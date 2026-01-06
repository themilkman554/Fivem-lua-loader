-- ============================================================================
-- redENGINE / CreateThread FiveM Lua Compatibility Layer
-- Provides compatibility for FiveM scripts using the redENGINE pattern
-- (CreateThread global, Citizen.IN, msgpack, etc.)
-- ============================================================================

local M = {}

-- ============================================================================
-- CreateThread Global Function
-- redENGINE scripts use CreateThread as a global instead of Citizen.CreateThread
-- ============================================================================

CreateThread = CreateThread or Citizen.CreateThread

-- CreateThreadNow global alias (Citizen.CreateThreadNow is defined in citizen.lua)
CreateThreadNow = CreateThreadNow or Citizen.CreateThreadNow

-- ============================================================================
-- Citizen.IN Alias
-- Common alias for Citizen.InvokeNative used in redENGINE scripts
-- ============================================================================

Citizen.IN = Citizen.IN or Citizen.InvokeNative

-- ============================================================================
-- Citizen.SubmitBoundaryEnd Stub
-- Used for thread boundary management in redENGINE - no-op in Cherax
-- ============================================================================

Citizen.SubmitBoundaryEnd = Citizen.SubmitBoundaryEnd or function(boundary, co)
    -- No-op: boundary management not needed in Cherax
end

-- ============================================================================
-- msgpack Shim
-- Basic msgpack implementation for TriggerEvent patterns
-- In Cherax context, we just pass data through as-is
-- ============================================================================

msgpack = msgpack or {
    pack = function(t)
        -- Simple passthrough - events are no-ops anyway
        return t
    end,
    unpack = function(data)
        -- Simple passthrough
        return data
    end
}

-- ============================================================================
-- Event Trigger Stubs
-- These are FiveM-specific server/client event functions
-- No-op in offline/single-player Cherax context
-- ============================================================================

TriggerEventInternal = TriggerEventInternal or function(eventName, payload, len)
    -- No-op: FiveM client events don't work in Cherax
    if Logger then
        Logger.LogInfo("[redENGINE] TriggerEventInternal called: " .. tostring(eventName) .. " (stub)")
    end
end

TriggerServerEventInternal = TriggerServerEventInternal or function(eventName, payload, len)
    -- No-op: FiveM server events don't work in Cherax
    if Logger then
        Logger.LogInfo("[redENGINE] TriggerServerEventInternal called: " .. tostring(eventName) .. " (stub)")
    end
end

-- NOTE: TriggerEvent and TriggerServerEvent are now handled by network_stubs.lua
-- Do NOT override them here - network_stubs.lua provides a working implementation
-- with proper event handler support that is required for ESX and other frameworks

-- ============================================================================
-- Additional Citizen API Stubs for redENGINE compatibility
-- ============================================================================

-- Citizen.Await - Used for async operations
Citizen.Await = Citizen.Await or function(promise)
    -- Simple passthrough for promise-like objects
    if type(promise) == "table" and promise.await then
        return promise:await()
    end
    return promise
end

-- ============================================================================
-- rE (redENGINE) Stub
-- Some scripts check for rE.ConfigHandler to detect redENGINE executor
-- We return nil to indicate we're not running in redENGINE
-- ============================================================================

rE = rE or {
    ConfigHandler = nil  -- nil indicates not running in redENGINE
}

-- ============================================================================
-- MainColor Default
-- Some menu scripts expect a MainColor global for UI theming
-- ============================================================================

MainColor = MainColor or { r = 155, g = 89, b = 182, a = 255 }  -- Purple default

-- ============================================================================
-- utf8 Library Compatibility
-- Some scripts use utf8.codes, utf8.char etc.
-- ============================================================================

if not utf8 then
    utf8 = {
        codes = function(s)
            local i = 0
            return function()
                i = i + 1
                if i <= #s then
                    return i, string.byte(s, i)
                end
            end
        end,
        char = function(...)
            local chars = {...}
            local result = ""
            for _, c in ipairs(chars) do
                if c < 128 then
                    result = result .. string.char(c)
                else
                    -- Simple fallback for non-ASCII
                    result = result .. "?"
                end
            end
            return result
        end,
        len = function(s)
            return #s
        end
    }
end

-- ============================================================================
-- json Library Compatibility
-- Scripts often use json.encode/decode
-- ============================================================================

if not json then
    -- Try to use existing JSON library if available
    json = {
        encode = function(t)
            -- Simple table to string conversion
            if type(t) ~= "table" then
                return tostring(t)
            end
            local result = "{"
            local first = true
            for k, v in pairs(t) do
                if not first then result = result .. "," end
                first = false
                if type(k) == "string" then
                    result = result .. '"' .. k .. '":'
                else
                    result = result .. "[" .. tostring(k) .. "]:"
                end
                if type(v) == "string" then
                    result = result .. '"' .. v .. '"'
                elseif type(v) == "table" then
                    result = result .. json.encode(v)
                else
                    result = result .. tostring(v)
                end
            end
            return result .. "}"
        end,
        decode = function(s)
            -- Minimal decode - scripts mostly use encode for configs
            Logger.LogError("[redENGINE] json.decode called - limited stub implementation")
            return {}
        end
    }
end

-- ============================================================================
-- Additional FiveM-specific Native Stubs
-- These are FiveM-only natives that don't exist in GTA V
-- ============================================================================

-- GetPlayerServerId - Returns server ID for a player (FiveM multiplayer only)
GetPlayerServerId = GetPlayerServerId or function(player)
    -- In single-player context, just return player + 1 as a fake server ID
    return (player or 0) + 1
end

-- GetPlayerFromServerId - Inverse of above
GetPlayerFromServerId = GetPlayerFromServerId or function(serverId)
    return (serverId or 1) - 1
end

-- NetworkGetPlayerIndexFromPed - Get player index from ped
NetworkGetPlayerIndexFromPed = NetworkGetPlayerIndexFromPed or function(ped)
    -- Try to find which player owns this ped
    for i = 0, 31 do
        if PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(i) == ped then
            return i
        end
    end
    return -1
end

-- ============================================================================
-- Scaleform Natives (used by menus)
-- ============================================================================

-- PushScaleformMovieMethodParameterButtonName - crashes, stub it
PushScaleformMovieMethodParameterButtonName = PushScaleformMovieMethodParameterButtonName or function(string)
    -- No-op to prevent crash
end

-- N_0xe83a3e3557a56640 variant
_G["N_0xe83a3e3557a56640"] = _G["N_0xe83a3e3557a56640"] or function(string)
    -- No-op
end

-- ============================================================================
-- Common FiveM Helper Functions
-- These are utility functions commonly used in FiveM scripts
-- ============================================================================

-- load_anim_dict - Requests and waits for an animation dictionary to load
load_anim_dict = load_anim_dict or function(dict)
    if not dict or type(dict) ~= "string" then return end
    
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
        
        -- Wait for the animation dictionary to load (with timeout)
        local timeout = 0
        while not HasAnimDictLoaded(dict) and timeout < 1000 do
            Citizen.Wait(10)
            timeout = timeout + 10
        end
    end
    
    return HasAnimDictLoaded(dict)
end

-- RequestModelSync - Requests a model and waits synchronously (common pattern)
RequestModelSync = RequestModelSync or function(model)
    local hash = type(model) == "number" and model or GetHashKey(model)
    
    if not IsModelValid(hash) then
        return false
    end
    
    RequestModel(hash)
    
    local timeout = 0
    while not HasModelLoaded(hash) and timeout < 5000 do
        Citizen.Wait(10)
        timeout = timeout + 10
    end
    
    return HasModelLoaded(hash)
end

-- DisplayHelpText - Shows help text on screen (calls actual native)
DisplayHelpText = DisplayHelpText or function(text)
    -- Display help text using the proper native sequence
    if text and type(text) == "string" then
        HUD.BEGIN_TEXT_COMMAND_DISPLAY_HELP("STRING")
        HUD.ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(tostring(text))
        HUD.END_TEXT_COMMAND_DISPLAY_HELP(0, false, true, -1)
    end
end

-- DrawNotification - Finishes and draws a notification (calls actual native)
-- NOTE: This function finishes a notification sequence started with SetNotificationTextEntry
-- and AddTextComponentString - it does NOT take a text parameter
DrawNotification = DrawNotification or function(blink, showInBrief)
    -- Call the actual HUD native to draw the notification
    return HUD.END_TEXT_COMMAND_THEFEED_POST_TICKER(blink, showInBrief)
end

-- RequestClipSet - Request a clip set (movement style)
RequestClipSet = RequestClipSet or function(clipSet)
    if not clipSet then return end
    STREAMING.REQUEST_CLIP_SET(clipSet)
end

-- RequestAnimSet - Request an animation set
RequestAnimSet = RequestAnimSet or function(animSet)
    if not animSet then return end
    STREAMING.REQUEST_ANIM_SET(animSet)
end

Logger.LogInfo("[FiveM Loader] redENGINE compatibility layer loaded")

return M
