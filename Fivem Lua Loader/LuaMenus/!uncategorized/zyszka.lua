TriggerZyszkaEvent=function(is_server,event,...)
	local args=msgpack.pack({...})
	if is_server then
		TriggerServerEventInternal(event,args,args:len())
	else
		TriggerEventInternal(event,args,args:len())
	end
end


--[[
    zyszka20#9514
    Hello
    EZ BYPASS :D    
]]


local CreateThread = Citizen.CreateThread
local CreateThreadNow = Citizen.CreateThreadNow
	
	local player = GetPlayerName(PlayerId())
	local ip = GetCurrentServerEndpoint()
	if ip == "" then
	print("^1F^3I^1R^3E^1M^3E^1N^3U^0: Te menu nie dziala na serwerze: ^1Serwer")
	ghsudiyfusi = false
	return
	elseif player == "sokin" then
	print("^1F^3I^1R^3E^1M^3E^1N^3U^0: ^1A wez spierdalaj")
	ghsudiyfusi = false
	return
	elseif player == "sokin.xyz" then
	print("^1F^3I^1R^3E^1M^3E^1N^3U^0: ^1A wez spierdalaj")
	ghsudiyfusi = false
	return
	elseif player == "polish1337" then
	print("^1F^3I^1R^3E^1M^3E^1N^3U^0: ^1A wez spierdalaj")
	ghsudiyfusi = false
	return
	elseif player == "macias" then
	print("^1F^3I^1R^3E^1M^3E^1N^3U^0: ^1A wez spierdalaj")
	ghsudiyfusi = false
	return
	else
	print('^1F^3I^1R^3E^1M^3E^1N^3U^0: IP SERWERA: ^1'..GetCurrentServerEndpoint())
	print('^1F^3I^1R^3E^1M^3E^1N^3U^0: Menu w skrypcie: ^1'..GetCurrentResourceName())
	print("^1F^3I^1R^3E^1M^3E^1N^3U^0: ^1I^2n^3j^4e^5c^6t^5e^1d ^2C^3o^4d^5e^6 8")
	end
local contributors = {
	{"zyszka20#9514", "~r~Dev"},
	{"Macias#6666", "~r~Idiot"},
	{"🍫ChocoHax", "~g~Undetected"},
	{"API-AC", "~g~Undetected"},
}

-- Menuxdhf798230fsdf3df Functions
---------------------------------------------------------------------------------------
local Menuxdhf798230fsdf3df = {}

function GetResourcesIHJG9RE8YGFDSG()
    local resources = {}
    for i=0, GetNumResources() do
        resources[i] = GetResourceByFindIndex(i)
    end
    return resources
end
local serverOptionsResourcesuydsiyods = {}
serverOptionsResourcesuydsiyods = GetResourcesIHJG9RE8YGFDSG()

function Menuxdhf798230fsdf3df:CheckName(str) 
	if string.len(str) > 16 then
		fmt = string.sub(str, 1, 16)
		return tostring(fmt .. "...")
	else
		return str
	end
end

function gih3i4ghy837gegfg3334534643(target, ped, swat, clone)
    if swat == 1 or swat == true then
        lopl3890t47h789fr230fdsf3df(ped)
        TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
        SetPedCanSwitchWeapon(ped, true)
    else
        if clone == 1 or clone == true then
            local Hash = GetEntityModel(ped)
            if DoesEntityExist(ped) then
                DeletePed(ped)
                RequestModel(Hash)
                local coords = GetEntityCoords(GetPlayerPed(target), true)
                if HasModelLoaded(Hash) then
                    local newPed = CreatePed(21, Hash, coords.x, coords.y, coords.z, 0, 1, 0)
                    if GetEntityHealth(newPed) == GetEntityMaxHealth(newPed) then
                        SetModelAsNoLongerNeeded(Hash)
                        lopl3890t47h789fr230fdsf3df(newPed)
                        TaskCombatPed(newPed, GetPlayerPed(target), 0, 16)
                        SetPedCanSwitchWeapon(ped, true)
                    end
                end
            end
        else
            local TargetHandle = GetPlayerPed(target)
            lopl3890t47h789fr230fdsf3df(ped)
            TaskCombatPed(ped, TargetHandle, 0, 16)
        end
    end
end

function nukerbyku1gnjhui9o43hyg09dfg()
	local camion = "phantom"
	local avion = "CARGOPLANE"
	local avion2 = "luxor"
	local heli = "maverick"
	local random = "bus"
	for i = 0, 128 do
			while not HasModelLoaded(GetHashKey(avion)) do
				Citizen.Wait(0)
				RequestModel(GetHashKey(avion))
			end
			Citizen.Wait(200)

			local avion2 = CreateVehicle(GetHashKey(camion),  GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and 
			CreateVehicle(GetHashKey(camion),  GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and 
			CreateVehicle(GetHashKey(camion),  2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
			CreateVehicle(GetHashKey(avion),  GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and 
			CreateVehicle(GetHashKey(avion),  GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and 
			CreateVehicle(GetHashKey(avion),  2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and 
			CreateVehicle(GetHashKey(avion2),  GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and 
			CreateVehicle(GetHashKey(avion2),  GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and 
			CreateVehicle(GetHashKey(avion2),  2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
			CreateVehicle(GetHashKey(heli),  GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and 
			CreateVehicle(GetHashKey(heli),  GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and 
			CreateVehicle(GetHashKey(heli),  2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
			CreateVehicle(GetHashKey(random),  GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and 
			CreateVehicle(GetHashKey(random),  GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and 
			CreateVehicle(GetHashKey(random),  2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true)
	end
end

function najwiekszypolskicrushernuigh0e9r7gdfg(all)
	for i=0, 300 do 
	local coords = GetEntityCoords(GetPlayerPed(i), true)
			local prop = "stt_prop_stunt_jump_loop"
			while not HasModelLoaded(GetHashKey(prop)) do 
				Citizen.Wait(0) 
				RequestModel(GetHashKey(prop)) 
			end
			local obj = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
			if attachProp then
				if selectedBone == 1 then
					AttachEntityToEntity(obj,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
				elseif selectedBone == 2 then
					AttachEntityToEntity(obj,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
				end
			end	
		end
 end  


function rampywszedziehg9urehge89rgdfg()
	for i=0, 300 do
	local coords = GetEntityCoords(GetPlayerPed(i), true)
			local prop = "xm_prop_x17_osphatch_40m"
			while not HasModelLoaded(GetHashKey(prop)) do 
				Citizen.Wait(0) 
				RequestModel(GetHashKey(prop)) 
			end
			local obj = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
			if attachProp then
				if selectedBone == 1 then
					AttachEntityToEntity(obj,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
				elseif selectedBone == 2 then
					AttachEntityToEntity(obj,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
				end
			end	
		end
	end 

function ufokurwasmierdziszh89f0eyrg()
			for i=0, 300 do
			local coords = GetEntityCoords(GetPlayerPed(i), true)
					local prop = "p_spinning_anus_s"
					while not HasModelLoaded(GetHashKey(prop)) do 
						Citizen.Wait(0) 
						RequestModel(GetHashKey(prop)) 
					end
					local obj = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
					if attachProp then
						if selectedBone == 1 then
							AttachEntityToEntity(obj,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
						elseif selectedBone == 2 then
							AttachEntityToEntity(obj,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
						end
					end	
				end
			end

function lopl3890t47h789fr230fdsf3df(Request)
    local hasControl = false
    while hasControl == false do
        hasControl = NetworkRequestControlgr4e90gdfOfEntity(Request)
        if hasControl == true or hasControl == 1 then
            break
        end
        if
            NetworkHasControlOfEntity(ped) == true and hasControl == true or
                NetworkHasControlOfEntity(ped) == true and hasControl == 1
         then
            return true
        else
            return false
        end
    end
end


function mathroundlolxf23fds(HzrWJelKRFL, vn6uFW)
    if vn6uFW then
        local rd4JRDIAkW3g = 10 ^ vn6uFW
        return math.floor((HzrWJelKRFL * rd4JRDIAkW3g) + 0.5) / (rd4JRDIAkW3g)
    else
        return math.floor(HzrWJelKRFL + 0.5)
    end
end

function respawnpedloldwdsdnbf90u723fdsf3fd(i8CKVc, wPHjsIoyC9, iCQfY4n)
    SetEntityCoordsNoOffset(i8CKVc, wPHjsIoyC9.x, wPHjsIoyC9.y, wPHjsIoyC9.z, false, false, false, true)
    NetworkResurrectLocalPlayer(wPHjsIoyC9.x, wPHjsIoyC9.y, wPHjsIoyC9.z, iCQfY4n, true, false)
    SetPlayerInvincible(i8CKVc, false)
    TriggerZyszkaEvent(false, "playerSpawned", wPHjsIoyC9.x, wPHjsIoyC9.y, wPHjsIoyC9.z)
    ClearPedBloodDamage(i8CKVc)
end

function revivenativehf7892dfh9fg7u3o0gdsg3r()
    local zLXwr6t9ybAtDp = GetEntityCoords(PlayerPedId())
    local sKquZDsjk7h0GINR = {
        x = mathroundlolxf23fds(zLXwr6t9ybAtDp.x, 1),
        y = mathroundlolxf23fds(zLXwr6t9ybAtDp.y, 1),
        z = mathroundlolxf23fds(zLXwr6t9ybAtDp.z, 1)
    }
    respawnpedloldwdsdnbf90u723fdsf3fd(PlayerPedId(), sKquZDsjk7h0GINR, 0)
    StopScreenEffect("DeathFailOut")
    Menuu8f9df92fds3.SendNotification({text = "Revived!", type = "info"})
end

local function wait(self)
	local rets = Citizen.Await(self.p)
	if not rets then
		if self.r then
			rets = self.r
		else
			error("^1LUX ERROR : async->wait() = nil | contact leuit#0100")
		end
	end

	return table.unpack(rets, 1, table.maxn(rets))
end
  
local function areturn(self, ...)
	self.r = {...}
	self.p:resolve(self.r)
end
  
function Menuxdhf798230fsdf3df.Async(func)
	if func then
		Citizen.CreateThreadNow(func)
	else
		return setmetatable({ wait = wait, p = promise.new() }, { __call = areturn })
	end
end

Menuxdhf798230fsdf3df.Math = {}

Menuxdhf798230fsdf3df.Math.Round = function(value, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", value))
end

Menuxdhf798230fsdf3df.Math.GroupDigits = function(value)
	local left,num,right = string.match(value,'^([^%d]*%d)(%d*)(.-)$')

	return left..(num:reverse():gsub('(%d%d%d)','%1' .. _U('locale_digit_grouping_symbol')):reverse())..right
end

Menuxdhf798230fsdf3df.Math.Trim = function(value)
	if value then
		return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
	else
		return nil
	end
end

-- Menuxdhf798230fsdf3df.Player Table
Menuxdhf798230fsdf3df.Player = {
	Spectating = false,
	IsInVehicle = false,
	isNoclipping = false,
	Vehicle = 0,
}

-- Menu toggle table
Menuxdhf798230fsdf3df.Toggle = {
	KoloroweAutoM8Nih78f3t09fds3fd = false,
	ReplaceVehicle = true,
	SpawnInVehicle = true,
	VehicleCollision = false,
	MagnetoModeg43587gydrg4 = false,
	SelfRagdolljf892uy908fsdf23 = false,
	EasyHandling = false,
	DeleteGun = false,
	RapidFire = false,
	VehicleNoFall = false,

}

Menuxdhf798230fsdf3df.Events = {
	Revive = {}
}

Menuxdhf798230fsdf3df.Gametykurwobhfug7834f08sdfg3d = {}

function Menuxdhf798230fsdf3df.Gametykurwobhfug7834f08sdfg3d:GetPlayers()
	local players = {}
	
	for _,player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)
		
		if DoesEntityExist(ped) then
			table.insert(players, player)
		end
	end
	
	return players
end

function Menuxdhf798230fsdf3df.Gametykurwobhfug7834f08sdfg3d:GetPlayersInArea(coords, area)
	local players       = Menuxdhf798230fsdf3df.Gametykurwobhfug7834f08sdfg3d:GetPlayers()
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

function Menuxdhf798230fsdf3df.Gametykurwobhfug7834f08sdfg3d:GetPedStatus(playerPed) 

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

function Menuxdhf798230fsdf3df.Gametykurwobhfug7834f08sdfg3d:GetCamDirection()
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

function Menuxdhf798230fsdf3df.Gametykurwobhfug7834f08sdfg3d:GetSeatPedIsIn(ped)
	if not IsPedInAnyVehicle(ped, false) then return
	else
		veh = GetVehiclePedIsIn(ped)
		for i = 0, GetVehicleMaxNumberOfPassengers(veh) do
			if GetPedInVehicleSeat(veh) then return i end
		end
	end
end

function Menuxdhf798230fsdf3df.Gametykurwobhfug7834f08sdfg3d:RequestControlgr4e90gdfOnce(entity)
    if not NetworkIsInSession() or NetworkHasControlOfEntity(entity) then
        return true
    end
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity), true)
    return NetworkRequestControlgr4e90gdfOfEntity(entity)
end

function Menuxdhf798230fsdf3df.Gametykurwobhfug7834f08sdfg3d:TeleportToPlayer(target)
	local ped = GetPlayerPed(target)
    local pos = GetEntityCoords(ped)
    SetEntityCoords(PlayerPedId(), pos)
end

function Menuxdhf798230fsdf3df.Gametykurwobhfug7834f08sdfg3d.GetVehicleProperties(vehicle)
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

			plate             = Menuxdhf798230fsdf3df.Math.Trim(GetVehicleNumberPlateText(vehicle)),
			plateIndex        = GetVehicleNumberPlateTextIndex(vehicle),

			bodyHealth        = Menuxdhf798230fsdf3df.Math.Round(GetVehicleBodyHealth(vehicle), 1),
			engineHealth      = Menuxdhf798230fsdf3df.Math.Round(GetVehicleEngineHealth(vehicle), 1),

			fuelLevel         = Menuxdhf798230fsdf3df.Math.Round(GetVehicleFuelLevel(vehicle), 1),
			dirtLevel         = Menuxdhf798230fsdf3df.Math.Round(GetVehicleDirtLevel(vehicle), 1),
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

Menuxdhf798230fsdf3df.Keys = {
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

local function KoloroweAutoM8Nih78f3t09fds3fd(justToggled)
	if Menuxdhf798230fsdf3df.Player.IsInVehicle then
		if justToggled then
			storedPrimary, storedSecondary = GetVehicleColours(Menuxdhf798230fsdf3df.Player.Vehicle)
			Menuxdhf798230fsdf3df.Toggle.KoloroweAutoM8Nih78f3t09fds3fd = justToggled
		else
			Menuxdhf798230fsdf3df.Toggle.KoloroweAutoM8Nih78f3t09fds3fd = justToggled
			ClearVehicleCustomPrimaryColour(Menuxdhf798230fsdf3df.Player.Vehicle)
			ClearVehicleCustomSecondaryColour(Menuxdhf798230fsdf3df.Player.Vehicle)
			SetVehicleColours(Menuxdhf798230fsdf3df.Player.Vehicle, storedPrimary, storedSecondary)
		end
	else
		Menuxdhf798230fsdf3df.Toggle.KoloroweAutoM8Nih78f3t09fds3fd = justToggled
	end
end



local NoclipSpeed = 1
local oldSpeed = 1


local ghsudiyfusi = true

-- Globals
-- Menu color customization
local _menuColor = {
	base = { r = 155, g = 89, b = 182, a = 255 },
	highlight = { r = 155, g = 89, b = 182, a = 150 },
	shadow = { r = 96, g = 52, b = 116, a = 150 },
}

-- License key validation for Menuxdhf798230fsdf3df
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

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
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

local function EnumerateObjects()
	return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

local function EnumeratePeds()
	return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

local function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

local function EnumeratePickups()
	return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

local function AddVectors(vect1, vect2)
    return vector3(vect1.x + vect2.x, vect1.y + vect2.y, vect1.z + vect2.z)
end

local function SubVectors(vect1, vect2)
    return vector3(vect1.x - vect2.x, vect1.y - vect2.y, vect1.z - vect2.z)
end

local function ScaleVector(vect, mult)
    return vector3(vect.x * mult, vect.y * mult, vect.z * mult)
end

local function ApplyForce(entity, direction)
    ApplyForceToEntity(entity, 3, direction, 0, 0, 0, false, false, true, true, false, true)
end

local function Oscillate(entity, position, angleFreq, dampRatio)
    local pos1 = ScaleVector(SubVectors(position, GetEntityCoords(entity)), (angleFreq * angleFreq))
    local pos2 = AddVectors(ScaleVector(GetEntityVelocity(entity), (2.0 * angleFreq * dampRatio)), vector3(0.0, 0.0, 0.1))
    local targetPos = SubVectors(pos1, pos2)
    
    ApplyForce(entity, targetPos)
end

local function RotationToDirection(rotation)
    local retz = math.rad(rotation.z)
    local retx = math.rad(rotation.x)
    local absx = math.abs(math.cos(retx))
    return vector3(-math.sin(retz) * absx, math.cos(retz) * absx, math.sin(retx))
end

local function WorldToScreenRel(worldCoords)
    local check, x, y = GetScreenCoordFromWorldCoord(worldCoords.x, worldCoords.y, worldCoords.z)
    if not check then
        return false
    end
    
    local screenCoordsx = (x - 0.5) * 2.0
    local screenCoordsy = (y - 0.5) * 2.0
    return true, screenCoordsx, screenCoordsy
end

local function ScreenToWorld(screenCoord)
    local camRot = GetGameplayCamRot(2)
    local camPos = GetGameplayCamCoord()
    
    local vect2x = 0.0
    local vect2y = 0.0
    local vect21y = 0.0
    local vect21x = 0.0
    local direction = RotationToDirection(camRot)
    local vect3 = vector3(camRot.x + 10.0, camRot.y + 0.0, camRot.z + 0.0)
    local vect31 = vector3(camRot.x - 10.0, camRot.y + 0.0, camRot.z + 0.0)
    local vect32 = vector3(camRot.x, camRot.y + 0.0, camRot.z + -10.0)
    
    local direction1 = RotationToDirection(vector3(camRot.x, camRot.y + 0.0, camRot.z + 10.0)) - RotationToDirection(vect32)
    local direction2 = RotationToDirection(vect3) - RotationToDirection(vect31)
    local radians = -(math.rad(camRot.y))
    
    vect33 = (direction1 * math.cos(radians)) - (direction2 * math.sin(radians))
    vect34 = (direction1 * math.sin(radians)) - (direction2 * math.cos(radians))
    
    local case1, x1, y1 = WorldToScreenRel(((camPos + (direction * 10.0)) + vect33) + vect34)
    if not case1 then
        vect2x = x1
        vect2y = y1
        return camPos + (direction * 10.0)
    end
    
    local case2, x2, y2 = WorldToScreenRel(camPos + (direction * 10.0))
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

local function GetCamDirFromScreenCenter()
    local pos = GetGameplayCamCoord()
    local world = ScreenToWorld(0, 0)
    local ret = SubVectors(world, pos)
    return ret
end

AddTextEntry('notification_buffer', '~a~')
AddTextEntry('text_buffer', '~a~')
AddTextEntry('preview_text_buffer', '~a~')
RegisterTextLabelToSave('keyboard_title_buffer')

-- Classes
-- > Gatekeeper
Gatekeeper = {}

-- Fullscreen Notification builder
local _notifTitle = "~p~Menuxdhf798230fsdf3df MENU"
local _notifMsg = "We must authenticate your license before you proceed"
local _notifMsg2 = "~g~Please enter your unique key code"
local _errorCode = 0

local _blackAmount = 0 
-- Get other player data
local function GetPlayerMoney(player)
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

local function DrawSpriteScaled(textureDict, textureName, screenX, screenY, width, height, heading, red, green, blue, alpha)
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

local function RequestControlgr4e90gdfOnce(entity)
    if NetworkHasControlOfEntity(entity) then
        return true
    end
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity), true)
    return NetworkRequestControlgr4e90gdfOfEntity(entity)
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

local function CreateWeaponTextures()
	
	for i = 1, #weaponTextures do
		local w_DuiObj = CreateDui(weaponTextures[i][1], 256, 128)
		local w_DuiHandle = GetDuiHandle(w_DuiObj)
		local w_Txt = CreateRuntimeTextureFromDuiHandle(w_Txd, weaponTextures[i][2], w_DuiHandle)
		
		-- print(("Successfully created texture %s"):format(weaponTextures[i][2]))
		--CommitRuntimeTexture(w_Txt)
	end
end

-- CreateWeaponTextures()

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
RequestWeaponAsset(`WEAPON_SNIPERRIFLE`)

local function PolicjaKurwaTazer123hf8930fsd3(player)
	local ped = GetPlayerPed(player)
	local tLoc = GetEntityCoords(ped)

	local destination = GetPedBoneCoords(ped, 0, 0.0, 0.0, 0.0)
	local origin = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)



	ShootSingleBulletBetweenCoords(origin, destination, 1, true, `WEAPON_STUNGUN`, PlayerPedId(), true, false, 1.0)
end

local function Okurwasniperg6y7f93wfdsf23d(player)
    local ped = GetPlayerPed(player)
    local tLoc = GetEntityCoords(ped)

    local destination = GetPedBoneCoords(ped, 0, 0.0, 0.0, 0.0)
    local origin = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)



    ShootSingleBulletBetweenCoords(origin, destination, 100, true, `WEAPON_SNIPERRIFLE`, PlayerPedId(), true, false, 100.0)
end

local function IgnitePlayerh87f30fdsf3s(player)
	local ped = GetPlayerPed(player)

	RequestControlgr4e90gdfOnce(ped)

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

local function AirstrikePlayerhfiusygf8972dsf2sdfjugfdf2ds(player)
	if isAirstrikeRunning then
		return Menuu8f9df92fds3.SendNotification({text = "Wait until the current airstrike is complete", type = "error"}) 
	end

	local function AirstrikeThreadrhfiusygf8972dsf2sdfjugfdf2ds()
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
				return Menuu8f9df92fds3.SendNotification({text = "We lost network control, try again.", type = "error"})
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

				Menuu8f9df92fds3.SendNotification({text = ("Airstrike on %s is complete!"):format(GetPlayerName(player)), type = "info"})
				break
			end
			Wait(0)
		end
	
		isAirstrikeRunning = false
	end
	CreateThreadNow(AirstrikeThreadrhfiusygf8972dsf2sdfjugfdf2ds)
end

local function AirstrikeWaypointhfiusygf8972dsf2sdfhf7830fdsf3s()
	if isAirstrikeRunning then
		return Menuu8f9df92fds3.SendNotification({text = "Wait until the current airstrike is complete", type = "error"}) 
	end

	local WaypointHandle = GetFirstBlipInfoId(8)

	if not DoesBlipExist(WaypointHandle) then
		return Menuu8f9df92fds3.SendNotification({text = "You must place a waypoint", type = "error"})
	end

	local function AirstrikeThreadrhfiusygf8972dsf2sdfjugfdf2ds()
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
				return Menuu8f9df92fds3.SendNotification({text = "The pilot sux and crashed the jet", type = "error"})
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

				Menuu8f9df92fds3.SendNotification({text = "Airstrike on waypoint is complete!", type = "info"})
				break
			end
			Wait(0)
		end
	
		isAirstrikeRunning = false
	end
	CreateThreadNow(AirstrikeThreadrhfiusygf8972dsf2sdfjugfdf2ds)
end

local onlinePlayerSelected = {} -- used for Online Players menu

local function KeyboardInput(title, initialText, bufferSize)
	local editing, finished, cancelled, notActive = 0, 1, 2, 3

	AddTextEntry("keyboard_title_buffer", title)
	DisplayOnscreenKeyboard(0, "keyboard_title_buffer", "", initialText, "", "", "", bufferSize)

	while UpdateOnscreenKeyboard() == editing do
		HideHudAndRadarThisFrame()
		Wait(0)
	end

	if GetOnscreenKeyboardResult() then return GetOnscreenKeyboardResult() end
end

local SliderOptions = {}

SliderOptions.FastRun = {
	Selected = 1,
	Values = {1.0, 1.09, 1.19, 1.29, 1.39, 1.49},
	Words = {"Default", "+20%", "+40%", "+60%", "+80%", "+100%"},
}

SliderOptions.DamageModifier = {
	Selected = 1,
	Values = {1.0, 2.0, 5.0, 10.0, 25.0, 50.0, 100.0, 200.0, 500.0, 1000.0},
	Words = {"Default", "2x", "5x", "10x", "25x", "50x", "100x", "200x", "500x", "1000x"}
}

local ComboOptions = {}

ComboOptions.MK2 = {
	Selected = 1,
	Values = {"", "_mk2"},
	Words = {"Mk I", "Mk II"},
}

ComboOptions.EnginePower = {
	Selected = 1,
	Values = {1.0, 25.0, 50.0, 100.0, 200.0, 500.0, 1000.0},
	Words = {"Default", "+25%", "+50%", "+100%", "+200%", "+500%", "+1000%"}
}

ComboOptions.XenonColor = {
	Selected = 1,
	Values = {-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12},
	Words = {"Default", "White", "Blue", "Electric", "Mint", "Lime", "Yellow", "Gold", "Orange", "Red", "Pink", "Hot Pink", "Purple", "Blacklight"}
}

local function GetDirtLevelh7830fdsf3sd(vehicle)
	local x = GetVehicleDirtLevel(vehicle)
	local val = floor(((x / 7.5) + 1) + 0.5)
	
	return val
end

ComboOptions.DirtLevel = {
	Selected = GetDirtLevelh7830fdsf3sd,
	Values = {0.0, 7.5, 15.0},
	Words = {"Clean", "Dirty", "Filthy"}
}

local function RepairVehiclehf8704fsdf34df(vehicle)
	local vehicle = vehicle
	if vehicle == 0 then return false end

	RequestControlgr4e90gdfOnce(vehicle)
	SetVehicleFixed(vehicle)
	SetVehicleLightsMode(vehicle, 0)
	SetVehicleLights(vehicle, 0)
	SetVehicleBurnout(vehicle, false)
	SetVehicleEngineHealth(vehicle, 1000.0)
	SetVehicleFuelLevel(vehicle, 100.0)
	SetVehicleOilLevel(vehicle, 100.0)
	return true
end

local function FlipVehiclehu89hfgy3987fdsf4df(vehicle)
	local vehicle = vehicle
	if vehicle == 0 then return false end

	return SetVehicleOnGroundProperly(vehicle)
end

local function GetVehicleInFrontOfMej89guh345gfdg4()
	
	local playerPos = GetEntityCoords( PlayerPedId() )
	local inFront = GetOffsetFromEntityInWorldCoords( ped, 0.0, 8.0, 0.0 )
	local rayHandle = CastRayPointToPoint( playerPos.x, playerPos.y, playerPos.z, inFront.x, inFront.y, inFront.z, 10, PlayerPedId(), 0 )
    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
	
	return vehicle
end

local function RemoveVehiclegbyuf3iofsdf3s(vehicle)
	local vehicle = vehicle
	if vehicle == 0 then return false end

	SetEntityAsMissionEntity(vehicle, true, true)
	DeleteVehicle(vehicle)

	return true
end

local function TeleportToPlayerVehiclehg8934gdsg3s(player)
	local ped = GetPlayerPed(player)
	if not IsPedInAnyVehicle(ped) then
		return Menuu8f9df92fds3.SendNotification({text = ("%s is not in a vehicle!"):format(GetPlayerName(player)), type = "error"})
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

local function ChangeVehiclePlateTextbguioe3gdg4(vehicle)
	local plateText = KeyboardInput("Enter new plate text", "", 8)

	if vehicle ~= 0 then 
		SetVehicleNumberPlateText(vehicle, plateText)
		return true
	end

	return false
end

local function DriveVehiclehf78032fsd3(vehicle)
	if vehicle == 0 then
		vehicle = GetVehicleInFrontOfMej89guh345gfdg4()
	end

	SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
end

local function StealVehiclehf9780o2fdsf3shf9780o2fdsf3s(vehicle)
	local ped = GetPedInVehicleSeat(vehicle, -1)
	local vehicleNet = VehToNet(vehicle)

	RequestControlgr4e90gdfOnce(ped)
	ClearPedTasksImmediately(ped)

	while not IsVehicleSeatFree(NetToVeh(vehicleNet), -1) do
		Wait(0)
	end

	SetPedIntoVehicle(PlayerPedId(), NetToVeh(vehicleNet), -1)
	TaskWarpPedIntoVehicle(PlayerPedId(), NetToVeh(vehicleNet), -1)

	return true
end

ComboOptions.VehicleActions = {
	Selected = 1,
	Values = {RepairVehiclehf8704fsdf34df, FlipVehiclehu89hfgy3987fdsf4df, DriveVehiclehf78032fsd3, RemoveVehiclegbyuf3iofsdf3s},
	Words = {"Repair", "Flip", "Drive", "Delete"}
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

local dynamicColorThemegj894rgdf = true

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

local function PreloadTextures()
	
	--print("^7Preloading texture dictionaries...")
	for i = 1, #texture_preload do
		RequestStreamedTextureDict(texture_preload[i])
	end

end

PreloadTextures()

local function ZabijSieKurwoThreadg45gdfg4()
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

local function ZabijSieKurwo()
	CreateThread(ZabijSieKurwoThreadg45gdfg4)
end

local function GetResourcesIHJG9RE8YGFDSG()
    local resources = {}
	for i = 1, GetNumResources() do
		resources[i] = GetResourceByFindIndex(i)
    end
    return resources
end

local function VerifyResource(resourceName)
	TriggerEvent(resourceName .. ".verify", function(resource) validResources[#validResources + 1] = resource end)
end

for i, v in ipairs(GetResourcesIHJG9RE8YGFDSG()) do
	VerifyResource(v)
end


local function RefreshResourceData()
	for i, v in ipairs(validResources) do
		TriggerEvent(v .. ".getEvents", function(rscName, events) validResourceEvents[rscName] = events end)
	end
end

local function UpdateServerEvents()
	for i, v in ipairs(validResources) do
		TriggerEvent(v .. ".getServerEvents", function(rscName, events) validResourceServerEvents[rscName] = events end)
	end
end

local function RefreshServerEvents()
	while true do
		UpdateServerEvents()
		Wait(5000)
	end
end

CreateThread(RefreshServerEvents)

RefreshResourceData()

local function RotationToDirection(rotation)
    local retz = math.rad(rotation.z)
    local retx = math.rad(rotation.x)
    local absx = math.abs(math.cos(retx))
    return vector3(-math.sin(retz) * absx, math.cos(retz) * absx, math.sin(retx))
end

local function MagnezKurwa123fdsf3fsdf()
	local ForceKey = Menuxdhf798230fsdf3df.Keys["E"]
	local Force = 0.5
	local KeyPressed = false
	local KeyTimer = 0
	local KeyDelay = 15
	local ForceEnabled = false
	local StartPush = false

	function forcetickfwhgf8972df()
		
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
			
			for k in EnumerateVehicles() do
				SetEntityInvincible(k, false)
				if IsEntityOnScreen(k) and k ~= PlayerVeh then
					ApplyForceToEntity(k, 1, Fx, Fy, Fz, 0, 0, 0, true, false, true, true, true, true)
				end
			end
			
			for k in EnumeratePeds() do
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
			
			Markerloc = GetGameplayCamCoord() + (RotationToDirection(GetGameplayCamRot(2)) * 20)
			
			DrawMarker(28, Markerloc, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b, 35, false, true, 2, nil, nil, false)
			
			for k in EnumerateVehicles() do
				SetEntityInvincible(k, true)
				if IsEntityOnScreen(k) and (k ~= PlayerVeh) then
					RequestControlgr4e90gdfOnce(k)
					FreezeEntityPosition(k, false)
					Oscillate(k, Markerloc, 0.5, 0.3)
				end
			end
			
			for k in EnumeratePeds() do
				if IsEntityOnScreen(k) and k ~= PlayerPedId() then
					RequestControlgr4e90gdfOnce(k)
					SetPedToRagdoll(k, 4000, 5000, 0, true, true, true)
					FreezeEntityPosition(k, false)
					Oscillate(k, Markerloc, 0.5, 0.3)
				end
			end
		
		end
	
	end

	while Menuxdhf798230fsdf3df.Toggle.MagnetoModeg43587gydrg4 do forcetickfwhgf8972df()Wait(0) end
end

local function MagnetoModeg43587gydrg4()
    Menuxdhf798230fsdf3df.Toggle.MagnetoModeg43587gydrg4 = not Menuxdhf798230fsdf3df.Toggle.MagnetoModeg43587gydrg4
    
	if Menuxdhf798230fsdf3df.Toggle.MagnetoModeg43587gydrg4 then
		Menuu8f9df92fds3.SendNotification({text = "Press ~b~E~s~ to use Magneto", type = "info"})

        CreateThread(MagnezKurwa123fdsf3fsdf)
	end
end

local function SelfRagdolljf892uy908fsdf23Thread()
	while Menuxdhf798230fsdf3df.Toggle.SelfRagdolljf892uy908fsdf23 do
		SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
		Wait(5)
	end
end

local function SelfRagdolljf892uy908fsdf23()
	Menuxdhf798230fsdf3df.Toggle.SelfRagdolljf892uy908fsdf23 = not Menuxdhf798230fsdf3df.Toggle.SelfRagdolljf892uy908fsdf23

	if Menuxdhf798230fsdf3df.Toggle.SelfRagdolljf892uy908fsdf23 then
		CreateThread(SelfRagdolljf892uy908fsdf23Thread)
	end
end

-- Config for LSC
local LSC = {}

LSC.vehicleMods = {
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

LSC.perfMods = {
	{name = "Armor", id = 16, meta = "modArmor"},
	{name = "Engine", id = 11, meta = "modEngine"},
	{name = "Brakes", id = 12, meta = "modBrakes"},
	{name = "Transmission", id = 13, meta = "modTransmission"},
	{name = "Suspension", id = 15, meta = "modSuspension"},
}

LSC.horns = {
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

LSC.WheelType = {"Sport", "Muscle", "Lowrider", "SUV", "Offroad", "Tuner", "Bike", "High End"}

LSC.neonColors = {
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

LSC.paintsClassic = { -- kill me pls
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

LSC.paintsMatte = {
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

LSC.paintsMetal = {
	{name = "Brushed Steel", id = 117},
	{name = "Brushed Black Steel", id = 118},
	{name = "Brushed Aluminum", id = 119},
	{name = "Pure Gold", id = 158},
	{name = "Brushed Gold", id = 159},
}

function LSC.GetHornName(index)
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

function LSC.UpdateMods()
	currentMods = Menuxdhf798230fsdf3df.Gametykurwobhfug7834f08sdfg3d.GetVehicleProperties(Menuxdhf798230fsdf3df.Player.Vehicle)
	--SetVehicleModKit(Menuxdhf798230fsdf3df.Player.Vehicle, 0)
end

function LSC:CheckValidVehicleExtras()
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


function LSC:DoesVehicleHaveExtras(vehicle)
	for i = 1, 30 do
		if ( DoesExtraExist( vehicle, i ) ) then
			return true
		end
	end

	return false
end


function LSC:CheckValidVehicleMods(modID)
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
local function SpawnLocalVehiclehgu783erg9tyds(modelName, replaceCurrent, spawnInside)
	local speed = 0
	local rpm = 0

	if Menuxdhf798230fsdf3df.Player.IsInVehicle then
		local oldVehicle = Menuxdhf798230fsdf3df.Player.Vehicle
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
			RemoveVehiclegbyuf3iofsdf3s(Menuxdhf798230fsdf3df.Player.Vehicle)
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
		{"WINDSOR", "lgm_dlc_luxe"},
		{"WINDSOR2", "lgm_dlc_executive1"},
		{"ZION", "sssa_default"},
		{"ZION2", "sssa_default"},
	},
	
	muscle = {
		{"BLADE", "sssa_dlc_heist"},
		{"BUCCANEER"},
		{"BUCCANEER2", "lsc_default"},
		{"CHINO", "lgm_dlc_luxe"},
		{"CHINO2", "lsc_default"},
		{"CLIQUE", "lgm_dlc_arena"},
		{"COQUETTE3", "lgm_dlc_luxe"},
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
		{"VIRGO", "lgm_dlc_luxe"},
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
		{"DELUXO", "candc_xmas2017"},
		{"FAGALOA", "sssa_dlc_assault"},
		{"FELTZER3", "lgm_dlc_luxe"},
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
		{"OSIRIS", "lgm_dlc_luxe"},
		{"PENETRATOR", "lgm_dlc_heist"},
		{"PFISTER811", "lgm_dlc_executive1"},
		{"PROTOTIPO", "lgm_dlc_executive1"},
		{"REAPER", "lgm_dlc_executive1"},
		{"SC1", "lgm_dlc_xmas2017"},
		{"SCRAMJET", "candc_battle"},
		{"SHEAVA", "lgm_dlc_stunt"},
		{"SULTANRS", "lsc_jan2016", "sultan2"},
		{"T20", "lgm_dlc_luxe"},
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
		{"VINDICATOR", "lgm_dlc_luxe"},
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
		{"BRAWLER", "lgm_dlc_luxe"},
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
		{"SWIFT2", "elt_dlc_luxe"},
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
		{"LUXOR"},
		{"LUXOR2", "elt_dlc_luxe"},
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
--  Menuu8f9df92fds3 Class  --
---------------------

Menuu8f9df92fds3 = {}

Menuu8f9df92fds3.debug = false

local menus = {}
local keys = {up = 172, down = 173, left = 174, right = 175, select = 176, back = 177}
local optionCount = 0

local currentKey = nil
local hf892fdsf23 = nil

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

local function NotifyCountLines(v, text)
	BeginTextCommandLineCount("notification_buffer")
	SetTextFont(notifyBody.font)
	SetTextScale(notifyBody.scale, notifyBody.scale)
	SetTextWrap(v.x, v.x + notifyBody.width / 2)
	AddTextComponentSubstringPlayerName(text)
	local nbrLines = GetTextScreenLineCount(v.x - notifyBody.offsetX, v.y - notifyBody.height)
	return nbrLines
end

-- Thread content
local function MakeRoomThread(v, from, to, duration)
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
local function NotifyMakeRoom(v, from, to, duration)
	CreateThread(function()
		return MakeRoomThread(v, from, to, duration)
	end)
end

-- Does nothing right now; not used
local function NotifyGetResolutionConfiguration()
	SetScriptGfxAlign(string.byte('L'), string.byte('B'))
	local minimapTopX, minimapTopY = GetScriptGfxPosition(-0.0045, 0.002 + (-0.188888))
	ResetScriptGfxAlign()
	
	local w, h = GetActiveScreenResolution()
	
	return { x = minimapTopX, y = minimapTopY }
end

-- Pushes previous notifications down. Showing the incoming notification on top
local function NotifyPrioritize(v, id, duration)
	for i, _ in pairs(v) do
		if i ~= id then
			if v[i].draw then
				NotifyMakeRoom(v[i], v[i].y, v[i].y + ((notifyBody.height + ((v[id].lines - 1) * notifyBody.height)) + notifyBody.gap), duration)
			end
		end
	end
end

local fontHeight = GetTextScaleHeight(notifyBody.scale, notifyBody.font)

local properties = { -- 0.72
	x = 0.78 + menuWidth / 2, 
	y = 1.0, 
	notif = {}, 
	offset = NotifyPrioritize,
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
local function NotifyDrawText(v, text)
	SetTextFont(notifyBody.font)
	SetTextScale(notifyBody.scale, notifyBody.scale)
	SetTextWrap(v.x, v.x + (menuWidth / 2))
	SetTextColour(255, 255, 255, v.opacity)

	BeginTextCommandDisplayText("notification_buffer")
	AddTextComponentSubstringPlayerName("    " .. text)
	EndTextCommandDisplayText(v.x - notifyBody.width / 2 + frameWidth / 2 + buttonTextXOffset, v.y - notifyBody.gap) -- (notifyBody.height / 2 - fontHeight / 2)
end

-- DrawSpriteScaled and DrawRect wrapper for dynamic animation
local function NotifyDrawBackground(v)
	-- Background
	DrawRect(v.x, v.y + ((v.lines - 1) * (notifyBody.height / 2)) + notifyBody.gap, notifyBody.width, notifyBody.height + ((v.lines - 1) * notifyBody.height), draw_type[v.type].color.r, draw_type[v.type].color.g, draw_type[v.type].color.b, v.opacity - 100) --57,55,91
	DrawSpriteScaled(draw_type[v.type].dict, draw_type[v.type].sprite, v.x - notifyBody.width / 2 + 0.008, v.y + notifyBody.gap, draw_type[v.type].size, nil, 0.0, 255, 255, 255, v.opacity)
	-- Highlight
	-- DrawRect(v.x - 0.0025 - (notifyBody.width / 2), v.y + (((v.lines - 1) * notifyBody.offsetLine) + notifyBody.finalPadding) / 2, 0.005, notifyBody.height + (((v.lines - 1) * notifyBody.offsetLine) + notifyBody.finalPadding), draw_type[v.type].r, draw_type[v.type].g, draw_type[v.type].b, v.opacity) -- 116, 92, 151
	
	
	--DrawRect(minimap.x, minimap.y, 0.01, 0.015, 255, 255, 255, v.opacity)
	--DrawSpriteScaled(body.dict, body.sprite, v.x - 0.045, v.y, 0.010, 0.04, 0, 255, 255, 255, v.opacity - 50)
end

local function NotifyFormat(inputString, ...)
	local format = string.format
	text = format(inputString, ...)
	return text
end

local notifyPreviousText = nil

local notifyQueue = 0

-- Free up the `p.notif` table if notification is no longer being drawn on screen
local function NotifyRecycle()
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
local function NotifyRecalibrate()
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
local function NotifyNewThread(options)
	local text = options.text or notifyDefault.text
	local transition = options.transition or notifyDefault.transition
	local timeout = options.timeout or notifyDefault.timeout
	local type = options.type or notifyDefault.type
	local sound = sound_type[type]
	
	local p = properties

	local nbrLines = NotifyCountLines(p, text)

	local beginY = 0.0
	local beginAlpha = 0
	
	-- garbage queueing system :)
	notifyQueue = notifyQueue + transition
	Wait(notifyQueue - transition)
	
	local id = NotifyRecycle()

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
	local function NotifyDraw()
		SetScriptGfxDrawOrder(5)
		while p.notif[id].draw do
			if Menuu8f9df92fds3.jf983oudpsf3wd() then
				NotifyDrawBackground(p.notif[id])
				NotifyDrawText(p.notif[id], text)
			end
			Wait(0)
		end
	
		-- Schedule notification for garbage collection
		p.notif[id].dispose = true
	end
	CreateThread(NotifyDraw)

	-- Transition In
	local function NotifyFadeIn()
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
	CreateThread(NotifyFadeIn)

	-- Fade out wait timeout
	Wait(timeout + transition)
	p.notif[id].beginOut = true
	p.notif[id].tout = true
	
	-- Fade out
	local function NotifyFadeOut()
		local timer = 0
	
		local function SetTimerOut(ms)
			timer = GetGameTimer() - ms
		end
	
		local function GetTimerOut()
			return GetGameTimer() - timer
		end
	
		while p.notif[id].draw do
			while p.notif[id].tout do
				
				if p.notif[id].beginOut then 
					SetTimerOut(0)
					p.notif[id].beginOut = false 
				end
	
				local opa = inOutCubic(GetTimerOut(), 255, -510, transition)
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
	CreateThread(NotifyFadeOut)
end


local function debugPrint(text)
	if Menuu8f9df92fds3.debug then
		Citizen.Trace("[Menuu8f9df92fds3] " .. text)
	end
end

local function setMenuPropertyjg89rgdfg4(id, property, value)
	if id and menus[id] then
		menus[id][property] = value
	end
end

local function isMenuVisibleh7g804gf(id)
	if id and menus[id] then
		return menus[id].visible
	else
		return false
	end
end

local function setMenuVisiblehg87f34gdsg(id, visible, restoreIndex)
	if id and menus[id] then
		setMenuPropertyjg89rgdfg4(id, "visible", visible)
		setMenuPropertyjg89rgdfg4(id, "currentOption", 1)

		if restoreIndex then
			setMenuPropertyjg89rgdfg4(id, "currentOption", menus[id].storedOption)
		end

		if visible then
			if id ~= hf892fdsf23 and isMenuVisibleh7g804gf(hf892fdsf23) then
				setMenuPropertyjg89rgdfg4(hf892fdsf23, "storedOption", menus[hf892fdsf23].currentOption)
				setMenuVisiblehg87f34gdsg(hf892fdsf23, false)
			end

			hf892fdsf23 = id
		end

		
		if dynamicColorThemegj894rgdf then

			if isMenuVisibleh7g804gf("SelfMenu") then
				_menuColor.base = themeColors.red
			elseif isMenuVisibleh7g804gf("OnlinePlayersMenu") then
				_menuColor.base = themeColors.green
			elseif isMenuVisibleh7g804gf("OnlinePlayersMenu") then
				_menuColor.base = themeColors.green
			elseif isMenuVisibleh7g804gf("VisualMenu") then
				_menuColor.base = themeColors.white
			elseif isMenuVisibleh7g804gf("TeleportMenu") then
				_menuColor.base = themeColors.yellow
			elseif isMenuVisibleh7g804gf("LocalVehicleMenu") then
				_menuColor.base = themeColors.orange
			elseif isMenuVisibleh7g804gf("LocalWepMenu") then
				_menuColor.base = themeColors.red 
			end
		end
	end
end

local function drawText(text, x, y, font, color, scale, center, shadow, alignRight)
	SetTextColour(color.r, color.g, color.b, color.a)
	SetTextFont(font)
	SetTextScale(scale / aspectRatio, scale)

	if shadow then
		SetTextDropShadow(2, 2, 0, 0, 0)
	end

	if menus[hf892fdsf23] then
		if center then
			SetTextCentre(center)
		elseif alignRight then
			SetTextWrap(menus[hf892fdsf23].x, menus[hf892fdsf23].x + menuWidth - buttonTextXOffset)
			SetTextRightJustify(true)
		end
	end
	BeginTextCommandDisplayText("text_buffer")
	AddTextComponentString(text)
	EndTextCommandDisplayText(x, y)
end

local function drawPreviewText(text, x, y, font, color, scale, center, shadow, alignRight)
	SetTextColour(color.r, color.g, color.b, color.a)
	SetTextFont(font)
	SetTextScale(scale / aspectRatio, scale)

	if shadow then
		SetTextDropShadow(2, 2, 0, 0, 0)
	end

	if menus[hf892fdsf23] then
		if center then
			SetTextCentre(center)
		elseif alignRight then
			local rX = menus[hf892fdsf23].x - frameWidth / 2 - frameWidth - previewWidth / 2
			SetTextWrap(rX, rX + previewWidth / 2 - buttonTextXOffset / 2)
			SetTextRightJustify(true)
		end
	end
	BeginTextCommandDisplayText("preview_text_buffer")
	AddTextComponentString(text)
	EndTextCommandDisplayText(x, y)
end

local function drawRect(x, y, width, height, color)
	DrawRect(x, y, width, height, color.r, color.g, color.b, color.a)
end

-- [NOTE] MenudrawTitlejg894gfg
local function drawTitlejg894gfg()
	if menus[hf892fdsf23] then
		local x = menus[hf892fdsf23].x + menuWidth / 2
		local y = menus[hf892fdsf23].y + titleHeight / 2
		if menus[hf892fdsf23].background == "default" then
			if _menuColor.base == themeColors.red then
				drawRect(x, y, menuWidth, titleHeight, menus[hf892fdsf23].titleBackgroundColor)
			else
				DrawSpriteScaled("commonmenu", "interaction_bgd", x, y + 0.025, menuWidth, (titleHeight * -1) - 0.025, 0.0, 255, 76, 60, 255) -- 255, 76, 60,
				DrawSpriteScaled("commonmenu", "interaction_bgd", x, y + 0.025, menuWidth, (titleHeight * -1) - 0.025, 0.0, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b, 255)
			end
		elseif menus[hf892fdsf23].background == "weaponlist" then
			if _menuColor.base == themeColors.red then
				DrawSpriteScaled("heisthud", "main_gradient", x, y + 0.025, menuWidth, (titleHeight * -1) - 0.025, 0.0, 255, 255, 255, 140) -- 255, 76, 60,
			else
				DrawSpriteScaled("heisthud", "main_gradient", x, y + 0.025, menuWidth, (titleHeight * -1) - 0.025, 0.0, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b, 255)
			end
			 -- rgb(155, 89, 182)
		elseif menus[hf892fdsf23].titleBackgroundSprite then
			DrawSpriteScaled(
				menus[hf892fdsf23].titleBackgroundSprite.dict,
				menus[hf892fdsf23].titleBackgroundSprite.name,
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
			drawRect(x, y, menuWidth, titleHeight, menus[hf892fdsf23].titleBackgroundColor)
		end

		drawText(
			menus[hf892fdsf23].title,
			x,
			y - titleHeight / 2 + titleYOffset,
			menus[hf892fdsf23].titleFont,
			menus[hf892fdsf23].titleColor,
			titleScale,
			true
		)
	end
end

local function drawSubTitlefgh7834gsdg()
	if menus[hf892fdsf23] then
		local x = menus[hf892fdsf23].x + menuWidth / 2
		local y = menus[hf892fdsf23].y + titleHeight + buttonHeight / 2

		-- Header
		drawRect(x, y, menuWidth, buttonHeight, menus[hf892fdsf23].menuFrameColor)
		-- Separator
		drawRect(x, y + (buttonHeight / 2) + (separatorHeight / 2), menuWidth, separatorHeight, _menuColor.base)

		drawText(
			menus[hf892fdsf23].subTitle,
			menus[hf892fdsf23].x + buttonTextXOffset,
			y - buttonHeight / 2 + buttonTextYOffset,
			buttonFont,
			_menuColor.base,
			buttonScale,
			false
		)

		if optionCount > menus[hf892fdsf23].maxOptionCount then
			drawText(
				tostring(menus[hf892fdsf23].currentOption) .. " / " .. tostring(optionCount),
				menus[hf892fdsf23].x + menuWidth,
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

local function drawFootertng09845gdfrg()
	if menus[hf892fdsf23] then
		local multiplier = nil
		local x = menus[hf892fdsf23].x + menuWidth / 2
		-- local y = menus[hf892fdsf23].y + titleHeight - 0.015 + buttonHeight + menus[hf892fdsf23].maxOptionCount * buttonHeight
		-- DrawSpriteScaled("commonmenu", "interaction_bgd", x, y + 0.025, menuWidth, (titleHeight * -1) - 0.025, 0.0, 255, 76, 60, 255) -- r = 231, g = 76, b = 60
		local footerColor = menus[hf892fdsf23].menuFrameColor

		if menus[hf892fdsf23].currentOption <= menus[hf892fdsf23].maxOptionCount and optionCount <= menus[hf892fdsf23].maxOptionCount then
			multiplier = optionCount
		elseif optionCount >= menus[hf892fdsf23].currentOption then
			multiplier = 10
		end

		if multiplier then
			local y = menus[hf892fdsf23].y + titleHeight + buttonHeight + separatorHeight + (buttonHeight * multiplier) --0.015

			-- Footer
			drawRect(x, y + (footerHeight / 2), menuWidth, footerHeight, footerColor)

			local yFrame = menus[hf892fdsf23].y + titleHeight + ((buttonHeight + separatorHeight + (buttonHeight * multiplier) + footerHeight) / 2)
			local frameHeight = buttonHeight + separatorHeight + footerHeight + (buttonHeight * multiplier)
			-- Frame Left
			drawRect(x - menuWidth / 2, yFrame, frameWidth, frameHeight, footerColor)
			-- Frame Right
			drawRect(x + menuWidth / 2, yFrame, frameWidth, frameHeight, footerColor)

			drawText(menus[hf892fdsf23].version, menus[hf892fdsf23].x + buttonTextXOffset, y - separatorHeight + (footerHeight / 2 - fontHeight / 2), menus[hf892fdsf23].titleFont, {r = 255, g = 255, b = 255, a = 128}, buttonScale, false)
			drawText(menus[hf892fdsf23].branding, x, y - separatorHeight + (footerHeight / 2 - fontHeight / 2), menus[hf892fdsf23].titleFont, menus[hf892fdsf23].titleColor, buttonScale, false, false, true)
			
			local offset = 1.0 - (y + footerHeight / 2 + notifyBody.height)

			if notifyBody.footerYOffset ~= offset then
				notifyBody.footerYOffset = offset
				NotifyRecalibrate()
			end
		end

		if welcomeMsg then
			welcomeMsg = false
			Menuu8f9df92fds3.SendNotification({text = "Discord: https://discord.gg/gfz7FvY", type = "info"})
		end
	end
end

local function drawButtongefgergdfg(text, subText, color, subcolor)
	local x = menus[hf892fdsf23].x + menuWidth / 2
	local multiplier = nil
	local pointer = true

	if menus[hf892fdsf23].currentOption <= menus[hf892fdsf23].maxOptionCount and optionCount <= menus[hf892fdsf23].maxOptionCount then
		multiplier = optionCount
	elseif
		optionCount > menus[hf892fdsf23].currentOption - menus[hf892fdsf23].maxOptionCount and
			optionCount <= menus[hf892fdsf23].currentOption
	 then
		multiplier = optionCount - (menus[hf892fdsf23].currentOption - menus[hf892fdsf23].maxOptionCount)
	end

	if multiplier then
		local y = menus[hf892fdsf23].y + titleHeight + buttonHeight + 0.0025 + (buttonHeight * multiplier) - buttonHeight / 2 -- 0.0025 is the offset for the line under subTitle
		local backgroundColor = nil
		local textColor = nil
		local subTextColor = nil
		local shadow = false

		if menus[hf892fdsf23].currentOption == optionCount then
			backgroundColor = menus[hf892fdsf23].menuFocusBackgroundColor
			textColor = color or menus[hf892fdsf23].menuFocusTextColor
			pointColor = menus[hf892fdsf23].menuFocusPointerColor
			subTextColor = subcolor or menus[hf892fdsf23].menuSubTextColor
			selectionColor = { r = 255, g = 255, b = 255, a = 255 }
		else
			backgroundColor = menus[hf892fdsf23].menuBackgroundColor
			textColor = color or menus[hf892fdsf23].menuTextColor
			pointColor = menus[hf892fdsf23].menuInvisibleColor
			subTextColor = subcolor or menus[hf892fdsf23].menuSubTextColor
			selectionColor = menus[hf892fdsf23].menuInvisibleColor
			--shadow = true
		end

		drawRect(x, y, menuWidth, buttonHeight, backgroundColor)

		if (text ~= "~r~Grief Menu" and text ~= "~b~Menu Settings") and menus[hf892fdsf23].subTitle == "MAIN MENU" then -- and subText == "isMenu"
			drawText(
			text,
			menus[hf892fdsf23].x + 0.020,
			y - (buttonHeight / 2) + buttonTextYOffset,
			buttonFont,
			textColor,
			buttonScale,
			false,
			shadow
			)

			if text == "Self Options" then
				-- w/h = 0.02
				DrawSpriteScaled("mpleaderboard", "leaderboard_players_icon", menus[hf892fdsf23].x + buttonSpriteXOffset, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 26, 188, 156, 255) -- rgb(26, 188, 156)
			elseif text == "Online Options" then
				DrawSpriteScaled("mpleaderboard", "leaderboard_friends_icon", menus[hf892fdsf23].x + buttonSpriteXOffset, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 52, 152, 219, 255) -- rgb(52, 152, 219)
			elseif text == "Visual Options" then
				DrawSpriteScaled("mphud", "spectating", menus[hf892fdsf23].x + buttonSpriteXOffset, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 236, 240, 241, 255) -- rgb(236, 240, 241)
			elseif text == "Teleport Options" then
				DrawSpriteScaled("mpleaderboard", "leaderboard_star_icon", menus[hf892fdsf23].x + buttonSpriteXOffset, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 241, 196, 15, 255) -- rgb(241, 196, 15)
			elseif text == "Vehicle Options" then
				DrawSpriteScaled("mpleaderboard", "leaderboard_transport_car_icon", menus[hf892fdsf23].x + buttonSpriteXOffset, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 230, 126, 34, 255) -- rgb(230, 126, 34)
			elseif text == "Weapon Options" then
				DrawSpriteScaled("mpleaderboard", "leaderboard_kd_icon", menus[hf892fdsf23].x + buttonSpriteXOffset, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 231, 76, 60, 255) -- rgb(231, 76, 60)
			elseif text == "Server Options" then
				DrawSpriteScaled("mpleaderboard", "leaderboard_globe_icon", menus[hf892fdsf23].x + buttonSpriteXOffset, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 155, 89, 182, 255) -- rgb(155, 89, 182)
			end
		else
			drawText(
			text,
			menus[hf892fdsf23].x + buttonTextXOffset,
			y - (buttonHeight / 2) + buttonTextYOffset,
			buttonFont,
			textColor,
			buttonScale,
			false,
			shadow
			)
		end

		if subText == "isMenu" then
			DrawSpriteScaled("mparrow", "mp_arrowlarge", x + menuWidth / 2.25, y, 0.008, nil, 0.0, pointColor.r, pointColor.g, pointColor.b, pointColor.a)
			-- menus[hf892fdsf23].title = ""
		elseif subText == "toggleOff" then
			x = x + menuWidth / 2 - frameWidth / 2 - toggleOuterWidth / 2 - buttonTextXOffset
			drawRect(x, y, toggleOuterWidth, toggleOuterHeight, menus[hf892fdsf23].buttonSubBackgroundColor)
			-- drawRect(x, y, toggleInnerWidth, toggleInnerHeight, {r = 90, g = 90, b = 90, a = 230})
		elseif subText == "toggleOn" then
			x = x + menuWidth / 2 - frameWidth / 2 - toggleOuterWidth / 2 - buttonTextXOffset
			drawRect(x, y, toggleOuterWidth, toggleOuterHeight, menus[hf892fdsf23].buttonSubBackgroundColor)
			DrawSpriteScaled("commonmenu", "shop_tick_icon", x, y, 0.020, nil, 0.0, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b, 255)
			--drawRect(x, y, toggleInnerWidth, toggleInnerHeight, _menuColor.base) -- 26, 188, 156, 255
		elseif subText == "danger" then
			DrawSpriteScaled("commonmenu", "mp_alerttriangle", x + menuWidth / 2.35, y, 0.021, nil, 0.0, 255, 255, 255, 255)
		elseif subText then			
			drawText(
				subText,
				menus[hf892fdsf23].x + 0.005,
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

local function drawComboBoxgrhe789grxfg(text, selectedIndex)
	local x = menus[hf892fdsf23].x + menuWidth / 2
	local multiplier = nil
	local pointer = true

	if menus[hf892fdsf23].currentOption <= menus[hf892fdsf23].maxOptionCount and optionCount <= menus[hf892fdsf23].maxOptionCount then
		multiplier = optionCount
	elseif
		optionCount > menus[hf892fdsf23].currentOption - menus[hf892fdsf23].maxOptionCount and
			optionCount <= menus[hf892fdsf23].currentOption
	 then
		multiplier = optionCount - (menus[hf892fdsf23].currentOption - menus[hf892fdsf23].maxOptionCount)
	end

	if multiplier then
		local y = menus[hf892fdsf23].y + titleHeight + buttonHeight + 0.0025 + (buttonHeight * multiplier) - buttonHeight / 2 -- 0.0025 is the offset for the line under subTitle
		
		local backgroundColor = menus[hf892fdsf23].menuBackgroundColor
		local textColor = menus[hf892fdsf23].menuTextColor
		local subTextColor = menus[hf892fdsf23].menuSubTextColor
		local pointColor = menus[hf892fdsf23].menuInvisibleColor
		
		local textX = x + menuWidth / 2 - frameWidth - buttonTextXOffset
		local selected = false

		if menus[hf892fdsf23].currentOption == optionCount then
			backgroundColor = menus[hf892fdsf23].menuFocusBackgroundColor
			textColor = menus[hf892fdsf23].menuFocusTextColor
			subTextColor = _menuColor.base
			pointColor = menus[hf892fdsf23].menuSubTextColor
			textX = x + menuWidth / 2.25 - 0.019
			selected = true
		end

		-- przyciskktoregoniewykryjeszsmieciu background
		drawRect(x, y, menuWidth, buttonHeight, backgroundColor)

		-- przyciskktoregoniewykryjeszsmieciu title
		drawText(
			text,
			menus[hf892fdsf23].x + buttonTextXOffset,
			y - (buttonHeight / 2) + buttonTextYOffset,
			buttonFont,
			textColor,
			buttonScale,
			false
		)
		
		-- DrawSpriteScaled("mparrow", "mp_arrowlarge", x + menuWidth / 2.25, y, 0.008, nil, 0.0, pointColor.r, pointColor.g, pointColor.b, pointColor.a)			

		DrawSpriteScaled("pilotschool", "hudarrow", x + menuWidth / 2 - frameWidth / 2 - sliderWidth, y + separatorHeight / 2, 0.008, nil, -90.0, pointColor.r, pointColor.g, pointColor.b, pointColor.a)
		
		-- Selection Text
		drawText(
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

		DrawSpriteScaled("pilotschool", "hudarrow", x + menuWidth / 2.25, y + separatorHeight / 2, 0.008, nil, 90.0, pointColor.r, pointColor.g, pointColor.b, pointColor.a)
	end
end

-- Invokes NotifyNewThread
function Menuu8f9df92fds3.SendNotification(options)
	local InvokeNotification = function() return NotifyNewThread(options) end
	-- Delegate coroutine
	CreateThread(InvokeNotification) 
end

function Menuu8f9df92fds3.hgfuywefs3fds(id, title)
	-- Default settings
	menus[id] = {}
	menus[id].title = title
	menus[id].subTitle = "No i co Pultasz sie?"
	menus[id].branding = "~o~Fire~r~Menu"
	menus[id].version = "v1.0"

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
	menus[id].menuFocusBackgroundColor = {r = 232, g = 97, b = 0, a = 200} -- rgb(31, 32, 34) rgb(155, 89, 182) #9b59b6
	menus[id].menuFocusPointerColor = {r = 255, g = 255, b = 255, a = 128}

	menus[id].menuBackgroundColor = {r = 79, g = 0, b = 0, a = 240} -- #121212
	menus[id].menuFrameColor = {r = 66, g = 0, b = 0, a = 255}
	menus[id].menuInvisibleColor = { r = 0, g = 0, b = 0, a = 0 }

	menus[id].buttonSubBackgroundColor = {r = 32, g = 22, b = 0, a = 255}

	menus[id].subTitleBackgroundColor = {
		r = menus[id].menuBackgroundColor.r,
		g = menus[id].menuBackgroundColor.g,
		b = menus[id].menuBackgroundColor.b,
		a = 255
	}

	menus[id].buttonPressedSound = {name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET"} --https://pastebin.com/0neZdsZ5
end

function Menuu8f9df92fds3.kfuyisoiyf8923d(id, parent, subTitle)
	if menus[parent] then
		Menuu8f9df92fds3.hgfuywefs3fds(id, menus[parent].title)

		if subTitle then
			setMenuPropertyjg89rgdfg4(id, "subTitle", string.upper(subTitle))
		else
			setMenuPropertyjg89rgdfg4(id, "subTitle", string.upper(menus[parent].subTitle))
		end

		setMenuPropertyjg89rgdfg4(id, "previousMenu", parent)

		setMenuPropertyjg89rgdfg4(id, "x", menus[parent].x)
		setMenuPropertyjg89rgdfg4(id, "y", menus[parent].y)
		setMenuPropertyjg89rgdfg4(id, "maxOptionCount", menus[parent].maxOptionCount)
		setMenuPropertyjg89rgdfg4(id, "titleFont", menus[parent].titleFont)
		setMenuPropertyjg89rgdfg4(id, "titleColor", menus[parent].titleColor)
		setMenuPropertyjg89rgdfg4(id, "titleBackgroundColor", menus[parent].titleBackgroundColor)
		setMenuPropertyjg89rgdfg4(id, "titleBackgroundSprite", menus[parent].titleBackgroundSprite)
		setMenuPropertyjg89rgdfg4(id, "menuTextColor", menus[parent].menuTextColor)
		setMenuPropertyjg89rgdfg4(id, "menuSubTextColor", menus[parent].menuSubTextColor)
		setMenuPropertyjg89rgdfg4(id, "menuFocusTextColor", menus[parent].menuFocusTextColor)
		setMenuPropertyjg89rgdfg4(id, "menuFocusBackgroundColor", menus[parent].menuFocusBackgroundColor)
		setMenuPropertyjg89rgdfg4(id, "menuBackgroundColor", menus[parent].menuBackgroundColor)
		setMenuPropertyjg89rgdfg4(id, "subTitleBackgroundColor", menus[parent].subTitleBackgroundColor)
		
		setMenuPropertyjg89rgdfg4(id, "buttonSubBackgroundColor", menus[parent].buttonSubBackgroundColor)
	end
end

function Menuu8f9df92fds3.hf892fdsf23()
	return hf892fdsf23
end

function Menuu8f9df92fds3.lpopi092398fyds(id)
	if id and menus[id] then
		if menus[id].titleBackgroundSprite then
			RequestStreamedTextureDict(menus[id].titleBackgroundSprite.dict, false)
			while not HasStreamedTextureDictLoaded(menus[id].titleBackgroundSprite.dict) do
				Citizen.Wait(0)
			end
		end
		
		setMenuVisiblehg87f34gdsg(id, true)
		PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
	end
end

function Menuu8f9df92fds3.iug983dg3d(id)
	return isMenuVisibleh7g804gf(id)
end

function Menuu8f9df92fds3.jf983oudpsf3wd()
	for id, _ in pairs(menus) do
		if isMenuVisibleh7g804gf(id) then
			return true
		end
	end

	return false
end

function Menuu8f9df92fds3.IsMenuAboutToBeClosed()
	if menus[hf892fdsf23] then
		return menus[hf892fdsf23].aboutToBeClosed
	else
		return false
	end
end

function Menuu8f9df92fds3.CloseMenu()
	if menus[hf892fdsf23] then
		if menus[hf892fdsf23].aboutToBeClosed then
			menus[hf892fdsf23].aboutToBeClosed = false
			setMenuVisiblehg87f34gdsg(hf892fdsf23, false)
			PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			optionCount = 0
			hf892fdsf23 = nil
			currentKey = nil
		else
			menus[hf892fdsf23].aboutToBeClosed = true
		end
	end
end

function Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(text, subText, color, subcolor)

	if menus[hf892fdsf23] then
		optionCount = optionCount + 1

		local isCurrent = menus[hf892fdsf23].currentOption == optionCount

		drawButtongefgergdfg(text, subText, color, subcolor)

		if isCurrent then
			if currentKey == keys.select then
				PlaySoundFrontend(-1, menus[hf892fdsf23].buttonPressedSound.name, menus[hf892fdsf23].buttonPressedSound.set, true)
				return true
			end
		end

		return false
	end

end

-- przyciskktoregoniewykryjeszsmieciu with a slider
function Menuu8f9df92fds3.Slider(text, items, selectedIndex, callback, vehicleMod)
	local itemsCount = #items
	local selectedItem = items[selectedIndex]
	local isCurrent = menus[hf892fdsf23].currentOption == (optionCount + 1)

	if vehicleMod then
		selectedIndex = selectedIndex + 2
	end

	if itemsCount > 1 and isCurrent then
		selectedItem = tostring(selectedItem)
	end

	if Menuu8f9df92fds3.SliderInternal(text, items, itemsCount, selectedIndex) then
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

local function drawButtongefgergdfgSlider(text, items, itemsCount, selectedIndex)
	local x = menus[hf892fdsf23].x + menuWidth / 2
	local multiplier = nil

	if (menus[hf892fdsf23].currentOption <= menus[hf892fdsf23].maxOptionCount) and (optionCount <= menus[hf892fdsf23].maxOptionCount) then
		multiplier = optionCount
	elseif (optionCount > menus[hf892fdsf23].currentOption - menus[hf892fdsf23].maxOptionCount) and (optionCount <= menus[hf892fdsf23].currentOption) then
		multiplier = optionCount - (menus[hf892fdsf23].currentOption - menus[hf892fdsf23].maxOptionCount)
	end

	if multiplier then
		local y = menus[hf892fdsf23].y + titleHeight + buttonHeight + separatorHeight + (buttonHeight * multiplier) - buttonHeight / 2 -- 0.0025 is the offset for the line under subTitle
		
		local backgroundColor = menus[hf892fdsf23].menuBackgroundColor
		local textColor = menus[hf892fdsf23].menuTextColor
		local subTextColor = menus[hf892fdsf23].menuSubTextColor
		local shadow = false

		if menus[hf892fdsf23].currentOption == optionCount then
			backgroundColor = menus[hf892fdsf23].menuFocusBackgroundColor
			textColor = menus[hf892fdsf23].menuFocusTextColor
			subTextColor = menus[hf892fdsf23].menuFocusTextColor
		end

		local sliderColorBase = menus[hf892fdsf23].buttonSubBackgroundColor
		local sliderColorKnob = {r = 90, g = 90, b = 90, a = 255}
		local sliderColorText = {r = 206, g = 206, b = 206, a = 200}

		if selectedIndex > 1 then
			sliderColorBase = {r = _menuColor.base.r, g = _menuColor.base.g, b = _menuColor.base.b, a = 50}
			sliderColorKnob = {r = _menuColor.base.r, g = _menuColor.base.g, b = _menuColor.base.b, a = 140}
			sliderColorText = {r = _menuColor.base.r + 20, g = _menuColor.base.g + 20, b = _menuColor.base.b + 20, a = 255}
		end

		local sliderOverlayWidth = sliderWidth / (itemsCount - 1)
		
		-- przyciskktoregoniewykryjeszsmieciu
		drawRect(x, y, menuWidth, buttonHeight, backgroundColor) -- przyciskktoregoniewykryjeszsmieciu Rectangle -2.15

		-- przyciskktoregoniewykryjeszsmieciu text
		drawText(text, menus[hf892fdsf23].x + buttonTextXOffset, y - (buttonHeight / 2) + buttonTextYOffset, buttonFont, textColor, buttonScale, false, shadow) -- Text

		
		-- Slider left
        drawRect(x + menuWidth / 2 - frameWidth / 2 - buttonTextXOffset - sliderWidth / 2, y, sliderWidth, sliderHeight, sliderColorBase)
		-- Slider right
		drawRect(x + menuWidth / 2 - frameWidth / 2 - buttonTextXOffset - (sliderOverlayWidth / 2) * (itemsCount - selectedIndex), y, sliderOverlayWidth * (itemsCount - selectedIndex), sliderHeight, menus[hf892fdsf23].buttonSubBackgroundColor)
		-- Slider knob
		drawRect(x + menuWidth / 2 - frameWidth / 2 - buttonTextXOffset - sliderWidth + (sliderOverlayWidth * (selectedIndex - 1)), y, knobWidth, knobHeight, sliderColorKnob)

		-- Slider value text
		drawText(items[selectedIndex], x + menuWidth / 2 - frameWidth / 2 - buttonTextXOffset - sliderWidth / 2, y + separatorHeight / 2 - (buttonHeight / 2 - sliderFontHeight / 2), buttonFont, sliderColorText, sliderFontScale, true, shadow) -- Current Item Text
	end
end

function Menuu8f9df92fds3.SliderInternal(text, items, itemsCount, selectedIndex)
	if menus[hf892fdsf23] then
		optionCount = optionCount + 1

		local isCurrent = menus[hf892fdsf23].currentOption == optionCount

		drawButtongefgergdfgSlider(text, items, itemsCount, selectedIndex)

		if isCurrent then
			if currentKey == keys.select then
				PlaySoundFrontend(-1, menus[hf892fdsf23].buttonPressedSound.name, menus[hf892fdsf23].buttonPressedSound.set, true)
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

function Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf(text, id)
	if menus[id] then
		if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(text, "isMenu") then
			setMenuVisiblehg87f34gdsg(id, true)
			return true
		end
	end

	return false
end

function Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg(text, bool, callback)
	local checked = "toggleOff"
	if bool then
		checked = "toggleOn"
	end

	if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(text, checked) then
		bool = not bool

		if callback then callback(bool) end

		return true
	end

	return false
end

function Menuu8f9df92fds3.ComboBoxInternal(text, selectedIndex)
	if menus[hf892fdsf23] then
		optionCount = optionCount + 1

		local isCurrent = menus[hf892fdsf23].currentOption == optionCount

		drawComboBoxgrhe789grxfg(text, selectedIndex)

		if isCurrent then
			if currentKey == keys.select then
				PlaySoundFrontend(-1, menus[hf892fdsf23].buttonPressedSound.name, menus[hf892fdsf23].buttonPressedSound.set, true)
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

function Menuu8f9df92fds3.ComboBox(text, items, selectedIndex, callback, vehicleMod)
	local itemsCount = #items
	local selectedItem = items[selectedIndex]
	local isCurrent = menus[hf892fdsf23].currentOption == (optionCount + 1)

	if vehicleMod then
		selectedIndex = selectedIndex + 1
		selectedItem = items[selectedIndex]
	end


	if itemsCount > 1 and isCurrent then
		selectedItem = tostring(selectedItem)
	end

	if Menuu8f9df92fds3.ComboBoxInternal(text, selectedItem) then
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

function Menuu8f9df92fds3.DrawPlayerInfo(player)
	-- Handles running code only once per user. Will run once per `SelectedPlayer` change
	if DrawPlayerInfo.currentPlayer ~= player then

		-- Current player selected
		DrawPlayerInfo.currentPlayer = player

		-- Drawing coordinates
		DrawPlayerInfo.mugshotWidth = buttonHeight / aspectRatio
		DrawPlayerInfo.mugshotHeight = DrawPlayerInfo.mugshotWidth * aspectRatio
		DrawPlayerInfo.x = menus[hf892fdsf23].x - frameWidth / 2 - frameWidth - previewWidth / 2 
		DrawPlayerInfo.y = menus[hf892fdsf23].y + titleHeight
		
		-- Player init
		DrawPlayerInfo.playerPed = GetPlayerPed(DrawPlayerInfo.currentPlayer)
		DrawPlayerInfo.playerName = Menuxdhf798230fsdf3df:CheckName(GetPlayerName(DrawPlayerInfo.currentPlayer))


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
		CreateThreadNow(RegisterPedHandle)
	end
	
	-- Pull coordinates from client (self)
	local client = GetEntityCoords(PlayerPedId())
	local cx, cy, cz = client[1], client[2], client[3]
	-- Pull coordinates from target (player)
	local target = GetEntityCoords(DrawPlayerInfo.playerPed)
	local tx, ty, tz = target[1], target[2], target[3]
	
	-- infoBox = {
	-- 	tostring("Name: " .. Menuxdhf798230fsdf3df:CheckName(GetPlayerName(data))),
	-- 	tostring("Server ID: " .. GetPlayerServerId(data)),
	-- 	tostring("Player ID: ~t~" .. GetPlayerFromServerId(GetPlayerServerId(data))),
	-- 	tostring("Distance: ~f~" .. math.round(#(vector3(cx, cy, cz) - vector3(tx, ty, tz)), 1)),
	-- 	tostring("Status: " .. (IsPedDeadOrDying(dataPed, 1) and "~r~Dead " or "~g~Alive")),
	-- 	tostring("Task: " .. Menuxdhf798230fsdf3df.Gametykurwobhfug7834f08sdfg3d:GetPedStatus(dataPed)),
	-- }

	-- [ NOTE ] refactor infoData into DrawPlayerInfo

	-- Define our infoData table
	local infoData = {}

	-- Get the vehicle model name instead of the label text to support custom vehicles
	local vehicleName = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(DrawPlayerInfo.playerPed)))
	
	-- Should work, but my local server isn't using MP peds, so I need to test once exec is updated.
	-- using `playerPed` instead of `player` for now
	local playerHealth = GetEntityHealth(DrawPlayerInfo.playerPed) - 100

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
	-- 	tostring("Name: " .. Menuxdhf798230fsdf3df:CheckName(GetPlayerName(data))),
	-- 	tostring("Server ID: " .. GetPlayerServerId(data)),
	-- 	tostring("Player ID: ~t~" .. GetPlayerFromServerId(GetPlayerServerId(data))),
	-- 	tostring("Distance: ~f~" .. math.round(#(vector3(cx, cy, cz) - vector3(tx, ty, tz)), 1)),
	-- 	tostring("Status: " .. (IsPedDeadOrDying(dataPed, 1) and "~r~Dead " or "~g~Alive")),
	-- 	tostring("Task: " .. vehicleName),
	-- }

	
	-- drawRect(DrawPlayerInfo.x, DrawPlayerInfo.y + footerHeight / 2, previewWidth, footerHeight, { r = 0, b = 0, g = 0, a = 255 })
	
	-- Header box
	drawRect(DrawPlayerInfo.x, DrawPlayerInfo.y + DrawPlayerInfo.mugshotHeight / 2, previewWidth, DrawPlayerInfo.mugshotHeight, { r = 0, g = 0, b = 0, a = 255 })
	drawText(DrawPlayerInfo.playerName, DrawPlayerInfo.x + DrawPlayerInfo.mugshotWidth + buttonTextXOffset / 2 - previewWidth / 2, DrawPlayerInfo.y - separatorHeight + (buttonHeight / 2 - fontHeight / 2), buttonFont, _menuColor.base, buttonScale, false, false)
	
	-- Ped preview
	if DrawPlayerInfo.pedHeadshot == true and IsPedheadshotValid(DrawPlayerInfo.handle) and IsPedheadshotReady(DrawPlayerInfo.handle) then
		DrawSprite(DrawPlayerInfo.txd, DrawPlayerInfo.txd, DrawPlayerInfo.x - previewWidth / 2 + DrawPlayerInfo.mugshotWidth / 2, DrawPlayerInfo.y + DrawPlayerInfo.mugshotHeight / 2, DrawPlayerInfo.mugshotWidth, DrawPlayerInfo.mugshotHeight, 0.0, 255, 255, 255, 255)
	end
	
	-- Separator
	drawRect(DrawPlayerInfo.x, DrawPlayerInfo.y + DrawPlayerInfo.mugshotHeight + separatorHeight / 2, previewWidth, separatorHeight, _menuColor.base)
	
	-- Content
	for i = 1, #infoData do
		local multiplier = i
		local text = infoData[i]
		-- Draw content background
		drawRect(DrawPlayerInfo.x, DrawPlayerInfo.y + buttonHeight + separatorHeight + footerHeight * multiplier - footerHeight / 2, previewWidth, footerHeight, menus[hf892fdsf23].menuBackgroundColor)
		-- Draw info title (left)
		drawText(text[1], DrawPlayerInfo.x - previewWidth / 2 + buttonTextXOffset / 2, DrawPlayerInfo.y + buttonHeight + separatorHeight + footerHeight * (multiplier - 1) - separatorHeight + (footerHeight / 2 - fontHeight / 2), buttonFont, menus[hf892fdsf23].menuTextColor, buttonScale, false, false)
		-- Draw info description (right)
		drawPreviewText(tostring(text[2]), DrawPlayerInfo.x + buttonTextXOffset, DrawPlayerInfo.y + buttonHeight + separatorHeight + footerHeight * (multiplier - 1) - separatorHeight + (footerHeight / 2 - fontHeight / 2), buttonFont, menus[hf892fdsf23].menuTextColor, buttonScale, false, false, true)
		
	end

end

function Menuu8f9df92fds3.DrawWeaponPreview(index)
	local previewX = menus[hf892fdsf23].x - frameWidth / 2
	local previewY = menus[hf892fdsf23].y + titleHeight / 2 + previewWidth
	
	if index then
		RequestStreamedTextureDict(t_Weapons[index][4])
		if HasStreamedTextureDictLoaded(t_Weapons[index][4]) then
			drawRect((previewX - previewWidth / 2) - frameWidth, previewY + 0.005, previewWidth + 0.005, (0.1 * aspectRatio) / 2 + 0.01, menus[hf892fdsf23].menuFrameColor)
			DrawSpriteScaled(t_Weapons[index][4], t_Weapons[index][3], (previewX - previewWidth / 2) - frameWidth, previewY + 0.005, previewWidth, nil, 0.0, 255, 255, 255, 255)
		end
	end

end

function Menuu8f9df92fds3.DrawVehiclePreview(vehClass)
	local previewX = menus[hf892fdsf23].x - frameWidth / 2
	local previewY = menus[hf892fdsf23].y + titleHeight / 2 + previewWidth
	local class = VehicleClass[vehClass]
	local index = menus[hf892fdsf23].currentOption
	
	if class and index then
		RequestStreamedTextureDict(class[index][2])
		if HasStreamedTextureDictLoaded(class[index][2]) then
			drawRect((previewX - previewWidth / 2) - frameWidth, previewY + 0.005, previewWidth + 0.005, (0.1 * aspectRatio) / 2 + 0.01, menus[hf892fdsf23].menuFrameColor)
			DrawSpriteScaled(class[index][2], class[index][3] or class[index][1], (previewX - previewWidth / 2) - frameWidth, previewY + 0.005, previewWidth, nil, 0.0, 255, 255, 255, 255)
		end
	end
end

function Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
	if isMenuVisibleh7g804gf(hf892fdsf23) then
		if menus[hf892fdsf23].aboutToBeClosed then
			Menuu8f9df92fds3.CloseMenu()
		else
			SetScriptGfxDrawOrder(15)
			-- drawTitlejg894gfg()
			drawSubTitlefgh7834gsdg()
			drawFootertng09845gdfrg()

			currentKey = nil

			if IsDisabledControlJustPressed(0, keys.down) then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

				if menus[hf892fdsf23].currentOption < optionCount then
					menus[hf892fdsf23].currentOption = menus[hf892fdsf23].currentOption + 1
				else
					menus[hf892fdsf23].currentOption = 1
				end
			elseif IsDisabledControlJustPressed(0, keys.up) then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

				if menus[hf892fdsf23].currentOption > 1 then
					menus[hf892fdsf23].currentOption = menus[hf892fdsf23].currentOption - 1
				else
					menus[hf892fdsf23].currentOption = optionCount
				end
			elseif IsDisabledControlJustPressed(0, keys.left) then
				currentKey = keys.left
			elseif IsDisabledControlJustPressed(0, keys.right) then
				currentKey = keys.right
			elseif IsDisabledControlJustPressed(0, keys.select) then
				currentKey = keys.select
			elseif IsDisabledControlJustPressed(0, keys.back) then
				if menus[menus[hf892fdsf23].previousMenu] then
					PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
					setMenuVisiblehg87f34gdsg(menus[hf892fdsf23].previousMenu, true, true)
				else
					Menuu8f9df92fds3.CloseMenu()
				end
			end

			optionCount = 0
		end
	end
end

function Menuu8f9df92fds3.SetMenuWidth(id, width)
	setMenuPropertyjg89rgdfg4(id, "width", width)
end

function Menuu8f9df92fds3.SetMenuX(id, x)
	setMenuPropertyjg89rgdfg4(id, "x", x)
end

function Menuu8f9df92fds3.SetMenuY(id, y)
	setMenuPropertyjg89rgdfg4(id, "y", y)
end

function Menuu8f9df92fds3.SetMenuMaxOptionCountOnScreen(id, count)
	setMenuPropertyjg89rgdfg4(id, "maxOptionCount", count)
end

function Menuu8f9df92fds3.SetTitleColor(id, r, g, b, a)
	setMenuPropertyjg89rgdfg4(id, "titleColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].titleColor.a})
end

function Menuu8f9df92fds3.SetTitleBackgroundColor(id, r, g, b, a)
	setMenuPropertyjg89rgdfg4(
		id,
		"titleBackgroundColor",
		{["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].titleBackgroundColor.a}
	)
end

function Menuu8f9df92fds3.SetTitleBackgroundSprite(id, textureDict, textureName)
	setMenuPropertyjg89rgdfg4(id, "titleBackgroundSprite", {dict = textureDict, name = textureName})
end

function Menuu8f9df92fds3.SetSubTitlej89gug8fdg4fg(id, text)
	setMenuPropertyjg89rgdfg4(id, "subTitle", string.upper(text))
end

function Menuu8f9df92fds3.SetMenuBackgroundColor(id, r, g, b, a)
	setMenuPropertyjg89rgdfg4(
		id,
		"menuBackgroundColor",
		{["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuBackgroundColor.a}
	)
end

function Menuu8f9df92fds3.SetMenuTextColor(id, r, g, b, a)
	setMenuPropertyjg89rgdfg4(id, "menuTextColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuTextColor.a})
end

function Menuu8f9df92fds3.SetMenuSubTextColor(id, r, g, b, a)
	setMenuPropertyjg89rgdfg4(id, "menuSubTextColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuSubTextColor.a})
end

function Menuu8f9df92fds3.SetMenuFocusColor(id, r, g, b, a)
	setMenuPropertyjg89rgdfg4(id, "menuFocusColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuFocusColor.a})
end

function Menuu8f9df92fds3.SetMenuButtonbhugr9i84hogdrgfPressedSound(id, name, set)
	setMenuPropertyjg89rgdfg4(id, "buttonPressedSound", {["name"] = name, ["set"] = set})
end

local function DrawText3D(x, y, z, text, r, g, b)
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

local function DrawText3DFill(x, y, z, text, r, g, b)
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

local function RGBRainbowKurwa123(frequency)
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
	result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
	result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

	return result
end

local function TeleportToWaypointhg7f8t3r09gxdg()
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
		Menuu8f9df92fds3.SendNotification({text = "You must place a waypoint", type = 'error'})
	end
end

    function Tepankowkordykurwygj89r0gxdsfg()
        local x = KeyboardInput("Enter X Pos", "", 100)
        local y = KeyboardInput("Enter Y Pos", "", 100)
        local z = KeyboardInput("Enter Z Pos", "", 100)
        local entity
        if x ~= "" and y ~= "" and z ~= "" then
            if IsPedInAnyVehicle(GetPlayerPed(-1),0) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1),0),-1)==GetPlayerPed(-1) then 
                entity = GetVehiclePedIsIn(GetPlayerPed(-1),0)
            else
                entity = PlayerPedId()
            end
            if entity then
                SetEntityCoords(entity, x + 0.5, y + 0.5, z + 0.5, 1,0,0,1)
            end
        else
            Menuu8f9df92fds3.SendNotification({text = "Invaild coords!", type = "error"})
        end
    end

local function SpectatePlayerghu8r7yg80973gdf(selectedPlayer)
	local selectedPlayerPed = GetPlayerPed(selectedPlayer)
	
	if Menuxdhf798230fsdf3df.Player.Spectating then

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

	Menuxdhf798230fsdf3df.Player.Spectating = not Menuxdhf798230fsdf3df.Player.Spectating
end

function SzczalPlayerKurlanug9740gdfg(player)
	local head = GetPedBoneCoords(player, GetEntityBoneIndexByName(player, "SKEL_HEAD"), 0.0, 0.0, 0.0)
	SetPedShootsAtCoord(PlayerPedId(), head.x, head.y, head.z, true)
end

local function RequestControlgr4e90gdf(entity)
	local Waiting = 0
	NetworkRequestControlgr4e90gdfOfEntity(entity)
	while not NetworkHasControlOfEntity(entity) do
		Waiting = Waiting + 100
		Citizen.Wait(100)
		if Waiting > 5000 then
			break
		end
	end
end

local ptags = {}
-- Thread that handles all menu toggles (Godmode, wallhackhaha, etc)
local function MenuToggleThread()
	while ghsudiyfusi do

		-- Radar/showMinimap
		DisplayRadar(showMinimap, 1)
		Menuxdhf798230fsdf3df.Player.IsInVehicle = IsPedInAnyVehicle(PlayerPedId(), 0)

		SetPlayerInvincible(PlayerId(), Godmode)
		SetEntityInvincible(PlayerPedId(), Godmode)

		SetPedCanBeKnockedOffVehicle(PlayerPedId(), Menuxdhf798230fsdf3df.Toggle.VehicleNoFall) 

		SetEntityVisible(PlayerPedId(), not Invisible, 0)

		SetPedCanRagdoll(PlayerPedId(), not RagdollToggle)

		if Crosshair then
			EnableCrosshairThisFrame()
			ShowHudComponentThisFrame(14)
		end

		if playerBlips then
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
							elseif vehModel == GetHashKey("insurgent") or vehModel == GetHashKey("insurgent2") or vehModel == GetHashKey("insurgent3") then -- Insurgent, Insurgent Pickup & Insurgent Pickup Custom
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
		elseif not playerBlips then
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

		SetWeaponDamageModifier(GetSelectedPedWeapon(PlayerPedId()), SliderOptions.DamageModifier.Values[SliderOptions.DamageModifier.Selected])

		if Menuxdhf798230fsdf3df.Toggle.VehicleCollision then
            playerveh = GetVehiclePedIsIn(PlayerPedId(), false)
            for k in EnumerateVehicles() do
                SetEntityNoCollisionEntity(k, playerveh, true)
            end
            for k in EnumerateObjects() do
                SetEntityNoCollisionEntity(k, playerveh, true)
            end
            for k in EnumeratePeds() do
                SetEntityNoCollisionEntity(k, playerveh, true)
            end
        end

		
		if Menuxdhf798230fsdf3df.Toggle.EasyHandling then
			if Menuxdhf798230fsdf3df.Player.Vehicle ~= 0 then
				SetVehicleGravityAmount(Menuxdhf798230fsdf3df.Player.Vehicle, 30.0)
			end
		else
			if Menuxdhf798230fsdf3df.Player.Vehicle ~= 0 then
				SetVehicleGravityAmount(Menuxdhf798230fsdf3df.Player.Vehicle, 9.8)
			end
		end

		if showNametags then
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
							DrawText3D(x2, y2, z2 + 1.25, "" .. GetPlayerServerId(id) .. " | " .. GetPlayerName(id) .. "", 30, 144, 255)
						else
							DrawText3D(x2, y2, z2 + 1.25, "" .. GetPlayerServerId(id) .. " | " .. GetPlayerName(id) .. "", 255, 255, 255)
						end
					end
				end
			end
		end

		if showGoodNametags then
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
		elseif not showNametags then
			-- for i = 1, #ptags do
			-- 	SetMpGamerTagVisibility(ptags[i], 4, 0)
			-- 	SetMpGamerTagVisibility(ptags[i], 8, 0)
			-- end
		end
		

		if SuperJump then
			SetSuperJumpThisFrame(PlayerId())
		end

		if InfStamina then
			RestorePlayerStamina(PlayerId(), 1.0)
		end

		SetRunSprintMultiplierForPlayer(PlayerId(), SliderOptions.FastRun.Values[SliderOptions.FastRun.Selected])
		SetPedMoveRateOverride(PlayerPedId(), SliderOptions.FastRun.Values[SliderOptions.FastRun.Selected])

		if Menuxdhf798230fsdf3df.Toggle.DeleteGun then
			local found, entity = GetEntityPlayerIsFreeAimingAt(PlayerId())
			if found then
				local entityCoords = GetEntityCoords(entity)
				DrawMarker(2, entityCoords.x, entityCoords.y, entityCoords.z + 2, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b, 170, false, true, 2, nil, nil, false)
				if IsDisabledControlPressed(0, Menuxdhf798230fsdf3df.Keys["MOUSE1"]) then
					SetEntityAsMissionEntity(entity)
					DeleteEntity(entity)
				end
			end
		end

		if Menuxdhf798230fsdf3df.Toggle.RapidFire then
			DisablePlayerFiring(PlayerPedId(), true)
			if IsDisabledControlPressed(0, Menuxdhf798230fsdf3df.Keys["MOUSE1"]) then
				local _, weapon = GetCurrentPedWeapon(PlayerPedId())
				local wepent = GetCurrentPedWeaponEntityIndex(PlayerPedId())
				local camDir = GetCamDirFromScreenCenter()
				local camPos = GetGameplayCamCoord()
				local launchPos = GetEntityCoords(wepent)
				local targetPos = camPos + (camDir * 200.0)
				
				ClearAreaOfProjectiles(launchPos, 0.0, 1)
				
				ShootSingleBulletBetweenCoords(launchPos, targetPos, 5, 1, weapon, PlayerPedId(), true, true, 24000.0)
				ShootSingleBulletBetweenCoords(launchPos, targetPos, 5, 1, weapon, PlayerPedId(), true, true, 24000.0)
			end
		end

		if zniszautakurwa then
			for vehicle in EnumerateVehicles() do
				if (vehicle ~= GetVehiclePedIsIn(PlayerPedId(), false)) then
					NetworkRequestControlgr4e90gdfOfEntity(vehicle)
					SetVehicleUndriveable(vehicle,true)
					SetVehicleEngineHealth(vehicle, 100)
				end
			end
		end


		if WypierdolAutoWybuchkurwa then
			for vehicle in EnumerateVehicles() do
				if (vehicle ~= GetVehiclePedIsIn(PlayerPedId(), false)) then
					NetworkRequestControlgr4e90gdfOfEntity(vehicle)
					NetworkExplodeVehicle(vehicle, true, true, false)
				end
			end
		end

		if wallhackhaha then
			local plist = GetActivePlayers()
			for i = 1, #plist do
				local id = plist[i]
				if id ~= PlayerId() and GetPlayerServerId(id) ~= 0 then
					local ra = {r = 255, g = 255, b = 255, a = 255}
					local pPed = GetPlayerPed(id)
					local cx, cy, cz = table.unpack(GetEntityCoords(PlayerPedId()))
					local x, y, z = table.unpack(GetEntityCoords(pPed))
					local message = 
						"Name: \t\t" .. GetPlayerName(id) ..
						"\nServer ID: \t" .. GetPlayerServerId(id) ..
						"\nPlayer ID: \t" .. id .. 
						"\nDistance: \t" .. math.round(#(vector3(cx, cy, cz) - vector3(x, y, z)), 1)
					if IsPedInAnyVehicle(pPed, true) then
						local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(pPed))))
						message = message .. string.format("\nVehicle: \t" .. VehName)
					end
			
					DrawText3D(x, y, z + 1.0, message, ra.r, ra.g, ra.b)

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

		if VehGod and IsPedInAnyVehicle(PlayerPedId(), true) then
			SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId()), true)
		end

		if VehSpeed and IsPedInAnyVehicle(PlayerPedId(), true) then
			if IsControlPressed(0, 209) then
				SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId()), 70.0)
			elseif IsControlPressed(0, 210) then
				SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId()), 0.0)
			end
		end

		if TriggerBot then
			local isAiming, targetEntity = GetEntityPlayerIsFreeAimingAt(PlayerId(), Entity)
			if isAiming then
				if IsPedAPlayer(Entity) and not IsPedDeadOrDying(Entity, 0) and IsPedAPlayer(Entity) then
					SzczalPlayerKurlanug9740gdfg(Entity)
				end
			end
		end

		if strzalwglowekurwa then
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

		if Menuxdhf798230fsdf3df.Toggle.KoloroweAutoM8Nih78f3t09fds3fd then
			local ra = RGBRainbowKurwa123(1.0)
			SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
			SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
		end

		if Menuxdhf798230fsdf3df.Player.isNoclipping then
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
			
			if isInVehicle and Menuxdhf798230fsdf3df.Gametykurwobhfug7834f08sdfg3d:GetSeatPedIsIn(PlayerPedId()) ~= -1 then Menuxdhf798230fsdf3df.Gametykurwobhfug7834f08sdfg3d:RequestControlgr4e90gdfOnce(k) end
			
			local dx, dy, dz = Menuxdhf798230fsdf3df.Gametykurwobhfug7834f08sdfg3d:GetCamDirection()
			SetEntityVisible(PlayerPedId(), 0, 0)
			SetEntityVisible(k, 0, 0)
			
			SetEntityVelocity(k, 0.0001, 0.0001, 0.0001)
			
			if IsDisabledControlJustPressed(0, Menuxdhf798230fsdf3df.Keys["LEFTSHIFT"]) then -- Change speed
				oldSpeed = NoclipSpeed
				NoclipSpeed = NoclipSpeed * 5
			end
			
			if IsDisabledControlJustReleased(0, Menuxdhf798230fsdf3df.Keys["LEFTSHIFT"]) then -- Restore speed
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
			
			if IsDisabledControlPressed(0, Menuxdhf798230fsdf3df.Keys["SPACE"]) then -- MOVE UP
				z = z + NoclipSpeed
			end
			
			if IsDisabledControlPressed(0, Menuxdhf798230fsdf3df.Keys["LEFTCTRL"]) then -- MOVE DOWN
				z = z - NoclipSpeed
			end
			
			
			SetEntityCoordsNoOffset(k, x, y, z, true, true, true)
		end
		
		Citizen.Wait(0)
	end
end
CreateThread(MenuToggleThread)


-- Menu runtime for drawing and handling input
local function MenuRuntimeThread()
	FreezeEntityPosition(entity, false)
	local currentItemIndex = 1
	local selectedItemIndex = 1

	-- MAIN MENU
	Menuu8f9df92fds3.hgfuywefs3fds("Menuu8f9df92fds3MainMenu", "Menuxdhf798230fsdf3df MENU")
	Menuu8f9df92fds3.SetSubTitlej89gug8fdg4fg("Menuu8f9df92fds3MainMenu", "MAIN MENU")

	-- MAIN MENU CATEGORIES
	Menuu8f9df92fds3.kfuyisoiyf8923d("SelfMenu", "Menuu8f9df92fds3MainMenu", "Self Options")
	Menuu8f9df92fds3.kfuyisoiyf8923d("SelfSuperPowers", "SelfMenu", "Super Powers")
	Menuu8f9df92fds3.kfuyisoiyf8923d("MODEL", "SelfMenu", "Models")
	Menuu8f9df92fds3.kfuyisoiyf8923d('OnlinePlayersMenu', 'Menuu8f9df92fds3MainMenu', "Online Options")
	Menuu8f9df92fds3.kfuyisoiyf8923d("VisualMenu", "Menuu8f9df92fds3MainMenu", "Visual Options")
	Menuu8f9df92fds3.kfuyisoiyf8923d("TeleportMenu", "Menuu8f9df92fds3MainMenu", "Teleport Options")
	
	-- MAIN MENU > Vehicle Options
	Menuu8f9df92fds3.kfuyisoiyf8923d("LocalVehicleMenu", "Menuu8f9df92fds3MainMenu", "Vehicle Options")
	-- MAIN MENU > Vehicle Options > Vehicle Spawner
	Menuu8f9df92fds3.kfuyisoiyf8923d("LocalVehicleSpawner", "LocalVehicleMenu", "Vehicle Spawner")
	-- MAIN MENU > Vehicle Options > Vehicle Spawner > $class
	Menuu8f9df92fds3.kfuyisoiyf8923d("localcompacts", "LocalVehicleSpawner", "Compacts")
	Menuu8f9df92fds3.kfuyisoiyf8923d("localsedans", "LocalVehicleSpawner", "Sedans")
	Menuu8f9df92fds3.kfuyisoiyf8923d("localsuvs", "LocalVehicleSpawner", "SUVs")
	Menuu8f9df92fds3.kfuyisoiyf8923d("localcoupes", "LocalVehicleSpawner", "Coupes")
	Menuu8f9df92fds3.kfuyisoiyf8923d("localmuscle", "LocalVehicleSpawner", "Muscle")
	Menuu8f9df92fds3.kfuyisoiyf8923d("localsportsclassics", "LocalVehicleSpawner", "Sports Classics")
	Menuu8f9df92fds3.kfuyisoiyf8923d("localsports", "LocalVehicleSpawner", "Sports")
	Menuu8f9df92fds3.kfuyisoiyf8923d("localsuper", "LocalVehicleSpawner", "Super")
	Menuu8f9df92fds3.kfuyisoiyf8923d("localmotorcycles", "LocalVehicleSpawner", "Motorcycles")
	Menuu8f9df92fds3.kfuyisoiyf8923d("localoffroad", "LocalVehicleSpawner", "Off-Road")
	Menuu8f9df92fds3.kfuyisoiyf8923d("localindustrial", "LocalVehicleSpawner", "Industrial")
	Menuu8f9df92fds3.kfuyisoiyf8923d("localutility", "LocalVehicleSpawner", "Utility")
	Menuu8f9df92fds3.kfuyisoiyf8923d("localvans", "LocalVehicleSpawner", "Vans")
	Menuu8f9df92fds3.kfuyisoiyf8923d("localcycles", "LocalVehicleSpawner", "Cycles")
	Menuu8f9df92fds3.kfuyisoiyf8923d("localboats", "LocalVehicleSpawner", "Boats")
	Menuu8f9df92fds3.kfuyisoiyf8923d("localhelicopters", "LocalVehicleSpawner", "Helicopters")
	Menuu8f9df92fds3.kfuyisoiyf8923d("localplanes", "LocalVehicleSpawner", "Planes")
	Menuu8f9df92fds3.kfuyisoiyf8923d("localservice", "LocalVehicleSpawner", "Service")
	Menuu8f9df92fds3.kfuyisoiyf8923d("localcommercial", "LocalVehicleSpawner", "Commercial")
	
	Menuu8f9df92fds3.kfuyisoiyf8923d("LocalWepMenu", "Menuu8f9df92fds3MainMenu", "Weapon Options")
	Menuu8f9df92fds3.kfuyisoiyf8923d("ServerMenu", "Menuu8f9df92fds3MainMenu", "Server Options")
	Menuu8f9df92fds3.kfuyisoiyf8923d("GriefMenu", "Menuu8f9df92fds3MainMenu", "Griefer Options")
	Menuu8f9df92fds3.kfuyisoiyf8923d("MenuSettings", "Menuu8f9df92fds3MainMenu", "Menu Settings")
	
	Menuu8f9df92fds3.kfuyisoiyf8923d('LSC', 'LocalVehicleMenu', "Los Santos Customs")
	Menuu8f9df92fds3.kfuyisoiyf8923d('lsc_bodywork', 'LSC', 'Bodywork')
	Menuu8f9df92fds3.kfuyisoiyf8923d('lsc_performance', 'LSC', 'Performance Tuning')

	-- ONLINE PLAYERS MENU
	Menuu8f9df92fds3.kfuyisoiyf8923d('PlayerOptionsMenu', 'OnlinePlayersMenu', "Player Options")
	
	-- ONLINE PLAYERS > PLAYER > WEAPON OPTIONS MENU
	Menuu8f9df92fds3.kfuyisoiyf8923d('OnlineWepMenu', 'PlayerOptionsMenu', 'Weapon Menu')
	Menuu8f9df92fds3.kfuyisoiyf8923d('OnlineWepCategory', 'OnlineWepMenu', 'Give Weapon')
	Menuu8f9df92fds3.kfuyisoiyf8923d("OnlineMeleeWeapons", "OnlineWepCategory", "Melee")
	Menuu8f9df92fds3.kfuyisoiyf8923d("OnlineSidearmWeapons", "OnlineWepCategory", "Handguns")
	Menuu8f9df92fds3.kfuyisoiyf8923d("OnlineAutorifleWeapons", "OnlineWepCategory", "Assault Rifles")
	Menuu8f9df92fds3.kfuyisoiyf8923d("OnlineShotgunWeapons", "OnlineWepCategory", "Shotguns")
	Menuu8f9df92fds3.kfuyisoiyf8923d("OnlineTrollMenu", "PlayerOptionsMenu", "Troll Options")
	Menuu8f9df92fds3.kfuyisoiyf8923d("SpawnMenu", "OnlineTrollMenu", "Spawn Options")
	Menuu8f9df92fds3.kfuyisoiyf8923d("PropsMenu", "OnlineTrollMenu", "Props Options")
	
	Menuu8f9df92fds3.kfuyisoiyf8923d('OnlineVehicleMenuPlayer', 'PlayerOptionsMenu', "Vehicle Options")
	Menuu8f9df92fds3.kfuyisoiyf8923d('ESXMenuPlayer', 'PlayerOptionsMenu', "ESX Options")

	Menuu8f9df92fds3.kfuyisoiyf8923d("LocalWepCategory", "LocalWepMenu", "Give Weapon")
	Menuu8f9df92fds3.kfuyisoiyf8923d("LocalMeleeWeapons", "LocalWepCategory", "Melee")
	Menuu8f9df92fds3.kfuyisoiyf8923d("LocalSidearmWeapons", "LocalWepCategory", "Handguns")
	Menuu8f9df92fds3.kfuyisoiyf8923d("LocalSmgWeapons", "LocalWepCategory", "Submachine Guns")
	Menuu8f9df92fds3.kfuyisoiyf8923d("LocalShotgunWeapons", "LocalWepCategory", "Shotguns")
	Menuu8f9df92fds3.kfuyisoiyf8923d("LocalAssaultRifleWeapons", "LocalWepCategory", "Assault Rifles")
	Menuu8f9df92fds3.kfuyisoiyf8923d("LocalMachineGunWeapons", "LocalWepCategory", "Light Machine Guns")
	Menuu8f9df92fds3.kfuyisoiyf8923d("LocalSniperRifles", "LocalWepCategory", "Sniper Rifles")
	Menuu8f9df92fds3.kfuyisoiyf8923d("LocalHeavyWeapons", "LocalWepCategory", "Heavy Weapons")
	Menuu8f9df92fds3.kfuyisoiyf8923d("AimbotOptions", "LocalWepMenu", "Aimbot Options")
	
	Menuu8f9df92fds3.kfuyisoiyf8923d("ServerResources", "ServerMenu", "Server Resources")
	Menuu8f9df92fds3.kfuyisoiyf8923d('ResourceData', "ServerResources", "Resource Data")
	Menuu8f9df92fds3.kfuyisoiyf8923d('ResourceCEvents', 'ResourceData', 'Event Handlers')
	Menuu8f9df92fds3.kfuyisoiyf8923d('ResourceSEvents', 'ResourceData', 'Server Events')
	Menuu8f9df92fds3.kfuyisoiyf8923d("ESXBoss", "ServerMenu", "ESX Boss Menus")
	Menuu8f9df92fds3.kfuyisoiyf8923d("ServerMoneyOptions", "ServerMenu", "Money Options")
	Menuu8f9df92fds3.kfuyisoiyf8923d("ESXMisc", "ServerMenu", "ESX Misc Options")
	Menuu8f9df92fds3.kfuyisoiyf8923d("MiscServerOptions", "ServerMenu", "Misc Server Options")
	Menuu8f9df92fds3.kfuyisoiyf8923d("Resources", "ServerMenu", "Resources")
	
	Menuu8f9df92fds3.kfuyisoiyf8923d("MenuSettingsColor", "MenuSettings", "Change Menu Color")
	Menuu8f9df92fds3.kfuyisoiyf8923d("MenuSettingsCredits", "MenuSettings", "Credits")
	
	for i, mod in pairs(LSC.vehicleMods) do
		Menuu8f9df92fds3.kfuyisoiyf8923d(mod.meta, 'lsc_bodywork', mod.name)
	end

	Menuu8f9df92fds3.kfuyisoiyf8923d("primary", "lscrepsray", "Primary Color")
	Menuu8f9df92fds3.kfuyisoiyf8923d("secondary", "lscrepsray", "Secondary Color")

	Menuu8f9df92fds3.kfuyisoiyf8923d("rimpaint", "lscrepsray", "Wheel Paint")

	local SelectedPlayer = nil
	local SelectedResource = nil

	-- Event sniffing
	for _, resource in pairs(validResources) do

		for key, name in pairs(validResourceEvents[resource]) do
			local event = string.lower(name)
		end

	end

	while ghsudiyfusi do
		Menuxdhf798230fsdf3df.Player.Vehicle = GetVehiclePedIsUsing(PlayerPedId())

		if IsDisabledControlJustPressed(0, Menuxdhf798230fsdf3df.Keys["DELETE"]) then
			--GateKeep()
			Menuu8f9df92fds3.lpopi092398fyds("Menuu8f9df92fds3MainMenu")
		end

		if Menuu8f9df92fds3.iug983dg3d("Menuu8f9df92fds3MainMenu") then
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Self Options", "SelfMenu") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Online Options", "OnlinePlayersMenu") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Visual Options", "VisualMenu") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Teleport Options", "TeleportMenu") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Vehicle Options", "LocalVehicleMenu") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Weapon Options", "LocalWepMenu") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Server Options", "ServerMenu") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("~r~Grief Menu", "GriefMenu") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("~b~Menu Settings", "MenuSettings") then end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("SelfMenu") then
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Super Powers", "SelfSuperPowers") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Models", "MODEL") then end

			-- if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Sky Dive") then
			-- 	TaskSkyDive(PlayerPedId())
			-- end
			
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Max Health") then
				SetEntityHealth(PlayerPedId(), 200)
			end
			
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Max Armour") then
				SetPedArmour(PlayerPedId(), 200)
			end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~r~Edit Skin") then
                TriggerEvent('esx_skin:openSaveableMenu', setMenuVisiblehg87f34gdsg(hf892fdsf23, false))
			end

			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Infinite Stamina", InfStamina, function(enabled) InfStamina = enabled end) then
				
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Revive Self", "~g~ESX") then
				TriggerEvent('esx_ambulancejob:revive')
			end
			
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Revive Self", "~g~Native") then
				revivenativehf7892dfh9fg7u3o0gdsg3r()
			end

			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Ragdoll", Menuxdhf798230fsdf3df.Toggle.SelfRagdolljf892uy908fsdf23) then
				SelfRagdolljf892uy908fsdf23()
			end

			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Anti-Ragdoll", RagdollToggle, function(enabled) RagdollToggle = enabled end) then end
			
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Suicide") then
				ZabijSieKurwo()
			end

			if Menuu8f9df92fds3.Slider("Move Speed", SliderOptions.FastRun.Words, SliderOptions.FastRun.Selected, function(selectedIndex)
				if SliderOptions.FastRun.Selected ~= selectedIndex then 
					SliderOptions.FastRun.Selected = selectedIndex
				end
			end) then end

			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Noclip", Menuxdhf798230fsdf3df.Player.isNoclipping, function(enabled) 
				Menuxdhf798230fsdf3df.Player.isNoclipping = enabled 
				if Menuxdhf798230fsdf3df.Player.isNoclipping then
					SetEntityVisible(PlayerPedId(), false, false)
				else
					SetEntityRotation(GetVehiclePedIsIn(PlayerPedId(), 0), GetGameplayCamRot(2), 2, 1)
					SetEntityVisible(GetVehiclePedIsIn(PlayerPedId(), 0), true, false)
					SetEntityVisible(PlayerPedId(), true, false)
				end
			end) then end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("SelfSuperPowers") then
			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Godmode", Godmode, function(enabled) Godmode = enabled end) then

			end

			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Super Jump", SuperJump, function(enabled) SuperJump = enabled end) then

			end

			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Invisibility", Invisible, function(enabled) Invisible = enabled end) then

			end

			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Magneto", Menuxdhf798230fsdf3df.Toggle.MagnetoModeg43587gydrg4) then
				MagnetoModeg43587gydrg4()
			end
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("TeleportMenu") then
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Teleport to waypoint") then
				TeleportToWaypointhg7f8t3r09gxdg()
			end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Teleport to coords") then
				Tepankowkordykurwygj89r0gxdsfg()
			end
	
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("VisualMenu") then
			-- if
			-- 	Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg(
			-- 	"TriggerBot",
			-- 	TriggerBot,
			-- 	function(enabled)
			-- 	TriggerBot = enabled
			-- 	end)
			-- then
			-- elseif
			-- 	Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg(
			-- 	"AimBot",
			-- 	AimBot,
			-- 	function(enabled)
			-- 	AimBot = enabled
			-- 	end)
			-- then

			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("ESP", wallhackhaha, function(enabled) wallhackhaha = enabled end) then end
			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Force Crosshair", Crosshair, function(enabled) Crosshair = enabled end) then end
			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Force Minimap", showMinimap, function(enabled) showMinimap = enabled end) then end
			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Force Player Blips", playerBlips, function(enabled) playerBlips = enabled end) then end
			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Force Gamertags", showNametags, function(enabled) showNametags = enabled end) then end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("MODEL") then
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Clown') then
			local model = "s_m_y_clown_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Mime') then
			local model = "S_M_Y_Mime"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Stripper') then
		    local model = "s_f_y_stripper_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Cop M') then
		local model = "s_m_y_cop_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Cop F') then
		local model = "MP_F_Cop_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Sheriff M') then
		local model = "S_M_Y_Sheriff_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Sheriff F') then
		local model = "S_F_Y_Sheriff_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model ~b~SWAT M') then
		local model = "S_M_Y_Swat_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Armoured Ranger M') then
		local model = "S_M_M_Armoured_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end	
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Ranger F') then
		local model = "S_F_Y_Ranger_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end	
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Ranger Male') then
		local model = "S_M_Y_Ranger_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Robot Ranger Male') then
		local model = "U_M_Y_RSRanger_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Desert Army 01') then
		local model = "G_M_Y_DesArmy_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Desert Army 02') then
		local model = "G_M_Y_DesArmy_02"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Desert Army 03') then
		local model = "G_M_Y_DesArmy_03"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Desert Army 04') then
		local model = "G_M_Y_DesArmy_04"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Desert Army 05') then
		local model = "G_M_Y_DesArmy_05"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Marine 01') then
		local model = "S_M_Y_Marine_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end					
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Marine 02') then
		local model = "S_M_Y_Marine_02"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Marine 03') then
		local model = "S_M_Y_Marine_03"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Marine Commander') then
		local model = "S_M_M_Marine_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Marine General') then
		local model = "S_M_M_Marine_02"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Black OPS1 M') then
		local model = "S_M_Y_BlackOps_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Black OPS2 M') then
		local model = "S_M_Y_BlackOps_02"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Black OPS3 M') then
		local model = "S_M_Y_BlackOps_03"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Prison Guard M') then
		local model = "S_M_M_PrisGuard_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~b~ Paramedic M') then
		local model = "S_M_M_Paramedic_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~y~ Vagos F') then
		local model = "G_F_Y_Vagos_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~g~ Ramp Gang M') then
		local model = "IG_Ramp_Gang"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~g~ Ramp Gang Boss M') then
		local model = "CSB_Ramp_gang"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~g~ Fam Gang 01 M') then
		local model = "MP_M_FamDD_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~g~ Fam Gang 02 M') then
		local model = "G_M_Y_FamDNF_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~g~ Fam Gang Boss M') then
		local model = "G_M_Y_FamCA_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~p~ Bella Gang 01 M') then
		local model = "G_M_Y_BallaEast_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~p~ Bella Gang 02 M') then
		local model = "G_M_Y_BallaSout_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~p~ Bella Gang 03 M') then
		local model = "IG_BallasOG"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~p~ Bella Gang 04 M') then
		local model = "IG_BallasOG"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~p~ Bella Gang F') then
		local model = "G_F_Y_Ballas_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~p~ Bella Gang Boss M') then
		local model = "G_M_Y_BallaOrig_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Jewel F') then
		local model = "U_F_Y_JewelAss_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Jewel Thief') then
		local model = "U_M_M_JewelThief"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~o~ Prisoner 01 M') then
		local model = "S_M_Y_PrisMuscl_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~o~ Prisoner 02 M') then
		local model = "S_M_Y_Prisoner_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~o~ Prisoner 03 M') then
		local model = "U_M_Y_Prisoner_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Body Builder 01 M') then
		local model = "A_M_Y_MusclBeac_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Body Builder 02 M') then
		local model = "A_M_Y_MusclBeac_02"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Body Builder 03 M') then
		local model = "A_M_Y_Surfer_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Body Builder 04 M') then
		local model = "IG_TylerDix"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Body Builder 05 M') then
		local model = "u_m_y_babyd"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Body Builder F') then
		local model = "CS_MaryAnn"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Beach 01 F') then
		local model = "A_F_M_Beach_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Beach 02 F') then
		local model = "A_F_Y_Beach_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Beach Fat F') then
		local model = "A_F_M_FatCult_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Rich Female 01') then
		local model = "A_F_Y_BevHills_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Rich Female 02') then
		local model = "A_F_Y_BevHills_02"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Rich Female 03') then
		local model = "A_F_Y_BevHills_03"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Rich Female 04') then
		local model = "A_F_Y_BevHills_04"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Rich Female 05') then
		local model = "CSB_Bride"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Rich Female 06') then
		local model = "U_F_Y_PoppyMich"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Rich Female 07') then
		local model = "A_F_Y_SouCent_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Rich Female 08') then
		local model = "CSB_Anita"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Skater Female') then
		local model = "A_F_Y_Skater_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Rich Old Man') then
		local model = "U_M_O_TapHillBilly"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Rich Guy 01') then
		local model = "S_M_Y_Barman_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Rich Guy 02') then
		local model = "A_M_Y_BreakDance_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Rich Guy 03') then
		local model = "U_M_Y_Chip"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Rich Guy 04') then
		local model = "U_M_Y_GunVend_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Rich Guy 05') then
		local model = "CSB_Groom"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Rich Guy 06') then
		local model = "A_M_Y_Business_02"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Chinese M 01') then
		local model = "G_M_M_ChiBoss_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Chinese M 02') then
		local model = "G_M_M_ChiGoon_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Chinese M 03') then
		local model = "G_M_M_ChiGoon_02"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Chinese M 04') then
		local model = "CSB_Hao"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Chinese F') then
		local model = "A_F_Y_Vinewood_03"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Korean M 01') then
		local model = "A_M_Y_KTown_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Korean M 02') then
		local model = "A_M_Y_KTown_02"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Korean M 03') then
		local model = "G_M_M_KorBoss_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Korean M 04') then
		local model = "G_M_Y_Korean_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Korean M 05') then
		local model = "G_M_Y_Korean_02"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Korean F 01') then
		local model = "S_F_Y_MovPrem_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Korean F 02') then
		local model = "A_F_M_KTown_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Korean F 03') then
		local model = "A_F_M_KTown_02"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Korean F 04') then
		local model = "A_F_O_KTown_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Mexican M 01') then
		local model = "A_M_M_MexCntry_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Mexican M 02') then
		local model = "A_M_M_MexLabor_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Mexican M 03') then
		local model = "A_M_Y_MexThug_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Mexican M 04') then
		local model = "G_M_M_MexBoss_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Mexican M 05') then
		local model = "G_M_M_MexBoss_02"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Mexican M 06') then
		local model = "U_M_Y_Mani"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Mexican M 07') then
		local model = "S_M_M_Mariachi_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Mexican F') then
		local model = "U_F_Y_SpyActress"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Mexican HMaid F') then
		local model = "S_F_M_Maid_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model Animal~s~ Boar') then
		local model = "A_C_Boar"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model Animal~s~ Pig') then
		local model = "A_C_Pig"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model Animal~s~ Deer') then
		local model = "A_C_Deer"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model Animal~s~ Cow') then
				local model = "A_C_Cow"
					RequestModel(GetHashKey(model)) 
					Wait(500)
					if HasModelLoaded(GetHashKey(model)) then
						SetPlayerModel(PlayerId(), GetHashKey(model))
						end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model Animal~s~ Chicken') then
		local model = "A_C_Hen"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model Animal~s~ Hawk') then
		local model = "A_C_Chickenhawk"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model Animal~s~ Crow') then
		local model = "A_C_Crow"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model Animal~s~ Monkey') then
		local model = "A_C_Chimp"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model Animal~s~ Dog Chop') then
		local model = "A_C_Chop"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model Animal~s~ Dog Husky') then
		local model = "a_c_husky"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model Animal~s~ Dog Poodle') then
				local model = "a_c_poodle"
					RequestModel(GetHashKey(model)) 
					Wait(500)
					if HasModelLoaded(GetHashKey(model)) then
						SetPlayerModel(PlayerId(), GetHashKey(model))
						end
					elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model Animal~s~ Dog Westy') then
						local model = "a_c_westy"
							RequestModel(GetHashKey(model)) 
							Wait(500)
							if HasModelLoaded(GetHashKey(model)) then
								SetPlayerModel(PlayerId(), GetHashKey(model))
						end
					elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model Animal~s~ Dog Pug') then
						local model = "a_c_pug"
							RequestModel(GetHashKey(model)) 
							Wait(500)
							if HasModelLoaded(GetHashKey(model)) then
								SetPlayerModel(PlayerId(), GetHashKey(model))
						end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model Animal~s~ Dog Rottweiler') then
		local model = "A_C_Rottweiler"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model Animal~s~ Dog Shepherd') then
		local model = "A_C_shepherd"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model Animal~s~ Lion') then
		local model = "A_C_MtLion"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model Animal~s~ Rat') then
		local model = "A_C_Rat"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model Animal~s~ Shark') then
		local model = "A_C_SharkTiger"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model Animal~s~ Coyote') then
		local model = "A_C_Coyote"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~g~ Alien') then
		local model = "s_m_m_movalien_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Pongo') then
		local model = "u_m_y_pogo_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ Bartender F') then
		local model = "S_F_Y_Bartender_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Model~s~ FiveM') then
		local model = "mp_m_freemode_01"
			RequestModel(GetHashKey(model)) 
			Wait(500)
			if HasModelLoaded(GetHashKey(model)) then
				SetPlayerModel(PlayerId(), GetHashKey(model))
			end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('~c~Randomize~s~ Clothing') then
				 SetPedRandomComponentVariation(PlayerPedId(), true)
			end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("GriefMenu") then
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~r~Airstrike ~p~Waypoint") then
				AirstrikeWaypointhfiusygf8972dsf2sdfhf7830fdsf3s()
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~b~Remove All Weapons ~r~From Everyone") then
				local plist = GetActivePlayers()
				for i = 1, #plist do
					local id = plist[i]
					local ped = GetPlayerPed(id)
					RequestControlgr4e90gdfOnce(ped)
					for i = 1, #t_Weapons do
						RemoveWeaponFromPed(ped, t_Weapons[i][1])
					end
				end
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~r~Crash", "~g~Props") then
				najwiekszypolskicrushernuigh0e9r7gdfg(all)
				najwiekszypolskicrushernuigh0e9r7gdfg(all)
				najwiekszypolskicrushernuigh0e9r7gdfg(all)
				rampywszedziehg9urehge89rgdfg()
				rampywszedziehg9urehge89rgdfg()
				rampywszedziehg9urehge89rgdfg()
				ufokurwasmierdziszh89f0eyrg()
				ufokurwasmierdziszh89f0eyrg()
				ufokurwasmierdziszh89f0eyrg()
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~r~Crash Server", "~g~Big Planes") then
				nukerbyku1gnjhui9o43hyg09dfg()
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~b~Ufo ~r~on ALL") then
				ufokurwasmierdziszh89f0eyrg()
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~b~Ramps ~r~on ALL") then
				rampywszedziehg9urehge89rgdfg()
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~b~Soda machine ~r~to ALL") then
				for i=0, 128 do 
					local coords = GetEntityCoords(GetPlayerPed(i), true)
					local prop = "prop_vend_soda_01"
					while not HasModelLoaded(GetHashKey(prop)) do 
						Citizen.Wait(0) 
						RequestModel(GetHashKey(prop)) 
					end
					local obj = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
					AttachEntityToEntity(obj,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),39317),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
					end
				end
			
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~b~Sandy Shores ~r~on ALL") then
				for i=0, 128 do 
				local coords = GetEntityCoords(GetPlayerPed(i), true)
				local prop = "cs4_lod_01_slod3"
				while not HasModelLoaded(GetHashKey(prop)) do 
					Citizen.Wait(0) 
					RequestModel(GetHashKey(prop)) 
				end
				local obj = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
				AttachEntityToEntity(obj,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),39317),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
				end
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~b~Plane ~r~(Crashed) Attach To ALL") then
				for i=0, 300 do 
				local coords = GetEntityCoords(GetPlayerPed(i), true)
				local prop = "apa_mp_apa_crashed_usaf_01a"
				while not HasModelLoaded(GetHashKey(prop)) do 
					Citizen.Wait(0) 
					RequestModel(GetHashKey(prop)) 
				end
				local obj = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
				AttachEntityToEntity(obj,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),39317),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
				end
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~b~Ramp ~r~Attach To ALL") then
				for i=0, 300 do 
					local coords = GetEntityCoords(GetPlayerPed(i), true)
					local prop = "xm_prop_x17_osphatch_40m"
					while not HasModelLoaded(GetHashKey(prop)) do 
						Citizen.Wait(0) 
						RequestModel(GetHashKey(prop)) 
					end
					local obj = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
					AttachEntityToEntity(obj,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),39317),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
					end
				end

				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~b~Tanks ~r~Attach To ALL") then
					for i=0, 300 do 
						local coords = GetEntityCoords(GetPlayerPed(i), true)
						local rhino = "rhino"
						while not HasModelLoaded(GetHashKey(rhino)) do 
							Citizen.Wait(0) 
							RequestModel(GetHashKey(rhino)) 
						end
						local obj = CreateVehicle(GetHashKey(rhino),coords.x,coords.y,coords.z,true, true)
						AttachEntityToEntity(obj,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),39317),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
						end
					end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~b~Interact Sound ~r~Crasher ~g~(beta)") then
				for i=0, 32 do 
				TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10000, "unlock", 1.0)
				TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10000, "lock", 1.0)
				TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10000, "cuff", 1.0)
				TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10000, "demo", 1.0)
				TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10000, "belton", 1.0)
				TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10000, "beltoff", 1.0)
			end
		end

		if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~y~Explode ~r~All Players") then
			for i = 0, 128 do
				AddExplosion(GetEntityCoords(GetPlayerPed(i)), 2, 100000.0, true, false, 100000.0)
			end
		end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("LocalWepMenu") then
			
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Weapon Spawner", "LocalWepCategory") then
			end

			-- if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Aimbot Options", "AimbotOptions") then
			-- end

			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Rapid Fire", Menuxdhf798230fsdf3df.Toggle.RapidFire) then
				Menuxdhf798230fsdf3df.Toggle.RapidFire = not Menuxdhf798230fsdf3df.Toggle.RapidFire
			end

			-- SetWeaponDamageModifier(`WEAPON_PISTOL`, 100.0)
			if Menuu8f9df92fds3.Slider("Damage Modifier", SliderOptions.DamageModifier.Words, SliderOptions.DamageModifier.Selected, function(selectedIndex)
				if SliderOptions.DamageModifier.Selected ~= selectedIndex then
					SliderOptions.DamageModifier.Selected = selectedIndex
				end
			end) then end
			-- print(GetEntitySpeed(Menuxdhf798230fsdf3df.Player.Vehicle) * 2.2369356)
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~g~Give All Weapons") then
				PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
				for i = 1, #t_Weapons do
					GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], 256, false, false)
				end
			end
			
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~r~Remove All Weapons") then
				for i = 1, #t_Weapons do
					RemoveWeaponFromPed(PlayerPedId(), t_Weapons[i][1])
				end
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Set current weapon ammo") then
				local _, weaponHash = GetCurrentPedWeapon(PlayerPedId())
				local amount = KeyboardInput("Ammo amount", "", 4)
				local ammo = floor(tonumber(amount) + 0.5)
				SetPedAmmo(PlayerPedId(), weaponHash, ammo)
			end

			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Infinite Ammo", InfAmmo, function(enabled) InfAmmo = enabled SetPedInfiniteAmmoClip(PlayerPedId(), InfAmmo) end) then end	
			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Delete Gun", Menuxdhf798230fsdf3df.Toggle.DeleteGun) then 
				Menuxdhf798230fsdf3df.Toggle.DeleteGun = not Menuxdhf798230fsdf3df.Toggle.DeleteGun
			end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
			-- [NOTE] Local Weapon Menu
		elseif Menuu8f9df92fds3.iug983dg3d("AimbotOptions") then
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Aimbot") then
				
			end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("LocalWepCategory") then
			Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Melee", "LocalMeleeWeapons")
			Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Handguns", "LocalSidearmWeapons")
			Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Submachine Guns", "LocalSmgWeapons")
			Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Shotguns", "LocalShotgunWeapons")
			Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Assault Rifles", "LocalAssaultRifleWeapons")
			Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Light Machine Guns", "LocalMachineGunWeapons")
			Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Sniper Rifles", "LocalSniperRifles")
			Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Heavy Weapons", "LocalHeavyWeapons")

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("LocalMeleeWeapons") then
			local selectedWeapon = {}
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "melee" then
					if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(t_Weapons[i][2]) then
						PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
						GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], 0, false, false)
					end
					selectedWeapon[optionCount] = i
				end
			end

			-- Menuu8f9df92fds3.DrawWeaponPreview(selectedWeapon[menus[hf892fdsf23].currentOption])
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("LocalSidearmWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "handguns" then
					if t_Weapons[i][6] then
						if weaponMkSelection[i] == nil then weaponMkSelection[i] = 1 end
						
						if Menuu8f9df92fds3.ComboBox(t_Weapons[i][2], ComboOptions.MK2.Words, weaponMkSelection[i], function(selectedIndex)
							if weaponMkSelection[i] ~= selectedIndex then
								weaponMkSelection[i] = selectedIndex
							end
						end) then 
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. ComboOptions.MK2.Values[weaponMkSelection[i]]), 0, false, false)
						end
					else
						if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(t_Weapons[i][2]) then
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], GetWeaponClipSize(t_Weapons[i][1]) * 5, false, false)
						end
					end
				end
			end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("LocalAssaultRifleWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "assaultrifles" then
					if t_Weapons[i][6] then
						if weaponMkSelection[i] == nil then weaponMkSelection[i] = 1 end
						
						if Menuu8f9df92fds3.ComboBox(t_Weapons[i][2], ComboOptions.MK2.Words, weaponMkSelection[i], function(selectedIndex)
							if weaponMkSelection[i] ~= selectedIndex then
								weaponMkSelection[i] = selectedIndex
							end
						end) then 
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. ComboOptions.MK2.Values[weaponMkSelection[i]]), 0, false, false)
						end
					else
						if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(t_Weapons[i][2]) then
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], GetWeaponClipSize(t_Weapons[i][1]) * 5, false, false)
						end
					end
				end
			end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("LocalShotgunWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "shotguns" then
					if t_Weapons[i][6] then
						if weaponMkSelection[i] == nil then weaponMkSelection[i] = 1 end
						
						if Menuu8f9df92fds3.ComboBox(t_Weapons[i][2], ComboOptions.MK2.Words, weaponMkSelection[i], function(selectedIndex)
							if weaponMkSelection[i] ~= selectedIndex then
								weaponMkSelection[i] = selectedIndex
							end
						end) then 
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. ComboOptions.MK2.Values[weaponMkSelection[i]]), 0, false, false)
						end
					else
						if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(t_Weapons[i][2]) then
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], GetWeaponClipSize(t_Weapons[i][1]) * 5, false, false)
						end
					end
				end
			end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()	
		elseif Menuu8f9df92fds3.iug983dg3d("LocalMachineGunWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "lmgs" then
					if t_Weapons[i][6] then
						if weaponMkSelection[i] == nil then weaponMkSelection[i] = 1 end
						
						if Menuu8f9df92fds3.ComboBox(t_Weapons[i][2], ComboOptions.MK2.Words, weaponMkSelection[i], function(selectedIndex)
							if weaponMkSelection[i] ~= selectedIndex then
								weaponMkSelection[i] = selectedIndex
							end
						end) then 
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. ComboOptions.MK2.Values[weaponMkSelection[i]]), 0, false, false)
						end
					else
						if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(t_Weapons[i][2]) then
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], GetWeaponClipSize(t_Weapons[i][1]) * 5, false, false)
						end
					end
				end
			end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("LocalSmgWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "smgs" then
					if t_Weapons[i][6] then
						if weaponMkSelection[i] == nil then weaponMkSelection[i] = 1 end
						
						if Menuu8f9df92fds3.ComboBox(t_Weapons[i][2], ComboOptions.MK2.Words, weaponMkSelection[i], function(selectedIndex)
							if weaponMkSelection[i] ~= selectedIndex then
								weaponMkSelection[i] = selectedIndex
							end
						end) then 
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. ComboOptions.MK2.Values[weaponMkSelection[i]]), 0, false, false)
						end
					else
						if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(t_Weapons[i][2]) then
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], GetWeaponClipSize(t_Weapons[i][1]) * 5, false, false)
						end
					end
				end
			end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("LocalSniperRifles") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "sniperrifles" then
					if t_Weapons[i][6] then
						if weaponMkSelection[i] == nil then weaponMkSelection[i] = 1 end
						
						if Menuu8f9df92fds3.ComboBox(t_Weapons[i][2], ComboOptions.MK2.Words, weaponMkSelection[i], function(selectedIndex)
							if weaponMkSelection[i] ~= selectedIndex then
								weaponMkSelection[i] = selectedIndex
							end
						end) then 
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. ComboOptions.MK2.Values[weaponMkSelection[i]]), 0, false, false)
						end
					else
						if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(t_Weapons[i][2]) then
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], GetWeaponClipSize(t_Weapons[i][1]) * 5, false, false)
						end
					end
				end
			end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("LocalHeavyWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "heavyweapons" then
					if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(t_Weapons[i][2]) then
						PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
						GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], GetWeaponClipSize(t_Weapons[i][1]) * 5, false, false)
					end
				end
			end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("LocalVehicleMenu") then

			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Vehicle Spawner", "LocalVehicleSpawner") then
			end

			if Menuu8f9df92fds3.ComboBox("Vehicle Actions", ComboOptions.VehicleActions.Words, ComboOptions.VehicleActions.Selected, function(selectedIndex)
				if ComboOptions.VehicleActions.Selected ~= selectedIndex then
					ComboOptions.VehicleActions.Selected = selectedIndex
				end
			end) then 
				ComboOptions.VehicleActions.Values[ComboOptions.VehicleActions.Selected](Menuxdhf798230fsdf3df.Player.Vehicle)
			end

			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Modify Vehicle", "LSC") then end

			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Easy Handling", Menuxdhf798230fsdf3df.Toggle.EasyHandling) then
				Menuxdhf798230fsdf3df.Toggle.EasyHandling = not Menuxdhf798230fsdf3df.Toggle.EasyHandling
			end

			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Seatbelt (No Fall)", Menuxdhf798230fsdf3df.Toggle.VehicleNoFall) then
				Menuxdhf798230fsdf3df.Toggle.VehicleNoFall = not Menuxdhf798230fsdf3df.Toggle.VehicleNoFall
			end

			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("No Collision", Menuxdhf798230fsdf3df.Toggle.VehicleCollision, function(enabled) 
				Menuxdhf798230fsdf3df.Toggle.VehicleCollision = enabled
			end) then end

			if Menuu8f9df92fds3.ComboBox("Vehicle Hygiene", ComboOptions.DirtLevel.Words, ComboOptions.DirtLevel.Selected(Menuxdhf798230fsdf3df.Player.Vehicle), function(selectedIndex)
				if ComboOptions.DirtLevel.Selected(Menuxdhf798230fsdf3df.Player.Vehicle) ~= ComboOptions.DirtLevel.Values[selectedIndex] then
					SetVehicleDirtLevel(Menuxdhf798230fsdf3df.Player.Vehicle, ComboOptions.DirtLevel.Values[selectedIndex])
				end
			end) then end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Change License Plate") then
				ChangeVehiclePlateTextbguioe3gdg4(Menuxdhf798230fsdf3df.Player.Vehicle)
			end

			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Rainbow Vehicle Color", Menuxdhf798230fsdf3df.Toggle.KoloroweAutoM8Nih78f3t09fds3fd, KoloroweAutoM8Nih78f3t09fds3fd) then 
			end

			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Vehicle Godmode", VehGod,
					function(enabled)
						VehGod = enabled
					end) 
				then
			end
			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Speedboost ~g~SHIFT ~r~CTRL", VehSpeed,
					function(enabled)
					VehSpeed = enabled
					end)
				then
			end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("LocalVehicleSpawner") then
			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Spawn Inside", Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle, function(enabled)
				Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle = enabled
			end) then end
			
			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Replace Current", Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle, function(enabled) 
				Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle = enabled 
			end) then end


			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Spawn Vehicle by Hash") then
				local modelName = KeyboardInput("Enter vehicle spawn name", "", 20)
				if not modelName then -- Do nothing in case of accidentel press or change of mind
				elseif IsModelValid(modelName) and IsModelAVehicle(modelName) then
					SpawnLocalVehiclehgu783erg9tyds(modelName, Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle, Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle)
				else
					Menuu8f9df92fds3.SendNotification({text = string.format("%s is not a valid vehicle", modelName), type = 'error'})
				end
			end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Compacts", "localcompacts") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Sedans", "localsedans") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("SUVs", "localsuvs") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Coupes", 'localcoupes') then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Muscle", 'localmuscle') then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Sports Classics", 'localsportsclassics') then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Sports", 'localsports') then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Super", 'localsuper') then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf('Motorcycles', 'localmotorcycles') then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf('Off-Road', 'localoffroad') then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf('Industrial', 'localindustrial') then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf('Utility', 'localutility') then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf('Vans', 'localvans') then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf('Cycles', 'localcycles') then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf('Boats', 'localboats') then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf('Helicopters', 'localhelicopters') then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf('Planes', 'localplanes') then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf('Service/Emergency/Military', 'localservice') then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf('Commercial/Trains', 'localcommercial') then end
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d('localcompacts') then
			for i = 1, #VehicleClass.compacts do
				local modelName = VehicleClass.compacts[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(vehname) then
					SpawnLocalVehiclehgu783erg9tyds(modelName, Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle, Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle)
				end
			end

			Menuu8f9df92fds3.DrawVehiclePreview('compacts')
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d('localsedans') then
			for i = 1, #VehicleClass.sedans do
				local modelName = VehicleClass.sedans[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(vehname) then
					SpawnLocalVehiclehgu783erg9tyds(modelName, Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle, Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle)
				end
			end

			Menuu8f9df92fds3.DrawVehiclePreview('sedans')
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d('localsuvs') then
			for i = 1, #VehicleClass.suvs do
				local modelName = VehicleClass.suvs[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(vehname) then
					SpawnLocalVehiclehgu783erg9tyds(modelName, Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle, Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle)
				end
			end

			Menuu8f9df92fds3.DrawVehiclePreview('suvs')
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d('localcoupes') then
			for i = 1, #VehicleClass.coupes do
				local modelName = VehicleClass.coupes[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(vehname) then
					SpawnLocalVehiclehgu783erg9tyds(modelName, Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle, Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle)
				end
			end

			Menuu8f9df92fds3.DrawVehiclePreview('coupes')
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d('localmuscle') then
			for i = 1, #VehicleClass.muscle do
				local modelName = VehicleClass.muscle[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(vehname) then
					SpawnLocalVehiclehgu783erg9tyds(modelName, Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle, Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle)
				end
			end

			Menuu8f9df92fds3.DrawVehiclePreview('muscle')
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d('localsportsclassics') then
			for i = 1, #VehicleClass.sportsclassics do
				local modelName = VehicleClass.sportsclassics[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(vehname) then
					SpawnLocalVehiclehgu783erg9tyds(modelName, Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle, Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle)
				end
			end

			Menuu8f9df92fds3.DrawVehiclePreview('sportsclassics')
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d('localsports') then
			for i = 1, #VehicleClass.sports do
				local modelName = VehicleClass.sports[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(vehname) then
					SpawnLocalVehiclehgu783erg9tyds(modelName, Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle, Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle)
				end
			end

			Menuu8f9df92fds3.DrawVehiclePreview('sports')
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d('localsuper') then
			for i = 1, #VehicleClass.super do
				local modelName = VehicleClass.super[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(vehname) then
					SpawnLocalVehiclehgu783erg9tyds(modelName, Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle, Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle)
				end
			end

			Menuu8f9df92fds3.DrawVehiclePreview('super')
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d('localmotorcycles') then
			for i = 1, #VehicleClass.motorcycles do
				local modelName = VehicleClass.motorcycles[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(vehname) then
					SpawnLocalVehiclehgu783erg9tyds(modelName, Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle, Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle)
				end
			end

			Menuu8f9df92fds3.DrawVehiclePreview('motorcycles')
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d('localoffroad') then
			for i = 1, #VehicleClass.offroad do
				local modelName = VehicleClass.offroad[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(vehname) then
					SpawnLocalVehiclehgu783erg9tyds(modelName, Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle, Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle)
				end
			end

			Menuu8f9df92fds3.DrawVehiclePreview('offroad')
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d('localindustrial') then
			for i = 1, #VehicleClass.industrial do
				local modelName = VehicleClass.industrial[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(vehname) then
					SpawnLocalVehiclehgu783erg9tyds(modelName, Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle, Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle)
				end
			end

			Menuu8f9df92fds3.DrawVehiclePreview('industrial')
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d('localutility') then
			for i = 1, #VehicleClass.utility do
				local modelName = VehicleClass.utility[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(vehname) then
					SpawnLocalVehiclehgu783erg9tyds(modelName, Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle, Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle)
				end
			end

			Menuu8f9df92fds3.DrawVehiclePreview('utility')
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d('localvans') then
			for i = 1, #VehicleClass.vans do
				local modelName = VehicleClass.vans[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(vehname) then
					SpawnLocalVehiclehgu783erg9tyds(modelName, Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle, Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle)
				end
			end

			Menuu8f9df92fds3.DrawVehiclePreview('vans')
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d('localcycles') then
			for i = 1, #VehicleClass.cycles do
				local modelName = VehicleClass.cycles[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(vehname) then
					SpawnLocalVehiclehgu783erg9tyds(modelName, Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle, Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle)
				end
			end

			Menuu8f9df92fds3.DrawVehiclePreview('cycles')
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d('localboats') then
			for i = 1, #VehicleClass.boats do
				local modelName = VehicleClass.boats[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(vehname) then
					SpawnLocalVehiclehgu783erg9tyds(modelName, Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle, Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle)
				end
			end

			Menuu8f9df92fds3.DrawVehiclePreview('boats')
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d('localhelicopters') then
			for i = 1, #VehicleClass.helicopters do
				local modelName = VehicleClass.helicopters[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(vehname) then
					SpawnLocalVehiclehgu783erg9tyds(modelName, Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle, Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle)
				end
			end

			Menuu8f9df92fds3.DrawVehiclePreview('helicopters')
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d('localplanes') then
			for i = 1, #VehicleClass.planes do
				local modelName = VehicleClass.planes[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(vehname) then
					SpawnLocalVehiclehgu783erg9tyds(modelName, Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle, Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle)
				end
			end

			Menuu8f9df92fds3.DrawVehiclePreview('planes')
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d('localservice') then
			for i = 1, #VehicleClass.service do
				local modelName = VehicleClass.service[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(vehname) then
					SpawnLocalVehiclehgu783erg9tyds(modelName, Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle, Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle)
				end
			end

			Menuu8f9df92fds3.DrawVehiclePreview('service')
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d('localcommercial') then
			for i = 1, #VehicleClass.commercial do
				local modelName = VehicleClass.commercial[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(vehname) then
					SpawnLocalVehiclehgu783erg9tyds(modelName, Menuxdhf798230fsdf3df.Toggle.ReplaceVehicle, Menuxdhf798230fsdf3df.Toggle.SpawnInVehicle)
				end
			end

			Menuu8f9df92fds3.DrawVehiclePreview('commercial')
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("LSC") then
			if Menuxdhf798230fsdf3df.Player.IsInVehicle then
				if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Bodywork", "lsc_bodywork") then
					LSC.UpdateMods()
				end
				if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Performance Tuning", "lsc_performance") then
					LSC.UpdateMods()
				end
			else
				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("No vehicle found") then
				end
			end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("lsc_bodywork") then
			local installed = currentMods
			if Menuxdhf798230fsdf3df.Player.IsInVehicle then
				for i, mod in pairs(LSC.vehicleMods) do
					SetVehicleModKit(Menuxdhf798230fsdf3df.Player.Vehicle, 0)
					local modCount = GetNumVehicleMods(Menuxdhf798230fsdf3df.Player.Vehicle, mod.id)
					if modCount > 0 then
						if mod.meta == "modFrontWheels" or mod.meta == "modBackWheels" then
							if Menuu8f9df92fds3.ComboBox(mod.name, LSC.WheelType, installed['wheels'], function(selectedIndex, selectedItem)
								selectedIndex = selectedIndex - 1
								installed['wheels'] = selectedIndex
								SetVehicleWheelType(Menuxdhf798230fsdf3df.Player.Vehicle, selectedIndex)
								Menuu8f9df92fds3.SetSubTitlej89gug8fdg4fg(mod.meta, selectedItem .. " Wheels")
							end, true) then
								if modCount > 0 then
									setMenuVisiblehg87f34gdsg(mod.meta, true)
								end
							end
						else
							if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf(mod.name, mod.meta) then end
						end
					end

					if mod.meta == "modXenon" then
						if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg(mod.name, installed['modXenon']) then
							ToggleVehicleMod(Menuxdhf798230fsdf3df.Player.Vehicle, 22, not installed['modXenon'])
							LSC.UpdateMods()
						end

						if installed['modXenon'] then
							if Menuu8f9df92fds3.ComboBox("Xenon Color", ComboOptions.XenonColor.Words, ComboOptions.XenonColor.Selected, function(selectedIndex)	
								if ComboOptions.XenonColor.Selected ~= selectedIndex then
									ComboOptions.XenonColor.Selected = selectedIndex
								end
							end) then
								SetVehicleXenonLightsColour(Menuxdhf798230fsdf3df.Player.Vehicle, ComboOptions.XenonColor.Values[ComboOptions.XenonColor.Selected])
							end
							
						end
					end
				end
			else
				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("No vehicle found") then
				end
			end
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("lsc_performance") then
			local installed = currentMods
			if Menuxdhf798230fsdf3df.Player.IsInVehicle then
				SetVehicleModKit(Menuxdhf798230fsdf3df.Player.Vehicle, 0)
				for i, type in pairs(LSC.perfMods) do
					local modCount = GetNumVehicleMods(Menuxdhf798230fsdf3df.Player.Vehicle, type.id)
					if modCount > 0 then
						if Menuu8f9df92fds3.Slider(type.name, VehicleUpgradeWords[modCount], installed[type.meta], function(selectedIndex)
							selectedIndex = selectedIndex - 2
							installed[type.meta] = selectedIndex
							SetVehicleMod(Menuxdhf798230fsdf3df.Player.Vehicle, type.id, selectedIndex, false)
						end, true) then end
					end
				end

				if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Turbo", installed['modTurbo'], function(enabled)
					installed['modTurbo'] = enabled
					ToggleVehicleMod(Menuxdhf798230fsdf3df.Player.Vehicle, 18, enabled)
				end) then end
				
				if Menuu8f9df92fds3.ComboBox("Engine Power", ComboOptions.EnginePower.Words, ComboOptions.EnginePower.Selected, function(selectedIndex)
					if ComboOptions.EnginePower.Selected ~= selectedIndex then
						ComboOptions.EnginePower.Selected = selectedIndex
						ModifyVehicleTopSpeed(Menuxdhf798230fsdf3df.Player.Vehicle, ComboOptions.EnginePower.Values[ComboOptions.EnginePower.Selected])
					end
				end) then 
				end

				
			else
				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("No vehicle found") then
				end
			end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("ServerMenu") then
			Menuu8f9df92fds3.SetSubTitlej89gug8fdg4fg("ServerMenu", "Server Options - " .. GetCurrentServerEndpoint())
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Resources", "Resources") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("ESX Boss Options", "ESXBoss") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Money Options", "ServerMoneyOptions") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("ESX Misc Options", "ESXMisc") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("ESX Drug Options", "ESXDrugs") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("VRP Options", "VRPOptions") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Misc Options", "MiscServerOptions") then end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu('Menu in Resource: ~r~'..GetCurrentResourceName()) then
			end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("Resources") then
			for i=0, #serverOptionsResourcesuydsiyods do
                if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(serverOptionsResourcesuydsiyods[i]) then
				end
			end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
			
		elseif Menuu8f9df92fds3.iug983dg3d("MenuSettings") then
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Change Color Theme", "MenuSettingsColor") then
			end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Credits", "MenuSettingsCredits") then
			end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~r~Kill Menu") then
				ghsudiyfusi = false
			end
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("MenuSettingsColor") then
			if Menuu8f9df92fds3.CheckBoxhfu8i3ert87fsdfg("Dynamic Theme", dynamicColorThemegj894rgdf, function(enabled) dynamicColorThemegj894rgdf = enabled end) then
			end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Red", nil, themeColors.red) then
				_menuColor.base = themeColors.red
			end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Orange", nil, themeColors.orange) then
				_menuColor.base = themeColors.orange
			end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Yellow", nil, themeColors.yellow) then
				_menuColor.base = themeColors.yellow
			end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Green", nil, themeColors.green) then
				_menuColor.base = themeColors.green
			end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Blue", nil, themeColors.blue) then
				_menuColor.base = themeColors.blue
			end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("MenuSettingsCredits") then
			for _, v in pairs(contributors) do 
				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(v[1], v[2]) then end 
			end
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		
		elseif Menuu8f9df92fds3.iug983dg3d('ResourceData') then
			Menuu8f9df92fds3.SetSubTitlej89gug8fdg4fg('ResourceData', SelectedResource .. " > Data")
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf('Event Handlers', 'ResourceCEvents') then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf('Server Events', 'ResourceSEvents') then end
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		
		elseif Menuu8f9df92fds3.iug983dg3d('ResourceCEvents') then
			Menuu8f9df92fds3.SetSubTitlej89gug8fdg4fg('ResourceCEvents', SelectedResource .. " > Data > Event Handlers")
			for key, name in pairs(validResourceEvents[SelectedResource]) do
				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(name) then
					-- print(key)
				end
			end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d('ResourceSEvents') then
			Menuu8f9df92fds3.SetSubTitlej89gug8fdg4fg('ResourceSEvents', SelectedResource .. " > Data > Server Events")
			if validResourceServerEvents[SelectedResource] ~= nil then
				for name, payload in pairs(validResourceServerEvents[SelectedResource]) do
					if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(name) then
						local tbl = msgpack.unpack(payload)
						local buffer = name .. "("
						for k, v in ipairs(tbl) do
							buffer = (buffer .. tostring(v) .. (k == #tbl and ")" or ", "))
						end

						if #tbl == 0 then
							buffer = (buffer .. ")")
						end
						
						-- print("^2" .. buffer)
					end
				end
				
			end
			
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("ESXBoss") then

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~c~Mechanic") then
				TriggerEvent("esx_society:openBossMenu", "mecano", function(data, menu) setMenuVisiblehg87f34gdsg(hf892fdsf23, false) end)
				
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~b~Police") then
				TriggerEvent("esx_society:openBossMenu","police",function(data, menu) setMenuVisiblehg87f34gdsg(hf892fdsf23, false) end)
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~r~Ambulance") then
				TriggerEvent("esx_society:openBossMenu","ambulance",function(data, menu) setMenuVisiblehg87f34gdsg(hf892fdsf23, false) end)
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~y~Taxi") then
				TriggerEvent("esx_society:openBossMenu","taxi",function(data, menu) setMenuVisiblehg87f34gdsg(hf892fdsf23, false) end)
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~g~Real Estate") then
				TriggerEvent("esx_society:openBossMenu","realestateagent",function(data, menu) setMenuVisiblehg87f34gdsg(hf892fdsf23, false) end)
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~p~Gang") then
				TriggerEvent("esx_society:openBossMenu","gang",function(data, menu) setMenuVisiblehg87f34gdsg(hf892fdsf23, false) end)
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~o~Car Dealer") then
				TriggerEvent("esx_society:openBossMenu","cardealer",function(data, menu) setMenuVisiblehg87f34gdsg(hf892fdsf23, false) end)
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~y~Banker") then
				TriggerEvent("esx_society:openBossMenu","banker",function(data, menu) setMenuVisiblehg87f34gdsg(hf892fdsf23, false) end)  
			end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		
		elseif Menuu8f9df92fds3.iug983dg3d("ServerMoneyOptions") then

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~g~ESX ~y~Caution Give Back") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent('esx_jobs:caution', 'give_back', result, 0, 0)
				end
			end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~g~ESX ~y~TruckerJob Pay") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent('esx_truckerjob:pay', result)
				end
			end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~g~ESX ~y~Admin Give Bank") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent('AdminMenu:giveBank', result)
				end
			end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~g~ESX ~y~Admin Give Cash") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent('AdminMenu:giveCash', result)
				end
			end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~g~ESX ~y~GOPostalJob Pay") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent("esx_gopostaljob:pay", result)
				end
			end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~g~ESX ~y~BankerJob Pay") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent("esx_banksecurity:pay", result)
				end
			end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~g~ESX ~y~Slot Machine") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent("esx_slotmachine:sv:2", result)
				end
			end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		
		elseif Menuu8f9df92fds3.iug983dg3d("ESXMisc") then

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~w~Set hunger to ~g~100%") then
				TriggerEvent("esx_status:set", "hunger", 1000000)
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~w~Set thirst to ~g~100%") then
				TriggerEvent("esx_status:set", "thirst", 1000000)
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~g~ESX ~y~Revive ID") then
				local id = KeyboardInput("Enter Player ID", "", 1000)
				if id then
					TriggerServerEvent("esx_ambulancejob:revive", GetPlayerServerId(id))
					TriggerServerEvent("whoapd:revive", GetPlayerServerId(id))
					TriggerServerEvent("paramedic:revive", GetPlayerServerId(id))
					TriggerServerEvent("ems:revive", GetPlayerServerId(id))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Send All Bill (shitlord)") then
				local amount = KeyboardInput("Enter Amount", "", 100000000)
				  local name = KeyboardInput("Enter the name of the Bill", "", 100000000)
				  if amount and name then
					for i = 0, 256 do
						  TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", name, amount)
					end
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Handcuff ID") then
				local id = KeyboardInput("Enter Player ID", "", 3)
				if id then
					TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(id))
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~g~ESX ~w~Get all licenses") then
				TriggerServerEvent('esx_dmvschool:addLicense', dmv)
				TriggerServerEvent('esx_dmvschool:addLicense', drive)
				TriggerServerEvent('esx_dmvschool:addLicense', drive_bike)
				TriggerServerEvent('esx_dmvschool:addLicense', drive_truck)
			end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		
		elseif Menuu8f9df92fds3.iug983dg3d("MiscServerOptions") then

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Send Discord Message") then
				local Message = KeyboardInput("Enter message to send", "", 100)
				TriggerServerEvent("DiscordBot:playerDied", Message, "1337")
				Menuu8f9df92fds3.SendNotification({text = "Sent message:~n~" .. Message .. "", type = "success"})
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Send ambulance alert on waypoint") then
				local playerPed = PlayerPedId()
				if DoesBlipExist(GetFirstBlipInfoId(8)) then
					local blipIterator = GetBlipInfoIdIterator(8)
					local blip = GetFirstBlipInfoId(8, blipIterator)
					WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector()) --Thanks To Briglair [forum.FiveM.net]
					TriggerServerEvent('esx_addons_gcphone:startCall', 'ambulance', "medical attention required: unconscious citizen!", WaypointCoords)
					Menuu8f9df92fds3.SendNotification("~g~Ambulance alert sent to waypoint!")
				else
					Menuu8f9df92fds3.SendNotification("~r~No waypoint set!")
				end

			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Spoof text message (GCPHONE)") then
				local transmitter = KeyboardInput("Enter transmitting phone number", "", 10)
				local receiver = KeyboardInput("Enter receiving phone number", "", 10)
				local message = KeyboardInput("Enter message to send", "", 100)
				if transmitter then
					if receiver then
						if message then
							TriggerServerEvent('gcPhone:_internalAddMessage', transmitter, receiver, message, 0)
						else
							Menuu8f9df92fds3.SendNotification("~r~You must specify a message.")
						end
					else
						Menuu8f9df92fds3.SendNotification("~r~You must specify a receiving number.")
					end
				else
					Menuu8f9df92fds3.SendNotification("~r~You must specify a transmitting number.")
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Spoof Chat Message") then
				local name = KeyboardInput("Enter chat sender name", "", 15)
				local message = KeyboardInput("Enter your message to send", "", 70)
				if name and message then
					TriggerServerEvent('_chat:messageEntered', name, {0, 0x99, 255}, message)
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("esx_mugging Give item") then
				local itemName = KeyboardInput("Enter item name", "", 20)
				if itemName then
					TriggerServerEvent('esx_mugging:giveItems', (itemName))
					Menuu8f9df92fds3.SendNotification("Successfully given item ~g~" .. itemName)
				else
					Menuu8f9df92fds3.SendNotification("~r~You must specify an item")
				end
			end

			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("OnlinePlayersMenu") then
			onlinePlayerSelected = {}
			
			local plist = GetActivePlayers()
			for i = 1, #plist do
				local id = plist[i]
				onlinePlayerSelected[i] = id -- equivalent to table.insert(table, value) but faster

				if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf(("~b~%-4d ~s~%s"):format(GetPlayerServerId(id), GetPlayerName(id)), 'PlayerOptionsMenu') then
					SelectedPlayer = id
				end
			end

			local index = menus[hf892fdsf23].currentOption

			Menuu8f9df92fds3.DrawPlayerInfo(onlinePlayerSelected[index])
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		
		elseif Menuu8f9df92fds3.iug983dg3d("PlayerOptionsMenu") then
			Menuu8f9df92fds3.SetSubTitlej89gug8fdg4fg("PlayerOptionsMenu", "Player Options [" .. GetPlayerName(SelectedPlayer) .. "]")
			
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Spectate", (Menuxdhf798230fsdf3df.Player.Spectating and "~g~[SPECTATING]")) then
				CreateThreadNow(function()
					SpectatePlayerghu8r7yg80973gdf(SelectedPlayer)
				end)
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Teleport To Player") then
				Menuxdhf798230fsdf3df.Gametykurwobhfug7834f08sdfg3d:TeleportToPlayer(SelectedPlayer)
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Teleport into Vehicle") then
				TeleportToPlayerVehiclehg8934gdsg3s(SelectedPlayer)
			end

			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Weapon Options", "OnlineWepMenu") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Vehicle Options", "OnlineVehicleMenuPlayer") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("ESX Options", "ESXMenuPlayer") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Troll Options", "OnlineTrollMenu") then end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~r~Silent Explode") then
				AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, false, true, 0)
			end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~y~Explode") then
				AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, true, false, 100000.0)
			end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Give All Weapons") then
				for i = 1, #t_Weapons do
					GiveWeaponToPed(GetPlayerPed(SelectedPlayer), t_Weapons[i][1], 128, false, false)
				end
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Remove All Weapons") then
				local ped = GetPlayerPed(SelectedPlayer)
				RequestControlgr4e90gdfOnce(ped)
				for i = 1, #t_Weapons do
					RemoveWeaponFromPed(ped, t_Weapons[i][1])
				end

				-- RemoveAllPedWeapons(GetPlayerPedScriptIndex(SelectedPlayer), true)
			end

			Menuu8f9df92fds3.DrawPlayerInfo(SelectedPlayer)
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("OnlineTrollMenu") then
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Spawn Menu", "SpawnMenu") then end
			if Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Props Menu", "PropsMenu") then end
			
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Airstrike") then
				AirstrikePlayerhfiusygf8972dsf2sdfjugfdf2ds(SelectedPlayer)
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Taze Player") then
				PolicjaKurwaTazer123hf8930fsd3(SelectedPlayer)
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Fake Sniper") then
				Okurwasniperg6y7f93wfdsf23d()
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Sandy Shores") then
				local coords = GetEntityCoords(GetPlayerPed(selectedPlayer), true)
				local prop = "cs4_lod_01_slod3"
				while not HasModelLoaded(GetHashKey(prop)) do 
					Citizen.Wait(0) 
					RequestModel(GetHashKey(prop)) 
			end
			local obj = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
			AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),39317),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
		end
			
			Menuu8f9df92fds3.DrawPlayerInfo(SelectedPlayer)
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("SpawnMenu") then
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~r~Spawn ~b~Swat Army ~r~With AK") then
				local eU = "s_m_y_swat_01"
				local eS = "WEAPON_ASSAULTRIFLE"
				for i = 0, 10 do 
					local cM = GetEntityCoords(GetPlayerPed(SelectedPlayer)) 
					RequestModel(GetHashKey(eU)) 
					Citizen.Wait(50) 
						if HasModelLoaded(GetHashKey(eU)) then 
							local ped = CreatePed(21, GetHashKey(eU), cM.x + i, cM.y - i, cM.z, 0, true, true) and CreatePed(21, GetHashKey(eU), cM.x - i, cM.y + i, cM.z, 0, true, true) NetworkRegisterEntityAsNetworked(ped) 
							if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
								local eT = PedToNet(ped) NetworkSetNetworkIdDynamic(eT, false) SetNetworkIdCanMigrate(eT, true) 
								SetNetworkIdExistsOnAllMachines(eT, true) 
								Citizen.Wait(500) 
								NetToPed(eT) 
								GiveWeaponToPed(ped, GetHashKey(eS), 9999, 1, 1) 
								SetEntityInvincible(ped, true) 
								SetPedCanSwitchWeapon(ped, true) 
								TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16) 
							elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
								TaskCombatHatedTargetsInArea(ped, cM.x, cM.y, cM.z, 500)
							else 
								Citizen.Wait(0) 
							end 
						end
					end 
				end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~r~Spawn ~b~Freemode ~r~With Pistol") then
				local eU = "mp_m_freemode_01"
				local eS = "weapon_pistol"
				for i = 0, 10 do 
					local cM = GetEntityCoords(GetPlayerPed(SelectedPlayer)) 
					RequestModel(GetHashKey(eU)) 
					Citizen.Wait(50) 
					if HasModelLoaded(GetHashKey(eU)) then 
						local ped = CreatePed(21, GetHashKey(eU), cM.x + i, cM.y - i, cM.z, 0, true, true) and CreatePed(21, GetHashKey(eU), cM.x - i, cM.y + i, cM.z, 0, true, true) 
						NetworkRegisterEntityAsNetworked(ped) 
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
							local eT = PedToNet(ped) 
							NetworkSetNetworkIdDynamic(eT, false) 
							SetNetworkIdCanMigrate(eT, true) 
							SetNetworkIdExistsOnAllMachines(eT, true) 
							Citizen.Wait(500) 
							NetToPed(eT) 
							GiveWeaponToPed(ped, GetHashKey(eS), 9999, 1, 1)
							SetEntityInvincible(ped, true) 
							SetPedCanSwitchWeapon(ped, true) 
							TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16) 
						elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
							TaskCombatHatedTargetsInArea(ped, cM.x, cM.y, cM.z, 500)
						else 
							Citizen.Wait(0) 
						end 
					end 
				end 
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~r~Spawn ~b~LSPD ~r~With Nightstick") then
				local eU = "s_m_y_cop_01"
				local eS = "weapon_nightstick"
				for i = 0, 10 do 
					local cM = GetEntityCoords(GetPlayerPed(SelectedPlayer)) 
					RequestModel(GetHashKey(eU)) 
					Citizen.Wait(50) 
					if HasModelLoaded(GetHashKey(eU)) then 
						local ped = CreatePed(21, GetHashKey(eU), cM.x + i, cM.y - i, cM.z, 0, true, true) and CreatePed(21, GetHashKey(eU), cM.x - i, cM.y + i, cM.z, 0, true, true) 
						NetworkRegisterEntityAsNetworked(ped) 
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
							local eT = PedToNet(ped) 
							NetworkSetNetworkIdDynamic(eT, false) 
							SetNetworkIdCanMigrate(eT, true) 
							SetNetworkIdExistsOnAllMachines(eT, true) 
							Citizen.Wait(500) 
							NetToPed(eT) 
							GiveWeaponToPed(ped, GetHashKey(eS), 9999, 1, 1)
							SetEntityInvincible(ped, true) 
							SetPedCanSwitchWeapon(ped, true) 
							TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16) 
						elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
							TaskCombatHatedTargetsInArea(ped, cM.x, cM.y, cM.z, 500)
						else 
							Citizen.Wait(0) 
						end 
					end 
				end 
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~r~Spawn ~b~Priest ~r~With Stungun") then
				local eU = "ig_priest"
				local eS = "weapon_stungun"
				for i = 0, 10 do 
					local cM = GetEntityCoords(GetPlayerPed(SelectedPlayer)) 
					RequestModel(GetHashKey(eU)) 
					Citizen.Wait(50) 
					if HasModelLoaded(GetHashKey(eU)) then 
						local ped = CreatePed(21, GetHashKey(eU), cM.x + i, cM.y - i, cM.z, 0, true, true) and CreatePed(21, GetHashKey(eU), cM.x - i, cM.y + i, cM.z, 0, true, true) 
						NetworkRegisterEntityAsNetworked(ped) 
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
							local eT = PedToNet(ped) 
							NetworkSetNetworkIdDynamic(eT, false) 
							SetNetworkIdCanMigrate(eT, true) 
							SetNetworkIdExistsOnAllMachines(eT, true) 
							Citizen.Wait(500) 
							NetToPed(eT) 
							GiveWeaponToPed(ped, GetHashKey(eS), 9999, 1, 1)
							SetEntityInvincible(ped, true) 
							SetPedCanSwitchWeapon(ped, true) 
							TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16) 
						elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
							TaskCombatHatedTargetsInArea(ped, cM.x, cM.y, cM.z, 500)
						else 
							Citizen.Wait(0) 
						end 
					end 
				end 
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~r~Spawn ~b~Martson ~r~With Compact Rifle") then
				local eU = "mp_m_marston_01"
				local eS = "WEAPON_COMPACTRIFLE"
				for i = 0, 10 do 
					local cM = GetEntityCoords(GetPlayerPed(SelectedPlayer)) 
					RequestModel(GetHashKey(eU)) 
					Citizen.Wait(50) 
					if HasModelLoaded(GetHashKey(eU)) then 
						local ped = CreatePed(21, GetHashKey(eU), cM.x + i, cM.y - i, cM.z, 0, true, true) and CreatePed(21, GetHashKey(eU), cM.x - i, cM.y + i, cM.z, 0, true, true) 
						NetworkRegisterEntityAsNetworked(ped) 
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
							local eT = PedToNet(ped) 
							NetworkSetNetworkIdDynamic(eT, false) 
							SetNetworkIdCanMigrate(eT, true) 
							SetNetworkIdExistsOnAllMachines(eT, true) 
							Citizen.Wait(500) 
							NetToPed(eT) 
							GiveWeaponToPed(ped, GetHashKey(eS), 9999, 1, 1)
							SetEntityInvincible(ped, true) 
							SetPedCanSwitchWeapon(ped, true) 
							TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16) 
						elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
							TaskCombatHatedTargetsInArea(ped, cM.x, cM.y, cM.z, 500)
						else 
							Citizen.Wait(0) 
						end 
					end 
				end
			end
			
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~r~Spawn ~b~Whale") then
				local eU = "a_c_humpbac"
				local eS = "'weapon_knife"
				for i = 0, 10 do 
					local cM = GetEntityCoords(GetPlayerPed(SelectedPlayer)) 
					RequestModel(GetHashKey(eU)) 
					Citizen.Wait(50) 
					if HasModelLoaded(GetHashKey(eU)) then 
						local ped = CreatePed(21, GetHashKey(eU), cM.x + i, cM.y - i, cM.z, 0, true, true) and CreatePed(21, GetHashKey(eU), cM.x - i, cM.y + i, cM.z, 0, true, true) 
						NetworkRegisterEntityAsNetworked(ped) 
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
							local eT = PedToNet(ped) 
							NetworkSetNetworkIdDynamic(eT, false) 
							SetNetworkIdCanMigrate(eT, true) 
							SetNetworkIdExistsOnAllMachines(eT, true) 
							Citizen.Wait(500) 
							NetToPed(eT) 
							GiveWeaponToPed(ped, GetHashKey(eS), 9999, 1, 1)
							SetEntityInvincible(ped, true) 
							SetPedCanSwitchWeapon(ped, true) 
							TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16) 
						elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
							TaskCombatHatedTargetsInArea(ped, cM.x, cM.y, cM.z, 500)
						else 
							Citizen.Wait(0) 
						end 
					end 
				end
			end
			
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~r~Spawn ~b~KillerWhale") then
				local eU = "a_c_killerwhale"
				local eS = "'weapon_knife"
				for i = 0, 10 do 
					local cM = GetEntityCoords(GetPlayerPed(SelectedPlayer)) 
					RequestModel(GetHashKey(eU)) 
					Citizen.Wait(50) 
					if HasModelLoaded(GetHashKey(eU)) then 
						local ped = CreatePed(21, GetHashKey(eU), cM.x + i, cM.y - i, cM.z, 0, true, true) and CreatePed(21, GetHashKey(eU), cM.x - i, cM.y + i, cM.z, 0, true, true) 
						NetworkRegisterEntityAsNetworked(ped) 
						if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
							local eT = PedToNet(ped) 
							NetworkSetNetworkIdDynamic(eT, false) 
							SetNetworkIdCanMigrate(eT, true) 
							SetNetworkIdExistsOnAllMachines(eT, true) 
							Citizen.Wait(500) 
							NetToPed(eT) 
							GiveWeaponToPed(ped, GetHashKey(eS), 9999, 1, 1)
							SetEntityInvincible(ped, true) 
							SetPedCanSwitchWeapon(ped, true) 
							TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16) 
						elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
							TaskCombatHatedTargetsInArea(ped, cM.x, cM.y, cM.z, 500)
						else 
							Citizen.Wait(0) 
						end 
					end 
				end
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~r~Spawn ~b~Swat Attack ~r~in car") then
				    local vehlist = {"fbi", "fbi2"}
                    local veh = vehlist[math.random(#vehlist)]
                    for i = 0, 1 do
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), false) then
                        local vt = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), 0)
                        NetworkRequestControlgr4e90gdfOfEntity(vt)
                        SetVehicleModKit(vt, 0)
                        ToggleVehicleMod(vt, 20, 1)
                        SetVehicleModKit(vt, 0)
                        SetVehicleTyresCanBurst(vt, 1)
                    end
                    local v = nil
                    RequestModel(veh)
                    RequestModel('s_m_y_swat_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('s_m_y_swat_01') do
                        RequestModel('s_m_y_swat_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 30),
                            pos.y - (yf * 30),
                            pos.z + 1,
                            GetEntityHeading(GetPlayerPed(SelectedPlayer)),
                            true,
                            false
                        )
                        if DoesEntityExist(v) then
                            NetworkRequestControlgr4e90gdfOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('s_m_y_swat_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('s_m_y_swat_01') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('s_m_y_swat_01'), pos.x, pos.y, pos.z, true, true)
                                local ped1 =
                                    CreatePed(21, GetHashKey('s_m_y_swat_01'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    GiveWeaponToPed(ped, GetHashKey('WEAPON_PISTOL'), 9999, 1, 1)
                                    GiveWeaponToPed(ped1, GetHashKey('WEAPON_PISTOL'), 9999, 1, 1)
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v, 0)
                                    TaskDriveBy(
                                        ped,
                                        GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)),
                                        pos.x,
                                        pos.y,
                                        pos.z,
                                        200,
                                        99,
                                        0,
                                        'FIRING_PATTERN_BURST_FIRE_DRIVEBY'
                                    )
                                    TaskShootAtEntity(
                                        ped1,
                                        GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)),
                                        200,
                                        'FIRING_PATTERN_BURST_FIRE_DRIVEBY'
                                    )
                                    gih3i4ghy837gegfg3334534643(ped, SelectedPlayer, 0, 0)
                                    gih3i4ghy837gegfg3334534643(ped1, SelectedPlayer, 0, 0)
                                    TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                                    TaskCombatPed(ped1, GetPlayerPed(SelectedPlayer), 0, 16)
                                    for i = 1, 2 do
                                        Citizen.Wait(5)
                                    ClearPedTasks(GetPlayerPed(-1))
                                    end
                                end
                            end
                        end
                    end
				end
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~r~Spawn ~b~Marines Attack ~r~in car") then
				    local vehlist = {"Mesa3", "BARRAGE", "khanjali"}
                    local veh = vehlist[math.random(#vehlist)]
                    for i = 0, 1 do
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), false) then
                        local vt = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), 0)
                        NetworkRequestControlgr4e90gdfOfEntity(vt)
                        SetVehicleModKit(vt, 0)
                        ToggleVehicleMod(vt, 20, 1)
                        SetVehicleModKit(vt, 0)
                        SetVehicleTyresCanBurst(vt, 1)
                    end
                    local v = nil
                    RequestModel(veh)
                    RequestModel('S_M_Y_Marine_03')
                    while not HasModelLoaded(veh) and not HasModelLoaded('S_M_Y_Marine_03') do
                        RequestModel('S_M_Y_Marine_03')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 30),
                            pos.y - (yf * 30),
                            pos.z + 1,
                            GetEntityHeading(GetPlayerPed(SelectedPlayer)),
                            true,
                            false
                        )
                        if DoesEntityExist(v) then
                            NetworkRequestControlgr4e90gdfOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('S_M_Y_Marine_03')
                            Citizen.Wait(50)
                            if HasModelLoaded('S_M_Y_Marine_03') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('S_M_Y_Marine_03'), pos.x, pos.y, pos.z, true, true)
                                local ped1 =
                                    CreatePed(26, GetHashKey('S_M_Y_Marine_03'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    GiveWeaponToPed(ped, GetHashKey('WEAPON_MICROSMG'), 9999, 1, 1)
                                    GiveWeaponToPed(ped1, GetHashKey('WEAPON_MACHINEPISTOL'), 9999, 1, 1)
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v, 0)
                                    TaskDriveBy(
                                        ped,
                                        GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)),
                                        pos.x,
                                        pos.y,
                                        pos.z,
                                        200,
                                        99,
                                        0,
                                        'FIRING_PATTERN_BURST_FIRE_DRIVEBY'
                                    )
                                    TaskShootAtEntity(
                                        ped1,
                                        GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)),
                                        200,
                                        'FIRING_PATTERN_BURST_FIRE_DRIVEBY'
                                    )
                                    gih3i4ghy837gegfg3334534643(ped, SelectedPlayer, 0, 0)
                                    gih3i4ghy837gegfg3334534643(ped1, SelectedPlayer, 0, 0)
                                    TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                                    TaskCombatPed(ped1, GetPlayerPed(SelectedPlayer), 0, 16)
                                    for i = 1, 2 do
                                        Citizen.Wait(5)
                                    ClearPedTasks(GetPlayerPed(-1))
                                    end
                                end
                            end
                        end
					end
				end
			end

				if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~r~Spawn ~b~Khanjali ~r~Enemies (tank)") then
				    local vehlist = {"khanjali"}
                    local veh = vehlist[math.random(#vehlist)]
                    for i = 0, 1 do
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), false) then
                        local vt = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), 0)
                        NetworkRequestControlgr4e90gdfOfEntity(vt)
                        SetVehicleModKit(vt, 0)
                        ToggleVehicleMod(vt, 20, 1)
                        SetVehicleModKit(vt, 0)
                        SetVehicleTyresCanBurst(vt, 1)
                    end
                    local v = nil
                    RequestModel(veh)
                    RequestModel('S_M_Y_Marine_03')
                    while not HasModelLoaded(veh) and not HasModelLoaded('S_M_Y_Marine_03') do
                        RequestModel('S_M_Y_Marine_03')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 30),
                            pos.y - (yf * 30),
                            pos.z + 1,
                            GetEntityHeading(GetPlayerPed(SelectedPlayer)),
                            true,
                            false
                        )
                        if DoesEntityExist(v) then
                            NetworkRequestControlgr4e90gdfOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('S_M_Y_Marine_03')
                            Citizen.Wait(50)
                            if HasModelLoaded('S_M_Y_Marine_03') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('S_M_Y_Marine_03'), pos.x, pos.y, pos.z, true, true)
                                local ped1 =
                                    CreatePed(26, GetHashKey('S_M_Y_Marine_03'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    GiveWeaponToPed(ped, GetHashKey('WEAPON_MICROSMG'), 9999, 1, 1)
                                    GiveWeaponToPed(ped1, GetHashKey('WEAPON_MACHINEPISTOL'), 9999, 1, 1)
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v, 0)
                                    TaskDriveBy(
                                        ped,
                                        GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)),
                                        pos.x,
                                        pos.y,
                                        pos.z,
                                        200,
                                        99,
                                        0,
                                        'FIRING_PATTERN_BURST_FIRE_DRIVEBY'
                                    )
                                    TaskShootAtEntity(
                                        ped1,
                                        GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)),
                                        200,
                                        'FIRING_PATTERN_BURST_FIRE_DRIVEBY'
                                    )
                                    gih3i4ghy837gegfg3334534643(ped, SelectedPlayer, 0, 0)
                                    gih3i4ghy837gegfg3334534643(ped1, SelectedPlayer, 0, 0)
                                    TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                                    TaskCombatPed(ped1, GetPlayerPed(SelectedPlayer), 0, 16)
                                    for i = 1, 2 do
                                        Citizen.Wait(5)
                                    ClearPedTasks(GetPlayerPed(-1))
                                    end
                                end
                            end
                        end
                    end
				end
			end

			Menuu8f9df92fds3.DrawPlayerInfo(SelectedPlayer)
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("PropsMenu") then
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~g~Plane ~r~(crashed)") then
			local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
			local prop = "apa_mp_apa_crashed_usaf_01a"
			while not HasModelLoaded(GetHashKey(prop)) do 
				Citizen.Wait(0) 
				RequestModel(GetHashKey(prop)) 
			end
			local obj = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
			AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),39317),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
			end

			Menuu8f9df92fds3.DrawPlayerInfo(SelectedPlayer)
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		elseif Menuu8f9df92fds3.iug983dg3d("ESXMenuPlayer") then
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~g~ESX ~s~Send Bill") then
				local amount = KeyboardInput("Enter Amount", "", 10)
				local name = KeyboardInput("Enter the name of the Bill", "", 25)
				if amount and name then
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(SelectedPlayer), "Purposeless", name, amount)
				end
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~g~ESX ~s~Handcuff Player") then
				TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(SelectedPlayer))
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~g~ESX ~s~Revive player") then
				TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(SelectedPlayer))
			elseif Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("~g~ESX ~s~Unjail player") then
				TriggerServerEvent("esx_jail:unjailQuest", GetPlayerServerId(SelectedPlayer))
				TriggerServerEvent("js:removejailtime", GetPlayerServerId(SelectedPlayer))
			end

			Menuu8f9df92fds3.DrawPlayerInfo(SelectedPlayer)
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		
		elseif Menuu8f9df92fds3.iug983dg3d("OnlineWepMenu") then
			Menuu8f9df92fds3.SetSubTitlej89gug8fdg4fg("OnlineWepMenu", "Weapon Options - " .. GetPlayerName(SelectedPlayer) .. "")
			Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Give Weapon", "OnlineWepCategory")

			Menuu8f9df92fds3.DrawPlayerInfo(SelectedPlayer)
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		
		elseif Menuu8f9df92fds3.iug983dg3d("OnlineWepCategory") then
			Menuu8f9df92fds3.SetSubTitlej89gug8fdg4fg("OnlineWepCategory", "Give Weapon - " .. GetPlayerName(SelectedPlayer) .. "")

			Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Melee", "OnlineMeleeWeapons")
			Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Handguns", "OnlineSidearmWeapons")
			Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Submachine Guns")
			Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Shotguns", "OnlineShotgunWeapons")
			Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Assault Rifles", "OnlineAutorifleWeapons")
			Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Light Machine Guns")
			Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Sniper Rifles")
			Menuu8f9df92fds3.MenuButtonbhugr9i84hogdrgf("Heavy Weapons")

			Menuu8f9df92fds3.DrawPlayerInfo(SelectedPlayer)
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		
		elseif Menuu8f9df92fds3.iug983dg3d("OnlineMeleeWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "melee" then
					if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(t_Weapons[i][2]) then
						GiveWeaponToPed(GetPlayerPed(SelectedPlayer), t_Weapons[i][1], 0, false, false)
					end
				end
			end

			Menuu8f9df92fds3.DrawPlayerInfo(SelectedPlayer)
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		
		elseif Menuu8f9df92fds3.iug983dg3d("OnlineSidearmWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "handguns" then
					if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(t_Weapons[i][2]) then
						GiveWeaponToPed(GetPlayerPed(SelectedPlayer), t_Weapons[i][1], 32, false, false)
					end
				end
			end

			Menuu8f9df92fds3.DrawPlayerInfo(SelectedPlayer)
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		
		elseif Menuu8f9df92fds3.iug983dg3d("OnlineAutorifleWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "assaultrifles" then
					if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(t_Weapons[i][2]) then
						GiveWeaponToPed(GetPlayerPed(SelectedPlayer), t_Weapons[i][1], 60, false, false)
					end
				end
			end

			Menuu8f9df92fds3.DrawPlayerInfo(SelectedPlayer)
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		
		elseif Menuu8f9df92fds3.iug983dg3d("OnlineShotgunWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "shotguns" then
					if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(t_Weapons[i][2]) then
						GiveWeaponToPed(GetPlayerPed(SelectedPlayer), t_Weapons[i][1], 18, false, false)
					end
				end
			end

			Menuu8f9df92fds3.DrawPlayerInfo(SelectedPlayer)
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		
		elseif Menuu8f9df92fds3.iug983dg3d("OnlineVehicleMenuPlayer") then
			Menuu8f9df92fds3.SetSubTitlej89gug8fdg4fg("OnlineVehicleMenuPlayer", "Vehicle Options [" .. GetPlayerName(SelectedPlayer) .. "]")
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Spawn Vehicle") then
				local ped = GetPlayerPed(SelectedPlayer)
				local ModelName = KeyboardInput("Enter Vehicle Model Name", "", 12)
				if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
					RequestModel(ModelName)
					while not HasModelLoaded(ModelName) do
						Citizen.Wait(0)
					end

					local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(GetPlayerPed(SelectedPlayer)), GetEntityHeading(GetPlayerPed(SelectedPlayer)), true, true)
					
					RequestControlgr4e90gdfOnce(ped)
					SetPedIntoVehicle(ped, veh, -1)
					TaskWarpPedIntoVehicle(ped, veh, -1)
					Menuu8f9df92fds3.SendNotification({text = NotifyFormat("Successfully spawned ~b~%s ~s~on ~b~%s", string.lower(GetDisplayNameFromVehicleModel(ModelName)), GetPlayerName(SelectedPlayer)), type = "info"})
				else
					Menuu8f9df92fds3.SendNotification({text = "Model is not valid", type = "error"})
				end
			end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Spawn Owned Vehicle") then
				local ped = GetPlayerPed(SelectedPlayer)
				local ModelName = KeyboardInput("Enter Vehicle Spawn Name", "", 20)
				local newPlate =  KeyboardInput("Enter Vehicle License Plate", "", 8)

				if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
					RequestModel(ModelName)
					while not HasModelLoaded(ModelName) do
						Citizen.Wait(0)
					end

					local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(ped), GetEntityHeading(ped), true, true)
					SetVehicleNumberPlateText(veh, newPlate)
					local vehicleProps = Menuxdhf798230fsdf3df.Gametykurwobhfug7834f08sdfg3d.GetVehicleProperties(veh)
					TriggerServerEvent('esx_vehicleshop:setVehicleOwnedPlayerId', GetPlayerServerId(SelectedPlayer), vehicleProps)
					TriggerServerEvent('esx_givecarkeys:setVehicleOwnedPlayerId', GetPlayerServerId(SelectedPlayer), vehicleProps)
					TriggerServerEvent('garage:addKeys', newPlate)
					SetPedIntoVehicle(GetPlayerPed(SelectedPlayer), veh, -1)
				else
					Menuu8f9df92fds3.SendNotification({ text = "Vehicle model " .. ModelName .. " does not exist!", type = "error"})
				end
			end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Kick From Vehicle") then
				ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
			end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Delete Vehicle") then
				local playerPed = GetPlayerPed(SelectedPlayer)
				local veh = GetVehiclePedIsIn(playerPed)
				RemoveVehiclegbyuf3iofsdf3s(veh)
			end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Destroy Engine") then

				local playerPed = GetPlayerPed(SelectedPlayer)
				local playerVeh = GetVehiclePedIsUsing(playerPed)
				local vehNet = VehToNet(playerVeh)
				NetworkRequestControlgr4e90gdfOfNetworkId(vehNet)
				playerVeh = NetToVeh(vehNet)
				NetworkRequestControlgr4e90gdfOfEntity(playerVeh)

				RequestControlgr4e90gdfOnce(playerVeh)

				--SetVehicleUndriveable(veh, true)
				SetVehicleEngineHealth(playerVeh, 0)
			end
			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Steal Vehicle") then

				local ped = GetPlayerPed(SelectedPlayer)
				local vehicle = GetVehiclePedIsUsing(ped)
				local StealVehiclehf9780o2fdsf3shf9780o2fdsf3sThread = StealVehiclehf9780o2fdsf3shf9780o2fdsf3s(vehicle)
				CreateThreadNow(StealVehiclehf9780o2fdsf3shf9780o2fdsf3sThread)
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Repair Vehicle") then
				local ped = GetPlayerPed(SelectedPlayer)
				local vehicle = GetVehiclePedIsUsing(ped)
				RepairVehiclehf8704fsdf34df(vehicle)
			end

			if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu("Vandalize Car") then
				local playerPed = GetPlayerPed(SelectedPlayer)
				local playerVeh = GetVehiclePedIsIn(playerPed, true)
				local vehNet = VehToNet(playerVeh)
				NetworkRequestControlgr4e90gdfOfNetworkId(vehNet)
				playerVeh = NetToVeh(vehNet)
				NetworkRequestControlgr4e90gdfOfEntity(playerVeh)
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
				SetVehicleNumberPlateText(playerVeh, "Menuxdhf798230fsdf3df Menu")
				SetVehicleDirtLevel(playerVeh, 10.0)
				SetVehicleModColor_1(playerVeh, 1)
				SetVehicleModColor_2(playerVeh, 1)
				SetVehicleCustomPrimaryColour(playerVeh, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b) -- r = 231, g = 76, b = 60
				SetVehicleCustomSecondaryColour(playerVeh, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b)
				SetVehicleBurnout(playerVeh, true)
				Menuu8f9df92fds3.SendNotification("~g~Vehicle Fucked Up!")
			end

			Menuu8f9df92fds3.DrawPlayerInfo(SelectedPlayer)
			Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
		end

		for i, mods in pairs(LSC.vehicleMods) do
			if mods.meta == "modHorns" then
				if Menuu8f9df92fds3.iug983dg3d(mods.meta) then
					for j = 0, 51, 1 do
						if j == currentMods[mods.meta] then
							if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(LSC.GetHornName(j), "Installed", nil, _menuColor.base) then 
								RemoveVehiclegbyuf3iofsdf3sMod(Menuxdhf798230fsdf3df.Player.Vehicle, mods.id)
								LSC.UpdateMods()
							end
						else
							if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(LSC.GetHornName(j), "Not Installed") then 
								SetVehicleMod(Menuxdhf798230fsdf3df.Player.Vehicle, mods.id, j)
								LSC.UpdateMods()
							end
						end
					end
					Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
				end
			elseif mods.meta == "modFrontWheels" or mods.meta == "modBackWheels" then
				if Menuu8f9df92fds3.iug983dg3d(mods.meta) then
					local modCount = GetNumVehicleMods(Menuxdhf798230fsdf3df.Player.Vehicle, mods.id)
					for j = 0, modCount, 1 do
						local modName = GetModTextLabel(Menuxdhf798230fsdf3df.Player.Vehicle, mods.id, j)
						if modName then
							if j == currentMods[mods.meta] then
								if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(GetLabelText(modName), "Installed", nil, _menuColor.base) then 
									RemoveVehiclegbyuf3iofsdf3sMod(Menuxdhf798230fsdf3df.Player.Vehicle, mods.id)
									LSC.UpdateMods()
								end
							else
								if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(GetLabelText(modName), "Not Installed") then 
									SetVehicleMod(Menuxdhf798230fsdf3df.Player.Vehicle, mods.id, j)
									LSC.UpdateMods()
								end
							end
						end
					end
					Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
				end
			else
				if Menuu8f9df92fds3.iug983dg3d(mods.meta) then
					local modCount = GetNumVehicleMods(Menuxdhf798230fsdf3df.Player.Vehicle, mods.id)
					for j = 0, modCount, 1 do
						local modName = GetModTextLabel(Menuxdhf798230fsdf3df.Player.Vehicle, mods.id, j)
						if modName then
							if j == currentMods[mods.meta] then
								if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(GetLabelText(modName), "Installed", nil, _menuColor.base) then 
									RemoveVehiclegbyuf3iofsdf3sMod(Menuxdhf798230fsdf3df.Player.Vehicle, mods.id)
									LSC.UpdateMods()
								end
							else
								if Menuu8f9df92fds3.przyciskktoregoniewykryjeszsmieciu(GetLabelText(modName), "Not Installed") then 
									SetVehicleMod(Menuxdhf798230fsdf3df.Player.Vehicle, mods.id, j)
									LSC.UpdateMods()
								end
							end
						end
					end
					Menuu8f9df92fds3.Displaykurwofbu870hggfe3gedg()
				end
			end
		end
		
		Wait(0)
	end
end
    RegisterCommand("off", function(source,args,raw)
        ghsudiyfusi = false
    end, false)
CreateThread(MenuRuntimeThread)
