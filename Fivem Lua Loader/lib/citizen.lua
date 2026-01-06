-- ============================================================================
-- Citizen API Implementation
-- Core FiveM Citizen.* functions for thread management and native invocation
-- ============================================================================

local M = {}

Citizen = Citizen or {}


local activeThreads = {}  
local threadIdCounter = 0
local currentLoadingScript = nil


function M.setCurrentLoadingScript(scriptPath)
    currentLoadingScript = scriptPath
end


local function shouldStopThread(threadId)
    local thread = activeThreads[threadId]
    return thread and thread.shouldStop
end


function M.stopScriptThreads(scriptPath)
    local stoppedCount = 0
    for threadId, thread in pairs(activeThreads) do
        if thread.scriptPath == scriptPath then
            thread.shouldStop = true
            stoppedCount = stoppedCount + 1
        end
    end
    if stoppedCount > 0 then
        Logger.LogInfo("[FiveM Loader] Stopping " .. stoppedCount .. " threads for script: " .. tostring(scriptPath))
    end
    return stoppedCount
end


function Citizen.Wait(ms)
    ms = tonumber(ms) or 0
    Script.Yield(math.floor(ms))
    return Citizen
end

Wait = Citizen.Wait

function Citizen.CreateThread(func)
    if type(func) ~= "function" then
        Logger.LogError("Citizen.CreateThread: Expected function, got " .. type(func))
        return
    end
    
    threadIdCounter = threadIdCounter + 1
    local threadId = threadIdCounter
    local scriptPath = currentLoadingScript
    
    activeThreads[threadId] = {
        scriptPath = scriptPath,
        shouldStop = false
    }
    
    local scriptId = Script.QueueJob(function()
        Logger.LogInfo("[FiveM Loader] Thread " .. threadId .. " started (script: " .. tostring(scriptPath) .. ")")
        
        local wrappedFunc = function()
            local co = coroutine.create(func)
            
            while coroutine.status(co) ~= "dead" do
                if shouldStopThread(threadId) then
                    Logger.LogInfo("[FiveM Loader] Thread " .. threadId .. " stopped by unload")
                    return
                end
                
                local ok, err = coroutine.resume(co)
                if not ok then
                    local errorMsg = tostring(err)
                    Logger.LogError("[FiveM Loader] ============ THREAD EXCEPTION ============")
                    Logger.LogError("[FiveM Loader] Thread ID: " .. threadId)
                    Logger.LogError("[FiveM Loader] Script: " .. tostring(scriptPath))
                    Logger.LogError("[FiveM Loader] Error: " .. errorMsg)
                    
                    local stackInfo = debug.traceback(co)
                    if stackInfo then
                        Logger.LogError("[FiveM Loader] Stack trace:\n" .. stackInfo)
                    end
                    Logger.LogError("[FiveM Loader] ==========================================")
                    
                    GUI.AddToast("Script Exception", "Thread " .. threadId .. " crashed - check console", 5000, 0)
                    break
                end
                
                Script.Yield(0)
            end
        end
        
        local success, err = xpcall(wrappedFunc, debug.traceback)
        if not success then
            Logger.LogError("[FiveM Loader] ============ OUTER THREAD ERROR ============")
            Logger.LogError("[FiveM Loader] Thread ID: " .. threadId)
            Logger.LogError("[FiveM Loader] Error with trace:\n" .. tostring(err))
            Logger.LogError("[FiveM Loader] ==============================================")
            GUI.AddToast("Script Error", "Thread wrapper failed - check console", 5000, 0)
        end
        
        activeThreads[threadId] = nil
        Logger.LogInfo("[FiveM Loader] Thread " .. threadId .. " ended")
    end)
    
    activeThreads[threadId].scriptId = scriptId
    return threadId
end


function Citizen.SetTimeout(ms, func)
    Script.QueueJob(function()
        Script.Yield(ms)
        func()
    end)
end

function Citizen.CreateThreadNow(func)
    return Citizen.CreateThread(func)
end

local POINTER_INT_MARKER = { __pointerType = "int" }
local POINTER_FLOAT_MARKER = { __pointerType = "float" }
local POINTER_VECTOR_MARKER = { __pointerType = "vector" }
local RESULT_AS_LONG_MARKER = { __resultAsLong = true }
local RESULT_AS_INT_MARKER = { __resultAsInt = true }
local RESULT_AS_FLOAT_MARKER = { __resultAsFloat = true }
local RESULT_AS_STRING_MARKER = { __resultAsString = true }
local RESULT_AS_VECTOR_MARKER = { __resultAsVector = true }
local RESULT_AS_OBJECT_MARKER = { __resultAsObject = true }
local RETURN_RESULT_MARKER = { __returnResult = true }

function Citizen.PointerValueInt() return POINTER_INT_MARKER end
function Citizen.PointerValueFloat() return POINTER_FLOAT_MARKER end
function Citizen.PointerValueVector() return POINTER_VECTOR_MARKER end
function Citizen.PointerValueIntInitialized() return POINTER_INT_MARKER end

function Citizen.ResultAsLong() return RESULT_AS_LONG_MARKER end
function Citizen.ResultAsInteger() return RESULT_AS_INT_MARKER end
function Citizen.ResultAsFloat() return RESULT_AS_FLOAT_MARKER end
function Citizen.ResultAsString() return RESULT_AS_STRING_MARKER end
function Citizen.ResultAsVector() return RESULT_AS_VECTOR_MARKER end
function Citizen.ResultAsObject() return RESULT_AS_OBJECT_MARKER end
function Citizen.ReturnResultAnyway() return RETURN_RESULT_MARKER end


Citizen.Trace = Citizen.Trace or function(msg)
    Logger.LogInfo("[Citizen.Trace] " .. tostring(msg))
end

local JhashToNative = {}
local JhashToFunction = {} 

-- Try to load jhash lookup tables
local function loadJhashTables()
    -- Get the lib path from the loader
    local libPath = (FIVEM_LOADER_BASE_PATH or (FileMgr.GetMenuRootPath() .. "\\Lua\\Fivem lua loader\\")) .. "Fivem Lua Loader\\lib\\"
    
    -- Load native hash mappings (from natives.json)
    local jhashOk, jhashTable = pcall(dofile, libPath .. "jhash_natives.lua")
    if jhashOk and jhashTable and type(jhashTable) == "table" then
        JhashToNative = jhashTable
        local count = 0
        for _ in pairs(JhashToNative) do count = count + 1 end
        Logger.LogInfo("[FiveM Loader] Loaded " .. count .. " jhash-to-native mappings")
    else
        Logger.LogError("[FiveM Loader] Could not load jhash_natives.lua: " .. tostring(jhashTable))
    end
    
    -- Load FiveM-specific function mappings
    local fivemOk, fivemTable = pcall(dofile, libPath .. "fivem_jhash.lua")
    if fivemOk and fivemTable and type(fivemTable) == "table" then
        JhashToFunction = fivemTable
        local count = 0
        for _ in pairs(JhashToFunction) do count = count + 1 end
        Logger.LogInfo("[FiveM Loader] Loaded " .. count .. " FiveM jhash-to-function mappings")
    end
end

loadJhashTables()

function Citizen.InvokeNative(hash, ...)
    local originalHash = hash
    if type(hash) == "string" then
        local cleanHash = hash:gsub("%s+", ""):lower()
        hash = tonumber(cleanHash)
        if not hash then
            Logger.LogError("[Citizen.InvokeNative] Invalid hash string: '" .. tostring(cleanHash) .. "', returning nil")
            return nil
        end
        -- Debug: log the hash conversion for armor-related hashes
        if cleanHash:find("9483") then
            Logger.LogInfo("[DEBUG] GetPedArmour hash detected: original='" .. tostring(originalHash) .. "' parsed=" .. string.format("0x%X", hash))
        end
    end
    
  
    local funcName = JhashToFunction[hash]
    if funcName and _G[funcName] then
        return _G[funcName](...)
    end
    

    if JhashToNative[hash] then
        hash = JhashToNative[hash]
    end
    
    local args = {...}

    local pointerCount = 0
    local hasReturnMarker = false
    local resultAsFloat = false
    local resultAsInt = false
    
    for i, arg in ipairs(args) do
        if type(arg) == "table" then
            if arg.__pointerType then
                pointerCount = pointerCount + 1
            elseif arg.__returnResult then
                hasReturnMarker = true
            elseif arg.__resultAsFloat then
                resultAsFloat = true
            elseif arg.__resultAsInt then
                resultAsInt = true
            end
        end
    end
    

    -- GET_ACTUAL_SCREEN_RESOLUTION
    if hash == 0x873C9F3104101DD3 then
        local w, h = ImGui.GetDisplaySize()
        return math.floor(w), math.floor(h)
    end
    
    -- GET_SCREEN_RESOLUTION
    if hash == 0xF1307EF624A80D87 then
        local w, h = ImGui.GetDisplaySize()
        return math.floor(w), math.floor(h)
    end
    
    -- GET_SCREEN_COORD_FROM_WORLD_COORD
    if hash == 0x6BC189A8CBE79825 then
        local x, y, z = args[1], args[2], args[3]
        local success, screenX, screenY = GRAPHICS.GET_SCREEN_COORD_FROM_WORLD_COORD(x, y, z)
        return success, screenX, screenY
    end
    
    -- GET_TEXT_SCALE_HEIGHT
    if hash == 0x2206BF9A37B7F724 then
        local realArgs = {}
        for _, arg in ipairs(args) do
            if type(arg) ~= "table" or (not arg.__pointerType and not arg.__returnResult and not arg.__resultAsFloat) then
                table.insert(realArgs, arg)
            end
        end
        return HUD.GET_TEXT_SCALE_HEIGHT(realArgs[1] or 1.0, realArgs[2] or 0)
    end
    
    -- END_TEXT_COMMAND_GET_WIDTH
    if hash == 0x85F061DA64ED2F67 then
        local realArgs = {}
        for _, arg in ipairs(args) do
            if type(arg) ~= "table" or (not arg.__pointerType and not arg.__returnResult and not arg.__resultAsFloat) then
                table.insert(realArgs, arg)
            end
        end
        return HUD.END_TEXT_COMMAND_GET_SCREEN_WIDTH_OF_DISPLAY_TEXT(realArgs[1] or true)
    end
    
    -- GET_HASH_KEY
    if hash == 0xD24D37CC275948CC then
        local str = args[1]
        if type(str) == "table" and str.__pointerType then
            return 0
        end
        return MISC.GET_HASH_KEY(tostring(str))
    end
    
    -- GetGameTimer
    if hash == 0x9CD27B0045628463 then
        return MISC.GET_GAME_TIMER()
    end
    
    -- GetNumResources
    if hash == 0x863F27B then return 0 end
    
    -- SetVehicleGravityAmount
    if hash == 0x1A963E58 then return end
    
    -- CreateDui
    if hash == 0x23EAF899 then return nil end
    
    -- GetDuiHandle
    if hash == 0x1655D41D then return nil end
    
    -- CreateRuntimeTextureFromDuiHandle
    if hash == 0xB135472B then return nil end
    
    -- GetResourceByFindIndex
    if hash == 0x387246B7 then return "spawnmanager" end
    
    -- GetResourceState
    if hash == 0x4039B485 then return "missing" end
    
    -- CreateRuntimeTxd
    if hash == 0x1F3AC778 then return nil end
    
    -- Input natives
    if hash == 0x91AEF906BCA88877 then
        return PAD.IS_DISABLED_CONTROL_JUST_PRESSED(args[1], args[2])
    end
    
    if hash == 0xE2587F8CBBD87B1D then
        return PAD.IS_DISABLED_CONTROL_PRESSED(args[1], args[2])
    end
    
    if hash == 0x305C8DCD79DA8B0F then
        return PAD.IS_DISABLED_CONTROL_JUST_RELEASED(args[1], args[2])
    end
    
    if hash == 0x11E65974A982637C then
        return PAD.GET_DISABLED_CONTROL_NORMAL(args[1], args[2])
    end
    
    -- GetNuiCursorPosition
    if hash == 0xBDBA226F then
        local x, y = ImGui.GetMousePos()
        return math.floor(x), math.floor(y)
    end
    
    -- GetPlayerName
    if hash == 0x6D0DE6A7B5DA71F8 then
        return PLAYER.GET_PLAYER_NAME(args[1])
    end
    
    -- PlayerPedId
    if hash == 0xD80958FC74E988A6 then
        return PLAYER.PLAYER_PED_ID()
    end
    
    -- GetEntityMaxHealth
    if hash == 0x15D757606D170C3C then
        return ENTITY.GET_ENTITY_MAX_HEALTH(args[1])
    end
    
    -- GetEntityHealth
    if hash == 0x6B76DC1F3AE6E6A3 then
        local entity = args[1]
        if type(entity) ~= "number" then return 0 end
        local ok, result = pcall(function() return ENTITY.GET_ENTITY_HEALTH(entity) end)
        return ok and result or 0
    end
    
    -- GET_PED_ARMOUR (0x9483AF821605B1D8)
    if hash == 0x9483AF821605B1D8 then
        local ped = args[1]
        if type(ped) ~= "number" then return 0 end
        local ok, result = pcall(function() return PED.GET_PED_ARMOUR(ped) end)
        return ok and result or 0
    end
    
    -- GET_PLAYER_PED (0x43A66C31C68491C0)
    if hash == 0x43A66C31C68491C0 then
        local player = args[1]
        if type(player) ~= "number" then return 0 end
        local ok, result = pcall(function() return PLAYER.GET_PLAYER_PED(player) end)
        return ok and result or 0
    end
    
    -- GET_PLAYER_PED alternative hash (0x6D0DE6A7B5DA71F8 is GetPlayerName, this is different)
    -- Some scripts use 0x275F255ED201B937
    if hash == 0x275F255ED201B937 then
        local player = args[1]
        if type(player) ~= "number" then return 0 end
        local ok, result = pcall(function() return PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player) end)
        return ok and result or 0
    end
    
    -- GET_ENTITY_COORDS (0x3FEF770D40960D5A)
    if hash == 0x3FEF770D40960D5A then
        local entity = args[1]
        if type(entity) ~= "number" then return vector3(0, 0, 0) end
        local ok, v3 = pcall(function() return ENTITY.GET_ENTITY_COORDS(entity, true) end)
        if ok and v3 then
            return vector3(v3.x or 0, v3.y or 0, v3.z or 0)
        end
        return vector3(0, 0, 0)
    end
    
    -- GET_DISTANCE_BETWEEN_COORDS (0xF1B760881820C952)
    if hash == 0xF1B760881820C952 then
        -- Filter out marker tables and extract actual coords
        local realArgs = {}
        for _, arg in ipairs(args) do
            if type(arg) ~= "table" or (type(arg) == "table" and (arg[1] ~= nil or arg.x ~= nil)) then
                table.insert(realArgs, arg)
            end
        end
        
        local x1, y1, z1, x2, y2, z2, useZ
        
        -- Check if first arg is a vector
        if type(realArgs[1]) == "table" or type(realArgs[1]) == "userdata" then
            local vec1 = realArgs[1]
            local vec2 = realArgs[2]
            useZ = realArgs[3]
            
            if not vec1 or not vec2 then return 0.0 end
            
            x1 = vec1.x or vec1[1] or 0
            y1 = vec1.y or vec1[2] or 0
            z1 = vec1.z or vec1[3] or 0
            x2 = vec2.x or vec2[1] or 0
            y2 = vec2.y or vec2[2] or 0
            z2 = vec2.z or vec2[3] or 0
        else
            x1 = realArgs[1] or 0
            y1 = realArgs[2] or 0
            z1 = realArgs[3] or 0
            x2 = realArgs[4] or 0
            y2 = realArgs[5] or 0
            z2 = realArgs[6] or 0
            useZ = realArgs[7]
        end
        
        local ok, result = pcall(function() 
            return MISC.GET_DISTANCE_BETWEEN_COORDS(x1, y1, z1, x2, y2, z2, useZ ~= false) 
        end)
        return ok and result or 0.0
    end
    
    -- GetActivePlayers (hash = 0xCF143FB9 = 3474705337)
    if hash == 0xCF143FB9 then
        local players = {}
        local localPlayerId = PLAYER.PLAYER_ID()
        local localFound = false
        -- FiveM supports up to 128 players (indices 0-127)
        for i = 0, 127 do
            if NETWORK.NETWORK_IS_PLAYER_ACTIVE(i) then
                table.insert(players, i)
                if i == localPlayerId then localFound = true end
            end
        end
        -- Always include local player even if network check fails
        if not localFound then
            table.insert(players, 1, localPlayerId) -- Insert at beginning
        end
        -- Return table directly - msgpack.pack/unpack are passthrough stubs
        return players
    end
    
    -- DrawSprite
    if hash == 0xE7FFAE5EBF23D890 then
        return Natives.InvokeVoid(0xE7FFAE5EBF23D890, 
           tostring(args[1]), tostring(args[2]), 
           tonumber(args[3]) or 0.0, tonumber(args[4]) or 0.0, 
           tonumber(args[5]) or 0.0, tonumber(args[6]) or 0.0, 
           tonumber(args[7]) or 0.0, 
           math.floor(tonumber(args[8]) or 255), math.floor(tonumber(args[9]) or 255), 
           math.floor(tonumber(args[10]) or 255), math.floor(tonumber(args[11]) or 255), 
           false, 0)
    end
    
    -- RequestStreamedTextureDict
    if hash == 0xDFA2EF8E04127DD5 then
        return GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT(tostring(args[1]), args[2] or false)
    end
    
    -- HasStreamedTextureDictLoaded
    if hash == 0x0145F696AAAAD2E4 then
        return GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED(tostring(args[1]))
    end
    
    -- N_0x0499d7b09fc9b407 = GET_CONTROL_INSTRUCTIONAL_BUTTON / GET_CONTROL_INSTRUCTIONAL_BUTTONS_STRING
    -- Returns button name string for a control
    if hash == 0x0499D7B09FC9B407 then
        local inputGroup = args[1] or 2
        local control = args[2] or 0
        local p2 = args[3] or 0
        -- Return a button name string like "~INPUT_CONTEXT~"
        return "~INPUT_" .. tostring(control) .. "~"
    end
    
    -- N_0xe83a3e3557a56640 = PUSH_SCALEFORM_MOVIE_METHOD_PARAMETER_BUTTON_NAME
    -- This native crashes - make it a complete no-op
    if hash == 0xE83A3E3557A56640 then
        return  -- No-op to prevent crash
    end
    
    -- Filter out marker tables from args for regular native calls
    local filteredArgs = {}
    local resultAsString = false
    local resultAsVector = false
    local resultAsObject = false

    for _, arg in ipairs(args) do
        if type(arg) == "table" then
            if arg.__resultAsString then
                resultAsString = true
            elseif arg.__resultAsVector then
                resultAsVector = true
            elseif arg.__resultAsObject then
                resultAsObject = true
            end
        end

        if type(arg) ~= "table" or (not arg.__pointerType and not arg.__returnResult and not arg.__resultAsFloat and not arg.__resultAsInt and not arg.__resultAsString and not arg.__resultAsVector and not arg.__resultAsObject) then
            table.insert(filteredArgs, arg)
        end
    end
    
    -- Try various return types
    local success, result
    
    -- If ResultAsInteger marker was found, try InvokeInt first
    if resultAsInt then
        success, result = pcall(function()
            return Natives.InvokeInt(hash, table.unpack(filteredArgs))
        end)
        if success then return result end
    end
    
    -- If ResultAsFloat marker was found, try InvokeFloat first
    if resultAsFloat then
        success, result = pcall(function()
            return Natives.InvokeFloat(hash, table.unpack(filteredArgs))
        end)
        if success then return result end
    end
    
    if resultAsString then
        success, result = pcall(function()
            return Natives.InvokeString(hash, table.unpack(filteredArgs))
        end)
        if success then return result end
    end

    if resultAsVector then
        success, result, y, z = pcall(function()
            return Natives.InvokeV3(hash, table.unpack(filteredArgs))
        end)
        if success then
            return vector3(result, y, z)
        end
    end

    success, result = pcall(function()
        return Natives.InvokeVoid(hash, table.unpack(filteredArgs))
    end)
    
    if success then return result end
    
    success, result = pcall(function()
        return Natives.InvokeInt(hash, table.unpack(filteredArgs))
    end)
    
    if success then return result end
    
    success, result = pcall(function()
        return Natives.InvokeBool(hash, table.unpack(filteredArgs))
    end)
    
    if success then return result end
    
    success, result = pcall(function()
        return Natives.InvokeFloat(hash, table.unpack(filteredArgs))
    end)
    
    if success then return result end
    
    Logger.LogError("Citizen.InvokeNative: Failed to invoke hash " .. string.format("0x%X", hash))
    return nil
end

-- ============================================================================
-- N_0x... Hash Function Auto-Router
-- Intercepts calls like N_0x0499d7b09fc9b407() and routes through InvokeNative
-- ============================================================================

local oldGlobalIndex = getmetatable(_G) and getmetatable(_G).__index
local nativeHashCache = {}

-- Create a metatable for _G to catch N_0x... calls
setmetatable(_G, {
    __index = function(t, key)
        -- Check old metatable first
        if oldGlobalIndex then
            local val
            if type(oldGlobalIndex) == "function" then
                val = oldGlobalIndex(t, key)
            else
                val = oldGlobalIndex[key]
            end
            if val ~= nil then return val end
        end
        
        -- Check if this is a N_0x... hash function call
        if type(key) == "string" and key:match("^N_0x[0-9a-fA-F]+$") then
            -- Return cached wrapper if exists
            if nativeHashCache[key] then
                return nativeHashCache[key]
            end
            
            -- Extract hash from key (e.g., "N_0x0499d7b09fc9b407" -> 0x0499d7b09fc9b407)
            local hashStr = key:sub(3)  -- Remove "N_" prefix
            local hash = tonumber(hashStr)
            
            if hash then
                -- Create wrapper function that calls Citizen.InvokeNative
                local wrapper = function(...)
                    return Citizen.InvokeNative(hash, ...)
                end
                
                -- Cache it for future calls
                nativeHashCache[key] = wrapper
                rawset(_G, key, wrapper)  -- Also set it directly for faster future access
                
                return wrapper
            end
        end
        
        return nil
    end
})

return M
