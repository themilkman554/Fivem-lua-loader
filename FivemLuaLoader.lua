--fivem lua loader for cherax 


Citizen = Citizen or {}

local loaderPath
if FIVEM_LOADER_BASE_PATH then
    loaderPath = FIVEM_LOADER_BASE_PATH
    -- Update package.path for LDev location
    package.path = loaderPath .. "Fivem Lua Loader\\?.lua;" .. loaderPath .. "?.lua;" .. package.path
else
    -- Default: loaded directly from Lua folder
    -- The script itself lives in: Lua\Fivem Lua Loader\
    -- The lib folder is: Lua\Fivem Lua Loader\lib\
    loaderPath = FileMgr.GetMenuRootPath() .. "\\Lua\\Fivem Lua Loader\\"
    package.path = loaderPath .. "?.lua;" .. loaderPath .. "lib\\?.lua;" .. package.path
end
local libPath = loaderPath .. "lib\\"

-- Export libPath globally so lib files can access it
FIVEM_LOADER_LIB_PATH = libPath

-- Log paths for debugging
Logger.LogInfo("[FiveM Loader] loaderPath: " .. loaderPath)
Logger.LogInfo("[FiveM Loader] libPath: " .. libPath)


dofile(libPath .. "natives.lua")

dofile(libPath .. "vector3.lua")
local NativeWrappers = dofile(libPath .. "native_wrappers.lua")
local CitizenLib = dofile(libPath .. "citizen.lua")
dofile(libPath .. "network_stubs.lua")
dofile(libPath .. "esx_stub.lua")
dofile(libPath .. "entity_enum.lua")
dofile(libPath .. "redengine.lua")

-- Load legacy native aliases (old FiveM names -> current names)
Logger.LogInfo("[FiveM Loader] Attempting to load legacy_natives.lua from: " .. libPath)
local legacyOk, LegacyNativesTable = pcall(dofile, libPath .. "legacy_natives.lua")
Logger.LogInfo("[FiveM Loader] pcall result: legacyOk=" .. tostring(legacyOk) .. " type=" .. type(LegacyNativesTable))

if legacyOk and LegacyNativesTable and type(LegacyNativesTable) == "table" then
    local count = 0
    local failed = 0
    
    local function pascalToSnake(str)
        local result = str:gsub("(%u)", function(c) return "_" .. c end)
        result = result:gsub("^_", ""):upper()
        return result
    end
    
    for oldName, mapping in pairs(LegacyNativesTable) do
        local namespace = _G[mapping.namespace]
        if namespace and type(namespace) == "table" then
            local snakeName = pascalToSnake(mapping.name)
            local nativeFunc = namespace[snakeName]
            
            if nativeFunc and type(nativeFunc) == "function" then
                if _G[oldName] == nil then
                    _G[oldName] = nativeFunc
                    count = count + 1
                end
            else
                failed = failed + 1
            end
        else
            failed = failed + 1
        end
    end
    Logger.LogInfo("[FiveM Loader] Loaded " .. count .. " legacy native aliases (" .. failed .. " failed)")
    Logger.LogInfo("[FiveM Loader] Loaded " .. count .. " legacy native aliases (" .. failed .. " failed)")
else
    Logger.LogInfo("[FiveM Loader] Failed to load legacy_natives.lua: " .. tostring(LegacyNativesTable))
    Logger.LogError("[FiveM Loader] Failed to load legacy_natives.lua: " .. tostring(LegacyNativesTable))
    LegacyNativesTable = {}
end

-- Track loaded scripts (global to this file)
local loadedScripts = {}

-- Settings
local LoaderSettings = {
    PrintStubs = false,
    DisablePhone = true,
    OpenOnLoad = false,
    UnloadLast = false,
    LineTrace = false  -- Enable line-by-line tracing for debugging crashes
}

-- Line tracing vars
local lastTracedLine = 0
local lastTracedFile = ""
local traceEnabled = false

-- Line trace hook function
local function lineTraceHook(event, line)
    if event == "line" then
        local info = debug.getinfo(2, "Sl")
        if info then
            lastTracedFile = info.source or "unknown"
            lastTracedLine = line or 0
            if LoaderSettings.LineTrace then
                Logger.LogInfo("[LineTrace] " .. lastTracedFile .. ":" .. tostring(line))
            end
        end
    end
end

-- Start tracing
local function startLineTrace()
    lastTracedLine = 0
    lastTracedFile = ""
    traceEnabled = true
    debug.sethook(lineTraceHook, "l")
end

-- Stop tracing  
local function stopLineTrace()
    debug.sethook()
    traceEnabled = false
end

-- Get last traced location (for crash reports)
local function getLastTracedLocation()
    return lastTracedFile .. ":" .. tostring(lastTracedLine)
end

-- Export functions from lib modules that are used by main file
local setCurrentLoadingScript = CitizenLib.setCurrentLoadingScript
local stopScriptThreads = CitizenLib.stopScriptThreads

-- Simulated inputs for action detection

local function loadFivemScript(scriptPath, scriptName)
    Logger.LogInfo("=========================================")
    Logger.LogInfo("[FiveM Loader] Starting to load: " .. scriptPath)
    Logger.LogInfo("=========================================")
    
    -- Set current loading script so threads know which script started them
    setCurrentLoadingScript(scriptPath)
    
    -- Clean script name for GetCurrentResourceName
    local cleanName = scriptName:gsub("%.lua$", "")
    Logger.LogInfo("[FiveM Loader] Clean name: " .. cleanName)
    
    -- Use xpcall to capture stack trace on error
    local success, result = xpcall(function()
        Logger.LogInfo("[FiveM Loader] Step 1: Loading file...")
        -- Pre-process file to support backticks (FiveM hash syntax)
        local f = io.open(scriptPath, "rb")
        if not f then
            error("Failed to open file: " .. scriptPath)
        end
        local content = f:read("*a")
        f:close()
        
        -- Replace backticks
        content = content:gsub("`([^`]+)`", "GetHashKey(\"%1\")")
        
        -- Use load/loadstring depending on Lua version
        local loader = loadstring or load
        local chunk, fileErr = loader(content, "@" .. scriptPath)
        
        if not chunk then
            error("Failed to load file: " .. tostring(fileErr))
        end
        Logger.LogInfo("[FiveM Loader] Step 2: File loaded, creating environment...")
        
        -- Create sandbox environment
        local env = {}
        setmetatable(env, {
            __index = _G,
            __newindex = _G
        })
        
        -- Inject script-specific function
        env.GetCurrentResourceName = function()
            return cleanName
        end
        
        Logger.LogInfo("[FiveM Loader] Step 3: Applying environment...")
        if setfenv then
            setfenv(chunk, env)
        end
        
        Logger.LogInfo("[FiveM Loader] Step 4: Executing script chunk...")
        
        -- Start line tracing before execution
        startLineTrace()
        
        local execSuccess, execErr = pcall(function()
            chunk()
        end)
        
        -- Stop tracing after execution
        stopLineTrace()
        
        if not execSuccess then
            Logger.LogError("[FiveM Loader] Chunk execution failed!")
            Logger.LogError("[FiveM Loader] Last traced location: " .. getLastTracedLocation())
            Logger.LogError("[FiveM Loader] Error: " .. tostring(execErr))
            
            -- Show toast with last line
            GUI.AddToast("Script Crash", "Last line: " .. getLastTracedLocation(), 5000, 0)
            error(execErr)
        end
        
        Logger.LogInfo("[FiveM Loader] Step 5: Script execution complete!")
    end, debug.traceback)
    
    -- Clear current loading script
    setCurrentLoadingScript(nil)
    
    if success then
        Logger.LogInfo("FiveM script loaded successfully: " .. scriptPath)
    else
        Logger.LogError("Failed to load FiveM script: " .. tostring(result))
        GUI.AddToast("Script Error", "Check console for details", 3000, 0)
    end
    
    return success
end


local luaMenusPath = loaderPath .. "LuaMenus"
local folderStates = {}
local scriptSearchFilter = ""
local cachedLuaMenusStructure = nil

-- Build folder structure
local function buildFolderStructure(files, basePath)
    local structure = { folders = {}, files = {} }
    for _, filePath in ipairs(files) do
        local normalizedBase = basePath:gsub("\\", "/")
        local normalizedFile = filePath:gsub("\\", "/")
        local relative = normalizedFile:gsub("^" .. normalizedBase .. "/", "")
        local parts = {}
        for part in relative:gmatch("([^/]+)") do table.insert(parts, part) end
        local cur = structure
        for i = 1, #parts do
            local part = parts[i]
            if i == #parts then
                table.insert(cur.files, { name = part, fullPath = filePath })
            else
                cur.folders[part] = cur.folders[part] or { folders = {}, files = {} }
                cur = cur.folders[part]
            end
        end
    end
    return structure
end


local function refreshLuaMenusStructure()
    local files = FileMgr.FindFiles(luaMenusPath, ".lua", true)
    if not files or #files == 0 then
        cachedLuaMenusStructure = { folders = {}, files = {} }
    else
        cachedLuaMenusStructure = buildFolderStructure(files, luaMenusPath)
    end
end


local function getLuaMenusStructure()
    if not cachedLuaMenusStructure then refreshLuaMenusStructure() end
    return cachedLuaMenusStructure
end

-- script actions tries to open them some have their own ui where you set open key stuff but it mostly works
local scriptActionsExpanded = {}

local function getControlName(controlNum)
    local names = {
        ["37"] = "Tab", ["38"] = "E", ["47"] = "G", ["121"] = "F2",
        ["157"] = "Numpad 5", ["166"] = "F5", ["167"] = "F6", ["168"] = "F7",
        ["170"] = "F9", ["244"] = "M", ["288"] = "F1", ["289"] = "F2",
        ["322"] = "ESC", ["344"] = "Insert"
    }
    return names[controlNum] or ("Control " .. controlNum)
end

local function parseScriptActions(scriptPath)
    local actions = {}
    
    local file = io.open(scriptPath, "r")
    if not file then return actions end
    
    local content = file:read("*all")
    file:close()
    
    if not content then return actions end
    
    local foundMenuGlobals = {}
    local foundMainMenus = {}
    
    for globalName, menuArg in content:gmatch("([%w_]+)%.CreateMenu%s*%(%s*([%w_]+)") do
        foundMenuGlobals[globalName] = true
        foundMainMenus[globalName] = menuArg
    end
    
    local function isEscapeSequence(str)
        return str:match("\\%d+") ~= nil
    end
    

    local excludedMenus = {
        ["modifyskintextures"] = true,
    }
    
    for globalName, menuName in content:gmatch("([%w_]+)%.OpenMenu%s*%(%s*[\"']([^\"']+)[\"']") do
        if not isEscapeSequence(menuName) and not excludedMenus[menuName:lower()] then
            table.insert(actions, {
                type = "open_menu",
                label = "Open " .. menuName,
                globalName = globalName,
                menuName = menuName,
                priority = 5,
                execute = function()
                    local globalObj = _G[globalName]
                    if globalObj and globalObj.OpenMenu then
                        pcall(function() globalObj.OpenMenu(menuName) end)
                    end
                end
            })
        end
    end
    
    -- Control-key detection patterns
    local foundControlOpens = {}
    local controlPatterns = {
        "IsDisabledControlPressed%s*%(%s*(%d+)%s*,%s*(%d+)%s*%)%s*then[^}]-([%w_]+)%.OpenMenu%s*%(",
        "IsControlPressed%s*%(%s*(%d+)%s*,%s*(%d+)%s*%)%s*then[^}]-([%w_]+)%.OpenMenu%s*%(",
    }
    
    for _, pattern in ipairs(controlPatterns) do
        for padIndex, controlNum, globalName in content:gmatch(pattern) do
            local key = "_ctrl_" .. controlNum
            if not foundControlOpens[key] then
                foundControlOpens[key] = true
                local controlName = getControlName(controlNum)
                
                table.insert(actions, {
                    type = "open_menu",
                    label = "Open Menu (" .. controlName .. ")",
                    globalName = globalName,
                    controlNum = tonumber(controlNum),
                    priority = 3,
                    execute = function()
                        GUI.AddToast("FiveM Loader", "Opening menu via " .. controlName, 1000, 0)
                        local ctrlKey = controlNum
                        NativeWrappers.SimulateInput(ctrlKey, true)
                        
                        Script.QueueJob(function()
                            Script.Yield(200)
                            NativeWrappers.SimulateInput(ctrlKey, nil)
                        end)
                    end
                })
            end
        end
    end
    

    

    local highPriorityMenuKeys = {
        ["121"] = "F2",  -- F2 key
        ["37"] = "Tab",  -- Tab key
    }
    
    for controlNum, keyName in pairs(highPriorityMenuKeys) do
        local key = "_ctrl_" .. controlNum
        if not foundControlOpens[key] then
            local pattern = "IsDisabledControlPressed%s*%([^%)]*,%s*" .. controlNum .. "%s*%)" .. ".-%.OpenMenu%s*%("
            if content:match(pattern) then
                foundControlOpens[key] = true
                
                table.insert(actions, {
                    type = "open_menu",
                    label = "Open Menu (" .. keyName .. ")",
                    controlNum = tonumber(controlNum),
                    priority = 4, 
                    execute = function()
                        GUI.AddToast("FiveM Loader", "Opening menu via " .. keyName, 1000, 0)
                        local ctrlKey = controlNum
                        NativeWrappers.SimulateInput(ctrlKey, true)
                        
                        Script.QueueJob(function()
                            Script.Yield(200)
                            NativeWrappers.SimulateInput(ctrlKey, nil)
                        end)
                    end
                })
            end
        end
    end
    
    local foundControls = {}
    local genericControlPatterns = {
        "IsDisabledControlPressed%s*%(%s*(%d+)%s*,%s*(%d+)%s*%)",
        "IsControlPressed%s*%(%s*(%d+)%s*,%s*(%d+)%s*%)",
        "IsDisabledControlJustPressed%s*%(%s*(%d+)%s*,%s*(%d+)%s*%)",
        "IsControlJustPressed%s*%(%s*(%d+)%s*,%s*(%d+)%s*%)"
    }
    
    for _, pattern in ipairs(genericControlPatterns) do
        for padIndex, controlNum in content:gmatch(pattern) do
            local key = "_gen_" .. controlNum
            local openKey = "_ctrl_" .. controlNum
            
            if not foundControls[key] and not foundControlOpens[openKey] then
                foundControls[key] = true
                local controlName = getControlName(controlNum)
                
                table.insert(actions, {
                    type = "control_key",
                    label = "Key: " .. controlName .. " (" .. controlNum .. ")",
                    controlNum = tonumber(controlNum),
                    priority = -5, -- Lowest priority, just for display
                    execute = function()
                        GUI.AddToast("FiveM Loader", "Simulating " .. controlName, 1000, 0)
                        local ctrlKey = controlNum
                        NativeWrappers.SimulateInput(ctrlKey, true)
                        
                        Script.QueueJob(function()
                            Script.Yield(100)
                            NativeWrappers.SimulateInput(ctrlKey, nil)
                        end)
                    end
                })
            end
        end
    end
    
    table.sort(actions, function(a, b)
        return (a.priority or 0) > (b.priority or 0)
    end)
    
    return actions
end


local function isScriptLoaded(scriptPath)
    for _, script in ipairs(loadedScripts) do
        if script.path == scriptPath then
            return true
        end
    end
    return false
end


local function unloadScript(scriptPath)
    for i, script in ipairs(loadedScripts) do
        if script.path == scriptPath then
            local scriptName = script.name
            local stoppedThreads = stopScriptThreads(scriptPath)
            
            table.remove(loadedScripts, i)
            
            if stoppedThreads > 0 then
                GUI.AddToast("FiveM Loader", "Unloaded: " .. scriptName .. " (" .. stoppedThreads .. " threads stopped)", 2000, 0)
            else
                GUI.AddToast("FiveM Loader", "Unloaded: " .. scriptName, 2000, 0)
            end
            return true
        end
    end
    return false
end


local function loadAndTrackScript(scriptPath, scriptName)
    if isScriptLoaded(scriptPath) then
        return unloadScript(scriptPath)
    end
    
    if LoaderSettings.UnloadLast and #loadedScripts > 0 then
        local lastScript = loadedScripts[#loadedScripts]
        unloadScript(lastScript.path)
    end
    
    local actions = parseScriptActions(scriptPath)
    
    Script.QueueJob(function()
        local success = loadFivemScript(scriptPath, scriptName)
        if success then
            table.insert(loadedScripts, {
                name = scriptName,
                path = scriptPath,
                loaded = true,
                actions = actions
            })
            
            local actionCount = #actions
            if actionCount > 0 then
                GUI.AddToast("FiveM Loader", "Loaded: " .. scriptName .. " (" .. actionCount .. " actions detected)", 2000, 0)
            else
                GUI.AddToast("FiveM Loader", "Loaded: " .. scriptName, 2000, 0)
            end
            
            if LoaderSettings.OpenOnLoad then
                for _, action in ipairs(actions) do
                    if action.type == "open_menu" then
                        Script.QueueJob(function()
                            Script.Yield(500)
                            action.execute()
                        end)
                        break
                    end
                end
            end
        else
            GUI.AddToast("FiveM Loader", "Failed to load: " .. scriptName, 3000, 0)
        end
    end)
    
    GUI.AddToast("FiveM Loader", "Loading: " .. scriptName .. "...", 1000, 0)
    return true
end


local function renderScriptFolder(folderName, folderData, path)
    local currentPath = path and (path .. "/" .. folderName) or folderName
    
    local currentState = folderStates[currentPath]
    if currentState ~= nil then
        ImGui.SetNextItemOpen(currentState)
    end
    
    local isOpen = ImGui.TreeNode(folderName)
    folderStates[currentPath] = isOpen
    
    if isOpen then
        local subFolders = {}
        for name, data in pairs(folderData.folders) do
            table.insert(subFolders, { name = name, data = data })
        end
        table.sort(subFolders, function(a, b) return a.name:lower() < b.name:lower() end)
        
        for _, sub in ipairs(subFolders) do
            renderScriptFolder(sub.name, sub.data, currentPath)
        end
        
        local files = {}
        for _, f in ipairs(folderData.files) do
            table.insert(files, f)
        end
        table.sort(files, function(a, b) return a.name:lower() < b.name:lower() end)
        
        for _, fileData in ipairs(files) do
            local filterLower = scriptSearchFilter:lower()
            if filterLower == "" or fileData.name:lower():find(filterLower) then
                local isLoaded = isScriptLoaded(fileData.fullPath)
                
                if isLoaded then
                    ImGui.PushStyleColor(ImGuiCol.Text, 0.4, 1.0, 0.4, 1.0)
                end
                
                if ImGui.Selectable(fileData.name .. (isLoaded and " [Loaded]" or "")) then
                    if not isLoaded then
                        loadAndTrackScript(fileData.fullPath, fileData.name)
                    end
                end
                
                if isLoaded then
                    ImGui.PopStyleColor(1)
                end
            end
        end
        
        ImGui.TreePop()
    end
end

local function renderScriptFolderContents(folderData)
    if not folderData then return end
    
    local subFolders = {}
    for name, data in pairs(folderData.folders) do
        table.insert(subFolders, { name = name, data = data })
    end
    table.sort(subFolders, function(a, b) return a.name:lower() < b.name:lower() end)
    
    for _, sub in ipairs(subFolders) do
        renderScriptFolder(sub.name, sub.data, nil)
    end
    
    local files = {}
    for _, f in ipairs(folderData.files) do
        table.insert(files, f)
    end
    table.sort(files, function(a, b) return a.name:lower() < b.name:lower() end)
    
    for _, fileData in ipairs(files) do
        local filterLower = scriptSearchFilter:lower()
        if filterLower == "" or fileData.name:lower():find(filterLower) then
            local isLoaded = isScriptLoaded(fileData.fullPath)
            
            if isLoaded then
                ImGui.PushStyleColor(ImGuiCol.Text, 0.4, 1.0, 0.4, 1.0)
            end
            
            if ImGui.Selectable(fileData.name .. (isLoaded and " [Loaded]" or "")) then
                if not isLoaded then
                    loadAndTrackScript(fileData.fullPath, fileData.name)
                end
            end
            
            if isLoaded then
                ImGui.PopStyleColor(1)
            end
        end
    end
end

local function renderFivemLoaderTab()
    if ImGui.BeginTable("FivemLoaderTable", 2, ImGuiTableFlags.SizingStretchSame) then
        ImGui.TableNextRow()
        
        ImGui.TableSetColumnIndex(0)
        
        if ClickGUI.BeginCustomChildWindow("Settings") then
            LoaderSettings.PrintStubs = ImGui.Checkbox("Print Stubs to Debug", LoaderSettings.PrintStubs)
            LoaderSettings.DisablePhone = ImGui.Checkbox("Disable Phone", LoaderSettings.DisablePhone)
            LoaderSettings.OpenOnLoad = ImGui.Checkbox("Open on Load", LoaderSettings.OpenOnLoad)
            LoaderSettings.UnloadLast = ImGui.Checkbox("Unload Last", LoaderSettings.UnloadLast)
            LoaderSettings.LineTrace = ImGui.Checkbox("Line Trace (Debug)", LoaderSettings.LineTrace)
            if ImGui.IsItemHovered() then
                ImGui.SetTooltip("Logs every line executed - helps find crash locations")
            end
            ClickGUI.EndCustomChildWindow()
        end
        
        if #loadedScripts > 0 then
            if ClickGUI.BeginCustomChildWindow("Loaded Scripts") then
                ImGui.Text("Loaded Scripts (" .. #loadedScripts .. ")")
                ImGui.Spacing()
                
                local i = 1
                while i <= #loadedScripts do
                    local script = loadedScripts[i]
                    local hasActions = script.actions and #script.actions > 0
                    local scriptKey = script.path
                    
                    if scriptActionsExpanded[scriptKey] == nil then
                        scriptActionsExpanded[scriptKey] = false
                    end
                    
                    if hasActions then
                        local arrow = scriptActionsExpanded[scriptKey] and "v" or ">"
                        if ImGui.SmallButton(arrow .. "##expand" .. i) then
                            scriptActionsExpanded[scriptKey] = not scriptActionsExpanded[scriptKey]
                        end
                        ImGui.SameLine()
                    end
                    
                    ImGui.TextColored(0.4, 1.0, 0.4, 1.0, script.name)
                    
                    if hasActions then
                        local firstOpenAction = nil
                        for _, action in ipairs(script.actions) do
                            if action.type == "open_menu" then
                                firstOpenAction = action
                                break
                            end
                        end
                        
                        if firstOpenAction then
                            ImGui.SameLine()
                            ImGui.PushStyleColor(ImGuiCol.Button, 0.2, 0.5, 0.2, 1.0)
                            ImGui.PushStyleColor(ImGuiCol.ButtonHovered, 0.3, 0.6, 0.3, 1.0)
                            ImGui.PushStyleColor(ImGuiCol.ButtonActive, 0.15, 0.45, 0.15, 1.0)
                            if ImGui.SmallButton("Open##first" .. i) then
                                Script.QueueJob(function()
                                    firstOpenAction.execute()
                                end)
                            end
                            ImGui.PopStyleColor(3)
                        end
                    end
                    
                    ImGui.SameLine()
                    ImGui.PushStyleColor(ImGuiCol.Button, 0.6, 0.15, 0.15, 1.0)
                    ImGui.PushStyleColor(ImGuiCol.ButtonHovered, 0.7, 0.2, 0.2, 1.0)
                    ImGui.PushStyleColor(ImGuiCol.ButtonActive, 0.5, 0.1, 0.1, 1.0)
                    if ImGui.SmallButton("Unload##" .. i) then
                        unloadScript(script.path)
                    else
                        if hasActions and scriptActionsExpanded[scriptKey] then
                            ImGui.Indent()
                            for j, action in ipairs(script.actions) do
                                if action.type == "open_menu" then
                                    ImGui.PushStyleColor(ImGuiCol.Button, 0.2, 0.5, 0.2, 1.0)
                                    ImGui.PushStyleColor(ImGuiCol.ButtonHovered, 0.3, 0.6, 0.3, 1.0)
                                    ImGui.PushStyleColor(ImGuiCol.ButtonActive, 0.15, 0.45, 0.15, 1.0)
                                else
                                    ImGui.PushStyleColor(ImGuiCol.Button, 0.3, 0.3, 0.5, 1.0)
                                    ImGui.PushStyleColor(ImGuiCol.ButtonHovered, 0.4, 0.4, 0.6, 1.0)
                                    ImGui.PushStyleColor(ImGuiCol.ButtonActive, 0.25, 0.25, 0.4, 1.0)
                                end
                                
                                if ImGui.SmallButton(action.label .. "##action" .. i .. "_" .. j) then
                                    Script.QueueJob(function()
                                        action.execute()
                                    end)
                                end
                                ImGui.PopStyleColor(3)
                            end
                            ImGui.Unindent()
                        end
                        
                        i = i + 1
                    end
                    ImGui.PopStyleColor(3)
                end
                
                ClickGUI.EndCustomChildWindow()
            end
        end
        
        ImGui.TableSetColumnIndex(1)
        
        if ClickGUI.BeginCustomChildWindow("Script Browser") then
            scriptSearchFilter = ImGui.InputText("##ScriptSearch", scriptSearchFilter or "", 256)
            ImGui.Spacing()
            ImGui.Separator()
            ImGui.Spacing()
            
            local structure = getLuaMenusStructure()
            renderScriptFolderContents(structure)
            
            ClickGUI.EndCustomChildWindow()
        end
        
        ImGui.EndTable()
    end
end

ClickGUI.AddTab("FiveM Loader", renderFivemLoaderTab)


Script.RegisterLooped(function()
    if ShouldUnload() then
        return
    end
    
    if LoaderSettings.DisablePhone then
        PAD.DISABLE_CONTROL_ACTION(0, 27, true)
    end
    
    Script.Yield(0)
end)
