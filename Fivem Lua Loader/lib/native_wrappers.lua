-- ============================================================================
-- FiveM Native Wrappers
-- Wrapper functions for natives that need special handling
-- ============================================================================

-- vector3.lua is loaded before this file and sets up vector3Lib globally
local vector3Lib = vector3Lib or {}
local v3ToVector3 = vector3Lib.v3ToVector3 or function(v) return v end

local M = {}

-- ============================================================================
-- Screen Resolution Natives
-- These need to be global functions as many scripts call them directly
-- ============================================================================

function GetActiveScreenResolution()
    local w, h = ImGui.GetDisplaySize()
    return math.floor(w), math.floor(h)
end

function GetScreenActiveResolution()
    local w, h = ImGui.GetDisplaySize()
    return math.floor(w), math.floor(h)
end

function GetActualScreenResolution()
    local w, h = ImGui.GetDisplaySize()
    return math.floor(w), math.floor(h)
end

function GetScreenResolution()
    local w, h = ImGui.GetDisplaySize()
    return math.floor(w), math.floor(h)
end

-- Raw native hash functions that some scripts call directly
-- N_0x873c9f3104101dd3 = GET_ACTUAL_SCREEN_RESOLUTION / GET_ACTIVE_SCREEN_RESOLUTION
function N_0x873c9f3104101dd3()
    local w, h = ImGui.GetDisplaySize()
    return math.floor(w), math.floor(h)
end

-- Alias with lowercase (Lua is case-sensitive but some scripts may vary)
N_0x873C9F3104101DD3 = N_0x873c9f3104101dd3

-- ============================================================================
-- NOTE: V3 to vector3 conversion is now automatic via InvokeV3 in natives.lua
-- The following wrappers are only needed for special handling (default args, etc)
-- ============================================================================

-- GetOffsetFromEntityInWorldCoords - provide default offsets when not specified
-- Some scripts call with only the entity argument
function GetOffsetFromEntityInWorldCoords(entity, offsetX, offsetY, offsetZ)
    -- If entity is nil or invalid, return a safe default
    if entity == nil or entity == 0 then
        return vector3(0, 0, 0)
    end
    local result = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(entity, offsetX or 0.0, offsetY or 0.0, offsetZ or 0.0)
    -- If the result is nil (entity doesn't exist), return safe default
    if result == nil then
        return vector3(0, 0, 0)
    end
    return result
end

-- RotationToDirection - converts rotation angles to a direction vector
-- Common FiveM helper function used for aiming/camera direction
function RotationToDirection(rotation)
    if not rotation then
        return vector3(0, 0, 0)
    end
    
    local rx = rotation.x or rotation[1] or 0
    local ry = rotation.y or rotation[2] or 0
    local rz = rotation.z or rotation[3] or 0
    
    -- Convert degrees to radians
    local radX = rx * math.pi / 180.0
    local radZ = rz * math.pi / 180.0
    
    local absX = math.abs(math.cos(radX))
    
    return vector3(
        -math.sin(radZ) * absX,
        math.cos(radZ) * absX,
        math.sin(radX)
    )
end

-- GetCamMatrix - FiveM-specific native that returns camera matrix vectors
-- Returns: rightVector, forwardVector, upVector, position
-- Hash: 0x8F57A89D
function GetCamMatrix(camera)
    -- Get camera position and rotation
    local pos = CAM.GET_CAM_COORD(camera)
    local rot = CAM.GET_CAM_ROT(camera, 2)
    
    if not pos or not rot then
        return vector3(1, 0, 0), vector3(0, 1, 0), vector3(0, 0, 1), vector3(0, 0, 0)
    end
    
    -- Convert rotation to radians
    local radX = (rot.x or 0) * math.pi / 180.0
    local radY = (rot.y or 0) * math.pi / 180.0
    local radZ = (rot.z or 0) * math.pi / 180.0
    
    -- Calculate forward vector from rotation
    local cosX = math.cos(radX)
    local sinX = math.sin(radX)
    local cosZ = math.cos(radZ)
    local sinZ = math.sin(radZ)
    
    local forwardVec = vector3(
        -sinZ * cosX,
        cosZ * cosX,
        sinX
    )
    
    -- Calculate right vector (perpendicular to forward in XY plane)
    local rightVec = vector3(
        cosZ,
        sinZ,
        0
    )
    
    -- Calculate up vector (cross product of forward and right)
    local upVec = vector3(
        rightVec.y * forwardVec.z - rightVec.z * forwardVec.y,
        rightVec.z * forwardVec.x - rightVec.x * forwardVec.z,
        rightVec.x * forwardVec.y - rightVec.y * forwardVec.x
    )
    
    return rightVec, forwardVec, upVec, pos
end

-- ============================================================================
-- Vehicle Color Natives (FiveM-specific stubs)
-- These don't exist in normal GTA5/Cherax but are used by FiveM scripts
-- ============================================================================

-- SetVehicleModColor_1 - Sets primary paint type and color
-- paintType: 0=Normal, 1=Metallic, 2=Pearl, 3=Matte, 4=Metal, 5=Chrome
-- Note: This is a FiveM-specific native, stubbed as no-op
function SetVehicleModColor_1(vehicle, paintType, color, pearlescentColor)
    -- Stub - this native doesn't exist in vanilla GTA5/Cherax
    -- Vehicle colors are set through other means in Cherax
end

-- SetVehicleModColor_2 - Sets secondary paint type and color
-- paintType: 0=Normal, 1=Metallic, 2=Pearl, 3=Matte, 4=Metal, 5=Chrome
-- Note: This is a FiveM-specific native, stubbed as no-op
function SetVehicleModColor_2(vehicle, paintType, color)
    -- Stub - this native doesn't exist in vanilla GTA5/Cherax
end

-- CreateVehicle wrapper - scripts often pass vector3 for coordinates
-- Native expects: modelHash, x, y, z, heading, isNetwork, bScriptHostVeh, p7
-- Some scripts call: CreateVehicle(hash, vector3, heading, isNetwork, ...)
function CreateVehicle(modelHash, x, y, z, heading, isNetwork, bScriptHostVeh, p7)
    -- Check if x is a vector3 (table/userdata with x,y,z)
    if type(x) == "table" or type(x) == "userdata" then
        local vec = x
        local vx = vec.x or vec[1] or 0
        local vy = vec.y or vec[2] or 0
        local vz = vec.z or vec[3] or 0
        -- y becomes heading, z becomes isNetwork, heading becomes bScriptHostVeh, etc.
        return VEHICLE.CREATE_VEHICLE(modelHash, vx, vy, vz, y or 0.0, z or true, heading or true, isNetwork or false)
    else
        -- Standard call with separate coordinates
        return VEHICLE.CREATE_VEHICLE(modelHash, x or 0.0, y or 0.0, z or 0.0, heading or 0.0, isNetwork or true, bScriptHostVeh or true, p7 or false)
    end
end

-- StartNetworkedParticleFxNonLoopedAtCoord wrapper - scripts often pass vector3 for coordinates
-- Native expects: effectName, xPos, yPos, zPos, xRot, yRot, zRot, scale, xAxis, yAxis, zAxis, p11
-- Some scripts call: StartNetworkedParticleFxNonLoopedAtCoord(effectName, vector3, xRot, yRot, zRot, scale, ...)
function StartNetworkedParticleFxNonLoopedAtCoord(effectName, xPos, yPos, zPos, xRot, yRot, zRot, scale, xAxis, yAxis, zAxis, p11)
    -- Check if xPos is a vector3 (table/userdata with x,y,z)
    if type(xPos) == "table" or type(xPos) == "userdata" then
        local vec = xPos
        local vx = vec.x or vec[1] or 0
        local vy = vec.y or vec[2] or 0
        local vz = vec.z or vec[3] or 0
        -- Arguments shift: yPos becomes xRot, zPos becomes yRot, xRot becomes zRot, etc.
        return GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(effectName, vx, vy, vz, yPos or 0.0, zPos or 0.0, xRot or 0.0, yRot or 1.0, zRot or false, scale or false, xAxis or false, yAxis or false)
    else
        -- Standard call with separate coordinates
        return GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(effectName, xPos or 0.0, yPos or 0.0, zPos or 0.0, xRot or 0.0, yRot or 0.0, zRot or 0.0, scale or 1.0, xAxis or false, yAxis or false, zAxis or false, p11 or false)
    end
end

-- GetWorldPositionOfEntityBone - now handled automatically by InvokeV3

-- GetDistanceBetweenCoords wrapper - handles both calling conventions:
-- FiveM style: GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, useZ)
-- Vector style: GetDistanceBetweenCoords(vec1, vec2) or GetDistanceBetweenCoords(vec1, vec2, useZ)
function GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, useZ)
    -- Check if first arg is a vector/table (has x,y,z properties)
    if type(x1) == "table" or type(x1) == "userdata" then
        local vec1 = x1
        local vec2 = y1  -- second arg is the second vector
        local useZ3d = z1 -- third arg would be useZ
        
        -- Handle nil vectors gracefully
        if not vec1 or not vec2 then
            return 0.0
        end
        
        -- Extract coordinates with fallbacks
        local px1 = vec1.x or vec1[1] or 0
        local py1 = vec1.y or vec1[2] or 0
        local pz1 = vec1.z or vec1[3] or 0
        local px2 = vec2.x or vec2[1] or 0
        local py2 = vec2.y or vec2[2] or 0
        local pz2 = vec2.z or vec2[3] or 0
        
        return MISC.GET_DISTANCE_BETWEEN_COORDS(px1, py1, pz1, px2, py2, pz2, useZ3d ~= false)
    else
        -- Standard 6+ argument form
        return MISC.GET_DISTANCE_BETWEEN_COORDS(x1 or 0, y1 or 0, z1 or 0, x2 or 0, y2 or 0, z2 or 0, useZ ~= false)
    end
end

-- RequestCollisionAtCoord wrapper - handles vector3 argument
function RequestCollisionAtCoord(x, y, z)
    if type(x) == "table" or type(x) == "userdata" then
        local vec = x
        local px = vec.x or vec[1] or 0
        local py = vec.y or vec[2] or 0
        local pz = vec.z or vec[3] or 0
        return STREAMING.REQUEST_COLLISION_AT_COORD(px, py, pz)
    else
        return STREAMING.REQUEST_COLLISION_AT_COORD(x or 0, y or 0, z or 0)
    end
end

-- SetEntityRotation wrapper - handles vector3 rotation argument
function SetEntityRotation(entity, pitch, roll, yaw, rotationOrder, p5)
    if type(pitch) == "table" or type(pitch) == "userdata" then
        local vec = pitch
        -- Shifting arguments since the second one consumed the vector
        local actualRotationOrder = roll 
        local actualP5 = yaw
        
        local px = vec.x or vec[1] or 0
        local py = vec.y or vec[2] or 0
        local pz = vec.z or vec[3] or 0
        
        return ENTITY.SET_ENTITY_ROTATION(entity, px, py, pz, actualRotationOrder or 2, actualP5 or true)
    else
        return ENTITY.SET_ENTITY_ROTATION(entity, pitch or 0, roll or 0, yaw or 0, rotationOrder or 2, p5 or true)
    end
end

-- GetGroundZFor_3dCoord wrapper - handle pointer return for Z coord
function GetGroundZFor_3dCoord(x, y, z, ignoreWater)
    -- Use Cherax API function GTA.GetGroundZ(x, y)
    -- It returns bool, number (z) which matches the expected return signature
    return GTA.GetGroundZ(x, y)
end

-- Also alias standard PascalCase to this wrapper just in case
GetGroundZFor3dCoord = GetGroundZFor_3dCoord

-- DrawLine wrapper - handles vector3 arguments
-- FiveM scripts often call: DrawLine(vec1, vec2, r, g, b, a)
-- But native expects: DrawLine(x1, y1, z1, x2, y2, z2, r, g, b, a)
function DrawLine(x1, y1, z1, x2, y2, z2, red, green, blue, alpha)
    -- Check if first arg is a vector/table
    if type(x1) == "table" or type(x1) == "userdata" then
        local vec1 = x1
        local vec2 = y1  -- second arg is the second vector
        local r = z1 or 255
        local g = x2 or 255
        local b = y2 or 255
        local a = z2 or 255
        
        local px1 = vec1.x or vec1[1] or 0
        local py1 = vec1.y or vec1[2] or 0
        local pz1 = vec1.z or vec1[3] or 0
        local px2 = vec2.x or vec2[1] or 0
        local py2 = vec2.y or vec2[2] or 0
        local pz2 = vec2.z or vec2[3] or 0
        
        return GRAPHICS.DRAW_LINE(px1, py1, pz1, px2, py2, pz2, r, g, b, a)
    else
        -- Standard 10 argument form
        return GRAPHICS.DRAW_LINE(x1 or 0, y1 or 0, z1 or 0, x2 or 0, y2 or 0, z2 or 0, red or 255, green or 255, blue or 255, alpha or 255)
    end
end

-- ============================================================================
-- Drawing Natives Compatibility
-- ============================================================================

-- BeginTextCommandDisplayText wrapper - FiveM scripts use custom text entries like
-- "text_buffer" registered via AddTextEntry, but Cherax doesn't support dynamic GXT entries.
-- We remap them to "STRING" which is a built-in label that works.
function BeginTextCommandDisplayText(textEntry)
    -- Map common FiveM custom text entries to the built-in "STRING" label
    if textEntry and textEntry ~= "STRING" then
        textEntry = "STRING"
    end
    HUD.BEGIN_TEXT_COMMAND_DISPLAY_TEXT(textEntry or "STRING")
end

-- Also wrap SetTextEntry (old name for the same native)
function SetTextEntry(textEntry)
    BeginTextCommandDisplayText(textEntry)
end

-- Text components - always convert to string to prevent crashes
function AddTextComponentString(text)
    HUD.ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(tostring(text))
end

function AddTextComponentSubstringPlayerName(text)
    HUD.ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(tostring(text))
end

function AddTextComponentSubstringWebsite(text)
    HUD.ADD_TEXT_COMPONENT_SUBSTRING_WEBSITE(tostring(text))
end

-- Drawing primitives with extra default parameters
function DrawRect(x, y, width, height, r, g, b, a)
    GRAPHICS.DRAW_RECT(x, y, width, height, r, g, b, a, false)
end

function DrawSprite(textureDict, textureName, x, y, width, height, rotation, r, g, b, a)
    GRAPHICS.DRAW_SPRITE(textureDict, textureName, x, y, width, height, rotation, r, g, b, a, false, nil)
end

-- DrawMarker wrapper - scripts often pass vector3 for position
-- Native expects: type, posX, posY, posZ, dirX, dirY, dirZ, rotX, rotY, rotZ, scaleX, scaleY, scaleZ, r, g, b, a, bobUpAndDown, faceCamera, p19, rotate, textureDict, textureName, drawOnEnts
-- Some scripts call: DrawMarker(type, vector3, dirX, dirY, dirZ, rotX, rotY, rotZ, scaleX, scaleY, scaleZ, r, g, b, a, ...)
function DrawMarker(markerType, posX, posY, posZ, dirX, dirY, dirZ, rotX, rotY, rotZ, scaleX, scaleY, scaleZ, red, green, blue, alpha, bobUpAndDown, faceCamera, p19, rotate, textureDict, textureName, drawOnEnts)
    -- Check if posX is a vector3 (table/userdata with x,y,z)
    if type(posX) == "table" or type(posX) == "userdata" then
        local vec = posX
        local vx = vec.x or vec[1] or 0
        local vy = vec.y or vec[2] or 0
        local vz = vec.z or vec[3] or 0
        -- Arguments shift: posY becomes dirX, posZ becomes dirY, dirX becomes dirZ, etc.
        -- textureDict (now arg 19) and textureName (now arg 20) may be nil, convert to empty string
        local td = faceCamera
        local tn = p19
        if td == nil then td = "" end
        if tn == nil then tn = "" end
        return GRAPHICS.DRAW_MARKER(markerType, vx, vy, vz, 
            posY or 0.0, posZ or 0.0, dirX or 0.0,  -- dirX, dirY, dirZ
            dirY or 0.0, dirZ or 0.0, rotX or 0.0,  -- rotX, rotY, rotZ
            rotY or 1.0, rotZ or 1.0, scaleX or 1.0,  -- scaleX, scaleY, scaleZ
            scaleY or 255, scaleZ or 255, red or 255, green or 255,  -- r, g, b, a
            blue or false, alpha or false,  -- bobUpAndDown, faceCamera
            bobUpAndDown or 0,  -- p19
            rotate or false, td, tn, drawOnEnts or false)
    else
        -- Standard call with separate coordinates
        -- Handle nil textureDict and textureName
        local td = textureDict
        local tn = textureName
        if td == nil then td = "" end
        if tn == nil then tn = "" end
        return GRAPHICS.DRAW_MARKER(markerType, posX or 0.0, posY or 0.0, posZ or 0.0, 
            dirX or 0.0, dirY or 0.0, dirZ or 0.0, 
            rotX or 0.0, rotY or 0.0, rotZ or 0.0, 
            scaleX or 1.0, scaleY or 1.0, scaleZ or 1.0, 
            red or 255, green or 255, blue or 255, alpha or 255, 
            bobUpAndDown or false, faceCamera or false, 
            p19 or 0, rotate or false, td, tn, drawOnEnts or false)
    end
end

-- GetTextureResolution returns V3 but scripts expect table with [1], [2] indices
function GetTextureResolution(textureDict, textureName)
    local v3 = GRAPHICS.GET_TEXTURE_RESOLUTION(textureDict, textureName)
    return v3ToVector3(v3)  -- Converts to FiveM vector3 which supports [1], [2], [3] indexing
end

-- SetVehicleDirtLevel wrapper - scripts sometimes call without dirtLevel argument
function SetVehicleDirtLevel(vehicle, dirtLevel)
    VEHICLE.SET_VEHICLE_DIRT_LEVEL(vehicle, dirtLevel or 0.0)
end

-- SetVehicleOnGroundProperly wrapper - scripts often call without p1 argument
-- Per native docs, p1 is always set to 5.0 in game scripts
function SetVehicleOnGroundProperly(vehicle, p1)
    return VEHICLE.SET_VEHICLE_ON_GROUND_PROPERLY(vehicle, p1 or 5.0)
end

-- ApplyForceToEntity wrapper - scripts often pass vector3 for force direction
-- Native expects: entity, forceFlags, x, y, z, offX, offY, offZ, boneIndex, isDirectionRel, ignoreUpVec, isForceRel, p12, p13
-- Some scripts call: ApplyForceToEntity(entity, flags, vector3, offX, offY, offZ, ...)
function ApplyForceToEntity(entity, forceFlags, x, y, z, offX, offY, offZ, boneIndex, isDirectionRel, ignoreUpVec, isForceRel, p12, p13)
    -- Check if x is a vector3 (table/userdata with x,y,z)
    if type(x) == "table" or type(x) == "userdata" then
        local vec = x
        -- Shift all arguments since vector consumed position 3
        local fx = vec.x or vec[1] or 0
        local fy = vec.y or vec[2] or 0
        local fz = vec.z or vec[3] or 0
        -- y becomes offX, z becomes offY, etc.
        return ENTITY.APPLY_FORCE_TO_ENTITY(entity, forceFlags, fx, fy, fz, 
            y or 0.0, z or 0.0, offX or 0.0, offY or 0, 
            offZ or false, boneIndex or false, isDirectionRel or false, ignoreUpVec or false, isForceRel or false)
    else
        -- Standard call with separate coordinates
        return ENTITY.APPLY_FORCE_TO_ENTITY(entity, forceFlags, 
            x or 0.0, y or 0.0, z or 0.0, 
            offX or 0.0, offY or 0.0, offZ or 0.0, 
            boneIndex or 0, isDirectionRel or false, ignoreUpVec or false, isForceRel or false, p12 or false, p13 or false)
    end
end

-- TaskPlayAnim wrapper - FiveM scripts often call with fewer than 11 arguments
-- Native expects: ped, animDict, animName, blendInSpeed, blendOutSpeed, duration, flag, playbackRate, lockX, lockY, lockZ
-- Scripts often omit: playbackRate, lockX, lockY, lockZ
function TaskPlayAnim(ped, animDictionary, animationName, blendInSpeed, blendOutSpeed, duration, flag, playbackRate, lockX, lockY, lockZ)
    -- Provide defaults for missing arguments
    blendInSpeed = blendInSpeed or 8.0
    blendOutSpeed = blendOutSpeed or 8.0
    duration = duration or -1
    flag = flag or 0
    playbackRate = playbackRate or 0.0  -- Default playback rate
    lockX = lockX or false
    lockY = lockY or false
    lockZ = lockZ or false
    
    TASK.TASK_PLAY_ANIM(ped, animDictionary, animationName, blendInSpeed, blendOutSpeed, duration, flag, playbackRate, lockX, lockY, lockZ)
end

-- Audio function wrappers with crash protection
function PlaySoundFrontend(soundId, audioName, audioRef, p3)
    local success, err = pcall(function()
        AUDIO.PLAY_SOUND_FRONTEND(soundId or -1, audioName or "", audioRef or "", p3 or false)
    end)
end

function StopSound(soundId)
    pcall(function()
        AUDIO.STOP_SOUND(soundId)
    end)
end

-- Text leading has different signature
function SetTextLeading(leading)
    HUD.SET_TEXT_LEADING(true, leading)
end

-- GetStreetNameAtCoord stub - this native crashes Cherax due to pointer parameter issues
-- Return 0,0 which means GetStreetNameFromHashKey will return empty strings
-- This prevents crashes - scripts just won't show street names
function GetStreetNameAtCoord(x, y, z, streetNamePtr, crossingRoadPtr)
    -- Stubbed to prevent crash - return empty hashes
    return 0, 0
end

-- ============================================================================
-- Player/Ped Wrappers
-- ============================================================================

function GetPlayerServerId(playerId)
    -- FiveM server IDs start at 1, not 0
    -- Convert player index (0-based) to server ID (1-based)
    return (playerId or 0) + 1
end

function GetPlayerFromServerId(serverId)
    -- Convert server ID (1-based) back to player index (0-based)
    return (serverId or 1) - 1
end

function GetPlayerInvincible_2(player)
    return PLAYER.GET_PLAYER_INVINCIBLE(player)
end

function GetPedBoneIndex(ped, boneId)
    return PED.GET_PED_BONE_INDEX(ped, boneId)
end

-- GetPedBoneCoords - now handled automatically by InvokeV3, but keep for default args
function GetPedBoneCoords(ped, boneId, offsetX, offsetY, offsetZ)
    return PED.GET_PED_BONE_COORDS(ped, boneId, offsetX or 0.0, offsetY or 0.0, offsetZ or 0.0)
end

function GetPlayerPed(playerId)
    if playerId == -1 then
        return PLAYER.PLAYER_PED_ID()
    end
    return PLAYER.GET_PLAYER_PED(playerId)
end

function PlayerId()
    return PLAYER.PLAYER_ID()
end

function PlayerPedId()
    return PLAYER.PLAYER_PED_ID()
end

function IsPedDeadOrDying(ped, p1)
    return PED.IS_PED_DEAD_OR_DYING(ped, p1)
end

function IsPedInAnyVehicle(ped, atGetIn)
    return PED.IS_PED_IN_ANY_VEHICLE(ped, atGetIn)
end

function GetVehiclePedIsUsing(ped)
    return PED.GET_VEHICLE_PED_IS_USING(ped)
end

-- ============================================================================
-- Input Wrappers - Enhanced to check disabled controls
-- ============================================================================

local simulatedInputs = {}

function M.SimulateInput(control, state)
    simulatedInputs[tostring(control)] = state
end

function IsControlJustReleased(controlGroup, control)
    if PAD.IS_CONTROL_JUST_RELEASED(controlGroup, control) then
        return true
    end
    return PAD.IS_DISABLED_CONTROL_JUST_RELEASED(controlGroup, control)
end

function IsControlJustPressed(controlGroup, control)
    if simulatedInputs[tostring(control)] then return true end
    if PAD.IS_CONTROL_JUST_PRESSED(controlGroup, control) then
        return true
    end
    return PAD.IS_DISABLED_CONTROL_JUST_PRESSED(controlGroup, control)
end

function IsControlPressed(controlGroup, control)
    if simulatedInputs[tostring(control)] then return true end
    if PAD.IS_CONTROL_PRESSED(controlGroup, control) then
        return true
    end
    return PAD.IS_DISABLED_CONTROL_PRESSED(controlGroup, control)
end

function IsDisabledControlPressed(padIndex, control)
    if simulatedInputs[tostring(control)] then return true end
    return PAD.IS_DISABLED_CONTROL_PRESSED(padIndex, control)
end

function IsDisabledControlJustPressed(padIndex, control)
    if simulatedInputs[tostring(control)] then return true end
    return PAD.IS_DISABLED_CONTROL_JUST_PRESSED(padIndex, control)
end

-- ============================================================================
-- Vehicle Wrappers - Handle vector arguments
-- ============================================================================

function GetClosestVehicle(x, y, z, radius, modelHash, flags)
    -- Handle vector argument (when first arg is a table/vector)
    if type(x) == "table" or type(x) == "userdata" then
        local coords = x
        local cx = coords[1] or coords.x or 0
        local cy = coords[2] or coords.y or 0
        local cz = coords[3] or coords.z or 0
        -- Shift arguments
        return VEHICLE.GET_CLOSEST_VEHICLE(cx, cy, cz, y or 10.0, z or 0, radius or 70)
    end
    return VEHICLE.GET_CLOSEST_VEHICLE(x, y, z, radius or 10.0, modelHash or 0, flags or 70)
end

function GetRandomVehicleInSphere(x, y, z, radius, modelHash, flags)
    -- Handle vector argument
    if type(x) == "table" or type(x) == "userdata" then
        local coords = x
        local cx = coords[1] or coords.x or 0
        local cy = coords[2] or coords.y or 0
        local cz = coords[3] or coords.z or 0
        return VEHICLE.GET_RANDOM_VEHICLE_IN_SPHERE(cx, cy, cz, y or 10.0, z or 0, radius or 0)
    end
    return VEHICLE.GET_RANDOM_VEHICLE_IN_SPHERE(x, y, z, radius or 10.0, modelHash or 0, flags or 0)
end

-- ============================================================================
-- Entity/Coords Wrappers
-- ============================================================================

function SetEntityCoords(entity, x, y, z, xAxis, yAxis, zAxis, clearArea)
    if type(x) == "table" then
        local coords = x
        ENTITY.SET_ENTITY_COORDS(entity, coords[1] or coords.x, coords[2] or coords.y, coords[3] or coords.z, false, false, false, false)
    else
        ENTITY.SET_ENTITY_COORDS(entity, x, y, z, xAxis or false, yAxis or false, zAxis or false, clearArea or false)
    end
end

function NetworkRequestControlOfEntity(entity)
    return NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
end

function NetworkExplodeVehicle(vehicle, isAudible, isInvisible, p3)
    NETWORK.NETWORK_EXPLODE_VEHICLE(vehicle, isAudible, isInvisible, false)
end

function AddExplosion(x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake)
    if type(x) == "table" then
        local coords = x
        FIRE.ADD_EXPLOSION(coords[1] or coords.x, coords[2] or coords.y, coords[3] or coords.z, y, z, explosionType or true, damageScale or false, isAudible or 0.0)
    else
        FIRE.ADD_EXPLOSION(x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake or 0.0)
    end
end

function SetVehicleGravityAmount(vehicle, gravity)
    -- No-op: this native is not available in standard GTA V
end

-- ============================================================================
-- Text Entry/GXT Functions
-- ============================================================================

local customTextEntries = {}

function AddTextEntry(entryKey, entryText)
    customTextEntries[entryKey] = entryText
    pcall(function()
        HUD.ADD_TEXT_ENTRY(entryKey, entryText)
    end)
end

-- ============================================================================
-- Utility Functions
-- ============================================================================

function roundNum(num, numDecimalPlaces)
    if num == nil then return 0 end
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- GetLocalTime - Returns year, month, day, hour, minute, second
local CheraxTimeGetEpoche = Time.GetEpoche
function GetLocalTime()
    local epoch = CheraxTimeGetEpoche()
    
    local days = math.floor(epoch / 86400)
    local remainingSeconds = epoch % 86400
    
    local hour = math.floor(remainingSeconds / 3600)
    local minute = math.floor((remainingSeconds % 3600) / 60)
    local second = remainingSeconds % 60
    
    local year = 1970
    local daysInYear
    
    while true do
        if (year % 4 == 0 and year % 100 ~= 0) or (year % 400 == 0) then
            daysInYear = 366
        else
            daysInYear = 365
        end
        
        if days < daysInYear then
            break
        end
        
        days = days - daysInYear
        year = year + 1
    end
    
    local daysInMonths = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
    if (year % 4 == 0 and year % 100 ~= 0) or (year % 400 == 0) then
        daysInMonths[2] = 29
    end
    
    local month = 1
    for i, daysInMonth in ipairs(daysInMonths) do
        if days < daysInMonth then
            month = i
            break
        end
        days = days - daysInMonth
    end
    
    local day = days + 1
    
    return year, month, day, hour, minute, second
end

return M
