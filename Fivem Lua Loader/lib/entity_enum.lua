-- ============================================================================
-- FiveM Entity Enumeration Functions
-- These are used by scripts with EnumerateEntities pattern
-- ============================================================================

local M = {}

-- Entity iterator state storage
local entityIterators = {}
local entityIteratorId = 0

-- ============================================================================
-- Ped Enumeration
-- ============================================================================

function FindFirstPed()
    entityIteratorId = entityIteratorId + 1
    local iterId = entityIteratorId
    
    local pedCount = PoolMgr.GetCurrentPedCount()
    if pedCount == 0 then
        return iterId, 0
    end
    
    entityIterators[iterId] = {
        type = "ped",
        index = 0,
        count = pedCount
    }
    
    local firstPed = PoolMgr.GetPed(0)
    return iterId, firstPed or 0
end

function FindNextPed(iter)
    local state = entityIterators[iter]
    if not state or state.type ~= "ped" then
        return false, 0
    end
    
    state.index = state.index + 1
    if state.index >= state.count then
        return false, 0
    end
    
    local ped = PoolMgr.GetPed(state.index)
    return true, ped or 0
end

function EndFindPed(iter)
    entityIterators[iter] = nil
end

-- ============================================================================
-- Vehicle Enumeration
-- ============================================================================

function FindFirstVehicle()
    entityIteratorId = entityIteratorId + 1
    local iterId = entityIteratorId
    
    local vehCount = PoolMgr.GetCurrentVehicleCount()
    if vehCount == 0 then
        return iterId, 0
    end
    
    entityIterators[iterId] = {
        type = "vehicle",
        index = 0,
        count = vehCount
    }
    
    local firstVeh = PoolMgr.GetVehicle(0)
    return iterId, firstVeh or 0
end

function FindNextVehicle(iter)
    local state = entityIterators[iter]
    if not state or state.type ~= "vehicle" then
        return false, 0
    end
    
    state.index = state.index + 1
    if state.index >= state.count then
        return false, 0
    end
    
    local veh = PoolMgr.GetVehicle(state.index)
    return true, veh or 0
end

function EndFindVehicle(iter)
    entityIterators[iter] = nil
end

-- ============================================================================
-- Object Enumeration
-- ============================================================================

function FindFirstObject()
    entityIteratorId = entityIteratorId + 1
    local iterId = entityIteratorId
    
    local objCount = PoolMgr.GetCurrentObjectCount()
    if objCount == 0 then
        return iterId, 0
    end
    
    entityIterators[iterId] = {
        type = "object",
        index = 0,
        count = objCount
    }
    
    local firstObj = PoolMgr.GetObject(0)
    return iterId, firstObj or 0
end

function FindNextObject(iter)
    local state = entityIterators[iter]
    if not state or state.type ~= "object" then
        return false, 0
    end
    
    state.index = state.index + 1
    if state.index >= state.count then
        return false, 0
    end
    
    local obj = PoolMgr.GetObject(state.index)
    return true, obj or 0
end

function EndFindObject(iter)
    entityIterators[iter] = nil
end

-- ============================================================================
-- Pickup Enumeration
-- ============================================================================

function FindFirstPickup()
    entityIteratorId = entityIteratorId + 1
    local iterId = entityIteratorId
    
    local pickupCount = PoolMgr.GetCurrentPickupCount and PoolMgr.GetCurrentPickupCount() or 0
    if pickupCount == 0 then
        return iterId, 0
    end
    
    entityIterators[iterId] = {
        type = "pickup",
        index = 0,
        count = pickupCount
    }
    
    local firstPickup = PoolMgr.GetPickup and PoolMgr.GetPickup(0) or 0
    return iterId, firstPickup or 0
end

function FindNextPickup(iter)
    local state = entityIterators[iter]
    if not state or state.type ~= "pickup" then
        return false, 0
    end
    
    state.index = state.index + 1
    if state.index >= state.count then
        return false, 0
    end
    
    local pickup = PoolMgr.GetPickup and PoolMgr.GetPickup(state.index) or 0
    return true, pickup or 0
end

function EndFindPickup(iter)
    entityIterators[iter] = nil
end

-- ============================================================================
-- Helper Functions
-- ============================================================================

function RevivePed()
    local playerPed = PLAYER.PLAYER_PED_ID()
    ENTITY.SET_ENTITY_HEALTH(playerPed, 200, 0)
    PED.RESURRECT_PED(playerPed)
    PED.CLEAR_PED_BLOOD_DAMAGE(playerPed)
    Logger.LogInfo("Player revived")
end

function shootAt(targetPed, weaponName)
    local playerPed = PLAYER.PLAYER_PED_ID()
    local weaponHash = MISC.GET_HASH_KEY(weaponName)
    local targetCoords = ENTITY.GET_ENTITY_COORDS(targetPed, true)
    
    WEAPON.GIVE_WEAPON_TO_PED(playerPed, weaponHash, 1, false, true)
    PED.SET_PED_SHOOTS_AT_COORD(playerPed, targetCoords.x, targetCoords.y, targetCoords.z, true)
end


-- ============================================================================
-- GetGamePool Implementation
-- ============================================================================

function GetGamePool(poolName)
    local handles = {}
    
    if poolName == "CPed" then
        local count = PoolMgr.GetCurrentPedCount()
        for i = 0, count - 1 do
            local ped = PoolMgr.GetPed(i)
            if ped then table.insert(handles, ped) end
        end
    elseif poolName == 'CVehicle' then
        local count = PoolMgr.GetCurrentVehicleCount()
        for i = 0, count - 1 do
            local veh = PoolMgr.GetVehicle(i)
            if veh then table.insert(handles, veh) end
        end
    elseif poolName == 'CObject' then
        local count = PoolMgr.GetCurrentObjectCount()
        for i = 0, count - 1 do
            local obj = PoolMgr.GetObject(i)
            if obj then table.insert(handles, obj) end
        end
    elseif poolName == 'CPickup' then
        if PoolMgr.GetCurrentPickupCount then
            local count = PoolMgr.GetCurrentPickupCount()
            for i = 0, count - 1 do
                local pickup = PoolMgr.GetPickup(i)
                if pickup then table.insert(handles, pickup) end
            end
        end
    end
    
    return handles
end

return M
