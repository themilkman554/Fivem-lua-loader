-- ============================================================================
-- FiveM Network/Server Stubs
-- These are server-side or FiveM-specific and need to be stubbed
-- ============================================================================

local M = {}

-- Settings reference (will be set by main loader)
local LoaderSettings = { PrintStubs = false }

function M.setSettings(settings)
    LoaderSettings = settings
end

-- Track loaded scripts (will be set by main loader)
local loadedScripts = {}

function M.setLoadedScripts(scripts)
    loadedScripts = scripts
end

-- ============================================================================
-- Internal Helpers
-- ============================================================================

local eventHandlers = {}
local eventHandlerCounter = 0

-- ============================================================================
-- Stubs Table
-- ============================================================================

M.Stubs = {
    -- Event System
    TriggerServerEvent = function(eventName, ...)
        if LoaderSettings.PrintStubs then
            Logger.LogInfo("[TriggerServerEvent] " .. tostring(eventName))
        end
    end,

    TriggerEventInternal = function(eventName, ...) end,

    TriggerEvent = function(eventName, ...)
        local handlers = eventHandlers[eventName]
        if handlers then
            for _, handler in ipairs(handlers) do
                pcall(handler, ...)
            end
        end
    end,

    RegisterNetEvent = function(eventName) end,
    RemoveEventHandler = function(handlerId) end,
    RegisterServerEvent = function(eventName) end,

    AddEventHandler = function(eventName, handler)
        eventHandlers[eventName] = eventHandlers[eventName] or {}
        table.insert(eventHandlers[eventName], handler)
        eventHandlerCounter = eventHandlerCounter + 1
        return eventHandlerCounter
    end,

    CancelEvent = function() end,

    WasEventCanceled = function()
        return false
    end,

    -- Resource Functions
    GetNumResources = function()
        return #loadedScripts + 1
    end,

    GetResourceByFindIndex = function(index)
        if index == 0 then
            return "fivem-loader"
        end
        local script = loadedScripts[index]
        if script then
            return script.name
        end
        return nil
    end,

    LoadResourceFile = function(resourceName, fileName)
        return nil
    end,

    SaveResourceFile = function(resourceName, fileName, data, dataLength)
        return false
    end,

    GetCurrentResourceName = function()
        return "fivem-loader"
    end,

    GetResourceState = function(resourceName)
        if not resourceName then return "missing" end
        
        for _, script in ipairs(loadedScripts) do
            if script.name == resourceName then
                return "started"
            end
            
            local sName = script.name:lower()
            local rName = resourceName:lower()
            
            if sName == rName then return "started" end
            if sName == rName .. ".lua" then return "started" end
            if sName:gsub("%.lua$", "") == rName then return "started" end
        end
        
        return "missing"
    end,

    --serverip funny numbers shouldn't matter although some luas blacklist certain servers/ips cause anticheat
    GetCurrentServerEndpoint = function()
        return "67.69.420.21"
    end,

    -- Player Functions
    GetNumberOfPlayers = function()
        local count = 0
        local localPlayerId = PLAYER.PLAYER_ID()
        local localFound = false
        -- FiveM supports up to 128 players (indices 0-127)
        for i = 0, 127 do
            if NETWORK.NETWORK_IS_PLAYER_ACTIVE(i) then
                count = count + 1
                if i == localPlayerId then localFound = true end
            end
        end
        -- Always include local player even if network check fails
        if not localFound then count = count + 1 end
        return count
    end,

    GetActivePlayers = function()
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
        return players
    end,

    GetPlayerServerId = function(player)
        -- FiveM server IDs start at 1, not 0
        -- Convert player index (0-based) to server ID (1-based)
        return (player or 0) + 1
    end,

    GetPlayerFromServerId = function(serverId)
        -- Convert server ID (1-based) back to player index (0-based)
        return (serverId or 1) - 1
    end,

    GetPlayerName = function(playerId)
        return PLAYER.GET_PLAYER_NAME(playerId) or "Unknown"
    end,

    NetworkIsPlayerActive = function(playerId)
        -- Always return true for local player, even if network check fails
        if playerId == PLAYER.PLAYER_ID() then
            return true
        end
        return NETWORK.NETWORK_IS_PLAYER_ACTIVE(playerId)
    end,

    NetworkIsPlayerTalking = function(playerId)
        return NETWORK.NETWORK_IS_PLAYER_TALKING(playerId)
    end,

    -- Network Entity Control (FiveM-specific stubs)
    NetworkHasControlOfEntity = function(entity)
        -- In single-player/Cherax context, always have control
        return true
    end,

    NetworkRequestControlOfEntity = function(entity)
        -- No-op in non-networked context
        return true
    end,

    NetworkRegisterEntityAsNetworked = function(entity)
        -- No-op
    end,

    NetworkSetNetworkIdDynamic = function(netId, toggle)
        -- No-op
    end,

    SetNetworkIdCanMigrate = function(netId, toggle)
        -- No-op  
    end,

    SetNetworkIdExistsOnAllMachines = function(netId, toggle)
        -- No-op
    end,

    PedToNet = function(ped)
        -- Return ped handle as fake network ID
        return ped
    end,

    NetToPed = function(netId)
        -- Return network ID as ped handle
        return netId
    end,

    VehToNet = function(vehicle)
        return vehicle
    end,

    NetToVeh = function(netId)
        return netId
    end,

    ObjToNet = function(object)
        return object
    end,

    NetToObj = function(netId)
        return netId
    end,

    -- Discord RPC Stubs could prob be made to work but nobody wants to be see using these things so
    SetRP = function()
    end,

    SetDiscordAppId = function(appId)
        if LoaderSettings.PrintStubs then
            Logger.LogInfo("[Stub] SetDiscordAppId called: " .. tostring(appId))
        end
    end,

    SetDiscordRichPresenceAsset = function(assetName)
        if LoaderSettings.PrintStubs then
            Logger.LogInfo("[Stub] SetDiscordRichPresenceAsset called: " .. tostring(assetName))
        end
    end,

    SetDiscordRichPresenceAssetText = function(text)
        if LoaderSettings.PrintStubs then
            Logger.LogInfo("[Stub] SetDiscordRichPresenceAssetText called: " .. tostring(text))
        end
    end,

    SetDiscordRichPresenceAction = function(index, label, url)
        if LoaderSettings.PrintStubs then
            Logger.LogInfo("[Stub] SetDiscordRichPresenceAction called: " .. tostring(index))
        end
    end,

    SetDiscordRichPresenceAssetSmall = function(assetName)
        if LoaderSettings.PrintStubs then
            Logger.LogInfo("[Stub] SetDiscordRichPresenceAssetSmall called: " .. tostring(assetName))
        end
    end,

    SetDiscordRichPresenceAssetSmallText = function(text)
        if LoaderSettings.PrintStubs then
            Logger.LogInfo("[Stub] SetDiscordRichPresenceAssetSmallText called: " .. tostring(text))
        end
    end,

    SetRichPresence = function(text)
        if LoaderSettings.PrintStubs then
            Logger.LogInfo("[Stub] SetRichPresence called: " .. tostring(text))
        end
    end,

    -- NUI Stubs
    SetNuiFocus = function(hasFocus, hasCursor) end,
    SetNuiFocusKeepInput = function(keepInput) end,
    SendNUIMessage = function(data) end,
    RegisterNUICallback = function(name, callback) end,

    -- DUI Stubs
    CreateRuntimeTxd = function(name)
        if LoaderSettings.PrintStubs then
            Logger.LogInfo("[Stub] CreateRuntimeTxd called: " .. tostring(name))
        end
        return { name = name }
    end,

    CreateDui = function(url, width, height)
        if LoaderSettings.PrintStubs then
            Logger.LogInfo("[Stub] CreateDui called: " .. tostring(url))
        end
        return { url = url }
    end,

    GetDuiHandle = function(duiObject)
        return "dummy_dui_handle"
    end,

    CreateRuntimeTextureFromDuiHandle = function(txd, txn, duiHandle)
        if LoaderSettings.PrintStubs then
            Logger.LogInfo("[Stub] CreateRuntimeTextureFromDuiHandle called")
        end
        return 1
    end,

    AddReplaceTexture = function(origTxd, origTxn, newTxd, newTxn)
        if LoaderSettings.PrintStubs then
            Logger.LogInfo("[Stub] AddReplaceTexture called")
        end
    end,

    -- Command System
    RegisterCommand = function(commandName, handler, restricted)
        Logger.LogInfo("[FiveM Loader] RegisterCommand called for: " .. tostring(commandName))
    end,

    -- MsgPack
    -- MsgPack
    msgpack = {
        pack = function(t) return t end,
        unpack = function(data) return data end
    }
}

-- Discord RPC global variables
-- These need to be globals because scripts access them directly as variables, not functions
scroll = scroll or setmetatable({}, {
    __index = function(t, k)
        return "FiveM Script"
    end
})
appid = appid or 0
asset = asset or "default"

-- ============================================================================
-- Register all stubs as global functions
-- ============================================================================
for name, func in pairs(M.Stubs) do
    if _G[name] == nil then
        _G[name] = func
    end
end

return M
