-- ============================================================================
-- ESX Framework Stub
-- Based on es_extended client/functions.lua from:
-- https://github.com/mitlight/es_extended/blob/f3e55a9f4164020a982cdab9fb7aaf4ca4f2ae4f/client/functions.lua
-- ============================================================================

local M = {}

-- Initialize ESX global structure
ESX                           = {}
ESX.PlayerData                = {}
ESX.PlayerLoaded              = true  -- Always loaded in Cherax context
ESX.CurrentRequestId          = 0
ESX.ServerCallbacks           = {}
ESX.TimeoutCallbacks          = {}

ESX.UI                        = {}
ESX.UI.HUD                    = {}
ESX.UI.HUD.RegisteredElements = {}
ESX.UI.Menu                   = {}
ESX.UI.Menu.RegisteredTypes   = {}
ESX.UI.Menu.Opened            = {}

ESX.Game                      = {}
ESX.Game.Utils                = {}

ESX.Scaleform                 = {}
ESX.Scaleform.Utils           = {}

ESX.Streaming                 = {}

ESX.Math                      = {}

-- Config stub
Config = Config or {}
Config.MaxPlayers = Config.MaxPlayers or 32

-- Capture ESX reference locally for the event handler
local ESXStubObject = ESX

-- ============================================================================
-- ESX.Math Functions
-- ============================================================================

ESX.Math.Round = function(value, numDecimalPlaces)
    if numDecimalPlaces then
        local power = 10^numDecimalPlaces
        return math.floor((value * power) + 0.5) / power
    else
        return math.floor(value + 0.5)
    end
end

ESX.Math.GroupDigits = function(value)
    local left, num, right = string.match(tostring(value), '^([^%d]*%d)(%d*)(.-)$')
    return left .. (num:reverse():gsub('(%d%d%d)', '%1,'):reverse()) .. right
end

ESX.Math.Trim = function(s)
    if s then
        return (string.gsub(s, '^%s*(.-)%s*$', '%1'))
    else
        return nil
    end
end

-- ============================================================================
-- ESX Core Functions
-- ============================================================================

ESX.SetTimeout = function(msec, cb)
    table.insert(ESX.TimeoutCallbacks, {
        time = GetGameTimer(),
        msec = msec,
        cb   = cb
    })
    return #ESX.TimeoutCallbacks
end

ESX.ClearTimeout = function(i)
    ESX.TimeoutCallbacks[i] = nil
end

ESX.IsPlayerLoaded = function()
    return ESX.PlayerLoaded
end

ESX.GetPlayerData = function()
    return ESX.PlayerData
end

ESX.SetPlayerData = function(key, val)
    ESX.PlayerData[key] = val
end

-- ============================================================================
-- ESX Notification Functions
-- ============================================================================

ESX.ShowNotification = function(msg)
    -- Clean ESX color codes
    local cleanMsg = msg
    if type(msg) == "string" then
        cleanMsg = msg:gsub("~%w~", "")
    end
    
    Logger.LogInfo("[ESX] " .. tostring(cleanMsg))
    
    -- Use native notification
    HUD.BEGIN_TEXT_COMMAND_THEFEED_POST("STRING")
    HUD.ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(cleanMsg)
    HUD.END_TEXT_COMMAND_THEFEED_POST_TICKER(false, false)
end

ESX.ShowAdvancedNotification = function(title, subject, msg, icon, iconType)
    local cleanMsg = msg
    if type(msg) == "string" then
        cleanMsg = msg:gsub("~%w~", "")
    end
    
    HUD.BEGIN_TEXT_COMMAND_THEFEED_POST("STRING")
    HUD.ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(cleanMsg)
    HUD.END_TEXT_COMMAND_THEFEED_POST_MESSAGETEXT(icon, icon, false, iconType or 0, title, subject)
    HUD.END_TEXT_COMMAND_THEFEED_POST_TICKER(false, false)
end

ESX.ShowHelpNotification = function(msg)
    HUD.BEGIN_TEXT_COMMAND_DISPLAY_HELP("STRING")
    HUD.ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(msg)
    HUD.END_TEXT_COMMAND_DISPLAY_HELP(0, false, true, -1)
end

-- ============================================================================
-- ESX Server Callback (Stub)
-- ============================================================================

ESX.TriggerServerCallback = function(name, cb, ...)
    -- In Cherax context, we can't trigger server callbacks
    -- Just log and optionally call callback with empty data
    Logger.LogInfo("[ESX] TriggerServerCallback: " .. tostring(name))
    if cb then
        cb(nil)
    end
end

-- ============================================================================
-- ESX.UI.HUD Functions (Stubs - NUI not available)
-- ============================================================================

ESX.UI.HUD.SetDisplay = function(opacity)
    -- NUI not available in Cherax
end

ESX.UI.HUD.RegisterElement = function(name, index, priority, html, data)
    -- NUI not available in Cherax
    table.insert(ESX.UI.HUD.RegisteredElements, name)
end

ESX.UI.HUD.RemoveElement = function(name)
    for i = 1, #ESX.UI.HUD.RegisteredElements do
        if ESX.UI.HUD.RegisteredElements[i] == name then
            table.remove(ESX.UI.HUD.RegisteredElements, i)
            break
        end
    end
end

ESX.UI.HUD.UpdateElement = function(name, data)
    -- NUI not available in Cherax
end

-- ============================================================================
-- ESX.UI.Menu Functions - Using Native Menu Drawing
-- ============================================================================

-- Register a menu type
ESX.UI.Menu.RegisterType = function(type, open, close)
    ESX.UI.Menu.RegisteredTypes[type] = {
        open  = open,
        close = close
    }
end

-- Track the current active menu (simpler than array approach)
local currentActiveMenu = nil

-- Open a menu
ESX.UI.Menu.Open = function(type, namespace, name, data, submit, cancel, change, close)
    local menu = {}
    
    menu.type      = type
    menu.namespace = namespace
    menu.name      = name
    menu.data      = data
    menu.submit    = submit
    menu.cancel    = cancel
    menu.change    = change
    menu.elements  = data.elements or {}
    menu.currentIndex = 1
    menu.isOpen    = true
    
    menu.close = function()
        menu.isOpen = false
        -- Remove from opened list
        for i = #ESX.UI.Menu.Opened, 1, -1 do
            if ESX.UI.Menu.Opened[i] == menu then
                table.remove(ESX.UI.Menu.Opened, i)
                break
            end
        end
        
        -- Update active menu to the last one in the stack (if any)
        if #ESX.UI.Menu.Opened > 0 then
            currentActiveMenu = ESX.UI.Menu.Opened[#ESX.UI.Menu.Opened]
        else
            currentActiveMenu = nil
        end
        
        if close ~= nil then
            close()
        end
    end
    
    menu.update = function(query, newData)
        for i = 1, #menu.data.elements do
            local match = true
            for k, v in pairs(query) do
                if menu.data.elements[i][k] ~= v then
                    match = false
                end
            end
            if match then
                for k, v in pairs(newData) do
                    menu.data.elements[i][k] = v
                end
            end
        end
    end
    
    menu.refresh = function()
        -- Refresh menu display
    end
    
    menu.setElement = function(i, key, val)
        if menu.data.elements[i] then
            menu.data.elements[i][key] = val
        end
    end
    
    menu.setTitle = function(val)
        menu.data.title = val
    end
    
    menu.removeElement = function(query)
        for i = #menu.data.elements, 1, -1 do
            for k, v in pairs(query) do
                if menu.data.elements[i] and menu.data.elements[i][k] == v then
                    table.remove(menu.data.elements, i)
                    break
                end
            end
        end
    end
    
    -- Add to opened list (use table.insert for proper array)
    table.insert(ESX.UI.Menu.Opened, menu)
    currentActiveMenu = menu
    
    return menu
end

-- Close a specific menu
ESX.UI.Menu.Close = function(type, namespace, name)
    for i = #ESX.UI.Menu.Opened, 1, -1 do
        local menu = ESX.UI.Menu.Opened[i]
        if menu and menu.type == type and menu.namespace == namespace and menu.name == name then
            menu.isOpen = false
            table.remove(ESX.UI.Menu.Opened, i)
        end
    end
    
    -- Update active menu
    if #ESX.UI.Menu.Opened > 0 then
        currentActiveMenu = ESX.UI.Menu.Opened[#ESX.UI.Menu.Opened]
    else
        currentActiveMenu = nil
    end
end

-- Close all menus
ESX.UI.Menu.CloseAll = function()
    for i = #ESX.UI.Menu.Opened, 1, -1 do
        local menu = ESX.UI.Menu.Opened[i]
        if menu then
            menu.isOpen = false
        end
    end
    ESX.UI.Menu.Opened = {}
    currentActiveMenu = nil
end

-- Get an opened menu
ESX.UI.Menu.GetOpened = function(type, namespace, name)
    for i = 1, #ESX.UI.Menu.Opened do
        local menu = ESX.UI.Menu.Opened[i]
        if menu and menu.type == type and menu.namespace == namespace and menu.name == name then
            return menu
        end
    end
    return nil
end

-- Get all opened menus
ESX.UI.Menu.GetOpenedMenus = function()
    return ESX.UI.Menu.Opened
end

-- Check if a menu is open
ESX.UI.Menu.IsOpen = function(type, namespace, name)
    return ESX.UI.Menu.GetOpened(type, namespace, name) ~= nil
end

-- Get the current active menu (for rendering)
ESX.UI.Menu.GetActiveMenu = function()
    return currentActiveMenu
end

-- Inventory notification stub
ESX.UI.ShowInventoryItemNotification = function(add, item, count)
    local action = add and "Added" or "Removed"
    ESX.ShowNotification(action .. " " .. tostring(count) .. "x " .. tostring(item.label or item.name or "item"))
end

-- ============================================================================
-- ESX.Streaming Functions
-- ============================================================================

ESX.Streaming.RequestModel = function(model, cb)
    local modelHash = type(model) == "number" and model or GetHashKey(model)
    
    if not STREAMING.IS_MODEL_VALID(modelHash) then
        Logger.LogError("[ESX] Invalid model: " .. tostring(model))
        return
    end
    
    STREAMING.REQUEST_MODEL(modelHash)
    
    local startTime = GetGameTimer()
    while not STREAMING.HAS_MODEL_LOADED(modelHash) do
        if GetGameTimer() - startTime > 5000 then
            Logger.LogError("[ESX] Model load timeout: " .. tostring(model))
            break
        end
        Citizen.Wait(0)
    end
    
    if cb then cb() end
end

ESX.Streaming.RequestAnimDict = function(animDict, cb)
    STREAMING.REQUEST_ANIM_DICT(animDict)
    
    local startTime = GetGameTimer()
    while not STREAMING.HAS_ANIM_DICT_LOADED(animDict) do
        if GetGameTimer() - startTime > 5000 then
            Logger.LogError("[ESX] Anim dict load timeout: " .. tostring(animDict))
            break
        end
        Citizen.Wait(0)
    end
    
    if cb then cb() end
end

ESX.Streaming.RequestTextureDict = function(textureDict, cb)
    GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT(textureDict, true)
    
    local startTime = GetGameTimer()
    while not GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED(textureDict) do
        if GetGameTimer() - startTime > 5000 then
            Logger.LogError("[ESX] Texture dict load timeout: " .. tostring(textureDict))
            break
        end
        Citizen.Wait(0)
    end
    
    if cb then cb() end
end

-- ============================================================================
-- ESX.Game Functions
-- ============================================================================

ESX.Game.GetPedMugshot = function(ped)
    local mugshot = HUD.REGISTER_PEDHEADSHOT(ped)
    
    local startTime = GetGameTimer()
    while not HUD.IS_PEDHEADSHOT_READY(mugshot) do
        if GetGameTimer() - startTime > 5000 then break end
        Citizen.Wait(0)
    end
    
    return mugshot, HUD.GET_PEDHEADSHOT_TXD_STRING(mugshot)
end

ESX.Game.Teleport = function(entity, coords, cb)
    STREAMING.REQUEST_COLLISION_AT_COORD(coords.x, coords.y, coords.z)
    
    local startTime = GetGameTimer()
    while not STREAMING.HAS_COLLISION_LOADED_AROUND_ENTITY(entity) do
        STREAMING.REQUEST_COLLISION_AT_COORD(coords.x, coords.y, coords.z)
        if GetGameTimer() - startTime > 5000 then break end
        Citizen.Wait(0)
    end
    
    ENTITY.SET_ENTITY_COORDS(entity, coords.x, coords.y, coords.z, false, false, false, true)
    
    if cb then cb() end
end

ESX.Game.SpawnObject = function(model, coords, cb)
    local modelHash = type(model) == "number" and model or GetHashKey(model)
    
    Citizen.CreateThread(function()
        ESX.Streaming.RequestModel(modelHash)
        
        local obj = OBJECT.CREATE_OBJECT(modelHash, coords.x, coords.y, coords.z, true, false, true)
        
        if cb then cb(obj) end
    end)
end

ESX.Game.SpawnLocalObject = function(model, coords, cb)
    local modelHash = type(model) == "number" and model or GetHashKey(model)
    
    Citizen.CreateThread(function()
        ESX.Streaming.RequestModel(modelHash)
        
        local obj = OBJECT.CREATE_OBJECT(modelHash, coords.x, coords.y, coords.z, false, false, true)
        
        if cb then cb(obj) end
    end)
end

ESX.Game.DeleteVehicle = function(vehicle)
    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(vehicle, false, true)
    VEHICLE.DELETE_VEHICLE(vehicle)
end

ESX.Game.DeleteObject = function(object)
    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(object, false, true)
    OBJECT.DELETE_OBJECT(object)
end

ESX.Game.SpawnVehicle = function(modelName, coords, heading, cb)
    local model = type(modelName) == "number" and modelName or GetHashKey(modelName)
    
    Citizen.CreateThread(function()
        ESX.Streaming.RequestModel(model)
        
        local vehicle = VEHICLE.CREATE_VEHICLE(model, coords.x, coords.y, coords.z, heading, true, false)
        
        ENTITY.SET_ENTITY_AS_MISSION_ENTITY(vehicle, true, false)
        VEHICLE.SET_VEHICLE_HAS_BEEN_OWNED_BY_PLAYER(vehicle, true)
        VEHICLE.SET_VEHICLE_NEEDS_TO_BE_HOTWIRED(vehicle, false)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(model)
        
        STREAMING.REQUEST_COLLISION_AT_COORD(coords.x, coords.y, coords.z)
        
        local startTime = GetGameTimer()
        while not STREAMING.HAS_COLLISION_LOADED_AROUND_ENTITY(vehicle) do
            STREAMING.REQUEST_COLLISION_AT_COORD(coords.x, coords.y, coords.z)
            if GetGameTimer() - startTime > 5000 then break end
            Citizen.Wait(0)
        end
        
        AUDIO.SET_VEH_RADIO_STATION(vehicle, "OFF")
        
        if cb then cb(vehicle) end
    end)
end

ESX.Game.SpawnLocalVehicle = function(modelName, coords, heading, cb)
    local model = type(modelName) == "number" and modelName or GetHashKey(modelName)
    
    Citizen.CreateThread(function()
        ESX.Streaming.RequestModel(model)
        
        local vehicle = VEHICLE.CREATE_VEHICLE(model, coords.x, coords.y, coords.z, heading, false, false)
        
        ENTITY.SET_ENTITY_AS_MISSION_ENTITY(vehicle, true, false)
        VEHICLE.SET_VEHICLE_HAS_BEEN_OWNED_BY_PLAYER(vehicle, true)
        VEHICLE.SET_VEHICLE_NEEDS_TO_BE_HOTWIRED(vehicle, false)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(model)
        
        STREAMING.REQUEST_COLLISION_AT_COORD(coords.x, coords.y, coords.z)
        
        local startTime = GetGameTimer()
        while not STREAMING.HAS_COLLISION_LOADED_AROUND_ENTITY(vehicle) do
            STREAMING.REQUEST_COLLISION_AT_COORD(coords.x, coords.y, coords.z)
            if GetGameTimer() - startTime > 5000 then break end
            Citizen.Wait(0)
        end
        
        AUDIO.SET_VEH_RADIO_STATION(vehicle, "OFF")
        
        if cb then cb(vehicle) end
    end)
end

ESX.Game.IsVehicleEmpty = function(vehicle)
    local passengers = VEHICLE.GET_VEHICLE_NUMBER_OF_PASSENGERS(vehicle)
    local driverSeatFree = VEHICLE.IS_VEHICLE_SEAT_FREE(vehicle, -1)
    
    return passengers == 0 and driverSeatFree
end

-- Get all players
ESX.Game.GetPlayers = function()
    local maxPlayers = Config.MaxPlayers or 32
    local players = {}
    
    for i = 0, maxPlayers - 1 do
        local ped = PLAYER.GET_PLAYER_PED(i)
        if ENTITY.DOES_ENTITY_EXIST(ped) then
            table.insert(players, i)
        end
    end
    
    return players
end

-- Get closest player
ESX.Game.GetClosestPlayer = function(coords)
    local players = ESX.Game.GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local usePlayerPed = false
    local playerPed = PLAYER.PLAYER_PED_ID()
    local playerId = PLAYER.PLAYER_ID()
    
    if coords == nil then
        usePlayerPed = true
        coords = ENTITY.GET_ENTITY_COORDS(playerPed, true)
    end
    
    for i = 1, #players do
        local target = PLAYER.GET_PLAYER_PED(players[i])
        
        if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then
            local targetCoords = ENTITY.GET_ENTITY_COORDS(target, true)
            local distance = MISC.GET_DISTANCE_BETWEEN_COORDS(
                targetCoords.x, targetCoords.y, targetCoords.z,
                coords.x, coords.y, coords.z, true
            )
            
            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = players[i]
                closestDistance = distance
            end
        end
    end
    
    return closestPlayer, closestDistance
end

-- Get players in area
ESX.Game.GetPlayersInArea = function(coords, area)
    local players = ESX.Game.GetPlayers()
    local playersInArea = {}
    
    for i = 1, #players do
        local target = PLAYER.GET_PLAYER_PED(players[i])
        local targetCoords = ENTITY.GET_ENTITY_COORDS(target, true)
        local distance = MISC.GET_DISTANCE_BETWEEN_COORDS(
            targetCoords.x, targetCoords.y, targetCoords.z,
            coords.x, coords.y, coords.z, true
        )
        
        if distance <= area then
            table.insert(playersInArea, players[i])
        end
    end
    
    return playersInArea
end

-- Get all vehicles
ESX.Game.GetVehicles = function()
    local vehicles = {}
    local count = PoolMgr.GetCurrentVehicleCount()
    
    for i = 0, count - 1 do
        local veh = PoolMgr.GetVehicle(i)
        if veh and veh ~= 0 then
            table.insert(vehicles, veh)
        end
    end
    
    return vehicles
end

-- Get closest vehicle
ESX.Game.GetClosestVehicle = function(coords)
    local vehicles = ESX.Game.GetVehicles()
    local closestDistance = -1
    local closestVehicle = -1
    
    if coords == nil then
        local playerPed = PLAYER.PLAYER_PED_ID()
        coords = ENTITY.GET_ENTITY_COORDS(playerPed, true)
    end
    
    for i = 1, #vehicles do
        local vehicleCoords = ENTITY.GET_ENTITY_COORDS(vehicles[i], true)
        local distance = MISC.GET_DISTANCE_BETWEEN_COORDS(
            vehicleCoords.x, vehicleCoords.y, vehicleCoords.z,
            coords.x, coords.y, coords.z, true
        )
        
        if closestDistance == -1 or closestDistance > distance then
            closestVehicle = vehicles[i]
            closestDistance = distance
        end
    end
    
    return closestVehicle, closestDistance
end

-- Get vehicles in area
ESX.Game.GetVehiclesInArea = function(coords, area)
    local vehicles = ESX.Game.GetVehicles()
    local vehiclesInArea = {}
    
    for i = 1, #vehicles do
        local vehicleCoords = ENTITY.GET_ENTITY_COORDS(vehicles[i], true)
        local distance = MISC.GET_DISTANCE_BETWEEN_COORDS(
            vehicleCoords.x, vehicleCoords.y, vehicleCoords.z,
            coords.x, coords.y, coords.z, true
        )
        
        if distance <= area then
            table.insert(vehiclesInArea, vehicles[i])
        end
    end
    
    return vehiclesInArea
end

-- Get vehicle in direction
ESX.Game.GetVehicleInDirection = function()
    local playerPed = PLAYER.PLAYER_PED_ID()
    local playerCoords = ENTITY.GET_ENTITY_COORDS(playerPed, true)
    local inDirection = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(playerPed, 0.0, 5.0, 0.0)
    
    local rayHandle = SHAPETEST.START_SHAPE_TEST_RAY(
        playerCoords.x, playerCoords.y, playerCoords.z,
        inDirection.x, inDirection.y, inDirection.z,
        10, playerPed, 0
    )
    
    local _, hit, _, _, entityHit = SHAPETEST.GET_SHAPE_TEST_RESULT(rayHandle)
    
    if hit == 1 and ENTITY.GET_ENTITY_TYPE(entityHit) == 2 then
        return entityHit
    end
    
    return nil
end

-- Check if spawn point is clear
ESX.Game.IsSpawnPointClear = function(coords, radius)
    local vehicles = ESX.Game.GetVehiclesInArea(coords, radius)
    return #vehicles == 0
end

-- Get all peds
ESX.Game.GetPeds = function(ignoreList)
    ignoreList = ignoreList or {}
    local peds = {}
    local count = PoolMgr.GetCurrentPedCount()
    
    for i = 0, count - 1 do
        local ped = PoolMgr.GetPed(i)
        if ped and ped ~= 0 then
            local found = false
            for j = 1, #ignoreList do
                if ignoreList[j] == ped then
                    found = true
                    break
                end
            end
            if not found then
                table.insert(peds, ped)
            end
        end
    end
    
    return peds
end

-- Get closest ped
ESX.Game.GetClosestPed = function(coords, ignoreList)
    ignoreList = ignoreList or {}
    local peds = ESX.Game.GetPeds(ignoreList)
    local closestDistance = -1
    local closestPed = -1
    
    if coords == nil then
        local playerPed = PLAYER.PLAYER_PED_ID()
        coords = ENTITY.GET_ENTITY_COORDS(playerPed, true)
    end
    
    for i = 1, #peds do
        local pedCoords = ENTITY.GET_ENTITY_COORDS(peds[i], true)
        local distance = MISC.GET_DISTANCE_BETWEEN_COORDS(
            pedCoords.x, pedCoords.y, pedCoords.z,
            coords.x, coords.y, coords.z, true
        )
        
        if closestDistance == -1 or closestDistance > distance then
            closestPed = peds[i]
            closestDistance = distance
        end
    end
    
    return closestPed, closestDistance
end

-- Get all objects
ESX.Game.GetObjects = function()
    local objects = {}
    local count = PoolMgr.GetCurrentObjectCount()
    
    for i = 0, count - 1 do
        local obj = PoolMgr.GetObject(i)
        if obj and obj ~= 0 then
            table.insert(objects, obj)
        end
    end
    
    return objects
end

-- Get closest object
ESX.Game.GetClosestObject = function(filter, coords)
    local objects = ESX.Game.GetObjects()
    local closestDistance = -1
    local closestObject = -1
    
    if type(filter) == "string" then
        if filter ~= "" then
            filter = {filter}
        end
    end
    
    if coords == nil then
        local playerPed = PLAYER.PLAYER_PED_ID()
        coords = ENTITY.GET_ENTITY_COORDS(playerPed, true)
    end
    
    for i = 1, #objects do
        local foundObject = false
        
        if filter == nil or (type(filter) == "table" and #filter == 0) then
            foundObject = true
        else
            local objectModel = ENTITY.GET_ENTITY_MODEL(objects[i])
            for j = 1, #filter do
                if objectModel == GetHashKey(filter[j]) then
                    foundObject = true
                    break
                end
            end
        end
        
        if foundObject then
            local objectCoords = ENTITY.GET_ENTITY_COORDS(objects[i], true)
            local distance = MISC.GET_DISTANCE_BETWEEN_COORDS(
                objectCoords.x, objectCoords.y, objectCoords.z,
                coords.x, coords.y, coords.z, true
            )
            
            if closestDistance == -1 or closestDistance > distance then
                closestObject = objects[i]
                closestDistance = distance
            end
        end
    end
    
    return closestObject, closestDistance
end

-- ============================================================================
-- ESX.Game.Utils Functions
-- ============================================================================

ESX.Game.Utils.DrawText3D = function(coords, text, size)
    local _, x, y = GRAPHICS.GET_SCREEN_COORD_FROM_WORLD_COORD(coords.x, coords.y, coords.z)
    local camCoords = CAM.GET_GAMEPLAY_CAM_COORD()
    local dist = MISC.GET_DISTANCE_BETWEEN_COORDS(
        camCoords.x, camCoords.y, camCoords.z,
        coords.x, coords.y, coords.z, true
    )
    
    size = size or 1
    local scale = (size / dist) * 2
    local fov = (1 / CAM.GET_GAMEPLAY_CAM_FOV()) * 100
    scale = scale * fov
    
    HUD.SET_TEXT_SCALE(0.0 * scale, 0.55 * scale)
    HUD.SET_TEXT_FONT(0)
    HUD.SET_TEXT_COLOUR(255, 255, 255, 255)
    HUD.SET_TEXT_DROPSHADOW(0, 0, 0, 0, 255)
    HUD.SET_TEXT_OUTLINE()
    HUD.SET_TEXT_CENTRE(true)
    HUD.BEGIN_TEXT_COMMAND_DISPLAY_TEXT("STRING")
    HUD.ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text)
    HUD.END_TEXT_COMMAND_DISPLAY_TEXT(x, y, 0)
end

-- ============================================================================
-- ESX Weapon Component Helper
-- ============================================================================

ESX.GetWeaponComponent = function(weaponName, componentName)
    -- Return component hash - in Cherax we just return the hash directly
    return { hash = GetHashKey(componentName) }
end

-- ============================================================================
-- Register esx:getSharedObject Event Handler
-- ============================================================================

if AddEventHandler then
    AddEventHandler('esx:getSharedObject', function(callback)
        if callback and type(callback) == 'function' then
            callback(ESXStubObject)
        end
    end)
end

-- ============================================================================
-- Menu Rendering with Native Drawing
-- ============================================================================

local menuInputCooldown = 0
local MENU_KEY_UP = 172      -- Arrow Up
local MENU_KEY_DOWN = 173    -- Arrow Down
local MENU_KEY_SELECT = 176  -- Enter
local MENU_KEY_BACK = 177    -- Backspace

local function drawRect(x, y, width, height, r, g, b, a)
    GRAPHICS.DRAW_RECT(x, y, width, height, r, g, b, a, false)
end

local function drawText(text, x, y, scale, r, g, b, a)
    HUD.SET_TEXT_FONT(4)
    HUD.SET_TEXT_SCALE(scale, scale)
    HUD.SET_TEXT_COLOUR(r, g, b, a)
    HUD.SET_TEXT_DROPSHADOW(0, 0, 0, 0, 255)
    HUD.SET_TEXT_OUTLINE()
    HUD.BEGIN_TEXT_COMMAND_DISPLAY_TEXT("STRING")
    HUD.ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text)
    HUD.END_TEXT_COMMAND_DISPLAY_TEXT(x, y, 0)
end

local function renderMenus()
    -- Only render if there are menus open
    if #ESX.UI.Menu.Opened == 0 then
        return
    end
    
    -- Only render the LAST menu (the active/topmost one)
    local menu = ESX.UI.Menu.Opened[#ESX.UI.Menu.Opened]
    if not menu or not menu.isOpen then
        return
    end
    
    local gameTime = GetGameTimer()
    local title = (menu.data and menu.data.title) or menu.name or "Menu"
    local elements = menu.elements or (menu.data and menu.data.elements) or {}
    
    -- Ensure currentIndex is valid
    if menu.currentIndex == nil or menu.currentIndex < 1 then
        menu.currentIndex = 1
    end
    if menu.currentIndex > #elements and #elements > 0 then
        menu.currentIndex = #elements
    end
    
    local currentIndex = menu.currentIndex
    
    -- Menu positioning
    local menuX = 0.15
    local menuY = 0.2
    local menuWidth = 0.25
    local itemHeight = 0.035
    local headerHeight = 0.045
    
    -- Draw header background
    drawRect(menuX, menuY, menuWidth, headerHeight, 30, 30, 30, 230)
    
    -- Draw header text
    local cleanTitle = title
    if type(cleanTitle) == "string" then
        cleanTitle = cleanTitle:gsub("<[^>]+>", "")
    else
        cleanTitle = "Menu"
    end
    drawText(cleanTitle, menuX - (menuWidth / 2) + 0.01, menuY - 0.015, 0.45, 255, 255, 255, 255)
    
    -- Draw menu items
    for i = 1, #elements do
        local element = elements[i]
        if element then
            local itemY = menuY + headerHeight + ((i - 0.5) * itemHeight)
            local isSelected = (i == currentIndex)
            
            -- Background
            if isSelected then
                drawRect(menuX, itemY, menuWidth, itemHeight, 100, 100, 200, 200)
            else
                drawRect(menuX, itemY, menuWidth, itemHeight, 20, 20, 20, 180)
            end
            
            -- Item text
            local label = element.label or "Unknown"
            if type(label) == "string" then
                label = label:gsub("<[^>]+>", "")
            end
            
            local textColor = isSelected and {255, 255, 255} or {180, 180, 180}
            drawText(label, menuX - (menuWidth / 2) + 0.01, itemY - 0.012, 0.35, textColor[1], textColor[2], textColor[3], 255)
        end
    end
    
    -- Handle input
    if gameTime > menuInputCooldown then
        -- Navigate up
        if PAD.IS_DISABLED_CONTROL_PRESSED(0, MENU_KEY_UP) then
            menu.currentIndex = menu.currentIndex - 1
            if menu.currentIndex < 1 then
                menu.currentIndex = #elements
            end
            menuInputCooldown = gameTime + 150
            
            if menu.change then
                pcall(menu.change, { current = elements[menu.currentIndex] }, menu)
            end
        end
        
        -- Navigate down
        if PAD.IS_DISABLED_CONTROL_PRESSED(0, MENU_KEY_DOWN) then
            menu.currentIndex = menu.currentIndex + 1
            if menu.currentIndex > #elements then
                menu.currentIndex = 1
            end
            menuInputCooldown = gameTime + 150
            
            if menu.change then
                pcall(menu.change, { current = elements[menu.currentIndex] }, menu)
            end
        end
        
        -- Select
        if PAD.IS_DISABLED_CONTROL_JUST_PRESSED(0, MENU_KEY_SELECT) then
            if menu.submit and elements[menu.currentIndex] then
                pcall(menu.submit, { current = elements[menu.currentIndex] }, menu)
            end
            menuInputCooldown = gameTime + 200
        end
        
        -- Back
        if PAD.IS_DISABLED_CONTROL_JUST_PRESSED(0, MENU_KEY_BACK) then
            if menu.cancel then
                pcall(menu.cancel, {}, menu)
            else
                menu.close()
            end
            menuInputCooldown = gameTime + 200
        end
    end
    
    -- Disable controls while menu is open
    PAD.DISABLE_CONTROL_ACTION(0, MENU_KEY_UP, true)
    PAD.DISABLE_CONTROL_ACTION(0, MENU_KEY_DOWN, true)
    PAD.DISABLE_CONTROL_ACTION(0, MENU_KEY_SELECT, true)
    PAD.DISABLE_CONTROL_ACTION(0, MENU_KEY_BACK, true)
end

-- ============================================================================
-- Menu Rendering and Timeout Thread using Script.RegisterLooped
-- This ensures menus are drawn every frame without flickering
-- ============================================================================

Script.RegisterLooped(function()
    -- Render menus every frame
    renderMenus()
    
    -- Process timeouts
    local currTime = GetGameTimer()
    for i = 1, #ESX.TimeoutCallbacks do
        if ESX.TimeoutCallbacks[i] then
            if currTime >= (ESX.TimeoutCallbacks[i].time + ESX.TimeoutCallbacks[i].msec) then
                ESX.TimeoutCallbacks[i].cb()
                ESX.TimeoutCallbacks[i] = nil
            end
        end
    end
end)

-- ============================================================================
-- Export Module
-- ============================================================================

function M.getOpenMenus()
    return ESX.UI.Menu.Opened
end

return M
