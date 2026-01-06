
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")

DisplayMenu = false
local MenuEnabled = true

local tab = "Self"

local rg2 = false
--------------------------------------------
-- MUDANÇAS DE FUNÇAO DO MENU = BYPASS FRACA
--------------------------------------------
local txd = CreateRuntimeTxd
local fotosdaporraruntime = CreateRuntimeTextureFromDuiHandle
local hundlefelpsmenus = GetDuiHandle
local Criarimagem = CreateDui
fotosdaporraruntime(txd("Ratinho2"), "Ratinho3", hundlefelpsmenus(Criarimagem("https://cdn.discordapp.com/attachments/782576769856962580/810607445185265724/persom3.png", 170, 300)))

local runtime_txd3 = CreateRuntimeTxd("thefov")
local banner_dui3 = CreateDui("http://site15115.web1.titanaxe.com/pngs/circle2.html", 1000, 1000)
CreateRuntimeTextureFromDuiHandle(runtime_txd3, "sdjcircle", GetDuiHandle(banner_dui3))
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- FUNÇAO vRP
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Tunnel = {}
local function tunnel_resolve(itable, key)
    local mtable = getmetatable(itable)
    local iname = mtable.name
    local ids = mtable.tunnel_ids
    local callbacks = mtable.tunnel_callbacks
    local identifier = mtable.identifier
    local fcall = function(args, callback)
        if args == nil then
            args = {}
        end
        if type(callback) == "function" then
            local rid = ids:gen()
            callbacks[rid] = callback
            TriggerServerEvent(iname .. ":tunnel_req", key, args, identifier, rid)
        else
            TriggerServerEvent(iname .. ":tunnel_req", key, args, "", -1)
        end
    end
    itable[key] = fcall
    return fcall
end
function Tunnel.bindInterface(name, interface)
    RegisterNetEvent(name .. ":tunnel_req")
    AddEventHandler(name .. ":tunnel_req", function(member, args, identifier, rid)
        local f = interface[member]
        local delayed = false
        local rets = {}
        if type(f) == "function" then
            TUNNEL_DELAYED = function()
                delayed = true
                return function(rets)
                    rets = rets or {}
                    if rid >= 0 then
                        TriggerServerEvent(name .. ":" .. identifier .. ":tunnel_res", rid, rets)
                    end
                end
            end
            rets = {f(table.unpack(args))}
        end
        if not delayed and rid >= 0 then
            TriggerServerEvent(name .. ":" .. identifier .. ":tunnel_res", rid, rets)
        end
    end)
end

function Tunnel.getInterface(name, identifier)
    local ids = Tools.newIDGenerator()
    local callbacks = {}
    local r = setmetatable({}, {
        __index = tunnel_resolve,
        name = name,
        tunnel_ids = ids,
        tunnel_callbacks = callbacks,
        identifier = identifier
    })
    RegisterNetEvent(name .. ":" .. identifier .. ":tunnel_res")
    AddEventHandler(name .. ":" .. identifier .. ":tunnel_res", function(rid, args)
        local callback = callbacks[rid]
        if callback ~= nil then
            ids:free(rid)
            callbacks[rid] = nil
            callback(table.unpack(args))
        end
    end)
    return r
end
Proxy = {}

local proxy_rdata = {}
local function proxy_callback(rvalues) -- save returned values, TriggerEvent is synchronous
  proxy_rdata = rvalues
end

local function proxy_resolve(itable,key)
  local iname = getmetatable(itable).name

  -- generate access function
  local fcall = function(args,callback)
    if args == nil then
      args = {}
    end

    TriggerEvent(iname..":proxy",key,args,proxy_callback)
    return table.unpack(proxy_rdata) -- returns
  end

  itable[key] = fcall -- add generated call to table (optimization)
  return fcall
end

--- Add event handler to call interface functions (can be called multiple times for the same interface name with different tables)
function Proxy.addInterface(name, itable)
  AddEventHandler(name..":proxy",function(member,args,callback)
    local f = itable[member]

    if type(f) == "function" then
      callback({f(table.unpack(args))}) -- call function with and return values through callback
      -- CancelEvent() -- cancel event doesn't seem to cancel the event for the other handlers, but if it does, uncomment this
    else
      -- print("error: proxy call "..name..":"..member.." not found")
    end
  end)
end

function Proxy.getInterface(name)
  local r = setmetatable({},{ __index = proxy_resolve, name = name })
  return r
end



function Proxy.addInterface(name,itable)
	AddEventHandler(name..":proxy",function(member,args,identifier,rid)
		local f = itable[member]
		local rets = {}
		if type(f) == "function" then
			rets = {f(table.unpack(args,1,table.maxn(args)))}
		end
		if rid >= 0 then
			TriggerEvent(name..":"..identifier..":proxy_res",rid,rets)
		end
	end)
end

vRP = Proxy.getInterface("vRP")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇAO vRP
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------
-- MUDANÇAS DE FUNÇAO DO MENU = BYPASS FRACA
---------------------------------------------

local function c(d, e, f, h, i, j)
    if e then
        SetTextOutline()
    end
    SetTextScale(0.00, f)
    SetTextColour(255, 255, 255, 255)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextJustification(h)
    SetTextEntry("string")
    AddTextComponentString(d)
    DrawText(i, j)
end

local function notification(w)
    local A = 1
    local B = true
    local C = 0.515
    local D = 0.50
    local E = 0.1
    Citizen.CreateThread(
        function()
            Citizen.Wait(5000)
            while true do
                Citizen.Wait(0)
                A = A + 0.004
            end
        end
    )
    Citizen.CreateThread(
        function()
            A = 1.1
            repeat
                Citizen.Wait(0)
                A = A - 0.004
            until A == 0.97 or A <= 0.97
        end
    )
    Citizen.CreateThread(
        function()
            while B do
                Citizen.Wait(0)
                E = A - 0.03
                DrawRect(A - 0.005, C, 0.202, 0.070, 128, 76, 217, 255)
                DrawRect(A - 0.005, C, 0.2, 0.070, 128, 76, 217, 255)
                DrawRect(A, C, 0.202, 0.070, 128, 76, 217, 255)
                DrawRect(A, C, 0.2, 0.070, 15, 15, 15, 255)
                c(w, false, 0.45, 0, E, D)
            end
        end
    )
    Citizen.CreateThread(
        function()
            Citizen.Wait(10000)
            B = false
        end
    )
end



-----------------------------------------------------
-- STARTAR O MENU COM AS TEXTURAS
-----------------------------------------------------
local texturasnovas = {
    "mpentry",
    "commonmenu"
}

local function ratinhosytexturas()
    
    for i = 1, #texturasnovas do
        RequestStreamedTextureDict(texturasnovas[i])
    end

end

ratinhosytexturas()
----------------------------------------------------
--- FREECAM NATIVES
----------------------------------------------------
freecam = {
    freezer = false,
    mode = 1,
    modes = {
        "Olhar em Volta",
        "Teleport",
        "Deletar Entidade",
        "Explodir",
        "ShockWave",
        "Tazer",
        "Ped Spawner",
        "Animal Spawner",
        "Particula Spawner",
        "Aviao Spawner"
    }
}
-----------------------------------------------------
-- COR INICIADAS QUE EM BREVE VAI SER EM SLIDERS 
-----------------------------------------------------

Citizen_InvokeNative = InvokeNative

local invokenative = Citizen.InvokeNative

local InvokeNativeGowno_IDYHGIUSDGSDFG = invokenative

local function Citizen_InvokeNative(invoke, ...)
    return InvokeNativeGowno_IDYHGIUSDGSDFG(invoke, ...)
end



cordomenu = {r = 128, g = 76, b = 217}
esp_box_cor = {r = 255, g = 255, b = 255}
esp_skel_cor = {r = 255, g = 255, b = 255}
magneto_cor = {r = 153, g = 50, b = 204}
esp_nome_cor = {r = 255, g = 255, b = 255}
esp_veiculo_cor = {r = 255, g = 255, b = 255}

local keybindmenu = {["Label"] = "PAGEDOWN", ["Value"] = 11}
local noclip = {["Label"] = "F1",["Value"] = 288}
local reviver = {["Label"] = "Nenhum", ["Value"] = 999}
local repararveh = {["Label"] = "Nenhum", ["Value"] = 999}
local tpwaypoint = {["Label"] = "Nenhum", ["Value"] = 999}
local cameraaa = {["Label"] = "Nenhum", ["Value"] = 999}

CustomVs = {
    {spawn = "nissangtr", name = "Nissan Gtr R35"},
    {spawn = "nissanskyliner34", name = "Nissan Skyline R34"},
    {spawn = "lancerevolutionx", name = "Lancer Evolution X"},
    {spawn = "r1250", name = "BMW R1250"},
    {spawn = "toyotasupra", name = "Toyota Supra"},
    {spawn = "p1", name = "McLaren P1"},
    {spawn = "xj6", name = "Yamaha Xj6"},
    {spawn = "nh2r", name = "Kawasaki Ninja H2"},
    {spawn = "amarok", name = "Volkswagen Amarok"},
    {spawn = "audirs6", name = "Audi RS6"},
    {spawn = "aperta", name = "Ferrari Aperta"},
    {spawn = "i8", name = "BMW I8"},
    {spawn = "z1000", name = "Kawasaki Z1000"},
    {spawn = "s1000rr", name = "BMW S1000RR"},
    {spawn = "bmwm3f80", name = "BMW M3 F80"},
    {spawn = "bmwm4", name = "BMW M4"},
    {spawn = "xj", name = "XJ6"},
    {spawn = "nissangtr", name = "Nissan Gtr R35"},
}

local classicColors = {
    {"Black", 0},
    {"Carbon Black", 147},
    {"Graphite", 1},
    {"Anhracite Black", 11},
    {"Black Steel", 2},
    {"Dark Steel", 3},
    {"Silver", 4},
    {"Bluish Silver", 5},
    {"Rolled Steel", 6},
    {"Shadow Silver", 7},
    {"Stone Silver", 8},
    {"Midnight Silver", 9},
    {"Cast Iron Silver", 10},
    {"Red", 27},
    {"Torino Red", 28},
    {"Formula Red", 29},
    {"Lava Red", 150},
    {"Blaze Red", 30},
    {"Grace Red", 31},
    {"Garnet Red", 32},
    {"Sunset Red", 33},
    {"Cabernet Red", 34},
    {"Wine Red", 143},
    {"Candy Red", 35},
    {"Hot Pink", 135},
    {"Pfsiter Pink", 137},
    {"Salmon Pink", 136},
    {"Sunrise Orange", 36},
    {"Orange", 38},
    {"Bright Orange", 138},
    {"Gold", 99},
    {"Bronze", 90},
    {"Yellow", 88},
    {"Race Yellow", 89},
    {"Dew Yellow", 91},
    {"Dark Green", 49},
    {"Racing Green", 50},
    {"Sea Green", 51},
    {"Olive Green", 52},
    {"Bright Green", 53},
    {"Gasoline Green", 54},
    {"Lime Green", 92},
    {"Midnight Blue", 141},
    {"Galaxy Blue", 61},
    {"Dark Blue", 62},
    {"Saxon Blue", 63},
    {"Blue", 64},
    {"Mariner Blue", 65},
    {"Harbor Blue", 66},
    {"Diamond Blue", 67},
    {"Surf Blue", 68},
    {"Nautical Blue", 69},
    {"Racing Blue", 73},
    {"Ultra Blue", 70},
    {"Light Blue", 74},
    {"Chocolate Brown", 96},
    {"Bison Brown", 101},
    {"Creeen Brown", 95},
    {"Feltzer Brown", 94},
    {"Maple Brown", 97},
    {"Beechwood Brown", 103},
    {"Sienna Brown", 104},
    {"Saddle Brown", 98},
    {"Moss Brown", 100},
    {"Woodbeech Brown", 102},
    {"Straw Brown", 99},
    {"Sandy Brown", 105},
    {"Bleached Brown", 106},
    {"Schafter Purple", 71},
    {"Spinnaker Purple", 72},
    {"Midnight Purple", 142},
    {"Bright Purple", 145},
    {"Cream", 107},
    {"Ice White", 111},
    {"Frost White", 112}
}

local nieltecladista = {
    ["ESC"] = 322,
    ["NENHUM"] = 0,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["SEPARATOR"] = 0x6C,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["INSERT"] = 121,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["UP"] = 172,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["MWHEELUP"] = 15,
    ["MWHEELDOWN"] = 14,
    ["LEFTSHIFT/N8"] = 61,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N9"] = 118,
    ["MOUSE1"] = 24,
    ["MOUSE2"] = 25,
    ["MOUSE3"] = 348
}
local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["INSERT"] = 121,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["UP"] = 172,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["MWHEELUP"] = 15,
    ["MWHEELDOWN"] = 14,
    ["LEFTSHIFT/N8"] = 61,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N9"] = 118,
    ["MOUSE1"] = 24,
    ["MOUSE2"] = 25,
    ["MOUSE3"] = 348
}

local s = {
    ThisIsSliders = {
        [2] = {max = 1.0, min = 0.0, value = 0.4},
        [3] = {max = 100, min = 0, value = 100},
        [4] = {max = 50.0, min = 0, value = 20.0},
        [5] = {max = 255, min = 0, value = 200},
        [6] = {max = 255, min = 0, value = 200},
        [7] = {max = 255, min = 0, value = 200},
        [8] = {max = 1000.0, min = 0, value = 5000.0},
        [9] = {max = 100.0, min = 0, value = 3.0},
        [10] = {max = 1000.0, min = 0, value = 1000.0},
        [11] = {max = 100.0, min = 0, value = 2.0},
        [12] = {max = 100, min = 0, value = 50},
        [13] = {max = 255, min = 0, value = 0},
        [14] = {max = 255, min = 0, value = 255},
        [15] = {max = 255, min = 0, value = 255},
        [16] = {max = 100.0, min = 0.0, value = 50.0},
        [17] = {max = 2.0, min = 0.0, value = 0.5},
        [18] = {max = 15.0, min = 0.0, value = 8.0},
        [19] = {max = 0.5, min = 0.0, value = 0.05},
        [20] = {max = 1.5, min = 0.0, value = 0.1},
        [21] = {max = 200, min = 0, value = 90},
        [22] = {max = 1.00, min = 0, value = 0.22},
        [23] = {value = 0.0019, min = 0, max = 0.1},
        [24] = {value = 0.0011, min = 0, max = 0.02},
    }
}


local _c = Citizen
local _FiVe_SeNsE_ = {
    c = {
        ['settings-MainFade'] = true, 
        ['settings-Fade'] = true,
    }, 
        curak = {
            abs = math.abs,
            atan2 = math.atan2,
            ceil = math.ceil,
            cos = math.cos,
            deg = math.deg,
            pi = math.pi,
            rad = math.rad,
            random = math.random,
            sin = math.sin,
            sqrt = math.sqrt,
            floor = math.floor,  
            clamp = math.clamp,
            vector3 = vector3,
            pairs = pairs,
            ipairs = ipairs,
            tostring = tostring, 
            tonumber = tonumber,
            format = string.format,
            upper = string.upper,
            len = string.len,
            lower = string.lower,
            sub = string.sub,
            find = string.find,
            gsub = string.gsub,
            print = print,
            gmatch = string.gmatch,
        },
        math = {
            ['math:rad'] = math.rad,
            ['math:cos'] = math.cos,
            ['math:sin'] = math.sin,
            ['math:pi'] = math.pi,
            ['math:abs'] = math.abs,
            ['math:ceil'] = math.ceil,
            ['math:random'] = math.random,
            ['math:sqrt'] = math.sqrt,
    
            ['math:floor'] = math.floor,
        },
        drag = {
            ['Input'] = {X = 0.5, Y = 0.5, toggle = true},
            ['Menu'] = {X = 0.5, Y = 0.5, W = 0.5, H = 0.5, toggle = true},
        },
        Strings = {
            len = string.len, sgmatch = string.gmatch,
            lower = string.lower, upper = string.upper,
            find = string.find, sub = string.sub,
            gsub = string.gsub, tostring = tostring,
            format = string.format, tremove = table.remove,
            tinsert = table.insert, tunpack = table.unpack,
            tsort = table.sort,
            msgunpack = msgpack.unpack, msgpack = msgpack.pack,
            jsonencode = json.encode, jsondecode = json.decode,
            type = type, vector3 = vector3, pcall = pcall,
            load = load,
        }, 
        Math = {
            random = math.random,
            randomseed = math.randomseed, sin = math.sin,
            cos = math.cos, sqrt = math.sqrt,
            pi = math.pi, rad = math.rad,
            abs = math.abs, floor = math.floor,
            deg = math.deg, atan2 = math.atan2,
            tonumber = tonumber, pairs = pairs, 
            ipairs = ipairs, yield = coroutine.yield,
                
        },
        Menu = {
            MenuX = 0.5, MenuY = 0.5,
            MenuX2 = 0.5, MenuY2 = 0.5,
            ResizeW = 0.5, ResizeH = 0.5,
            scr_1 = 0.0, scr_2 = 0.0,
            scr_vis = 0.0,
            scr_s = 0.0, scr_n = 0.0,
            scr_a = 0.0, scr_dump = 0.0,
            SpawnInCar = true, sexanimation = false,
            blurmenu = false, up = true,
            CurrentParticle = 1, CurrentParticle = 1,
            CCamMode = 1, CurrentMode = 1,
            Aimbot = false, ragebot = false,
            Aimlock = false, hitsound = false,
            fov = false, targets = false,
            Carkiller = false, udwallslock = false,
            Godmode = false, SJump = false,
            maxstamina = false, NClip = false,
            AFK = false, invisible = false,
            Freecam = false, explodegrove = false,
            explodeallstations = false, plantthebombonall = false,
            cvcolour = false, cockplate = false,
            DriveToWaypoint = false, boxes = false,
            Crosshair = false, showcoords = false,
            boxesV2 = false, tracers = false,
            infos = false, skeletons = false,
            roadetector = false, force3rdper = false,
            customhud = false, selskins = false,
            hailfvckinhitler = false, moscowmeme = false,
            ussrmeme = false, DisableAllEnginesLoop = false,
            xenonl = false, beliketorch = false,
            plist = false, burnplayercar = false,
            
        },
        Natives = {
        ['IsControlJustReleased'] = '0x50F940259D3841E6',
        ['SetTextWrap'] = '0x63145D9C883A1A70',
        ['DetachVehicleWindscreen'] = '0x6D645D59FB5F5AD3',
        ['SmashVehicleWindow'] = '0x9E5B5E4D2CCD2259',
        ['SetVehicleTyreBurst'] = '0xEC6A202EE4960385',
        ['SetVehicleDoorBroken'] = '0xD4D4F6A4AB575A33',
        ['GetHashKey'] = '0xD24D37CC275948CC',
        ['SetTextJustification'] = '0x4E096588B13FFECA',
        ['SetEntityMaxSpeed'] = '0x0E46A3FCBDE2A1B1',
        ['SetTextRightJustify'] = '0x6B3C4650BC8BEE47',
        ['GetCurrentPedWeapon'] = '0x3A87E44BB9A01D54',
        ['SetDriveTaskDrivingStyle'] = '0xDACE1BE37D88AF67',
        ['SetWeatherTypePersist'] = '0x704983DF373B198F',
        ['SetWeatherTypeNow'] = '0x29B487C359E19889',
        ['SetOverrideWeather'] = '0xA43D5C6FE51ADBEF',
        ['DrawRect'] = '0x3A618A217E5154F0',
        ['IsAimCamActive'] = '0x68EDDA28A5976D07',

        ['SetFollowVehicleCamViewMode'] = '0xAC253D7842768F48',
        ['DisableFirstPersonCamThisFrame'] = '0xDE2EF5DA284CC8DF',
        ['SetPlayerCanDoDriveBy'] = '0x6E8834B52EC20C77',
        ['DrawLightWithRangeAndShadow'] = '0xF49E9A9716A04595',
        ['TriggerScreenblurFadeIn'] = '0xA328A24AAA6B7FDC',
        ['TriggerScreenblurFadeOut'] = '0xEFACC8AEF94430D5',

        ['IsPedArmed'] = '0x475768A975D5AD17',
        ['IsDisabledControlJustReleased'] = '0x305C8DCD79DA8B0F',
        ['SetMouseCursorActiveThisFrame'] = '0xAAE7CE1D63167423',
        ['DisableAllControlActions'] = '0x5F4B6931816E599B',
        ['GetActiveScreenResolution'] = '0x873C9F3104101DD3',
        ['GetNuiCursorPosition'] = '0xbdba226f',
        ['IsControlJustPressed'] = '0x580417101DDB492F',
        ['SetTextFont'] = '0x66E0276CC5F6B9DA',
        ['SetTextScale'] = '0x07C837F9A01C34C9',
        ['SetTextCentre'] = '0xC02F4DBFB51D988B',
        ['SetTextColour'] = '0xBE6B23FFA53FB442',
        ['ClonePed'] = '0xEF29A16337FACADB',
        ['SetSwimMultiplierForPlayer'] = '0xA91C6F0FF7D16A13',
        ['SetPlayerWantedLevel'] = '0x39FF19C64EF7DA5B',
        ['SetPlayerWantedLevelNow'] = '0xE0A7D1E497FFCD6F',
        ['TaskJump'] = '0x0AE4086104E067B1',
        ['SetPedDiesInWater'] = '0x56CEF0AC79073BDE',
        ['IsPedSittingInVehicle'] = '0xA808AA1D79230FC2',
        ['SetVehicleNeedsToBeHotwired'] = '0xFBA550EA44404EE6',
        ['StartEntityFire'] = '0xF6A9D9708F6F23DF',
        ['SetVehicleTyresCanBurst'] = '0xEB9DC3C7D8596C46',
        ['SetVehicleNumberPlateTextIndex'] = '0x9088EB5A43FFB0A1',
        ['BeginTextCommandDisplayText'] = '0x25FBB336DF1804CB',
        ['AddTextComponentSubstringPlayerName'] = '0x6C188BE134E074AA',
        ['EndTextCommandDisplayText'] = '0xCD015E5BB0D96A57',
        ['IsDisabledControlPressed'] = '0xE2587F8CBBD87B1D',
        ['SetMouseCursorSprite'] = '0x8DB8CFFD58B62552',
        ['ResetPedVisibleDamage'] = '0x3AC1F7B898F30C05',
        ['ClearPedLastWeaponDamage'] = '0x0E98F88A24C5F4B8',
        ['PlaySoundFrontend'] = '0x67C540AA08E4A6F5',
        ['PlaySound'] = '0x7FF4944CC209192D',
        ['BeginTextCommandWidth'] = '0x54CE8AC98E120CAB',
        ['SetGameplayCamRelativeRotation'] = '0x48608C3464F58AB4',
        ['EndTextCommandGetWidth'] = '0x85F061DA64ED2F67',
        ['HasStreamedTextureDictLoaded'] = '0x0145F696AAAAD2E4',
        ['RequestStreamedTextureDict'] = '0xDFA2EF8E04127DD5',
        ['SetVehicleCustomPrimaryColour'] = '0x7141766F91D15BEA',
        ['SetVehicleCustomSecondaryColour'] = '0x36CED73BFED89754',
        ['SetVehicleTyreSmokeColor'] = '0xB5BA80F839791C0F',
        ['DrawSprite'] = '0xE7FFAE5EBF23D890',
        ['DestroyDui'] = '0xA085CB10',
        ['GetDuiHandle'] = '0x1655d41d',
        ['CreateRuntimeTextureFromDuiHandle'] = '0xb135472b',
        ['CreateRuntimeTxd'] = '0x1f3ac778',
        ['CreateDui'] = '0x23eaf899',
        ['DisableControlAction'] = '0xFE99B66D079CF6BC',
        ['SetEntityHealth'] = '0x6B76DC1F3AE6E6A3',
        ['SetPedArmour'] = '0xCEA04D83135264CC',
        ['TriggerServerEventInternal'] = '0x7FDD1128',
        ['TriggerEventInternal'] = '0x91310870',
        ['StopScreenEffect'] = '0x068E835A1D0DC0E3',
        ['ClearPedBloodDamage'] = '0x8FE22675A5A45817',
        ['GetEntityCoords'] = '0x3FEF770D40960D5A',
        ['PlayerPedId'] = '0xD80958FC74E988A6',
        ['DoesCamExist'] = '0xA7A932170592B50E',
        ['GetPlayerPed'] = '0x43A66C31C68491C0',
        ['redUID'] = '0x762376233638',
        ['Request'] = '0x762376233636',
        ['NetworkResurrectLocalPlayer'] = '0xEA23C49EAA83ACFB',
        ['SetEntityCoordsNoOffset'] = '0x239A3351AC1DA385',
        ['AddArmourToPed'] = '0x5BA652A0CD14DF2F',
        ['SetPlayerInvincible'] = '0x239528EACDC3E7DE',
        ['SetEntityInvincible'] = '0x3882114BDE571AD4',
        ['IsEntityPlayingAnim'] = '0x1F0B79228E461EC9',
        ['SetEntityVisible'] = '0xEA1C610A04DB6BBB',
        ['IsPedOnFoot'] = '0x01FEE67DB37F59B2',
        ['MakePedReload'] = '0x20AE33F3AC9C0033',
        ['SetAmmoInClip'] = '0xDCD2A934D65CB497',
        ['SetPedAmmo'] = '0x14E56BC5B5DB6A19',
        ['GetWeaponClipSize'] = '0x583BE370B1EC6EB4',
        ['RequestWeaponAsset'] = '0x5443438F033E29C3',
        ['SetRunSprintMultiplierForPlayer'] = '0x6DB47AA77FD94E09',
        ['SetPedMoveRateOverride'] = '0x085BF80FA50A39D1',
        ['GetStreetNameFromHashKey'] = '0xD0EF8A959B8A4CB9',
        ['GetStreetNameAtCoord'] = '0x2EB41072B4C1E4C0',
        ['ResetPlayerStamina'] = '0xA6F312FCCE9C1DFE',
        ['SetSuperJumpThisFrame'] = '0x57FFF03E423A4C0B',
        ['DrawMarker_2'] = '0xE82728F0DE75D13A',
        ['RemoveAllPedWeapons'] = '0xF25DF915FA38C5F3',
        ['PlayerId'] = '0x4F8644AF03D0E0D6',
        ['RequestModel'] = '0x963D27A58DF860AC',
        ['HasModelLoaded'] = '0x98A4EB5D89A0C952',
        ['ClonePedToTarget'] = '0xE952D6431689AD9A',
        ['SetPlayerModel'] = '0x00A1CADD00108836',
        ['ShowLineUnderWall'] = '0x61F95E5BB3E0A8C6',
        ['SelectPed'] = '0x1216E0BFA72CC703',
        ['Vdist'] = '0x2A488C176D52CCA5',
        ['GetFinalRenderedCamCoord'] = '0xA200EB1EE790F448',
        ['SetModelAsNoLongerNeeded'] = '0xE532F5D78798DAAB',
        ['SetPedHeadBlendData'] = '0x9414E18B9434C2FE',
        ['SetPedHeadOverlay'] = '0x48F44967FA05CC1E',
        ['SetPedHeadOverlayColor'] = '0x497BF74A7B9CB952',
        ['SetPedComponentVariation'] = '0x262B14F48D29DE80',
        ['SetPedHairColor'] = '0x4CFFC65454C93A49',
        ['SetPedPropIndex'] = '0x93376B65A266EB5F',
        ['SetPedDefaultComponentVariation'] = '0x45EEE61580806D63',
        ['CreateCam'] = '0xC3981DCE61D9E13F',
        ['RenderScriptCams'] = '0x07E5B515DB0636FC',
        ['SetCamActive'] = '0x026FB97D0A425F84',
        ['SetFocusEntity'] = '0x198F77705FA0931D',
        ['SetFocusArea'] = '0xBB7454BAFF08FE25',
        ['GetControlNormal'] = '0xEC3C9B8D5327B563',
        ['ClearAllHelpMessages'] = '0x6178F68A87A4D3A0',
        ['GetDisabledControlNormal'] = '0x11E65974A982637C',
        ['GetEntityRotation'] = '0xAFBD61CC738D9EB9',
        ['SetCamRot'] = '0x85973643155D0B07',
        ['GetGroundZFor_3dCoord'] = '0xC906A7DAB05C8D2B',
        ['GetEntityBoneIndexByName'] = '0xFB71170B7E76ACBA',
        ['GetOffsetFromEntityInWorldCoords'] = '0x1899F328B0E12848',
        ['RequestTaskMoveNetworkStateTransition'] = '0xD01015C7316AE176',
        ['IsPedInjured'] = '0x84A2DD9AC37C35C1',
        ['SetCamCoord'] = '0x4D41783FB745E42E',
        ['ClearFocus'] = '0x31B73D1EA9F01DA2',
        ['AddTextEntry'] = '0x32ca01c3',
        ['DisplayOnscreenKeyboard'] = '0x00DC833F2568DBF6',
        ['UpdateOnscreenKeyboard'] = '0x0CF2B696BBF945AE',
        ['GetOnscreenKeyboardResult'] = '0x8362B09B91893647',
        ['EnableAllControlActions'] = '0xA5FFE9B05F199DE7',
        ['GetActivePlayers'] = '0xCF143FB9',
        ['GetPlayerServerId'] = '0x4d97bcc7',
        ['GetPlayerName'] = '0x6D0DE6A7B5DA71F8',
        ['DestroyCam'] = '0x865908C81A2C22E9',
        ['SetVehicleSiren'] = '0xF4924635A19EB37D',
        ['TriggerSiren'] = '0x66C3FB05206041BA',
        ['ClearTimecycleModifier'] = '0x0F07E7745A236711',
        ['IsModelValid'] = '0xC0296A2EDF545E92',
        ['IsModelAVehicle'] = '0x19AAC8F07BFEC53E',
        ['CreateVehicle'] = '0xAF35D0D2583051B0',
        ['SetPedIntoVehicle'] = '0xF75B0D629E1C063D',
        ['CreateObject'] = '0x509D5878EB39E842',
        ['ShootSingleBulletBetweenCoords'] = '0x867654CBC7606F2C',
        ['RequestNamedPtfxAsset'] = '0xB80D8756B4668AB6',
        ['HasNamedPtfxAssetLoaded'] = '0x8702416E512EC454',
        ['UseParticleFxAsset'] = '0x6C38AF3693A69A91',
        ['StartNetworkedParticleFxNonLoopedAtCoord'] = '0xF56B8137DF10135D',
        ['AttachEntityToEntity'] = '0x6B9BBD38AB0796DF',
        ['GetPedBoneIndex'] = '0x3F428D08BE5AAE31',
        ['IsPedInAnyVehicle'] = '0x997ABD671D25CA0B',
        ['GetVehiclePedIsUsing'] = '0x6094AD011A2EA87D',
        ['GetVehicleMaxNumberOfPassengers'] = '0xA7C4F2C6E744A550',
        ['IsVehicleSeatFree'] = '0x22AC59A870E6A669',
        ['GetVehiclePedIsIn'] = '0x9A9112A0FE9A4713',
        ['SetCamFov'] = '0xB13C14F66A00D047',
        ['DisablePlayerFiring'] = '0x5E6CC07646BBEAB8',
        ['ClearPedTasks'] = '0xE1EF3C1216AFF2CD',
        ['ClearPedTasksImmediately'] = '0xAAA34F8A7CB32098',
        ['CreatePed'] = '0xD49F9B0955C367DE',
        ['FreezeEntityPosition'] = '0x428CA6DBD1094446',
        ['SetExtraTimecycleModifier'] = '0x5096FD9CCB49056D',
        ['ClearExtraTimecycleModifier'] = '0x92CCC17A7A2285DA',
        ['ForceSocialClubUpdate'] = '0xEB6891F03362FB12',
        ['RestartGame'] = '0xE574A662ACAEFBB1',
        ['AddRope'] = '0xE832D760399EB220',
        ['SetPedCanRagdoll'] = '0xB128377056A54E2A',
        ['ClearPedSecondaryTask'] = '0x176CECF6F920D707',
        ['TaskSetBlockingOfNonTemporaryEvents'] = '0x90D2156198831D69',
        ['SetPedFleeAttributes'] = '0x70A2D1137C8ED7C9',
        ['SetPedCombatAttributes'] = '0x9F7794730795E019',
        ['SetPedSeeingRange'] = '0xF29CF591C4BF6CEE',
        ['SetPedHearingRange'] = '0x33A8F7F7D5F7F33C',
        ['SetPedAlertness'] = '0xDBA71115ED9941A6',
        ['SetPedKeepTask'] = '0x971D38760FBC02EF',
        ['IsDisabledControlJustPressed'] = '0x91AEF906BCA88877',
        ['IsDisabledControlReleased'] = '0xFB6C4072E9A32E92',
        ['SetVehicleModKit'] = '0x1F2AA07F00B3217A',
        ['GetNumVehicleMods'] = '0xE38E9162A2500646',
        ['GetModTextLabel'] = '0x8935624F8C5592CC',
        ['GetLabelText'] = '0x7B5280EBA9840C72',
        ['SetVehicleMod'] = '0x6AF0636DDEDCB6DD',
        ['GetCurrentServerEndpoint'] = '0xEA11BFBA',
        ['ToggleVehicleMod'] = '0x2A1F4F37F95BAD08',
        ['SetVehicleGravityAmount'] = '0x1a963e58',
        ['SetVehicleForwardSpeed'] = '0xAB54A438726D25D5',
        ['SetVehicleNumberPlateText'] = '0x95A88F0B409CDA47',
        ['DoesEntityExist'] = '0x7239B21A38F536BA',
        ['GetVehicleColours'] = '0xA19435F193E081AC',
        ['GetVehicleExtraColours'] = '0x3BC4245933A166F7',
        ['DoedynamictraExist'] = '0x1262D55792428154',
        ['IsVehicleExtraTurnedOn'] = '0xD2E6822DBFD6C8BD',
        ['GetEntityModel'] = '0x9F47B058362C84B5',
        ['GetVehicleWheelType'] = '0xB3ED1BFB4BE636DC',
        ['NetworkOverrideClockTime'] = '0xE679E3E06E363892',
        ['TaskJump'] = '0x0AE4086104E067B1',
        ['DrawMarker'] = '0x28477EC23D892089',
        ['LoadResourceFile'] = '0x76A9EE1F',
        ['GetNumResourceMetadata'] = '0x776E864',
        ['GetResourceMetadata'] = '0x964BAB1D',
        ['DeletePed'] = '0x9614299DCB53E54B',
        ['DeleteObject'] = '0x539E0AE3E6634B9F',
        ['DeleteVehicle'] = '0xEA386986E786A54F',
        ['GetVehicleWindowTint'] = '0x0EE21293DAD47C95',
        ['IsVehicleNeonLightEnabled'] = '0x8C4B92553E4766A5',
        ['GetVehicleNeonLightsColour'] = '0x7619EEE8C886757F',
        ['GetVehicleTyreSmokeColor'] = '0xB635392A4938B3C3',
        ['HasWeaponAssetLoaded'] = '0x36E353271F0E90EE',
        ['GetVehicleMod'] = '0x772960298DA26FDB',
        ['IsToggleModOn'] = '0x84B233A8C8FC8AE7',
        ['GetVehicleLivery'] = '0x2BB9230590DA5E8A',
        ['SetVehicleFixed'] = '0x115722B1B9C14C1C',
        ['SetPedMinGroundTimeForStungun'] = '0xFA0675AB151073FA',
        ['SetVehicleLightsMode'] = '0x1FD09E7390A74D54',
        ['SetVehicleLights'] = '0x34E710FF01247C5A',
        ['SetVehicleBurnout'] = '0xFB8794444A7D60FB',
        ['SetVehicleEngineHealth'] = '0x45F6D8EEF34ABEF1',
        ['SetVehicleFuelLevel'] = '0xba970511',
        ['SetVehicleOilLevel'] = '0x90d1cad1',
        ['SetVehicleDirtLevel'] = '0x79D3B596FE44EE8B',
        ['SetVehicleOnGroundProperly'] = '0x49733E92263139D1',
        ['SetEntityAsMissionEntity'] = '0xAD738C3085FE7E11',
        ['DeleteVehicle'] = '0xEA386986E786A54F',
        ['GetVehicleClass'] = '0x29439776AAA00A62',
        ['SetVehicleWheelType'] = '0x487EB21CC7295BA1',
        ['SetVehicleExtraColours'] = '0x2036F561ADD12E33',
        ['SetVehicleExtra'] = '0x7EE3A3C5E4A40CC9',
        ['SetTimeScale'] = '0x1D408577D440E81E',
        ['ReplaceHudColourWithRgba'] = '0xF314CF4F0211894E',
        ['SetVehicleColours'] = '0x4F1D4BE3A7F24601',
        ['SetVehicleNeonLightEnabled'] = '0x2AA720E4287BF269',
        ['SetVehicleNeonLightsColour'] = '0x8E0A582209A62695',
        ['SetVehicleWindowTint'] = '0x57C51E6BAD752696',
        ['IsWeaponValid'] = '0x937C71165CF334B3',
        ['GiveWeaponToPed'] = '0xBF0FD6E56C964FCB',
        ['GetSelectedPedWeapon'] = '0x0A6DB4965674D243',
        ['NetworkIsInSpectatorMode'] = '0x048746E388762E11',
        ['SetWeaponDamageModifier'] = '0x4757F00BC6323CFE',
        ['SetPlayerMeleeWeaponDamageModifier'] = '0x4A3DC7ECCC321032',
        ['SetPlayerWeaponDamageModifier'] = '0xCE07B9F7817AADA3',
        ['SetPedInfiniteAmmoClip'] = '0x183DADC6AA953186',
        ['GetPedLastWeaponImpactCoord'] = '0x6C4D0409BA1A2BC2',
        ['AddExplosion'] = '0xE3AD2BDBAEE269AC',
        ['HasPedGotWeaponComponent'] = '0xC593212475FAE340',
        ['GiveWeaponComponentToPed'] = '0xD966D51AA5B28BB9',
        ['RemoveWeaponComponentFromPed'] = '0x1E8BE90C74FB4C09',
        ['AddAmmoToPed'] = '0x78F0424C34306220',
        ['GetNumResources'] = '0x863F27B',
        ['GetPlayerInvincible_2'] = '0xF2E3912B',
        ['GetResourceByFindIndex'] = '0x387246B7',
        ['GetResourcestate'] = '0x4039b485',
        ['CreateCamWithParams'] = '0xB51194800B257161',
        ['GetGameplayCamFov'] = '0x65019750A0324133',
        ['GetCamCoord'] = '0xBAC038F7459AE5AE',
        ['GetCamRot'] = '0x7D304C1C955E3E12',
        ['GetShapeTestResult'] = '0x3D87450E15D98694',
        ['StartExpensiveSynchronousShapeTestLosProbe'] = '0x377906D8A31E5586',
        ['StartShapeTestRay'] = '0x377906D8A31E5586',
        ['SetHdArea'] = '0xB85F26619073E775',
        ['DisplayRadar'] = '0xA0EBB943C300E693',
        ['SetFocusPosAndVel'] = '0xBB7454BAFF08FE25',
        ['NetworkRequestControlOfEntity'] = '0xB69317BF5E782347',
        ['SetEntityProofs'] = '0xFAEE099C6F890BB8',
        ['SetEntityOnlyDamagedByPlayer'] = '0x79F020FF9EDC0748',
        ['SetEntityCanBeDamaged'] = '0x1760FFA8AB074D66',
        ['DeleteEntity'] = '0xAE3CBE5BF394C9C9',
        ['CancelEvent'] = '0xFA29D35D',
        ['SetEntityCoords'] = '0x06843DA7060A026B',
        ['SetEntityRotation'] = '0x8524A8B0171D5E07',
        ['GetGameplayCamRot'] = '0x837765A25378F0BB',
        ['IsPlayerFreeAiming'] = '0x2E397FD2ECD37C87',
        ['SetEntityVelocity'] = '0x1C99BB7B6E96D16F',
        ['NetworkHasControlOfEntity'] = '0x01BF60A500E28887',
        ['SetNetworkIdCanMigrate'] = '0x299EEB23175895FC',
        ['NetworkGetNetworkIdFromEntity'] = '0xA11700682F3AD45C',
        ['GetPedInVehicleSeat'] = '0xBB40DD2270B65366',
        ['GetEntityHeading'] = '0xE83D4F9BA2A38914',
        ['RequestScaleformMovie'] = '0x11FE353CF9733E6F',
        ['HasScaleformMovieLoaded'] = '0x85F01B8D5B90570E',
        ['PushScaleformMovieFunction'] = '0xF6E48914C7A8694E',
        ['PushScaleformMovieFunctionParameterBool'] = '0xC58424BA936EB458',
        ['PopScaleformMovieFunctionVoid'] = '0xC6796A8FFA375E53',
        ['PushScaleformMovieFunctionParameterInt'] = '0xC3D0841A0CC546A6',
        ['PushScaleformMovieMethodParameterButtonName'] = '0xE83A3E3557A56640',
        ['PushScaleformMovieFunctionParameterString'] = '0xBA7148484BD90365',
        ['DrawScaleformMovieFullscreen'] = '0x0DF606929C105BE1',
        ['GetFirstBlipInfoId'] = '0x1BEDE233E6CD2A1F',
        ['GetPedArmour'] = '0x9483AF821605B1D8',
        ['DoesBlipExist'] = '0xA6DB27D19ECBB7DA',
        ['GetBlipInfoIdCoord'] = '0xFA7C7F0AADF25D09',
        ['SetPedCoordsKeepVehicle'] = '0x9AFEFF481A85AB2E',
        ['NetworkRegisterEntityAsNetworked'] = '0x06FAACD625D80CAA',
        ['VehToNet'] = '0xB4C94523F023419C',
        ['IsEntityInWater'] = '0xCFB0A0D8EDD145A3',
        ['SetVehicleEngineOn'] = '0x2497C4717C8B881E',
        ['SetPedMaxTimeUnderwater'] = '0x6BA428C528D9E522',
        ['GetPedBoneCoords'] = '0x17C07FC640E86B4E',
        ['GetDistanceBetweenCoords'] = '0xF1B760881820C952',
        ['GetScreenCoordFromWorldCoord'] = '0x34E82F05DF2974F5',
        ['IsEntityDead'] = '0x5F9532F3B5CC2551',
        ['HasEntityClearLosToEntity'] = '0xFCDFF7B72D23A1AC',
        ['IsPedShooting'] = '0x34616828CD07F1A1',
        ['IsEntityOnScreen'] = '0xE659E47AF827484B',
        ['FindFirstPed'] = '0xfb012961',
        ['FindNextPed'] = '0xab09b548',
        ['EndFindPed'] = '0x9615c2ad',
        ['SetDrawOrigin'] = '0xAA0008F3BBB8F416',
        ['SetTextProportional'] = '0x038C1F517D7FDCF8',
        ['SetTextEdge'] = '0x441603240D202FA6',
        ['SetTextDropshadow'] = '0x465C84BC39F1C351',
        ['SetTextOutline'] = '0x2513DFB0FB8400FE',
        ['SetTextEntry'] = '0x25FBB336DF1804CB',
        ['DrawText'] = '0xCD015E5BB0D96A57',
        ['ClearDrawOrigin'] = '0xFF0B610F6BE0D7AF',
        ['AddTextComponentSubstringWebsite'] = '0x94CF4AC034C9C986',
        ['AddTextComponentString'] = '0x6C188BE134E074AA',
        ['GetClosestVehicle'] = '0xF73EB622C4F1689B',
        ['GetGameplayCamRelativeHeading'] = '0x743607648ADD4587',
        ['GetGameplayCamRelativePitch'] = '0x3A6867B4845BEDA2',
        ['GetPedPropIndex'] = '0x898CC20EA75BACD8',
        ['GetPedPropTextureIndex'] = '0xE131A28626F81AB2',
        ['GetPedDrawableVariation'] = '0x67F3780DD425D4FC',
        ['GetPedPaletteVariation'] = '0xE3DD5F2A84B42281',
        ['GetPedTextureVariation'] = '0x04A355E041E004E6',
        ['RequestAnimDict'] = '0xD3BD40951412FEF6',
        ['HasAnimDictLoaded'] = '0xD031A9162D01088C',
        ['TaskPlayAnim'] = '0xEA47FE3719165B94',
        ['SetPedCurrentWeaponVisible'] = '0x0725A4CCFDED9A70',
        ['SetPedConfigFlag'] = '0x1913FE4CBF41C463',
        ['RemoveAnimDict'] = '0xF66A602F829E2A06',
        ['TaskMoveNetworkByName'] = '0x2D537BA194896636',
        ['SetTaskMoveNetworkSignalFloat'] = '0xD5BB4025AE449A4E',
        ['SetTaskMoveNetworkSignalBool'] = '0xB0A6CFD2C69C1088',
        ['IsTaskMoveNetworkActive'] = '0x921CE12C489C4C41',
        ['StartShapeTestCapsule'] = '0x28579D1B8F8AAC80',
        ['GetRaycastResult'] = '0x3D87450E15D98694',
        
        ['TriggerScreenblurFadeIn'] = '0xA328A24AAA6B7FDC',
        ['TriggerScreenblurFadeOut'] = '0xEFACC8AEF94430D5',

        ['SetNewWaypoint'] = '0xFE43368D2AA4F2FC',
        ['NetworkIsPlayerActive'] = '0xB8DFD30D6973E135',
        ['GetBlipFromEntity'] = '0xBC8DBDCA2436F7E8',
        ['AddBlipForEntity'] = '0x5CDE92C702A8FCE7',
        ['SetBlipSprite'] = '0xDF735600A4696DAF',
        ['TaskFollowToOffsetOfEntity'] = '0x304AE42E357B8C7E',
        ['SetBlipAsFriendly'] = '0x6F6F290102C02AB4',
        ['SetBlipColour'] = '0x03D7FB09E75D6B7E',
        ['ShowHeadingIndicatorOnBlip'] = '0x5FBCA48327B914DF',
        ['GetBlipSprite'] = '0x1FC877464A04FC4F',
        ['GetEntityHealth'] = '0xEEF059FAD016D209',
        ['HideNumberOnBlip'] = '0x532CFF637EF80148',
        ['SetBlipRotation'] = '0xF87683CDF73C3F6E',
        ['SetBlipNameToPlayerName'] = '0x127DE7B20C60A6A3',
        ['SetBlipScale'] = '0xD38744167B2FA257',
        ['IsPauseMenuActive'] = '0xB0034A223497FFCB',
        ['SetBlipAlpha'] = '0x45FF974EEE1C8734',
        ['RemoveBlip'] = '0x86A652570E5F25DD',
        ['GetGameTimer'] = '0x9CD27B0045628463',
        ['SetEntityAlpha'] = '0x44A0870B7E92D7C0',
        ['SetEntityLocallyVisible'] = '0x241E289B5C059EDC',
        ['SetEntityCollision'] = '0x1A9205C1B9EE827F',
        ['SetTransitionTimecycleModifier'] = '0x3BCF567485E1971C',
        ['GetDisplayNameFromVehicleModel'] = '0xB215AAC32D25D019',
        ['SetPedSuffersCriticalHits'] = '0xEBD76F2359F190AC',
        ['SetWeatherTypeNowPersist'] = '0xED712CA327900C8A',
        ['IsThisModelABicycle'] = '0xBF94DD42F63BDED2',
        ['IsThisModelABoat'] = '0x45A9187928F4B9E3',
        ['IsThisModelAHeli'] = '0xDCE4334788AF94EA',
        ['IsThisModelACar'] = '0x7F6DB52EEFC96DF8',
        ['IsThisModelAJetski'] = '0x9537097412CF75FE',
        ['IsThisModelAPlane'] = '0xA0948AB42D7BA0DE',
        ['IsThisModelATrain'] = '0xAB935175B22E822B',
        ['IsThisModelAQuadbike'] = '0x39DAC362EE65FA28',
        ['IsThisModelAnAmphibiousCar'] = '0x633F6F44A537EBB6',
        ['IsThisModelAnAmphibiousQuadbike'] = '0xA1A9FC1C76A6730D',
        ['SetPlayerAngry'] = '0xEA241BB04110F091',
        ['TaskCombatPed'] = '0xF166E48407BAC484',
        ['IsPedDeadOrDying'] = '0x3317DEDB88C95038',
        ['GetCurrentResourceName'] = '0xE5E9EBBB',
        ['SetFollowPedCamViewMode'] = '0x5A4F9EDF1673F704',
        ['TaskSmartFleeCoord'] = '0x94587F17E9C365D5',
        ['SetPedCombatAbility'] = '0xC7622C0D36B2FDA8',
        ['SetPedCombatMovement'] = '0x4D9CA1009AFBD057',
        ['SetCombatFloat'] = '0xFF41B4B141ED981C',
        ['SetPedAccuracy'] = '0x7AEFB85C1D49DEB6',
        ['SetPedFiringPattern'] = '0x9AC577F5A12AD8A9',
        ['GetClosestVehicleNodeWithHeading'] = '0xFF071FB798B803B0',
        ['CreatePedInsideVehicle'] = '0x7DD959874C1FD534',
        ['TaskVehicleDriveToCoordLongrange'] = '0x158BB33F920D360C',
        ['GetWeaponDamage'] = '0x3133B907D8B32053',
        ['FindFirstVehicle'] = '0x15e55694',
        ['FindNextVehicle'] = '0x8839120d',
        ['EndFindVehicle'] = '0x9227415a',
        ['GiveDelayedWeaponToPed'] = '0xB282DC6EBD803C75',
        ['SetVehicleDoorsLockedForAllPlayers'] = '0xA2F80B8D040727CC',
        ['SetVehicleDoorsLockedForPlayer'] = '0x517AAF684BB50CD1',
        ['ModifyVehicleTopSpeed'] = '0x93A3996368C94158',
        ['SetVehicleCheatPowerIncrease'] = '0xB59E4BD37AE292DB',
        ['RemoveWeaponFromPed'] = '0x4899CB088EDF59B8',
        ['DrawLine'] = '0x6B7256074AE34680',
        ['GetEntityVelocity'] = '0x4805D2B1D8CF94A9',
        ['ApplyForceToEntity'] = '0xC5F68BE9613E2D18',
        ['GetGameplayCamCoord'] = '0x14D6F5678D8F1B37',
        ['GetCurrentPedWeaponEntityIndex'] = '0x3B390A939AF0B5FC',
        ['SetPedToRagdoll'] = '0xAE99FB955581844A',
        ['SetPedCanRagdollFromPlayerImpact'] = '0xDF993EE5E90ABA25',
        ['StatSetInt'] = '0xB3271D7AB655B441',
        ['SetBlipCoords'] = '0xAE2AF67E9D9AF65D',
        ['SetBlipCategory'] = '0x234CDD44D996FD9A',
        ['AddBlipForCoord'] = '0x5A039BB0BCA604B6',
        ['BeginTextCommandSetBlipName'] = '0xF9113A30DE5C6670',
        ['EndTextCommandSetBlipName'] = '0xBC38B49BCB83BC9B',
        ['SetPedCanBeKnockedOffVehicle'] = '0x7A6535691B477C48',
        ['IsEntityAPed'] = '0x524AC5ECEA15343E',
        ['GetEntityPlayerIsFreeAimingAt'] = '0x2975C866E6713290',
        ['SetPedShootsAtCoord'] = '0x96A05E4FB321B1BA',
        ['IsEntityAVehicle'] = '0x6AC7003FA6E5575E',
        ['IsEntityAnObject'] = '0x8D68C8FD0FACA94E',
        ['IsModelAPed'] = '0x75816577FEA6DAD5',
        ['SetVehicleReduceGrip'] = '0x222FF6A823D122E2',
        ['SetVehicleDoorsLocked'] = '0xB664292EAECF7FA6',
        ['TaskVehicleTempAction'] = '0xC429DCEEB339E129',
        ['RenderFakePickupGlow'] = '0x3430676B11CDF21D',
        ['ResetEntityAlpha'] = '0x9B1E824FFBB7027A',
        ['NetworkGetPlayerIndexFromPed'] = '0x6C0E2E0125610278',
        ['IsPedAPlayer'] = '0x12534C348C6CB68B',

        ['GetPedSourceOfDeath'] = '0x93C8B64DEB84728C',
        ['SetPedRandomProps'] = '0xC44AA05345C992C6',
        ['SetPedRandomComponentVariation'] = '0xC8A9481A01E63C28',
        ['SetVehicleAlarmTimeLeft'] = '0xc108ee6f',
        ['GetIsVehicleEngineRunning'] = '0xAE31E7DF9B5B132E',
        ['SetVehicleUndriveable'] = '0x8ABA6AF54B942B95',
        ['TaskVehicleDriveToCoord'] = '0xE2A2AA2F659D77A7',
        ['SetPedCombatRange'] = '0x3C606747B23E497B',
        ['GetIsTaskActive'] = '0xB0760331C7AA4155',
        ['GetPlayerFromServerId'] = '0x344ea166',
        ['PedToNet'] = '0x0EDEC3C276198689',
        ['TaskVehicleDriveWander'] = '0x480142959D337D00',
        ['SetEntityHeading'] = '0x8E2530AA8ADA980E',
        ['TaskWanderStandard'] = '0xBB9CE077274F6A1B',
    },
    distesp = {
    ['visuals-distance'] = {value = 150, max = 2000, min = 0},
    },

    inv = {
    ['Invoke'] = Citizen_InvokeNative,
    ["Thread"] = CreateThread, 
    },
    c = {
        ['settings-MainFade'] = true, 
        ['settings-Fade'] = true,
    },
    checkboxes = {},
    m = {},
    Main = {},
    ComboBoxesT = {
        MultIndex = 1,
        LengMult = 1,
        HpLengMult = 1,
        HpMultIndex = 1,
        ConMultIndex = 1,
        ConLengMult = 1,
        ArmMultIndex = 1,
        ArmLengMult = 1,
        InvsMultIndex = 1,
        InvsLengMult = 1,
        DistMultIndex = 1, 
        DistLengMult = 1,
        FovMultIndex = 1,
        FovLengMult = 1,
        HeadMultIndex = 1, 
        HeadLengMult = 1,
        vehspeedMultIndex = 1,
        vehspeedLengMult = 1,	
        explosiontypeMultIndex = 1,
        explosiontypeLengMult = 1,
        PosMultIndex = 1,
        PosLengMult = 1,
        GifMultIndex = 1, 
        GifLengMult = 1,
        addonMultIndex = 1,
        addonLengMult = 1,
        PedsMultIndex = 1,
        PedsLengMult = 1,
        EspDistMultIndex = 1,
        InfoFontLengMult = 1,
        InfoFontMultIndex = 1,
        EspDistLengMult = 1,
        MBindMultIndex = 1,
        MBindLengMult = 1,
        WantedLVLMultIndex = 1,
        WantedLVLLengMult = 1,
        DmgModiMultIndex = 1,
        DmgModiLengMult = 1,
        NCSpeedMultIndex = 1,
        NCSpeedLengMult = 1,
        WepCustMultIndex = 1,
        WepCustLengMult = 1,
        ammoMultIndex = 1,
        ammoLengMult = 1,	
        Playsound1MultIndex = 1,
        Playsound1LengMult = 1,
        Playsound2MultIndex = 1,
        Playsound2LengMult = 1,

        Playsound2 = {"HUD_MINI_GAME_SOUNDSET", "HUD_FRONTEND_DEFAULT_SOUNDSET", "SHORT_PLAYER_SWITCH_SOUND_SET", "LESTER1A_SOUNDS", "MUGSHOT_CHARACTER_CREATION_SOUNDS", "FM_Events_Sasquatch_Sounds", "CAR_STEAL_2_SOUNDSET"},
        NCSpeed = {0.2, 0.4, 0.6, 0.8, 1.0, 1.2, 1.4, 1.6, 1.8, 2.0, 2.2, 2.4, 2.6, 2.8, 3.0},
        DmgModi = {1.0, 5.0, 10.0, 25.0, 50.0, 100.0, 150.0, 200.0, 250.0, 300.0, 350.0, 400.0, 450.0, 500.0, 550.0, 600.0, 650.0, 700.0, 750.0, 800.0, 850.0, 900.0, 950.0, 1000.0},
        EspDist = {100.0, 150.0, 200.0, 250.0, 300.0, 350.0, 400.0, 450.0, 500.0, 550.0, 600.0, 650.0, 700.0, 750.0, 800.0, 850.0, 900.0, 950.0, 1000.0, 1100.0, 1200.0, 1300.0, 1400.0, 1500.0, 1600.0, 1700.0, 1800.0, 1900.0, 2000.0, 2200.0, 2400.0, 2600.0, 2800.0, 3000.0, 3500.0, 4000.0, 5000.0, 6000.0, 7000.0, 8000.0, 9000.0, 10000.0},
        explosiontype = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 40, 43},
        MBind = {'DELETE', 'INSERT', 'HOME', 'PAGEUP', 'PAGEDOWN'},
        Peds = {'Delder', 'Larks', 'Conde', 'Prodigy', 'Camuga', 'OGG076', 'Dish', 'Theo', 'Goxint', 'Flacko', 'Cat', 'Laundry', 'LuaMenu', 'Pawcio', 'HamMafia'},
        Position = {'Left', 'Middle', 'Right'},
        ammo = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 140, 160, 180, 200, 210, 220, 230, 240, 250, 255},
        vehspeed = {'x1', 'x2', 'x3', 'x4', 'x5', 'x6'},
        Head = {'Head', 'Body', 'Left knee', 'Right knee', 'Left foot', 'Right foot'},
        WepCust = {'Suppressor', 'Flashlight', 'Extended Magazine', 'Grip', 'Scope', 'Special Finish'},
        InfoFont = {0, 1, 2, 3, 4, 5, 6, 7},
        Fov = {'50', '100', '150', '200', '400', '600', '800', '1000', '1100', '1300', '1500'},
        Distance = {'100', '200', '400', '600', '800', '1000'},
        SpeedLabels = {'Default', '+20%', '+40%', '+60%', '+100%'},
        Contributors = {'bäärs#3150', 'Delder', 'Alky', 'BMD (Graphics)'},
        Gif = {'default', 'nyan', 'blue', 'sun'},
        HpValue = {"100%", "80%", "60%", "40%", "20%", "0%"},
        ArmourValue = {"0%", "20%", "40%", "60%", "80%", "100%"},
        InvsValue = {"100%", "80%", "60%", "40%", "20%", "0%"},

        MBindVal = {178, 121, 213, 10, 11},
        PedsP = {'u_m_m_jesus_01', 's_f_y_stripper_01', 'u_m_y_mani', 'u_m_o_filmnoir', 'a_m_m_beach_01', 'a_m_y_acult_01', 'a_m_m_mlcrisis_01', 'csb_porndudes', 'cs_stretch', 'cs_priest', 'a_m_m_beach_02', 'a_m_m_og_boss_01', 'a_m_m_acult_01', 's_m_m_movspace_01', 'a_c_rat'},
        PosValue = {0.0175, 0.4, 0.74},
        SpeedMultiplier = {1.1, 1.2, 1.4, 1.8, 2.6},
        HpSet = {200, 140, 128, 110, 81, 0},
        ArmSet = {0, 20, 40, 60, 80, 100},
        VehSet = {9.8, 18.8, 27.8, 36.8, 45.8, 54.8},
        Bone = {31086, 0, 63931, 36864, 14201, 52301},
        InvsSet = {255, 200, 175, 150, 125, 0},
        WantedLVL = {0, 1, 2, 3, 4, 5},
    }, 
    Global = { 
        Alpha = 0,
        TextAlpha = 0,
        UseCustom = true,
        ShootingModes = {
            'weapon_pistol', 'weapon_stungun', 
            'weapon_assaultrifle', 'weapon_sniperrifle', 
            'weapon_raypistol', 'weapon_RPG', 
            'weapon_grenadelauncher'
        },
        CurrentShooting = 1, 
        FreecamMode = 1,
        FreecamModes = {
            "Particle Spam", "Teleport",
            "Shooting", "Spawner",
            "Prop Spawner ", "Place fire",
            "Ram vehicle", "Deleter",
            "Shit spawner", "Ped spawner",

            },
        },
        s = {
            ['player-smart-health'] = {max = 100, min = 0, value = 100},
            ['player-smart-health-time'] = {max = 15000, min = 0, value = 2500},
            ['player-smart-armor'] = {max = 100, min = 0, value = 100},
            ['player-smart-armor-time'] = {max = 15000, min = 0, value = 2500},
            ['player-superrun'] = {max = 10.0, min = 0.0, value = 1.0},
            ['player-superrun-slide'] = {max = 50.0, min = 0.0, value = 5.0},
            ['player-superjump'] = {max = 50.0, min = 0.0, value = 6.0},
            ['player-freecam-fov'] = {max = 130.0, min = 0.0, value = 50.0}, 
            ['self-gameplay-fov'] = {max = 130.0, min = 0.0, value = 50.0},
            ['player-freecam-sensitivity'] = {max = 15.0, min = 0.0, value = 8.0},
            ['player-freecam-speed'] = {max = 2.0, min = 0.0, value = 0.5},
            ['vehicle-color-r'] = {value = 255, max = 255, min = 0},
            ['vehicle-color-g'] = {value = 255, max = 255, min = 0},
            ['vehicle-color-b'] = {value = 255, max = 255, min = 0},
            ['npcvehicle-color-r'] = {value = 255, max = 255, min = 0},
            ['npcvehicle-color-g'] = {value = 255, max = 255, min = 0},
            ['npcvehicle-color-b'] = {value = 255, max = 255, min = 0},
            ['explode-all-button'] = {value = 7, max = 72, min = 0},
            ['explode-all-loop'] = {value = 7, max = 72, min = 0},
            ['player-noclip-value'] = {value = 1.0, max = 100.0, min = 0},
            ['glife-noclip-value'] = {value = 10.0, max = 100.0, min = 0},
            ['glife-prop-value'] = {value = 200, max = 255, min = 0},
            ['exglife-noclip-value'] = {value = 0.8, max = 100.0, min = 0},
            ['checkbox-check-r'] = {value = 0, max = 255, min = 0},
            ['checkbox-check-g'] = {value = 255, max = 255, min = 0},
            ['checkbox-check-b'] = {value = 0, max = 255, min = 0},
            ['checkbox-r'] = {value = 255, max = 255, min = 0},
            ['checkbox-g'] = {value = 0, max = 255, min = 0},
            ['checkbox-b'] = {value = 0, max = 255, min = 0},
        },
        NotiQ = {
            text = {},
            timeout = {},
        },
        Table = {
            LumPack = table.pack,
            LumInsert = table.insert,
            LumUnPack = table.unpack,
            LumSort = table.sort,
            LumRemove = table.remove,
            LumMsgPack = msgpack.pack,
            LumMsgUnpack = msgpack.unpack
        },
        idk = {
    FreeCamScale,
    },
    Sliders = {
        ['Sprint'] = {min = 0, max = 5, value = 1}, 
        ['VehSpeed'] = {min = 0, max = 255, value = 9},
        ['InvsAlpha'] = {min = 0, max = 255, value = 255}, 
        ['AimFov'] = {min = 0, max = 1000, value = 50}, 
        ['EspDistance'] = {min = 0, max = 10000, value = 250}, 
        ['AimDist'] = {min = 0, max = 1000, value = 250}, 
        ['AimDistFov'] = {min = 0, max = 150, value = 50},
        ['CustomDamage'] = {min = 1, max = 1000, value = 1}, 
        ['NoclipSpeed'] = {min = 0, max = 30, value = 2},
        ['gameplay-fov-changer'] = {min = 0, max = 1, value = 2},
        ['Forcemagnetoo'] = {min = 0, max = 50, value = 2},
        ['AlphaInvisible'] = {min = 0, max = 30, value = 2},
        ['CustomAmmo'] = {min = 0, max = 250, value = 250}, 
        ['ExplodeType'] = {min = 0, max = 43, value = 1},
        ['AimSmooth'] = {min = 0, max = 200, value = 124},
        ['HealthVal'] = {min = 0, max = 100, value = 100},
        ['ArmVal'] = {min = 0, max = 100, value = 0},
        ['FuelVal'] = {min = 0, max = 100, value = 100},
        ['MainR'] = {min = 0, max = 255, value = 166},
        ['MainG'] = {min = 0, max = 255, value = 0},
        ['MainB'] = {min = 0, max = 255, value = 255},
        ['MainA'] = {min = 0, max = 255, value = 100},
    },
    fodaseaimbot = {
    KeyboardDragXWM = 0.0, 
	KeyboardDragYWM = 0.0, 
},

        __KentasStrings__ = {
            -- strings
            ['string:upper'] = string.upper,
            ['string:lower'] = string.lower,
            ['string:format'] = string.format,
            ['string:tonumber'] = tonumber,
            ['string:tostring'] = tostring,
            ['string:pairs'] = pairs,
    
            ['string:find'] = string.find,
            ['string:sub'] = string.sub,
            ['string:gsub'] = string.gsub,
            ['string:quat'] = quat,
            ['string:vector3'] = vector3,
            ['string:type'] = type,
            ['table:unpack'] = table.unpack,
            ['table:insert'] = table.insert,
            ['table:remove'] = table.remove,
            ['msgpack:unpack'] = msgpack.unpack,
            ['msgpack:pack'] = msgpack.pack,
            
        },
        CustomKeysTable = {
            ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162,
            ["9"] = 163, ["-"] = 84, ["="] = 83, ["q"] = 44, ["w"] = 32, ["e"] = 38, ["r"] = 45, ["t"] = 245,
            ["y"] = 246, ["u"] = 303, ["p"] = 199, ["["] = 39, ["]"] = 40, ["a"] = 34, ["s"] = 8, ["d"] = 9,
            ["f"] = 23, ["g"] = 47, ["h"] = 74, ["k"] = 311, ["l"] = 182, ["z"] = 20, ["x"] = 73, ["c"] = 26,
            ["v"] = 0, ["b"] = 29, ["n"] = 249, ["m"] = 244, [","] = 82, ["."] = 81, ["`"] = 243,
        },
}
--------------------------------------------------------------------
-- ENUMARATE PEDS ESP ETC 
--------------------------------------------------------------------
function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePickups()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end
function cw()
	return veiculoo(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
	end
	function EnumeratePeds()
	return veiculoo(FindFirstPed, FindNextPed, EndFindPed)
	end
	local function cw()
	return veiculoo(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
	end
	local function cx()
	return veiculoo(FindFirstObject, FindNextObject, EndFindObject)
end
--------------------------------------------------------------
-- TEXT DO SLIDER 
--------------------------------------------------------------
CockText = function(name,_outl,size,Justification,xx,yy, font)
    if not font then
        font = 0
    end
    if _outl then
        SetTextOutline()
    end
    SetTextFont(font)
    SetTextProportional(1)
    SetTextScale(100.0, size)
    SetTextEdge(1, 0, 0, 0, 255)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringWebsite(name)
    EndTextCommandDisplayText(xx, yy)
end
----------------------------------------------------------------
-- SLIDER
----------------------------------------------------------------
Slider = function(text, x, y, O4v, r, g, b)
    drag_x2 = _FiVe_SeNsE_.Menu.MenuX2-0.5
    drag_y2 = _FiVe_SeNsE_.Menu.MenuY2-0.5
    local x = x +drag_x2
    local y = y +drag_y2
    
    DrawRect(x+0.002, y+0.015, 0.157, 0.007, 178, 178, 178, 255)
    DrawRect(x + 0.0055 + (O4v.value/(O4v.max/0.157)/2) - 0.082, y+0.015, O4v.value/(O4v.max/0.157), 0.007, r, g, b, 255)
    CockText(O4v.value, true, 0.25, false, x + 0.0055 + (O4v.value/(O4v.max/0.157)/1) - 0.085, y + 0.01, 4)
    DrawRect(x+ 0.002+(O4v.value/(O4v.max/0.157)/1)-0.081+0.002, y+0.014, 0.001, 0.010, 150, 150, 150, 255)


    local c_x = GetControlNormal(0, 239)
    local c_y = GetControlNormal(0, 240)

    --0.4229 0.5812
    local Vzs_x, dry_r = x - (0.5 - 0.4229), x + (0.5812 - 0.5)
    if (c_x - x > -0.085) and (c_x - x < 0.085) and (c_y - (y + (0.025/2)) > -(0.025/2)) and (c_y - (y + (0.013/2)) < (0.013/2)) and IsDisabledControlPressed(0, 24) then
        O4v.value = _FiVe_SeNsE_.Math.floor((((c_x) - (Vzs_x)) / (dry_r - Vzs_x) ) * (O4v.max - O4v.min) - O4v.min)
    end
    
    if (c_x - x > -0.085) and (c_x - x < 0.085) and (c_y - y > -0.007) and (c_y - y < 0.007)  then 
        SetTextColour(150, 150, 150, 255)
        CockText(text, false, 0.28, false, x - 0.078, y - 0.008, 4)
        if IsDisabledControlPressed(0, 25) then
            Wait(1000)
            local new_val =  KeyInput("New value", "", 5)
            if new_val ~= nil then
                O4v.value = _FiVe_SeNsE_.Math.tonumber(new_val)
            end
        end
    else
        SetTextColour(255, 255, 255, 255)
        CockText(text, false, 0.28, false, x - 0.078, y - 0.008, 4)
    end

    if O4v.value > O4v.max then
        O4v.value = O4v.max
    elseif O4v.value < O4v.min then
        O4v.value = O4v.min
    end
end
-----------------------------------------------------------------------
-- BGLH DAS KEY INPUT PROVAVELMENTE LISTA DE PLAYERS LOLOL
-----------------------------------------------------------------------
local WM = {
    Menu = {
        MenuX = 0.68,
        MenuY = 0.5
    }
}

local to_add_X = WM.Menu.MenuX - 0.5
local to_add_Y = WM.Menu.MenuY - 0.5

local function KeyInput(TextEntry, ExampleText, MaxStringLength)
    Citizen.InvokeNative(0x32CA01C3, "FMMC_KEY_TIP1", "~b~" .. TextEntry .. ":")
    Citizen.InvokeNative(0x00DC833F2568DBF6, 1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
    blockinput_dihgs8ourigdfg = true
    while Citizen.InvokeNative(0x0CF2B696BBF945AE) ~= 1 and Citizen.InvokeNative(0x0CF2B696BBF945AE) ~= 2 do
        Wait(0)
    end
    if Citizen.InvokeNative(0x0CF2B696BBF945AE) ~= 2 then
        local dfjs8erfdfg = GetOnscreenKeyboardResult()
        Wait(200)
        blockinput_dihgs8ourigdfg = false
        return dfjs8erfdfg
    else
        Wait(200)
        blockinput_dihgs8ourigdfg = false
        return nil
    end
end

local function GetTextWidht(str, font, scale)
    BeginTextCommandWidth("STRING")
    AddTextComponentSubstringPlayerName(str)
    SetTextFont(font or 4)
    SetTextScale(scale or 0.35, scale or 0.35)
    local length = EndTextCommandGetWidth(1)
    return length
end
------------------------------------------------------------------------
-- QUADRADO DE MUDAR AS CORES DE ESP 
------------------------------------------------------------------------
local function text2(name,sagwaa,size,Justification,xx,yy)
    if sagwaa then 
        SetTextOutline() 
    end
    SetTextScale(0.50,size) SetTextColour(128, 76, 217, 255)
    SetTextFont(4) SetTextProportional(0) 
    SetTextJustification(Justification)
    SetTextEntry("string") 
    AddTextComponentString(name)
    DrawText(xx,yy)
end

local function text3(name, outline, size, Justification, xx, yy)
    if outline then
        SetTextOutline()
    end
    SetTextScale(0.00, size)
    SetTextColour(255, 255, 255, 255)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextJustification(Justification)
    SetTextEntry("string")
    AddTextComponentString(name)
    DrawText(xx, yy)
end

local function Butao2(name, outline, xx, yy)
    local x, y = GetNuiCursorPosition()
    local x_res, y_res = GetActiveScreenResolution()
    text3(name, outline, 0.38, 0, xx, yy - 0.014)
    DrawRect(xx, yy, 0.0056, 0.0096, esp_box_cor.r, esp_box_cor.g, esp_box_cor.b, 255)
    if
        ((x / x_res) + 0.02 >= xx and (x / x_res) - 0.035 <= xx and (y / y_res) + 0.015 >= yy and
            (y / y_res) - 0.015 <= yy)
     then
        DrawRect(xx, yy, 0.0056, 0.0096, esp_box_cor.r, esp_box_cor.g, esp_box_cor.b, 255)
        if IsDisabledControlJustReleased(0, 92) then
            return true
        end
    else
        DrawRect(xx, yy, 0.0056, 0.0096, esp_box_cor.r, esp_box_cor.g, esp_box_cor.b, 255)
        return false
    end
end

local function Butao8(name, outline, xx, yy)
    local x, y = GetNuiCursorPosition()
    local x_res, y_res = GetActiveScreenResolution()
    text3(name, outline, 0.38, 0, xx, yy - 0.014)
    DrawRect(xx, yy, 0.0056, 0.0096, esp_nome_cor.r, esp_nome_cor.g, esp_nome_cor.b, 255)
    if
        ((x / x_res) + 0.02 >= xx and (x / x_res) - 0.035 <= xx and (y / y_res) + 0.015 >= yy and
            (y / y_res) - 0.015 <= yy)
     then
        DrawRect(xx, yy, 0.0056, 0.0096, esp_nome_cor.r, esp_nome_cor.g, esp_nome_cor.b, 255)
        if IsDisabledControlJustReleased(0, 92) then
            return true
        end
    else
        DrawRect(xx, yy, 0.0056, 0.0096, esp_nome_cor.r, esp_nome_cor.g, esp_nome_cor.b, 255)
        return false
    end
end

local function Butao77(name, outline, xx, yy)
    local x, y = GetNuiCursorPosition()
    local x_res, y_res = GetActiveScreenResolution()
    text3(name, outline, 0.38, 0, xx, yy - 0.014)
    DrawRect(xx, yy, 0.0056, 0.0096, esp_skel_cor.r, esp_skel_cor.g, esp_skel_cor.b, 255)
    if
        ((x / x_res) + 0.02 >= xx and (x / x_res) - 0.035 <= xx and (y / y_res) + 0.015 >= yy and
            (y / y_res) - 0.015 <= yy)
     then
        DrawRect(xx, yy, 0.0056, 0.0096, esp_skel_cor.r, esp_skel_cor.g, esp_skel_cor.b, 255)
        if IsDisabledControlJustReleased(0, 92) then
            return true
        end
    else
        DrawRect(xx, yy, 0.0056, 0.0096, esp_skel_cor.r, esp_skel_cor.g, esp_skel_cor.b, 255)
        return false
    end
end
--------------------------------------------------------
-- MENU SE MEXENDO 
--------------------------------------------------------
BielX = {
    MenuX = 0.5, MenuY = 0.5,
    MenuX2 = 0.5, MenuY2 = 0.5,
    MenuW = 0.5, MenuH = 0.5,
}

Dragbar = function()
    local c_x, c_y = GetNuiCursorPosition() 
    local widht, height = GetActiveScreenResolution()
    c_x = c_x / widht
    c_y = c_y / height 
    local res_w, res_h = BielX.MenuW-0.5, BielX.MenuH-0.5

    if (c_x >= BielX.MenuX - 0.19 and c_y >= BielX.MenuY - 0.2 and c_x <= BielX.MenuX + 0.2+res_w and c_y < BielX.MenuY - 0.110+res_h) and IsDisabledControlJustPressed(0, 24) then 
        _x = BielX.MenuX - c_x
        _y = BielX.MenuY - c_y
        dragging_allowed = true
    elseif IsDisabledControlReleased( 0, 24) then
        dragging_allowed = false
    end

    if dragging_allowed then
        BielX.MenuX = c_x + _x
        BielX.MenuY = c_y + _y
    end
end
BielX_DrawText = function(text, x, y, _outl, size, font, centre)
    SetTextFont(0)
    if _outl then
        SetTextOutline(true)
    end
    if tonumber(font) ~= nil then
        SetTextFont(font)
    end
    SetTextCentre(centre)
    SetTextScale(100.0, size or 0.23)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringWebsite(text)
    EndTextCommandDisplayText(x, y)
end
-------------------------------------------------------------------
-- BOTAO E TEXT DESNECESSARIO DPS VOU TIRAR ALGUMAS
-------------------------------------------------------------------
local function Butaodomag(name, outline, xx, yy)
    local x, y = GetNuiCursorPosition()
    local x_res, y_res = GetActiveScreenResolution()
    text3(name, outline, 0.38, 0, xx, yy - 0.014)
    DrawRect(xx, yy, 0.0056, 0.0096, magneto_cor.r, magneto_cor.g, magneto_cor.b, 255)
    if
        ((x / x_res) + 0.02 >= xx and (x / x_res) - 0.035 <= xx and (y / y_res) + 0.015 >= yy and
            (y / y_res) - 0.015 <= yy)
     then
        DrawRect(xx, yy, 0.0056, 0.0096, magneto_cor.r, magneto_cor.g, magneto_cor.b, 255)
        if IsDisabledControlJustReleased(0, 92) then
            return true
        end
    else
        DrawRect(xx, yy, 0.0056, 0.0096, magneto_cor.r, magneto_cor.g, magneto_cor.b, 255)
        return false
    end
end

local function Butao(name, outline, xx, yy)
    text3(name, outline, 0.34, 0, xx, yy - 0.014)
    local x, y = GetNuiCursorPosition()
    local x_res, y_res = GetActiveScreenResolution()
    if
        ((x / x_res) + 0.02 >= xx and (x / x_res) - 0.035 <= xx and (y / y_res) + 0.015 >= yy and
            (y / y_res) - 0.015 <= yy)
     then
       -- DrawRect(xx, yy, 0.1058, 0.0298, 55, 55, 55, 255)
        if IsDisabledControlJustReleased(0, 92) then
            return true
        end
    else
      --  DrawRect(xx, yy, 0.1058, 0.0298, 35, 35, 35, 255)
        return false
    end
end



local function fontseparator(name, outline, size, Justification, xx, yy)
    if outline then
        SetTextOutline()
    end
    SetTextScale(0.00, size)
    SetTextColour(255, 255, 255, 255)
    SetTextFont(1)
    SetTextProportional(0)
    SetTextJustification(Justification)
    SetTextEntry("string")
    AddTextComponentString(name)
    DrawText(xx, yy)
end

local function Separator(name, outline, xx, yy)
    fontseparator(name, outline, 0.34, 0, xx, yy - 0.014)
    local x, y = GetNuiCursorPosition()
    local x_res, y_res = GetActiveScreenResolution()
    if
        ((x / x_res) + 0.02 >= xx and (x / x_res) - 0.035 <= xx and (y / y_res) + 0.015 >= yy and
            (y / y_res) - 0.015 <= yy)
     then
       -- DrawRect(xx, yy, 0.1058, 0.0298, 55, 55, 55, 255)
        if IsDisabledControlJustReleased(0, 92) then
            return true
        end
    else
      --  DrawRect(xx, yy, 0.1058, 0.0298, 35, 35, 35, 255)
        return false
    end
end


-------------------------------------------------------------
-- cabou 
-------------------------------------------------------------

function text(nazwa, outline, size, Justification, xx, yy, centre, font)
    if outline then
        SetTextOutline()
    end
    if font ~= nil and tonumber(font) ~= nil then
        SetTextFont(font)
    else
        SetTextFont(0)
    end
    if centre then
        SetTextCentre(true)
    end
    SetTextProportional(1)
    SetTextScale(100.0, size)
    SetTextEdge(1, 0, 0, 227, 255)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringWebsite(nazwa)
    EndTextCommandDisplayText(xx, yy)
end

local function AddVectors(one, two)
    return vector3(one.x + two.x, one.y + two.y, one.z + two.z)
end

local function veiculoo(cp, cq, cr)
    return coroutine.wrap(
        function()
            local cs, ct = cp()
            if not ct or ct == 0 then
                cr(cs)
                return
            end
            local cu = {handle = cs, destructor = cr}
            setmetatable(cu, entityEnumerator)
            local cv = true
            repeat
                coroutine.yield(ct)
                cv, ct = cq(cs)
            until not cv
            cu.destructor, cu.handle = nil, nil
            cr(cs)
        end
    )
end

local function RotationToDirection(rotation)
    local retz = math.rad(rotation.z)
    local retx = math.rad(rotation.x)
    local absx = math.abs(math.cos(retx))
    return vector3(-math.sin(retz) * absx, math.cos(retz) * absx, math.sin(retx))
end

function cw()
    return veiculoo(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

local function cx()
    return veiculoo(FindFirstObject, FindNextObject, EndFindObject)
end

local function PlayerButaos(text, x, y, outline)
    local cursor_x, cursor_y = GetNuiCursorPosition()
    local widht, height = GetActiveScreenResolution()
    cursor_x = cursor_x / widht
    cursor_y = cursor_y / height
    local widht = GetTextWidht(text, 0, 0.2)
    if
        ((cursor_x) + 0.03 >= x + to_add_X and (cursor_x) - 0.1 <= x + to_add_X and (cursor_y) + 0.009 >= y + to_add_Y and
            (cursor_y) - 0.009 <= y + to_add_Y)
     then
        SetTextColour(cordomenu.r, cordomenu.g, cordomenu.b, 255)
        DrawText(text, x + to_add_X - 0.028, y + to_add_Y - 0.0003, outline, 0.35, 4, true)
    else
        DrawText(text, x + to_add_X - 0.028, y + to_add_Y - 0.0003, outline, 0.35, 4, true)
    end
    
    if
        ((cursor_x) + 0.03 >= x + to_add_X and (cursor_x) - 0.1 <= x + to_add_X and (cursor_y) + 0.009 >= y + to_add_Y and
            (cursor_y) - 0.009 <= y + to_add_Y and
            IsDisabledControlJustReleased(0, 92))
     then
        
        return true
    else
        return false
    end
end


function TeleportToPlayer()
    local ped = GetPlayerPed(SelectedPlayer)
    local pos = GetEntityCoords(ped)
    SetEntityCoords(PlayerPedId(), pos)
end

function copiarroupa()
    model = GetEntityModel(GetPlayerPed(SelectedPlayer))
    ClonePedToTarget(GetPlayerPed(SelectedPlayer), PlayerPedId())
end

function tabsmenu(id, nazwa, outline, xx, yy)
    local x, y = GetNuiCursorPosition()
    text(nazwa, outline, 0.26, 0, xx, yy - 0.01, true, 10)
    local x, y = GetNuiCursorPosition()
    local x_res, y_res = GetActiveScreenResolution()
    local yy2 = yy
    if id == tab then
        DrawRect(yy, 0.2298, 0.04580, 0.0015, cordomenu.r, cordomenu.g, cordomenu.b, 0)
    end
    if
        ((x / x_res) + 0.030 >= xx and (x / x_res) - 0.029 <= xx and (y / y_res) + 0.009 >= yy and
            (y / y_res) - 0.01 <= yy) and
            IsDisabledControlJustReleased(0, 92)
     then
        return true
    end
    return false
end

local function DrawText(text, x, y, outline, size, font, centre)
    SetTextFont(0)
    if outline then
        SetTextOutline(true)
    end
    if tonumber(font) ~= nil then
        SetTextFont(font)
    end
    if centre then
        SetTextCentre(true)
    end
    SetTextScale(100.0, size or 0.23)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringWebsite(text)
    EndTextCommandDisplayText(x, y)
end

function spawnarveiculo()
    local cb = KeyInput('~p~Nome Do ~w~Veiculo', '', 25)
    local rg
    if rg2 then
        rg = rg2
    else
        notification("Sete o RG Primeiro")
    end
    if cb and IsModelValid(cb) and IsModelAVehicle(cb) and rg then
        RequestModel(cb)
        while not HasModelLoaded(cb) do
            Wait(0)
        end
        local aB = GetEntityCoords(PlayerPedId())
        local aC = GetEntityForwardX(PlayerPedId())
        local aD = GetEntityForwardY(PlayerPedId())
        local aE = GetEntityHeading(PlayerPedId())
        local veh = CreateVehicle(GetHashKey(cb), aB.x + aC * 1.9, aB.y + aD * 5, aB.z, aE, 1, 1)
        if rg ~= "" then
            SetVehicleNumberPlateText(veh, rg)
        end
    end
end

function spawnMoto()
	local mhash = "kuruma"
	if not nveh5 then
	 while not HasModelLoaded(mhash) do
	  RequestModel(mhash)
	    Citizen.Wait(10)
	 end
		local ped = PlayerPedId()
		local x,y,z = vRP.getPosition()
        SetPedIntoVehicle(PlayerPedId(), veh, -1) 
		nveh5 = CreateVehicle(mhash,-1166.6,-888.7,14.1+0.5,190.20,true,false)
		SetVehicleIsStolen(nveh5,false)
		SetVehicleOnGroundProperly(nveh5)
		SetVehicleNumberPlateText(nveh5,vRP.getRegistrationNumber())
		Citizen.InvokeNative(0xAD738C3085FE7E11,nveh5,true,true)
		SetVehicleHasBeenOwnedByPlayer(nveh5,true)
		SetVehicleDirtLevel(nveh5,0.0)
		SetVehRadioStation(nveh5,"OFF")
		SetVehicleEngineOn(GetVehiclePedIsIn(ped,false),true)
		SetModelAsNoLongerNeeded(mhash)
	end
end

function engine1(veh)
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

function tpvehgayzick()
    local cA = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 15.0, 0, 70)
    if not DoesEntityExist(cA) then
    return
end
    local dO = -1
    TaskWarpPedIntoVehicle(PlayerPedId(), cA, dO)
    Citizen.Wait(100)
    SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
    SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
    SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
    Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
end

function setarrg()

    
    local rg = KeyInput("~p~Coloque o ~w~Rg", "", 25)
    if rg ~= "" then
        rg2 = rg
    else
        rg2 = false
    end
end

function alterarplaca()
    local plateInput = KeyInput("~p~Coloque o ~w~Rg", "", 25)
    local playerVeh = GetVehiclePedIsIn(PlayerPedId(), true)
    if plateInput then
        SetVehicleNumberPlateText(playerVeh, plateInput)
    end
end

function vehplayer()
    local MassCars = KeyInput("~p~Nome do ~w~Veiculo", "", 20)
        local plaquinha = KeyInput("~p~Coloque o ~w~Rg", "", 8)
        local coord = GetEntityCoords(GetPlayerPed(SelectedPlayer))
        local MassCars = {"".. MassCars ..""}
        local CrashCar = (MassCars[math.random(#MassCars)])
        if not HasModelLoaded(GetHashKey(CrashCar)) then 
           RequestModel(GetHashKey(CrashCar))
        end 
        for v = 1, 100 do 
           local veh = CreateVehicle(GetHashKey(CrashCar), coord, 1, 1, 1)
        SetVehicleNumberPlateText(veh, "zickmenu")
    end
end

function RapePlayer(player)
    local rmodel = "a_m_y_acult_01"
    local ped = GetPlayerPed(SelectedPlayer)
    local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(SelectedPlayer), 0.0, 8.0, 0.5)
    local x = coords.x
    local y = coords.y
    local z = coords.z
    RequestModel(GetHashKey(rmodel))
    local nped = CreatePed(31, rmodel, x, y, z, 0.0, true, true)
    SetPedComponentVariation(nped, 4, 0, 0, 0)
    SetPedKeepTask(nped)
    AttachEntityToEntity(nped, ped, 0, 0.0, -0.3, 0.0, 0.0, 0.0, 0.0, true, true, true, true, 0, true)
end

local function text4(name, outline, size, Justification, xx, yy, font)
    if outline then
        SetTextOutline()
    end
    if font ~= nil and tonumber(font) ~= nil then
        SetTextFont(font)
    else
        SetTextFont(6)
    end
    SetTextProportional(1)
    SetTextScale(100.0, size)
    SetTextEdge(1, 0, 0, 227, 255)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringWebsite(name)
    EndTextCommandDisplayText(xx, yy)
end

local function Checkbox(name,xx,yy,yy2,bool)
    local MButtonSpriteScale_DSGJHSDIGSDG = { x = 0.017, y = 0.12 }
    local x,y = GetNuiCursorPosition()
    local x_res, y_res = GetActiveScreenResolution()
    local xx2 = xx-0.012
    local yy2 = yy+0.0020
    if bool then
        DrawRect(xx2,yy2,0.0080,0.012,0, _FiVe_SeNsE_.Sliders['MainR'].value,  _FiVe_SeNsE_.Sliders['MainG'].value, _FiVe_SeNsE_.Sliders['MainB'].value, _FiVe_SeNsE_.Sliders['MainA'].value)
    else
        DrawRect(xx2,yy2,0.0080,0.0138,30,30,30,255)
        DrawRect(xx2,yy2,0.007,0.012,20,20,20,255)
    end
    text4(name,false,0.35,0,xx,yy - 0.010, 6)
    if( (x / x_res) + 0.030 >= xx and (x / x_res) - 0.029 <= xx and (y / y_res) + 0.009 >= yy and (y / y_res) - 0.01 <= yy) and IsDisabledControlJustReleased(0, 92) then 
        bool = not bool

        return true
end
    return false
end


local function Checkboxaimbot(name,xx,yy,yy2,bool)
	local MButtonSpriteScale_DSGJHSDIGSDG = { x = 0.01, y = 0.01 }
	local x,y = GetNuiCursorPosition()
	local x_res, y_res = GetActiveScreenResolution()
	local xx2 = xx-0.01
    local yy2 = yy+0.001
	if bool then
	DrawSprite("commonmenu", "common_medal", xx2, yy2, 0.01, 0.023, 0.0, 255, 0, 0, 255)
	else
    DrawSprite("commonmenu", "common_medal", xx2, yy2, 0.01, 0.023, 0.0, 255, 255, 255, 255)
    DrawSprite("commonmenu", "common_medal", xx2, yy2, 0.01, 0.023, 0.0, 255, 255, 255, 255)
	end
	text4(name,false,0.35,0,xx,yy - 0.010, 6) ------------ TAMANHO DAS LETRAS DA BOX 
	if( (x / x_res) + 0.030 >= xx and (x / x_res) - 0.029 <= xx and (y / y_res) + 0.009 >= yy and (y / y_res) - 0.01 <= yy) and IsDisabledControlJustReleased(0, 92) then 
		Citizen.InvokeNative(0x67C540AA08E4A6F5, -1, "COMPUTERS_MOUSE_CLICK", 0, 1)
		bool = not bool
		
		return true
end
	return false
end


local function TeleportToWaypoint()
    local entity = PlayerPedId()
    if IsPedInAnyVehicle(entity, false) then
        entity = GetVehiclePedIsUsing(entity)
    end
    local blipFound = false
    local blipIterator = GetBlipInfoIdIterator()
    local blip = GetFirstBlipInfoId(8)
    while DoesBlipExist(blip) do
        if GetBlipInfoIdType(blip) == 4 then
            cx, cy, cz =
                table.unpack(
                Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ReturnResultAnyway(), Citizen.ResultAsVector())
            )
            blipFound = true
            break
        end
        blip = GetNextBlipInfoId(blipIterator)
        Wait(0)
    end
    if blipFound then
        local yaw = GetEntityHeading(entity)
        SetEntityCoordsNoOffset(entity, cx, cy, cz, false, false, false)
    end
end

function GetScreenSize()
    local x, y = GetActiveScreenResolution()
    return {x = x, y = y}
end

function Rectangle(x, y, a9, aa, r, g, b, ab)
    local ac, ad = GetActiveScreenResolution()
    local ae, af = 1 / ac, 1 / ad
    local ag, ah = ae * x, af * y
    local ai, aj = ae * a9, af * aa
    DrawRect(ag + ai / 2, ah + aj / 2, ai, aj, r, g, b, ab)
end

function hsvToRgb(aa, ak, al, ab)
    local r, g, b
    local l = math.floor(aa * 6)
    local am = aa * 6 - l
    local an = al * (1 - ak)
    local ao = al * (1 - am * ak)
    local ap = al * (1 - (1 - am) * ak)
    l = l % 6
    if l == 0 then
        r, g, b = al, ap, an
    elseif l == 1 then
        r, g, b = ao, al, an
    elseif l == 2 then
        r, g, b = an, al, ap
    elseif l == 3 then
        r, g, b = an, ao, al
    elseif l == 4 then
        r, g, b = ap, an, al
    elseif l == 5 then
        r, g, b = al, an, ao
    end
    return math.floor(r * 255 + 0.5), math.floor(g * 255 + 0.5), math.floor(b * 255 + 0.5), math.floor(
        ab * 255
    )
end

function Gradient(x, y, a9, aa, aq, r, g, b, ab, ar, as, at, au)
    if aq then
        for l = 0, a9, 2 do
            if l > a9 then
                break
            end
            local ab = math.floor((au - ab) / a9 * l + ab)
            Rectangle(x + l, y, l < a9 - 1 and 2 or 1, aa, ar, as, at, math.abs(ab))
        end
    else
        for l = 0, aa, 2 do
            if l > aa then
                break
            end
            local ab = math.floor((au - ab) / aa * l + ab)
            Rectangle(x, y + l, a9, l < aa - 1 and 2 or 1, ar, as, at, math.abs(ab))
        end
    end
end

function HSVGradient(x, y, a9, aa, aq, av, aw, ax, ay, az, aA)
    Rectangle(x, y, a9, aa, hsvToRgb(av, aw, ax, 1))
    if aq then
        for l = 0, a9, 2 do
            local aB, ak, al = (ay - av) / a9 * l + av, (az - aw) / a9 * l + aw, (aA - ax) / a9 * l + ax
            Rectangle(x + l, y, 2, aa, hsvToRgb(aB, ak, al, 1))
        end
    else
        for l = 0, aa, 2 do
            local aB, ak, al = (ay - av) / aa * l + av, (az - aw) / aa * l + aw, (aA - ax) / aa * l + ax
            Rectangle(x, y + l, a9, 2, hsvToRgb(aB, ak, al, 1))
        end
    end
end

function DrawRecterinio(x, y, a9, aa, r, g, b, ab)
    resX, resY = GetActiveScreenResolution()
    local aC, aB = a9 / resX, aa / resY
    local _x, _y = x / resX + aC / 2, y / resY + aB / 2
    DrawRect(_x, _y, aC, aB, r, g, b, ab)
end

function Mouse(aD)
    local x, y = GetNuiCursorPosition()
    local a9, aa = GetActiveScreenResolution()
    if aD then
        x = x / a9
        y = y / aa
    end
    return {x = x, y = y}
end

local function aE(m, x, y, aF, aG, aH, aI)
    SetTextScale(0.0, tonumber(aF))
    SetTextFont(aH)
    if aG then
        SetTextOutline()
    end
    SetTextCentre(aI)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringWebsite(m)
    EndTextCommandDisplayText(x, y)
    return EndTextCommandGetWidth(true)
end

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(
        function()
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
        end
    )
end

function DrawTextOutline(text, x, y, scale, font, outline, center, r, g, b)
    SetTextScale(0.0, scale)
    SetTextFont(font)
    if outline then
        SetTextOutline(outline)
    else
    end
    SetTextCentre(center)
    SetTextColour(r, g, b, 255)
    BeginTextCommandDisplayText("TWOSTRINGS")
    AddTextComponentString(text)
    EndTextCommandDisplayText(x, y - 0.011)
end


function text_szpachlan_szmata(
    nazwa_szpachlan_szmata,
    outline_szpachlan_szmata,
    size_szpachlan_szmata,
    Justification_szpachlan_szmata,
    x,
    y,
    czcionka,
    centre)
    if outline_szpachlan_szmata then
        SetTextOutline()
    end
    if czcionka ~= nil and tonumber(czcionka) ~= nil then
        SetTextFont(czcionka)
    else
        SetTextFont(0)
    end
    if centre then
        SetTextCentre(true)
    end
    SetTextProportional(1)
    SetTextScale(100.0, size_szpachlan_szmata)
    SetTextEdge(1, 0, 0, 0, 255)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringWebsite(nazwa_szpachlan_szmata)
    EndTextCommandDisplayText(x, y)
end

function bindzinha()
    local klikniete = nil
    local napis = nil
    local zbindowane = false
    while not zbindowane do
        Wait(0)
        text_szpachlan_szmata("Pressione Uma Tecla", false, 0.45, 0, 0.400, 0.48)
        for k, v in pairs(Keys) do
            if IsDisabledControlPressed(0, v) then
                klikniete = v
                napis = k
            end
        end
        if klikniete ~= nil then
            zbindowane = true
            return klikniete, napis
        end
    end
end

function ColorPicker(R, aJ, aK)
    colorpicker = true
    open = false
    local R = {
        HSV = {H = 0, S = 0, V = 0},
        RGB = {R = R, G = aJ, B = aK},
        Held = {Hue = false, Value = false},
        Opened = false,
        Turned = true
    }
    while R.Turned do
        DisableControlAction(0, 1, true)
        DisableControlAction(0, 2, true)
        DisableControlAction(0, 142, true)
        DisableControlAction(0, 322, true)
        DisableControlAction(0, 106, true)
        DisableControlAction(0, 25, true)
        DisableControlAction(0, 24, true)
        DisableControlAction(0, 257, true)
        DisableControlAction(0, 32, true)
        DisableControlAction(0, 31, true)
        DisableControlAction(0, 30, true)
        DisableControlAction(0, 34, true)
        DisableControlAction(0, 23, true)
        DisableControlAction(0, 22, true)
        DisableControlAction(0, 16, true)
        DisableControlAction(0, 17, true)
        local a9, aa = GetScreenSize().x, GetScreenSize().y
        Rectangle(0, 0, a9, aa, 24, 24, 24, 200)
        local aL, aM = a9 / 2 - 100, aa / 2 - 100
        Rectangle(aL - 2, aM - 2, 204, 208, 18, 18, 18, 255)
        Rectangle(aL - 1, aM - 1, 202, 206, 42, 42, 42, 255)
        Rectangle(aL, aM, 200, 204, 24, 24, 24, 255)
        Rectangle(aL, aM, 200, 5, R.RGB.R, R.RGB.G, R.RGB.B, 255)
        local r, g, b, ab = hsvToRgb(R.HSV.H, R.HSV.S, R.HSV.V, 1)
        aE("R: " .. r .. " G: " .. g .. " B: " .. b .. "", 0.451, 0.59, 0.29, true, 4, false)
        local r, g, b, ab = hsvToRgb(R.HSV.H, 1, 1, 1)
        Rectangle(aL + 10, aM + 10, 160, 180, r, g, b, 255)
        Gradient(aL + 10, aM + 10, 160, 180, true, r, g, b, 255, 255, 255, 255, 0)
        Gradient(aL + 10, aM + 10, 160, 180, false, 255, 255, 255, 0, 0, 0, 0, 255)
        HSVGradient(aL + 20 + 160, aM + 10, 10, 180, false, 0, 1, 1, 1, 1, 1)
        local x, y = GetNuiCursorPosition()
        local a9, aa = GetScreenSize().x, GetScreenSize().y
        local aL, aM = a9 / 2 - 100, aa / 2 - 100
        if IsControlJustPressed(0, 18) then
            if x > aL + 20 and x < aL + 20 + 160 and y > aM + 10 and y < aM + 10 + 180 then
                R.Held.Value = true
            end
            if x > aL + 20 + 160 and x < aL + 20 + 160 + 10 and y > aM + 10 and y < aM + 10 + 180 then
                R.Held.Hue = true
            end
            if x < aL or x > aL + 200 or y < aM or y > aM + 200 then
                R.Opened = false
            end
        end
        if IsDisabledControlPressed(0, 69) then
            if R.Held.Value then
                local aN = x - aL - 10
                local aO = y - aM - 60
                R.HSV.S = math.clamp(aN / 180, 0, 1)
                R.HSV.V = math.clamp(1 - aO / 160, 0, 1)
            end
            if R.Held.Hue then
                local aP = y - aM + -19
                R.HSV.H = math.clamp(aP / 180, 0, 1)
            end
            local r, g, b, ab = hsvToRgb(R.HSV.H, R.HSV.S, R.HSV.V, 1)
            R.RGB.R, R.RGB.G, R.RGB.B = r, g, b
        else
            if R.Held.Value then
                R.Opened = false
            end
            R.Held.Value = false
            R.Held.Hue = false
        end
        DrawRecterinio(Mouse(false).x - 2, Mouse(false).y - 7, 3, 13, 0, 0, 0, 255)
        DrawRecterinio(Mouse(false).x - 7, Mouse(false).y - 2, 13, 3, 0, 0, 0, 255)
        DrawRecterinio(Mouse(false).x - 1, Mouse(false).y - 6, 1, 11, 255, 255, 255, 255)
        DrawRecterinio(Mouse(false).x - 6, Mouse(false).y - 1, 11, 1, 255, 255, 255, 255)
        if IsDisabledControlJustPressed(0, 191) then
            open = true
            colorpicker = false
            R.Turned = false
            return R.RGB.R, R.RGB.G, R.RGB.B
        end
        Wait(0)
    end
end

function deleteallveh()
    delete = not delete
end

local function StripPlayer(target)
    local ped = GetPlayerPed(target)
    RemoveAllPedWeapons(ped, false)
end

local function GiveMaxAmmo(target)
    local ped = GetPlayerPed(target)
    for i = 1, #allweapons do
        AddAmmoToPed(ped, GetHashKey(allweapons[i]), 250)
    end
end

function cargoplrame(custom_vehicle, playa)
    if custom_vehicle then
        RequestModel(GetHashKey(custom_vehicle))
        while not HasModelLoaded(GetHashKey(custom_vehicle)) do
            Wait(0)
        end	
        
        local coords = GetEntityCoords(GetPlayerPed(playa))
        local veh = CreateVehicle(GetHashKey(custom_vehicle), coords.x, coords.y, coords.z , 1, 1, 1)
        local rotation = GetEntityRotation(playa)
            
        SetVehicleEngineOn(veh, true, true, true)
        SetEntityRotation(veh, rotation, 0.0, 0.0, 0.0, true)
        SetVehicleForwardSpeed(veh, 10.0)
    end
end

local function DrawTextoo(text, x, y, outline, size, font, centre)
    SetTextFont(0)
    if outline then
        SetTextOutline(true)
    end
    if tonumber(font) ~= nil then
        SetTextFont(font)
    end
	if centre then
		SetTextCentre(true)
	end
    SetTextColour(128, 76, 217, 255)
    SetTextScale(100.0, size or 0.23)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringWebsite(text)
    EndTextCommandDisplayText(x, y)
end

function DisabilitarTeclas(Disable)
    DisableControlAction(0, 1, true)
    DisableControlAction(0, 2, true)
    DisableControlAction(0, 25, true)
    DisableControlAction(0, 24, true)
    DisableControlAction(0, 257, true)
end
-----------------------------------------------------------------
-- LISTA DE PLAYER
-----------------------------------------------------------------
Zones = function(x, y, w, h)
    local c_x, c_y = GetNuiCursorPosition()  local widht, height = GetActiveScreenResolution() c_x = c_x / widht c_y = c_y / height

    if (c_x > x - (w / 2) and c_y > y - (h / 2) and c_x < x + (w / 2) and c_y < y + (h / 2)) then 
        return true
    else
        return false
    end
end

DrawTextB = function(text, x, y, _outl, size, font, centre) 
    SetTextFont(0) if _outl then 
    SetTextOutline(true) end if _FiVe_SeNsE_.Math.tonumber(font) ~= nil then 
    SetTextFont(font) end 
    SetTextCentre(centre) 
    SetTextScale(100.0, size or 0.23) 
    BeginTextCommandDisplayText("STRING") 
    AddTextComponentSubstringWebsite(text) 
    EndTextCommandDisplayText(x, y) 
    end
    
    
    DrawText = function(x, y) 
    return Citizen_InvokeNative(_FiVe_SeNsE_.Natives['DrawText'], x, y) 
    end


OnlineButton = function(x, y, _outl, id, name)
    local x = x+drag_x2
    local y = y+drag_y2
    DrawTextB("ID: "..id.." | "..name, x+0.090+drag_x, y+0.100+drag_y, _outl, 0.3, 4, true)
    local c_x, c_y = GetNuiCursorPosition() 
    local widht, height = GetActiveScreenResolution()
    c_x = c_x / widht
    c_y = c_y / height

    if name == GetPlayerName(SelectedPlayer) then
        DrawRect(x +0.09+drag_x, y+0.110+drag_y, 0.1, 0.017, 35, 35, 35, 255)
    else
        DrawRect(x +0.09+drag_x, y +0.110+drag_y, 0.1, 0.017, 15, 15, 15, 255)
    end

    if( (c_x) + 0.03 >= x and (c_x) - 0.03 <= x and (c_y) + 0.012 >= y and (c_y) - 0.012 <= y and IsDisabledControlJustReleased(0, 92)) then 
        return true
    else
        return false
    end
end
---------------------------------------------------------
-- FUDER CARRO
---------------------------------------------------------
FuckVehicle = function(pp)
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(pp), true)
    RequestControlOnce(vehicle)
    SmashVehicleWindow(vehicle, 0)
    SmashVehicleWindow(vehicle, 1)
    SmashVehicleWindow(vehicle, 2)
    SmashVehicleWindow(vehicle, 3)
    invokenative(_FiVe_SeNsE_.Natives['SetVehicleTyreBurst'], vehicle, 0, true, 1000.0)
    invokenative(_FiVe_SeNsE_.Natives['SetVehicleTyreBurst'], vehicle, 1, true, 1000.0)
    invokenative(_FiVe_SeNsE_.Natives['SetVehicleTyreBurst'], vehicle, 2, true, 1000.0)
    invokenative(_FiVe_SeNsE_.Natives['SetVehicleTyreBurst'], vehicle, 3, true, 1000.0)
    invokenative(_FiVe_SeNsE_.Natives['SetVehicleTyreBurst'], vehicle, 4, true, 1000.0)
    InvokeNative(_FiVe_SeNsE_.Natives['SetVehicleTyreBurst'], vehicle, 5, true, 1000.0)
    InvokeNative(_FiVe_SeNsE_.Natives['SetVehicleTyreBurst'], vehicle, 4, true, 1000.0)
    InvokeNative(_FiVe_SeNsE_.Natives['SetVehicleTyreBurst'], vehicle, 7, true, 1000.0)
    InvokeNative(_FiVe_SeNsE_.Natives['SetVehicleDoorBroken'], vehicle, 0, true)
    InvokeNative(_FiVe_SeNsE_.Natives['SetVehicleDoorBroken'], vehicle, 1, true)
    InvokeNative(_FiVe_SeNsE_.Natives['SetVehicleDoorBroken'], vehicle, 2, true)
    InvokeNative(_FiVe_SeNsE_.Natives['SetVehicleDoorBroken'], vehicle, 3, true)
    InvokeNative(_FiVe_SeNsE_.Natives['SetVehicleDoorBroken'], vehicle, 4, true)
    InvokeNative(_FiVe_SeNsE_.Natives['SetVehicleDoorBroken'], vehicle, 5, true)
    InvokeNative(_FiVe_SeNsE_.Natives['SetVehicleDoorBroken'], vehicle, 6, true)
    InvokeNative(_FiVe_SeNsE_.Natives['SetVehicleDoorBroken'], vehicle, 7, true)
end
-----------------------------------------------------
-- SELF OPTINOS LOL
-----------------------------------------------------
local includeself = ratinhomitozz
-----------------------------------------------------
-- COR ALEATORIA
-----------------------------------------------------
randomrgb = function(frequency)
    local lb = {}
    local curtime = GetGameTimer() / 1000
    lb.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
    lb.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
    lb.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)
    return lb
end
RandomColour = function()
    local N = randomrgb(1)
    local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
    SetVehicleCustomPrimaryColour(veh, N.r, N.g, N.b)
    SetVehicleCustomSecondaryColour(veh, N.r, N.g, N.b)
end

function LeftBar()
	if tabsmenu("Self", "Jogador",true,0.3759,0.0200) then
		tab = "Self"
	end

    if tabsmenu("Armas", "Armas",true,0.4159,0.0200) then
		tab = "Armas"
	end

    if tabsmenu("Veiculo", "Veiculos",true,0.4559,0.0200) then
		tab = "Veiculo"
	end
 
    if tabsmenu("Online", "Online",true,0.4959,0.0200) then
		tab = "Online"
	end

    if tabsmenu("Visual", "Visual",true,0.5359,0.0200) then
		tab = "Visual"
	end

    if tabsmenu("Config", "Config",true,0.5759,0.0200) then
		tab = "Config"
	end
    if tabsmenu("Glife", "Glife",true,0.6159,0.0200) then
		tab = "glife"
	end
end

function tabs()

    if tab == "Self" then

        DrawSprite("mpentry", "mp_modeselected_gradient", 0.376+drag_x,0.358+drag_y,0.2500,0.020, 0, _FiVe_SeNsE_.Sliders['MainR'].value,  _FiVe_SeNsE_.Sliders['MainG'].value, _FiVe_SeNsE_.Sliders['MainB'].value, _FiVe_SeNsE_.Sliders['MainA'].value) --Logo
        if Separator("Self Player",false,0.376+drag_x,0.363+drag_y) then
        end

		if Butao("Reviver",false,0.295+drag_x,0.38+drag_y) then
            SetEntityHealth(PlayerPedId(),400)
            local coords = GetEntityCoords(PlayerPedId())
            NetworkResurrectLocalPlayer(coords, GetEntityHeading(PlayerPedId()), true, false)
		end


        if Butao("Suicidio",false,0.295+drag_x,0.40+drag_y) then
            SetEntityHealth(PlayerPedId(),0) 
        end

        if Butao("Desalgemar",false,0.301+drag_x,0.42+drag_y) then
            vRP.toggleHandcuff()
        end

        if Butao("Teleportar ",false,0.299+drag_x,0.44+drag_y) then
			TeleportToWaypoint()
		end 

    
		if Checkbox("Anti Tazer",0.50+drag_x,0.365+drag_y, 0.410,AntiTazer) then
            AntiTazer = not AntiTazer
        end

        if Checkbox("Noclip", 0.50+drag_x, 0.385+drag_y, 0.35,Noclip2) then
            Noclip2 = not Noclip2
            if Noclip2 then
                SetEntityVisible(PlayerPedId(), false, false)
            else
                SetEntityRotation(GetVehiclePedIsIn(PlayerPedId(), 0), GetGameplayCamRot(2), 2, 1)
                SetEntityVisible(GetVehiclePedIsIn(PlayerPedId(), 0), true, false)
                SetEntityVisible(PlayerPedId(), true, false)
            end
        end	

        if Checkbox("Rolamento Infinito", 0.50+drag_x, 0.405+drag_y, 0.323, rolasinf) then
            rolasinf = not rolasinf
        end
 
		if Checkbox("Stamina Infinita",0.50+drag_x,0.425+drag_y, 0.530,infstamina) then
            infstamina = not infstamina
        end
        
        if Checkbox("No Ragdoll", 0.50+drag_x, 0.445+drag_y, 0.323, noragdol) then
            noragdol = not noragdol
        end

        if Checkbox("Freecam ", 0.50+drag_x, 0.465+drag_y, 0.363, freecamm) then
            freecamm = not freecamm
        end

        if Butaodomag("", false, 0.538+drag_x, 0.487+drag_y) then
            s.ThisIsSliders[7].value, s.ThisIsSliders[8].value, s.ThisIsSliders[9].value = ColorPicker()
            magneto_cor = {r = s.ThisIsSliders[7].value, g = s.ThisIsSliders[8].value, b = s.ThisIsSliders[9].value}
        end

        if Checkbox("Magneto ", 0.50+drag_x, 0.485+drag_y, 0.403, magnetinho) then
            magnetinho = not magnetinho
            if magnetinho then
                Citizen.CreateThread(
                    function()
                        local ForceKey = Keys["E"]
                        local Force = 0.5
                        local KeyPressed = bypasszinhaa
                        local KeyTimer = 0
                        local KeyDelay = 15
                        local ForceEnabled = false
                        local StartPush = false
                        function forcetick()
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
                                        ApplyForceToEntity(
                                            k,
                                            1,
                                            Fx,
                                            Fy,
                                            Fz,
                                            0,
                                            0,
                                            0,
                                            true,
                                            false,
                                            true,
                                            true,
                                            true,
                                            true
                                        )
                                    end
                                end
                                for k in EnumeratePeds() do
                                    if IsEntityOnScreen(k) and k ~= pid then
                                        ApplyForceToEntity(
                                            k,
                                            1,
                                            Fx,
                                            Fy,
                                            Fz,
                                            0,
                                            0,
                                            0,
                                            true,
                                            false,
                                            true,
                                            true,
                                            true,
                                            true
                                        )
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
                                DrawMarker(
                                    28,
                                    Markerloc,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    180.0,
                                    0.0,
                                    1.0,
                                    1.0,
                                    1.0,
                                    magneto_cor.r,
                                    magneto_cor.g,
                                    magneto_cor.b,
                                    120,
                                    false,
                                    true,
                                    2,
                                    nil,
                                    nil,
                                    false
                                )
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
                        while magnetinho do
                            forcetick()
                            Wait(0)
                        end
                    end
                )
            else
            end
        end




        Slider('Noclip speed', 0.560+drag_x, 0.75+drag_y, _FiVe_SeNsE_.Sliders['NoclipSpeed'], 143, 240, 249)
        Slider('Fov Changer', 0.560+drag_x, 0.78+drag_y, _FiVe_SeNsE_.Sliders['gameplay-fov-changer'], 143, 240, 249)

    elseif tab == "Armas" then
    
        DrawSprite("mpentry", "mp_modeselected_gradient", 0.376+drag_x,0.358+drag_y,0.2500,0.020, 0, _FiVe_SeNsE_.Sliders['MainR'].value,  _FiVe_SeNsE_.Sliders['MainG'].value, _FiVe_SeNsE_.Sliders['MainB'].value, _FiVe_SeNsE_.Sliders['MainA'].value) --Logo

        if Separator("Weapons Option",false,0.376+drag_x,0.363+drag_y) then
    
        end

		if Butao("Spawnar Arma",false,0.305+drag_x,0.38+drag_y) then
            arminha()
        end

		if Butao("Puxar Muni",false,0.300+drag_x,0.40+drag_y) then
            GiveMaxAmmo(PlayerId())
        end

		if Butao("Remover Armas",false,0.306+drag_x,0.42+drag_y) then
            StripPlayer(PlayerId())
        end

        DrawSprite("mpentry", "mp_modeselected_gradient", 0.376+drag_x,0.438+drag_y,0.2500,0.020, 0, _FiVe_SeNsE_.Sliders['MainR'].value,  _FiVe_SeNsE_.Sliders['MainG'].value, _FiVe_SeNsE_.Sliders['MainB'].value, _FiVe_SeNsE_.Sliders['MainA'].value) --Logo

        if Separator("Weapons Spawner",false,0.376+drag_x,0.441+drag_y) then
    
        end

		if Butao("Pistola de Ceramica",false,0.312+drag_x,0.46+drag_y) then
            GiveWeaponToPed(
                PlayerPedId(),
                GetHashKey("weapon_ceramicpistol"),
                250,
                false,
                false
            )
        end

		if Butao("Fuzil Militar",false,0.300+drag_x,0.48+drag_y) then
            GiveWeaponToPed(
                PlayerPedId(),
                GetHashKey("weapon_militaryrifle"),
                250,
                false,
                false
            )
        end

		if Butao("Doze de Combate",false,0.308+drag_x,0.50+drag_y) then
            GiveWeaponToPed(
                PlayerPedId(),
                GetHashKey("weapon_combatshotgun"),
                250,
                false,
                false
            )
        end

        DrawSprite("mpentry", "mp_modeselected_gradient", 0.376+drag_x,0.515+drag_y,0.2500,0.020, 0, _FiVe_SeNsE_.Sliders['MainR'].value,  _FiVe_SeNsE_.Sliders['MainG'].value, _FiVe_SeNsE_.Sliders['MainB'].value, _FiVe_SeNsE_.Sliders['MainA'].value) --Logo
        if Separator("Aimbot Options",false,0.376+drag_x,0.518+drag_y) then
        end

        if Checkbox("Aimbot", 0.30+drag_x, 0.530+drag_y, 0.403, ESP_Preview) then
            ESP_Preview = not ESP_Preview
        end

        if Checkbox("Aimlock", 0.30+drag_x, 0.550+drag_y, 0.403, aimlockpika) then
            aimlockpika = not aimlockpika
        end

    

        if Checkbox("Aimlock Fov", 0.30+drag_x, 0.570+drag_y, 0.403, aimlockfov) then
            aimlockfov = not aimlockfov
        end

        if aimlockfov then 
			local fovn = (_FiVe_SeNsE_.Sliders['AimFov'].value / 1000)
			local nKDX, nKDY = _FiVe_SeNsE_.fodaseaimbot.KeyboardDragXWM, _FiVe_SeNsE_.fodaseaimbot.KeyboardDragYWM
			DrawSprite("thefov", "sdjcircle", 0.5-nKDX, 0.5-nKDY, fovn, fovn * 1.8, 0.0, 255,255,255, 255)
		end

        Slider('Fov Changer', 0.360+drag_x, 0.590+drag_y, _FiVe_SeNsE_.Sliders['AimFov'], 143, 240, 249)

        if ESP_Preview then
         DrawSprite("Ratinho2","Ratinho3", 0.74+drag_x, 0.59+drag_y, 0.1, 0.31,0.0,255, 255, 255, 255)
         if Checkboxaimbot("", 0.745+drag_x, 0.475+drag_y, 0.403, cabeca) then
            cabeca = not cabeca
        end
        if Checkboxaimbot("", 0.745+drag_x, 0.545+drag_y, 0.403, paito) then
            paito = not paito
        end
        if Checkboxaimbot("", 0.765+drag_x, 0.585+drag_y, 0.403, madireita) then
            madireita = not madireita
        end
        if Checkboxaimbot("", 0.725+drag_x, 0.595+drag_y, 0.403, maoesquerda) then
            maoesquerda = not maoesquerda
        end
    end


    DrawSprite("mpentry", "mp_modeselected_gradient", 0.376+drag_x,0.625+drag_y,0.2500,0.020, 0, _FiVe_SeNsE_.Sliders['MainR'].value,  _FiVe_SeNsE_.Sliders['MainG'].value, _FiVe_SeNsE_.Sliders['MainB'].value, _FiVe_SeNsE_.Sliders['MainA'].value) --Logo
    if Separator("Weapon Customization",false,0.376+drag_x,0.627+drag_y) then
    end

    if Butao("Add Supressor",false,0.306+drag_x,0.644+drag_y) then
        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x65EA7EBB)
		GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x837445AA)
		GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xA73D4664)
		GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xC304849A)
		GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xE608B35E)
    end

    if Butao("Add Flashight",false,0.304+drag_x,0.664+drag_y) then
        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x359B7AAE)
		GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x7BC4CDDC)
    end
    if Butao("Add Scope",false,0.300+drag_x,0.684+drag_y) then
        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x9D2FBF29)
        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xA0D89C42)
        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xAA2C45B4)
        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xD2443DDC)
        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x3CC6BA57)
        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x3C00AFED)
    end



        if Checkbox("Munição Infinita", 0.50+drag_x,0.365+drag_y, 0.410, InfAmmo) then
            InfAmmo = not InfAmmo
            SetPedInfiniteAmmoClip(PlayerPedId(), InfAmmo)
        end
    
        if Checkbox("Mira Sempre na Tela", 0.50+drag_x,0.385+drag_y, 0.410, Crosshair) then
            Crosshair = not Crosshair
        end

        if Checkbox("Não Recarregar",0.50+drag_x,0.405+drag_y, 0.410, noreload) then
            noreload = not noreload
        end

        if Checkbox("No Recoil", 0.50+drag_x,0.425+drag_y, 0.410, norecoil) then
            norecoil = not norecoil
        end

        if Checkbox("Muni/Soco Explosivo", 0.50+drag_x,0.445+drag_y, 0.410, munizinha_explosiva) then
            munizinha_explosiva = not munizinha_explosiva
        end
        
        if Checkbox("Muni/Soco ShockWave", 0.50+drag_x,0.465+drag_y, 0.410, munizinha_shock) then
            munizinha_shock = not munizinha_shock
        end

    elseif tab == "Veiculo" then

        DrawSprite("mpentry", "mp_modeselected_gradient", 0.376+drag_x,0.358+drag_y,0.2500,0.020, 0, _FiVe_SeNsE_.Sliders['MainR'].value,  _FiVe_SeNsE_.Sliders['MainG'].value, _FiVe_SeNsE_.Sliders['MainB'].value, _FiVe_SeNsE_.Sliders['MainA'].value) --Logo
        if Separator("Vehicle Options",false,0.376+drag_x,0.363+drag_y) then
        end

		if Butao("Spawnar Veiculo",false,0.306+drag_x,0.38+drag_y) then
 spawnarveiculo()
		end



       --[[ if Butao("Setar RG",false,0.340,0.42) then

                local mhash = "panto"
                if not nveh then
                 while not HasModelLoaded(mhash) do
                      RequestModel(mhash)
                    Citizen.Wait(10)
                 end
                    local ped = PlayerPedId()
                    local x,y,z = vRP.getPosition()
                    nveh = CreateVehicle(mhash,404.89, -704.35, 29.32,true,false)
                    SetVehicleIsStolen(nveh,false)
                    SetVehicleOnGroundProperly(nveh)
                    SetEntityInvincible(nveh,false)
                    SetVehicleNumberPlateText(nveh,vRP.getRegistrationNumber())
                    Citizen.InvokeNative(0xAD738C3085FE7E11,nveh,true,true)
                    SetVehicleHasBeenOwnedByPlayer(nveh,true)
                    SetVehicleDirtLevel(nveh,0.0)
                    SetVehRadioStation(nveh,"OFF")
                    SetVehicleEngineOn(GetVehiclePedIsIn(ped,false),true)
                    SetModelAsNoLongerNeeded(mhash)
                end
            end]]


        if Butao("Alterar a Placa",false,0.303+drag_x,0.40+drag_y) then
            alterarplaca()
		end

        if Butao("Reparar/Desvirar",false,0.307+drag_x,0.42+drag_y) then
            local eq = Citizen.InvokeNative(0x6094AD011A2EA87D, Citizen.InvokeNative(0xD80958FC74E988A6))
            Citizen.InvokeNative(0x49733E92263139D1, eq)
            SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
            SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
            SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
            SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
            Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
        end

        if Butao("Deletar",false,0.293+drag_x,0.44+drag_y) then
            DeleteVehicle(GetVehiclePedIsUsing(PlayerPedId()))
        end

        if Butao("Trancar",false,0.294+drag_x,0.46+drag_y) then
            trancar()
        end

        if Butao("Destrancar",false,0.299+drag_x,0.48+drag_y) then
            destrancar()
        end

        if Butao("Tp Veiculo Proximo",false,0.311+drag_x,0.50+drag_y) then
            tpvehgayzick()
        end
        DrawSprite("mpentry", "mp_modeselected_gradient", 0.376+drag_x,0.520+drag_y,0.2500,0.020, 0, _FiVe_SeNsE_.Sliders['MainR'].value,  _FiVe_SeNsE_.Sliders['MainG'].value, _FiVe_SeNsE_.Sliders['MainB'].value, _FiVe_SeNsE_.Sliders['MainA'].value) --Logo
        if Separator("Los Tunners",false,0.376+drag_x,0.522+drag_y) then
        end

        if Butao("Tunagem Maxima",false,0.310+drag_x,0.54+drag_y) then
            engine1(GetVehiclePedIsUsing(PlayerPedId()))
        end

        if Butao("Trocar a Cor",false,0.303+drag_x,0.56+drag_y) then
            vehcolor()
        end


        if Butao("Cor Aleatoria",false,0.304+drag_x,0.58+drag_y) then
            RandomColour()
        end

        --[[if Butao("Lista de Veiculos",false,0.470,0.54) then
            notification("Olhe o [F8]")
                print("^1----------- ^2Veiculos Achados ^1-----------")
                for o, p in pairs(CustomVs) do
            if IsModelValid(p.spawn) then
                    print("^2Nome do Veiculo: ^0" .. p.name .. "", "^1Spawn do Veiculo: ^0" .. p.spawn .. "")
                end
            end
        end]]--

        if Checkbox("Veiculo ~r~R~g~G~b~B", 0.50+drag_x,0.365+drag_y, 0.410, vehrgb) then
            vehrgb = not vehrgb
        end

        if Checkbox("Boost Buzina", 0.50+drag_x,0.385+drag_y, 0.410, buniza) then
            buniza = not buniza
        end

        if Checkbox("Não Cair da Moto", 0.50+drag_x,0.405+drag_y, 0.410, veh_cair) then
            veh_cair = not veh_cair
        end

        if Checkbox("Veiculo Invisivel", 0.50+drag_x,0.425+drag_y, 0.410, vehinv) then
            vehinv = not vehinv
        end

        if Checkbox("Auto Reparar", 0.50+drag_x,0.445+drag_y, 0.410, autorepair) then
            autorepair = not autorepair
        end

        if Checkbox("Piloto Automatico", 0.50+drag_x,0.465+drag_y, 0.410, pilotoauto) then
            pilotoauto = not pilotoauto
            if pilotoauto then
                if DoesBlipExist(GetFirstBlipInfoId(8)) then
                    local blipIterator = GetBlipInfoIdIterator(8)
                    local blip = GetFirstBlipInfoId(8, blipIterator)
                    local wp = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
                    local ped = PlayerPedId()
                    ClearPedTasks(ped)
                    local v = GetVehiclePedIsIn(ped, false)
                    TaskVehicleDriveToCoord(ped, v, wp.x, wp.y, wp.z, 50.0, 156, v, 2883621, 5.5, true)
                    SetDriveTaskDrivingStyle(ped, 2883621)
                    speedmit = true
                end
            else
                speedmit = false
                if IsPedInAnyVehicle(PlayerPedId()) then
                    ClearPedTasks(PlayerPedId())
                else
                    ClearPedTasksImmediately(PlayerPedId())
                end
            end
        end

        if Checkbox("Handling", 0.50+drag_x,0.485+drag_y, 0.410, modofacil) then
            modofacil = not modofacil
            local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
            if not modofacil then
                SetVehicleGravityAmount(veh, 9.8)
            else
                SetVehicleGravityAmount(veh, 30.0)
            end
        end

        if Checkbox("Deletar Todos os Veiculos", 0.50+drag_x,0.505+drag_y, 0.410, delete) then
            deleteallveh()
        end

    elseif tab == "Online" then

        stscr = 0.0

        if plist and DisplayMenu then
            drag_x2 = _FiVe_SeNsE_.Menu.MenuX2-0.5
            drag_y2 = _FiVe_SeNsE_.Menu.MenuY2-0.5
            DrawRect(0.74+drag_x, 0.570+drag_y, 0.1, 0.42, 0, 0, 0, 180)
        
            if Zones(0.70+drag_x, 0.475+drag_y, 0.1, 0.45) then
                if IsDisabledControlJustPressed(0, 15)  then
                    stscr = stscr - 0.016
                end
        
                if IsDisabledControlJustPressed(0, 14) then
                    stscr = stscr + 0.016
                end
            end
        
            local ids = GetActivePlayers()
            local y = 0.38
            local OnlineMax = 0.7
        
            if SelectedPlayer == nil then
                SelectedPlayer = ids[1]
            end
            for i = 1, #ids do
                local player = ids[i]
                local position = ( (0.259*1.0) + (i-1) * 0.02) + stscr
                if player == "**Invalid**" then
                else
                    if position >= 0.259 and position <= OnlineMax then
                        if OnlineButton(0.65, position, false, GetPlayerServerId(player), GetPlayerName(player)) then 
                            SelectedPlayer = player
                        end         
                    end      
                end
            end
        end

        
        if Checkbox("Lista De Player", 0.50+drag_x,0.365+drag_y, 0.410, plist) then
            plist = not plist
        end


        DrawSprite("mpentry", "mp_modeselected_gradient", 0.376+drag_x,0.358+drag_y,0.2500,0.020, 0, _FiVe_SeNsE_.Sliders['MainR'].value,  _FiVe_SeNsE_.Sliders['MainG'].value, _FiVe_SeNsE_.Sliders['MainB'].value, _FiVe_SeNsE_.Sliders['MainA'].value) --Logo
        if Separator("Player Options",false,0.376+drag_x,0.363+drag_y) then
        end


		if Butao("Copiar Roupa",false,0.303+drag_x,0.38+drag_y) then
            copiarroupa()
        end

        if Butao("Tp To Player",false,0.302+drag_x,0.40+drag_y) then
            TeleportToPlayer()
        end
        DrawSprite("mpentry", "mp_modeselected_gradient", 0.376+drag_x,0.418+drag_y,0.2500,0.020, 0, _FiVe_SeNsE_.Sliders['MainR'].value,  _FiVe_SeNsE_.Sliders['MainG'].value, _FiVe_SeNsE_.Sliders['MainB'].value, _FiVe_SeNsE_.Sliders['MainA'].value) --Logo
        if Separator("Player Troll",false,0.376+drag_x,0.420+drag_y) then
        end

        if Butao("Ataque Com Facas",false,0.310+drag_x,0.44+drag_y) then
            AtaqueFacas(SelectedPlayer)
        end

        if Butao("Homem Bomba",false,0.306+drag_x,0.46+drag_y) then
            HomemBomba(SelectedPlayer)
        end

        if Butao("NPC's Armados",false,0.306+drag_x,0.48+drag_y) then
            vilao(SelectedPlayer)
        end

        if Butao("Fuder Carro",false,0.301+drag_x,0.50+drag_y) then
            FuckVehicle(SelectedPlayer)
        end

        if Butao("Comer Player",false,0.304+drag_x,0.52+drag_y) then
            RapePlayer()
        end

        if Butao("Peixe na Bunda",false,0.307+drag_x,0.54+drag_y) then
            peixe_player()
        end
        DrawSprite("mpentry", "mp_modeselected_gradient", 0.376+drag_x,0.558+drag_y,0.2500,0.020, 0, _FiVe_SeNsE_.Sliders['MainR'].value,  _FiVe_SeNsE_.Sliders['MainG'].value, _FiVe_SeNsE_.Sliders['MainB'].value, _FiVe_SeNsE_.Sliders['MainA'].value) --Logo
        if Separator("Player Advanced Troll",false,0.376+drag_x,0.560+drag_y) then
        end

        if Butao("Kuruma",false,0.298+drag_x,0.58+drag_y) then
            cargoplrame('kuruma',SelectedPlayer)
			Wait(10)
			cargoplrame('kuruma',SelectedPlayer)
			Wait(10)
        end

        if Butao("Tug Player",false,0.302+drag_x,0.60+drag_y) then
            cargoplrame('tug',SelectedPlayer)
        end
        
        if Checkbox("Dar Muni/Soco Explosivo", 0.50+drag_x,0.385+drag_y, 0.410, darmuniexplosiva) then
            darmuniexplosiva = not darmuniexplosiva
        end

        if Checkbox("Dar Muni/Soco de Shock", 0.50+drag_x,0.405+drag_y, 0.410, darmunishock) then
            darmunishock = not darmunishock
        end

    elseif tab == "Visual" then

        DrawSprite("mpentry", "mp_modeselected_gradient", 0.376+drag_x,0.358+drag_y,0.2500,0.020, 0, _FiVe_SeNsE_.Sliders['MainR'].value,  _FiVe_SeNsE_.Sliders['MainG'].value, _FiVe_SeNsE_.Sliders['MainB'].value, _FiVe_SeNsE_.Sliders['MainA'].value) --Logo
        if Separator("Player Esp's",false,0.376+drag_x,0.363+drag_y) then
        end

        if Checkbox("Ligar Esp", 0.50+drag_x,0.365+drag_y, 0.410, includeself) then
            includeself = not includeself
        end

        if Checkbox("Corner Box", 0.50+drag_x,0.385+drag_y, 0.410, cornerBox) then
            cornerBox = not cornerBox
        end

        if Checkbox("Barra De Vida", 0.50+drag_x,0.405+drag_y, 0.410, vidabarra) then
            vidabarra = not vidabarra
        end

        if Checkbox("Barra De Colete", 0.50+drag_x,0.425+drag_y, 0.410, armourbar) then
            armourbar = not armourbar
        end

        if Checkbox("Esp Qudarado", 0.50+drag_x,0.445+drag_y, 0.410, espboxdomenu) then
            espboxdomenu = not espboxdomenu
        end

        if Checkbox("Esp Npc", 0.50+drag_x,0.465+drag_y, 0.410, npcesp) then
            npcesp = not npcesp
        end
    
        
        if Checkbox("Esp Names", 0.31, 0.380, 0.380, nomesesp) then
            nomesesp = not nomesesp
        end

        if Checkbox("Esp Box", 0.31, 0.420, 0.420, esp_box) then
            esp_box = not esp_box
        end

        if Checkbox("Esp Eskeletons", 0.31, 0.460, 0.460, esp_skel) then
            esp_skel = not esp_skel
        end


        if Checkbox("Esp Veiculos", 0.31, 0.500, 0.500, esp_veiculo) then
            esp_veiculo = not esp_veiculo
        end

        if Butao8("", false, 0.350, 0.3835) then
            s.ThisIsSliders[7].value, s.ThisIsSliders[8].value, s.ThisIsSliders[9].value = ColorPicker()
            esp_nome_cor = {r = s.ThisIsSliders[7].value, g = s.ThisIsSliders[8].value, b = s.ThisIsSliders[9].value}
        end

        if Butao2("", false, 0.340, 0.4235) then
            s.ThisIsSliders[7].value, s.ThisIsSliders[8].value, s.ThisIsSliders[9].value = ColorPicker()
            esp_box_cor = {r = s.ThisIsSliders[7].value, g = s.ThisIsSliders[8].value, b = s.ThisIsSliders[9].value}
        end

        if Butao77("", false, 0.360, 0.4635) then
            s.ThisIsSliders[7].value, s.ThisIsSliders[8].value, s.ThisIsSliders[9].value = ColorPicker()
            esp_skel_cor = {r = s.ThisIsSliders[7].value, g = s.ThisIsSliders[8].value, b = s.ThisIsSliders[9].value}
        end


    elseif tab == "Config" then


        Slider('Main colour (Red)', 0.560+drag_x, 0.69+drag_y, _FiVe_SeNsE_.Sliders['MainR'], _FiVe_SeNsE_.Sliders['MainR'].value, _FiVe_SeNsE_.Sliders['MainG'].value, _FiVe_SeNsE_.Sliders['MainB'].value)
        Slider('Main colour (Green)', 0.560+drag_x, 0.72+drag_y, _FiVe_SeNsE_.Sliders['MainG'], _FiVe_SeNsE_.Sliders['MainR'].value, _FiVe_SeNsE_.Sliders['MainG'].value, _FiVe_SeNsE_.Sliders['MainB'].value)
        Slider('Main colour (Blue)', 0.560+drag_x, 0.75+drag_y, _FiVe_SeNsE_.Sliders['MainB'], _FiVe_SeNsE_.Sliders['MainR'].value, _FiVe_SeNsE_.Sliders['MainG'].value, _FiVe_SeNsE_.Sliders['MainB'].value)
        Slider('Main colour (Alpha)', 0.560+drag_x, 0.78+drag_y, _FiVe_SeNsE_.Sliders['MainA'], _FiVe_SeNsE_.Sliders['MainR'].value, _FiVe_SeNsE_.Sliders['MainG'].value, _FiVe_SeNsE_.Sliders['MainB'].value)

        if Butao("Bind do Menu ~c~»  ~w~" .. keybindmenu["Label"], false, 0.34, 0.38) then
            bindzinha()
            local value, label = bindzinha()
            keybindmenu["Label"] = label
            keybindmenu["Value"] = value
        end
        if Butao("Bind Noclip ~c~»  ~w~" .. noclip["Label"], false, 0.34, 0.42) then
            bindzinha()
            local value, label = bindzinha()
            noclip["Label"] = label
            noclip["Value"] = value
        end

        if Butao("Bind Reviver ~c~»  ~w~" .. reviver["Label"], false, 0.34, 0.46) then
            bindzinha()
            local value, label = bindzinha()
            reviver["Label"] = label
            reviver["Value"] = value
        end

        if Butao("Bind Reparar Veiculo ~c~»  ~w~" .. repararveh["Label"], false, 0.34, 0.50) then
            bindzinha()
            local value, label = bindzinha()
            repararveh["Label"] = label
            repararveh["Value"] = value
        end
        if Butao("Bind TP WayPoint ~c~»  ~w~" .. tpwaypoint["Label"], false, 0.34, 0.54) then
            bindzinha()
            local value, label = bindzinha()
            tpwaypoint["Label"] = label
            tpwaypoint["Value"] = value
        end
        if Butao("Bind Freecam ~c~»  ~w~" .. cameraaa["Label"], false, 0.34, 0.58) then
            bindzinha()
            local value, label = bindzinha()
            cameraaa["Label"] = label
            cameraaa["Value"] = value
        end

		if Butao("~p~Desinjetar",false,0.340,0.62) then
            desinjetado()
		end

    end

    local x, y = GetNuiCursorPosition()
    local x_ez, y_ez = GetActiveScreenResolution()
    local cursorX, cursorY = x / x_ez, y / y_ez
    DrawTextoo('°', cursorX, cursorY - 0.009, 0, 0.4, true, 0, 0, 0, 255, true)
end

function Menu()
    drag_x = BielX.MenuX-0.5
    drag_y = BielX.MenuY-0.5
    drag_x2 = BielX.MenuX2-0.5
    drag_y2 = BielX.MenuY2-0.5
    local res_w, res_h = BielX.MenuW-0.5, BielX.MenuH-0.5
    local drag_x, drag_y = BielX.MenuX-0.5, BielX.MenuY-0.5
Dragbar()
    DrawSprite("mpentry", "mp_modeselected_gradient", 0.500,0.0025,0.3000,0.006, 0, 255,0,255,255) --Logo    
    DrawSprite("mpentry", "mp_modeselected_gradient", 0.430,0.0025,0.1900,0.006, 0, 0,228,255,255) --Logo    
    DrawSprite("mpentry", "mp_modeselected_gradient", 0.570,0.0025,0.1900,0.006, 0, 255,194,166,255) --Logo    
    DrawSprite("mpentry", "mp_modeselected_gradient", 0.500,0.0380,0.3000,0.006, 0, 255,0,255,255) --Logo   
    DrawSprite("mpentry", "mp_modeselected_gradient", 0.430,0.0380,0.1900,0.006, 0, 0,228,255,255) --Logo    
    DrawSprite("mpentry", "mp_modeselected_gradient", 0.570,0.0380,0.1900,0.006, 0, 255,194,166,255) --Logo   
    DrawSprite("mpentry", "mp_modeselected_gradient", 0.470+drag_x,0.3325+drag_y,0.3000,0.006, 0, 255,0,255,255) --Logo    

    DrawRect(0.375+drag_x+res_w/2, 0.58+drag_y+res_h/2, 0.2000+res_w, 0.4600+res_h, 15, 15, 15, 255) -- hud
    DrawRect(0.578+drag_x, 0.58+drag_y, 0.2000, 0.4600, 15, 15, 15, 255) -- hud
    DrawRect(0.477+drag_x, 0.35+drag_y, 0.4026, 0.0250, 15, 15, 15, 255) -- hud

    DrawRect(0.477+drag_x, 0.335+drag_y, 0.4026, 0.0035, 25, 25, 25, 255) -- hud
    DrawRect(0.578+drag_x, 0.35+drag_y, 0.2000, 0.0040, 25, 25, 25, 255) -- hud
    DrawRect(0.578+drag_x, 0.81+drag_y, 0.2000, 0.0040, 25, 25, 25, 255) -- hud
    DrawRect(0.375+drag_x, 0.35+drag_y, 0.2000, 0.0040, 25, 25, 25, 255) -- hud
    DrawRect(0.375+drag_x, 0.81+drag_y, 0.2000, 0.0040, 25, 25, 25, 255) -- hud
--------------------------------------------------------------------
-- LATERAIS
--------------------------------------------------------------------
    DrawRect(0.477+drag_x, 0.58+drag_y, 0.0018, 0.4635, 25, 25, 25, 255) -- hud
    DrawRect(0.474+drag_x, 0.58+drag_y, 0.0018, 0.4600, 25, 25, 25, 255) -- hud
    DrawRect(0.276+drag_x, 0.58+drag_y, 0.0018, 0.4635, 25, 25, 25, 255) -- hud
    DrawRect(0.677+drag_x, 0.58+drag_y, 0.0018, 0.4600, 25, 25, 25, 255) -- hud
--------------------------------------------------------------------
-- LATERAIS2
--------------------------------------------------------------------
    DrawRect(0.678+drag_x, 0.573+drag_y, 0.0018, 0.4785, 25, 25, 25, 255) -- hud
    DrawRect(0.275+drag_x, 0.573+drag_y, 0.0018, 0.4785, 25, 25, 25, 255) -- hud
--------------------------------------------------------------------
-- TABS 
--------------------------------------------------------------------
    DrawRect(0.492, 0.0200, 0.2870, 0.035, 15, 15, 15, 255) -- tab
    DrawRect(0.492, 0.0200, 0.2850, 0.028, 25, 25, 25, 200) -- tab
    LeftBar()
    tabs()
end
--------------------------------------------------------
-- NAO LEVAR TAZER
--------------------------------------------------------
if AntiTazer then
    SetPedCanRagdollFromPlayerImpact(PlayerPedId(), ratinhomitozz)
end
--------------------------------------------------------
-- PED ARMADO
--------------------------------------------------------
function vilao(onplayer)
	for s = 0, 3 do
		local ped = GetHashKey('u_m_y_imporage')
		RequestModel(ped)
		while not HasModelLoaded(ped) do
			Citizen.Wait(1000)
		end
		local ped_2 = CreatePed(10, ped, GetEntityCoords(GetPlayerPed(onplayer)), 0.0, true, true)

		GiveWeaponToPed(ped_2, GetHashKey('weapon_pistol_mk2'), 20, true, true)
		TaskCombatPed(ped_2, GetPlayerPed(SelectedPlayer), 0, 16)
	end
end
--------------------------------------------------------
-- HOMEM BOMBA
--------------------------------------------------------
function HomemBomba(player_to_explode)
	local onplayer = GetPlayerPed(player_to_explode)
	local ped = GetHashKey('a_m_m_soucent_01')

	RequestModel(ped)
	while not HasModelLoaded(ped) do
		Citizen.Wait(1500)
	end
	local ped_2 = CreatePed(31, ped, GetEntityCoords(onplayer)+1, 0.0, true, true)

	Citizen.Wait(1000)
	RequestAnimDict('mp_player_int_upperfinger')
	TaskPlayAnim(ped_2, 'mp_player_int_upperfinger', 'mp_player_int_finger_01_enter', 8.0, -8.0, -1, 0, 0, false, false, false)
	Citizen.Wait(2000)
	AddExplosion(GetEntityCoords(ped_2), 10, 100.0, true, false, false, 0.0)
	ShootSingleBulletBetweenCoords(GetEntityCoords(onplayer), GetEntityCoords(onplayer), 1.0, true, GetHashKey('WEAPON_RPG'), PlayerPedId(), true, false, 1410.0)
	MenuVisible = false
end
--------------------------------------------------------
-- PED ARMADO 
--------------------------------------------------------
function AtaqueFacas(onplayer)
	for s = 0, 3 do
		local ped = GetHashKey('a_f_m_fatcult_01')
		RequestModel(ped)
		while not HasModelLoaded(ped) do
			Citizen.Wait(1000)
		end
		local ped_2 = CreatePed(10, ped, GetEntityCoords(GetPlayerPed(onplayer)), 0.0, true, true)

		GiveWeaponToPed(ped_2, GetHashKey('weapon_switchblade'), 20, true, true)
		TaskCombatPed(ped_2, GetPlayerPed(SelectedPlayer), 0, 16)
	end
end
--------------------------------------------------------
-- AIMLOCK FODA
--------------------------------------------------------
function lerp(delta, from, to)
	if delta > 1 then return to end
	if delta < 0 then return from end
	return from + (to - from) * delta
	end

	local function bX(bY, bZ, b_)
		return coroutine.wrap(
			function()
				local c0, c1 = bY()
				if not c1 or c1 == 0 then
					b_(c0)
					return
				end
				local c2 = {handle = c0, destructor = b_}
				setmetatable(c2, entityEnumerator)
				local c3 = true
				repeat
					coroutine.yield(c1)
					c3, c1 = bZ(c0)
				until not c3
				c2.destructor, c2.handle = nil, nil
				b_(c0)
			end
		)
	end
	function lerp(n, o, p)
		if n > 1 then
			return p
		end
		if n < 0 then
			return o
		end
		return o + (p - o) * n
	end
	function EnumeratePeds()
		return bX(FindFirstPed, FindNextPed, EndFindPed)
	end
	Citizen.CreateThread(function()
		while true do
			local HazeStore = 1
			if aimlockpika then
				local HazeStore = 1
				for cI in EnumeratePeds() do
					for k, id in ipairs(GetActivePlayers()) do
						local cJ = GetPedBoneCoords(cI, 31086)
						R = IsPedAPlayer(cI)
						B = cI
						local x, y, z = table.unpack(GetEntityCoords(cI))
						local T, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
						local cK = 1.15
						local cL, cM = GetFinalRenderedCamCoord(), GetEntityRotation(PlayerPedId(), 2)
						local cN, cO, cP = (cJ - cL).x, (cJ - cL).y, (cJ - cL).z
						local cQ, aX, cR =
							-math.deg(math.atan2(cN, cO)) - cM.z,
							math.deg(math.atan2(cP, #vector3(cN, cO, 0.0))),
							1.0
						local cQ = lerp(1.0, 0.0, cQ)
						if cI ~= PlayerPedId() and IsEntityOnScreen(cI) and R then
							if _x > 0.5 - cK / 2 and _x < 0.5 + cK / 2 and _y > 0.5 - cK / 2 and _y < 0.5 + cK / 2 then
								if IsDisabledControlPressed(0, 21) and IsDisabledControlPressed(0, 25) then
									if HasEntityClearLosToEntity(PlayerPedId(), id, 19) then
										if GetEntityHealth(GetPlayerPed(id)) >= 102 and IsEntityVisible(GetPlayerPed(id)) then
											SetGameplayCamRelativeRotation(cQ, aX, cR)
										elseif GetEntityHealth(GetPlayerPed(id)) <= 101 and not IsEntityVisible(GetPlayerPed(id)) then
											SetGameplayCamRelativeRotation()
										end
									end
								end
							end
						end
						if cI ~= PlayerPedId() and IsEntityOnScreen(cI) and B then
							if _x > 0.5 - cK / 2 and _x < 0.5 + cK / 2 and _y > 0.5 - cK / 2 and _y < 0.5 + cK / 2 then
								if IsDisabledControlPressed(0, 21) and IsDisabledControlPressed(0, 25) then
									if HasEntityClearLosToEntity(PlayerPedId(), cI, 19) then
										if GetEntityHealth(cI) >= 102 and IsEntityVisible(cI) then
											SetGameplayCamRelativeRotation(cQ, aX, cR)
										elseif GetEntityHealth(cI) <= 101 and not IsEntityVisible(cI) then
											SetGameplayCamRelativeRotation()
										end
									end
								end
							end
						end
					end
				end
			end
			Citizen.Wait(HazeStore)
		end
	end)

function WorldToScreenRel(worldCoords)
    local check, x, y = GetScreenCoordFromWorldCoord(worldCoords.x, worldCoords.y, worldCoords.z)
    if not check then
        return false
    end
    screenCoordsx = (x - 0.5) * 2.0
    screenCoordsy = (y - 0.5) * 2.0
    return true, screenCoordsx, screenCoordsy
end

function ScreenToWorld(screenCoord)
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
    local direction1 =
        RotationToDirection(vector3(camRot.x, camRot.y + 0.0, camRot.z + 10.0)) - RotationToDirection(vect32)
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

local function cF()
    return table.unpack(Citizen.InvokeNative(0xcf143fb9, Citizen.ReturnResultAnyway(), Citizen.ResultAsObject()))
end

function SubVectors(vect1, vect2)
    return vector3(vect1.x - vect2.x, vect1.y - vect2.y, vect1.z - vect2.z)
end
function ScaleVector(vect, mult)
    return vector3(vect.x * mult, vect.y * mult, vect.z * mult)
end

function round(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function DeleteObjects(entity)
    if not DoesEntityExist(entity) then
        return
    end
    NetworkRequestControlOfEntity(entity)
    SetEntityAsMissionEntity(entity, true, true)
    DeleteObject(entity)
end
function deleteobjects()
    for objects in EnumerateObjects() do
        DeleteObjects(objects)
    end
end

function peixe_player()
    local rmodel = "a_c_fish"
    local ped = GetPlayerPed(SelectedPlayer)
    local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(SelectedPlayer), 0.0, 8.0, 0.5)
    local x = coords.x
    local y = coords.y
    local z = coords.z
    RequestModel(GetHashKey(rmodel))
    local nped = CreatePed(31, rmodel, x, y, z, 0.0, true, true)
    SetPedComponentVariation(nped, 4, 0, 0, 0)
    SetPedKeepTask(nped)
    AttachEntityToEntity(nped, ped, 0, 0.0, -0.3, 0.0, 0.0, 0.0, 0.0, true, true, true, true, 0, true)
end

function DeleteVehicles(entity)
    if not DoesEntityExist(entity) then
        return
    end
    NetworkRequestControlOfEntity(entity)
    SetEntityAsMissionEntity(entity, true, true)
    DeleteVehicle(entity)
end

function deletevehicles()
    for veh in EnumerateVehicles() do
        DeleteVehicles(veh)
    end
end

local function RGBRainbow(frequency)
    local result = {}
    local curtime = GetGameTimer() / 1000
    result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
    result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
    result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)
    return result
end

function vehcolor()
    s.ThisIsSliders[7].value, s.ThisIsSliders[8].value, s.ThisIsSliders[9].value = ColorPicker()
    SetVehicleCustomPrimaryColour(
        GetVehiclePedIsUsing(PlayerPedId(-1)),
        s.ThisIsSliders[7].value,
        s.ThisIsSliders[8].value,
        s.ThisIsSliders[9].value
    )
    SetVehicleCustomSecondaryColour(
        GetVehiclePedIsUsing(PlayerPedId(-1)),
        s.ThisIsSliders[7].value,
        s.ThisIsSliders[8].value,
        s.ThisIsSliders[9].value
    )
end

function destrancar()
    for er in cw() do
        if Citizen.InvokeNative(0x7239B21A38F536BA, er) then
            Citizen.InvokeNative(0xB664292EAECF7FA6, er, 1)
            Citizen.InvokeNative(0x517AAF684BB50CD1, er, PlayerId(), false)
            Citizen.InvokeNative(0xA2F80B8D040727CC, er, false)
        end
    end
end

function destrancar()
    local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 15.0, 0, 70)
    if vehicle then
        if DoesEntityExist(vehicle) then
            SetVehicleDoorsLocked(vehicle, 1)
            SetVehicleDoorsLockedForPlayer(vehicle, PlayerId(), false)
            SetVehicleDoorsLockedForAllPlayers(vehicle, false)
        end
    end
end

function trancar()
    local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 15.0, 0, 70)
    if vehicle then
        if DoesEntityExist(vehicle) then
            SetVehicleDoorsLocked(vehicle, 1)
            SetVehicleDoorsLockedForPlayer(vehicle, PlayerId(), true)
            SetVehicleDoorsLockedForAllPlayers(vehicle, true)
        end
    end
end

function Oscillate(entity, position, angleFreq, dampRatio)
    local pos1 = ScaleVector(SubVectors(position, GetEntityCoords(entity)), (angleFreq * angleFreq))
    local pos2 =
        AddVectors(ScaleVector(GetEntityVelocity(entity), (2.0 * angleFreq * dampRatio)), vector3(0.0, 0.0, 0.1))
    local targetPos = SubVectors(pos1, pos2)
    ApplyForce(entity, targetPos)
end

local function Q(target)
    local S = GetPlayerPed(target)
    for T = 0, #F do
        GiveWeaponToPed(S, GetHashKey(F[T]), 250, false, false)
    end
end
function arminha()
    local ARMA = KeyInput("~p~Nome da ~w~Arma", "WEAPON_", 25)
    GiveWeaponToPed(PlayerPedId(), GetHashKey(ARMA), 250, false, false)
end
-------------------------------------------------------------
-- TEXTGLOBAL
-------------------------------------------------------------
GlobalText = function(text, x, y, scale, centre, font, _outl, colour)
    SetTextFont(font)
    SetTextCentre(centre)
    SetTextOutline(_outl)
    SetTextScale(0.0, scale or 0.25)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end
-------------------------------------------------------------
-- DRAW COORD
-------------------------------------------------------------
DrawTextOnCoords = function(x, y, z, text, r, g, b, font, scale)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(0.0, scale or 0.25)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    GlobalText(0.0, 0.0)
    ClearDrawOrigin()
end
-------------------------------------------------------------
-- ESP FUNCTION
-------------------------------------------------------------
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
function cw()
	return veiculoo(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
	end
	function EnumeratePeds()
	return veiculoo(FindFirstPed, FindNextPed, EndFindPed)
	end
	local function cw()
	return veiculoo(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
	end
	local function cx()
	return veiculoo(FindFirstObject, FindNextObject, EndFindObject)
end
-------------------------------------------------------------
-- LOL
-------------------------------------------------------------
Citizen.CreateThread(
    function()
        while MenuEnabled do
            Wait(0)

            if vehrgb then
                ra = RGBRainbow(1.3)
                SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
                SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
            end

            if munizinha_explosiva then
                local p = PlayerPedId()
                local hit, coord = GetPedLastWeaponImpactCoord(p)				
                if hit then 
                    AddExplosion(coord.x, coord.y, coord.z, 37, 100.0, true, false, 0.0)
                end
            end

            if munizinha_shock then
                local p = PlayerPedId()
                local hit, coord = GetPedLastWeaponImpactCoord(p)				
                if hit then 
                    AddExplosion(coord.x, coord.y, coord.z, 70, 100.0, true, false, 0.0)
                end
            end
        
            if veh2 then
				SetEntityVisible(GetVehiclePedIsIn(GetPlayerPed(-1), false), false, false)
			else
				SetEntityVisible(GetVehiclePedIsIn(GetPlayerPed(-1), false), true, false)
			end
            
            function bY(x, y, z, b7, r, g, b)
                SetDrawOrigin(x, y, z, 0)
                SetTextFont(0)
                SetTextProportional(0)
                SetTextScale(0.20, 0.20)
                SetTextColour(esp_nome_cor.r, esp_nome_cor.g, esp_nome_cor.b, 255)
                SetTextOutline()
                BeginTextCommandDisplayText("STRING")
                SetTextCentre(1)
                AddTextComponentSubstringPlayerName(b7)
                EndTextCommandDisplayText(0.0, 0.0)
                ClearDrawOrigin()
            end

            if esp_nome then
                local ds = GetActivePlayers()
                for T = 1, #ds do
                    local ct = ds[T]
                    if ct ~= PlayerId() and GetPlayerServerId(ct) ~= 0 then
                        local dH = GetEntityCoords(GetPlayerPed(ds[T]))
                        local dI = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), dH)
                        local dJ = 300.0
                        if dI <= dJ then
                            local dK = GetPlayerPed(ct)
                            local dL, dM, dN = table.unpack(GetEntityCoords(PlayerPedId()))
                            local x, y, z = table.unpack(GetEntityCoords(dK))
                            local dd = " " .. GetPlayerName(ds[T]) .. "  [" .. math.floor(dI) .. " m]"
                            local dO = IsPlayerDead(dK)
                            if GetEntityHealth(dK) <= 0 then
                                dO = true
                            end
                            if dO then
                                dd = " "
                            end
                            bY(x, y, z - 0.1, dd, 255, 255, 255)
                        end
                    end
                end
            end

            if esp_box then
                local dE = GetActivePlayers()
                for l = 1, #dE do
                    local dw = GetPlayerPed(dE[l])
                    bone = GetEntityBoneIndexByName(dw, "SKEL_HEAD")
                    x, y, z = table.unpack(GetPedBoneCoords(dw, bone, 0.0, 0.0, 0.0))
                    px, py, pz = table.unpack(GetGameplayCamCoord())
                    if GetDistanceBetweenCoords(x, y, z, px, py, pz, true) < 300.0 then
                        if dw ~= PlayerPedId() and IsEntityOnScreen(dw) and not IsPedDeadOrDying(dw) then
                            z = z + 0.9
                            local dF = GetDistanceBetweenCoords(x, y, z, px, py, pz, true) * 0.002 / 2
                            if dF < 0.0042 then
                                dF = 0.0042
                            end
                            retval, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
                            width = 0.00045
                            height = 0.0023
                            DrawRect(_x, _y, width / dF, 0.0015, esp_box_cor.r, esp_box_cor.g, esp_box_cor.b, 200)
                            DrawRect(_x, _y + height / dF, width / dF, 0.0015, esp_box_cor.r, esp_box_cor.g, esp_box_cor.b, 200)
                            DrawRect(_x + width / 2 / dF, _y + height / 2 / dF, 0.001, height / dF, esp_box_cor.r, esp_box_cor.g, esp_box_cor.b, 200)
                            DrawRect(_x - width / 2 / dF, _y + height / 2 / dF, 0.001, height / dF, esp_box_cor.r, esp_box_cor.g, esp_box_cor.b, 200)
                        end
                    end
                end
            end

-------------------------------------------------------
-- ESP VEICULO
-------------------------------------------------------
                if esp_veiculo then
                    for vehs in EnumerateVehicles() do
                        local vehX, vehY, vehZ = _FiVe_SeNsE_.Strings.tunpack(GetEntityCoords(vehs))
                        local xx = _FiVe_SeNsE_.Math.tonumber(_FiVe_SeNsE_.Strings.format("%.2f", vehX))
                        local yy = _FiVe_SeNsE_.Math.tonumber(_FiVe_SeNsE_.Strings.format("%.2f", vehY))
                        local zz = _FiVe_SeNsE_.Math.tonumber(_FiVe_SeNsE_.Strings.format("%.2f", vehZ))
                        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(vehs), true) < _FiVe_SeNsE_.ComboBoxesT.EspDist[_FiVe_SeNsE_.ComboBoxesT.EspDistMultIndex] then
                            local text = 'Model: '..GetDisplayNameFromVehicleModel(GetEntityModel(vehs))..'\nHash: '..GetEntityModel(vehs)..'\n~g~X: ~s~'..xx..' ~g~Y: ~s~'..yy..' ~g~Z: ~s~'..zz
                            DrawTextOnCoords(xx, yy, zz, text, 255, 255, 255, 0, 0.20)
                        end
                    end
                end

            

        if vehinv then
            SetEntityVisible(GetVehiclePedIsIn(GetPlayerPed(-1), false), false, false)
        else
            SetEntityVisible(GetVehiclePedIsIn(GetPlayerPed(-1), false), true, false)
        end

        if autorepair then
            SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
            SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
            SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
            SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
        end

        if Crosshair then
            ShowHudComponentThisFrame(14)
        end
    
        if noreload then
            if IsPedShooting(PlayerPedId()) then
                PedSkipNextReloading(PlayerPedId())
                MakePedReload(PlayerPedId())
            end
        end

        if norecoil then
            local GameplayCamPitch = GetGameplayCamRelativePitch()
            SetGameplayCamRelativePitch(GameplayCamPitch, 0.0)
        end
            
        if infstamina then
            RestorePlayerStamina(PlayerId(), 1.0)
        end

        if delete then
            for dR in cw() do
                NetworkRequestControlOfEntity(dR)
                DeleteEntity(dR)
            end
        end

            if darmuniexplosiva then
                local addnew, pos = GetPedLastWeaponImpactCoord(GetPlayerPed(SelectedPlayer))
                if NetworkIsPlayerActive(SelectedPlayer) then
                    if addnew then
                        AddExplosion(pos.x, pos.y, pos.z, 1, 100.0, true, false, 0)
                    end
                end
            end

            if darmunishock then
                local addnew, pos = GetPedLastWeaponImpactCoord(GetPlayerPed(SelectedPlayer))
                if NetworkIsPlayerActive(SelectedPlayer) then
                    if addnew then
                        AddExplosion(pos.x, pos.y, pos.z, 70, 100.0, true, false, 0)
                    end
                end
            end
            
            function ApplyForce(entity, direction)
                ApplyForceToEntity(
                    entity,
                    3,
                    direction,
                    0,
                    0,
                    0,
                    false,
                    false,
                    true,
                    true,
                    false,
                    true
                )
            end

            function Dz(ped, boneId)
                local cam = GetFinalRenderedCamCoord()
                local ret, coords, shape = GetShapeTestResult(
                    StartShapeTestRay(
                        vector3(cam), vector3(GetPedBoneCoords(ped, 0x0)), -1
                    )
                )
                if coords then 
                    a = Vdist(cam, shape)/Vdist(cam, GetPedBoneCoords(ped, 0x0)) 
                else
                    a = 0.83 
                end
                if a > 1 then 
                    a = 0.83 
                end
                if ret then
                    return (((GetPedBoneCoords(ped, boneId)-cam)*((a) * 0.83)) + cam)
                end
            end

            if esp_skel then
                for k, v in pairs(GetActivePlayers()) do
                    local ped = GetPlayerPed(v)
                    local Pped = PlayerPedId()
                    er = PlayerPedId()
                    if GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(PlayerPedId()), true) < 300 + 0.0 and ped ~= er then
                        DrawLine(Dz(ped, 31086, 0.0, 0.0, 0.0),Dz(ped, 0x9995, 0.0, 0.0, 0.0),esp_skel_cor.r, esp_skel_cor.g, esp_skel_cor.b, 255)
                        DrawLine(Dz(ped, 0x9995, 0.0, 0.0, 0.0),Dz(ped, 0xE0FD, 0.0, 0.0, 0.0),esp_skel_cor.r, esp_skel_cor.g, esp_skel_cor.b, 255)
                        DrawLine(Dz(ped, 0x5C57, 0.0, 0.0, 0.0),Dz(ped, 0xE0FD, 0.0, 0.0, 0.0),esp_skel_cor.r, esp_skel_cor.g, esp_skel_cor.b, 255)
                        DrawLine(Dz(ped, 0x192A, 0.0, 0.0, 0.0),Dz(ped, 0xE0FD, 0.0, 0.0, 0.0),esp_skel_cor.r, esp_skel_cor.g, esp_skel_cor.b, 255)
                        DrawLine(Dz(ped, 0x3FCF, 0.0, 0.0, 0.0),Dz(ped, 0x192A, 0.0, 0.0, 0.0),esp_skel_cor.r, esp_skel_cor.g, esp_skel_cor.b, 255)
                        DrawLine(Dz(ped, 0xCC4D, 0.0, 0.0, 0.0),Dz(ped, 0x3FCF, 0.0, 0.0, 0.0),esp_skel_cor.r, esp_skel_cor.g, esp_skel_cor.b, 255)
                        DrawLine(Dz(ped, 0xB3FE, 0.0, 0.0, 0.0),Dz(ped, 0x5C57, 0.0, 0.0, 0.0),esp_skel_cor.r, esp_skel_cor.g, esp_skel_cor.b, 255)
                        DrawLine(Dz(ped, 0xB3FE, 0.0, 0.0, 0.0),Dz(ped, 0x3779, 0.0, 0.0, 0.0),esp_skel_cor.r, esp_skel_cor.g, esp_skel_cor.b, 255)
                        DrawLine(Dz(ped, 0x9995, 0.0, 0.0, 0.0),Dz(ped, 0xB1C5, 0.0, 0.0, 0.0),esp_skel_cor.r, esp_skel_cor.g, esp_skel_cor.b, 255)
                        DrawLine(Dz(ped, 0xB1C5, 0.0, 0.0, 0.0),Dz(ped, 0xEEEB, 0.0, 0.0, 0.0),esp_skel_cor.r, esp_skel_cor.g, esp_skel_cor.b, 255)
                        DrawLine(Dz(ped, 0xEEEB, 0.0, 0.0, 0.0),Dz(ped, 0x49D9, 0.0, 0.0, 0.0),esp_skel_cor.r, esp_skel_cor.g, esp_skel_cor.b, 255)
                        DrawLine(Dz(ped, 0x9995, 0.0, 0.0, 0.0),Dz(ped, 0x9D4D, 0.0, 0.0, 0.0),esp_skel_cor.r, esp_skel_cor.g, esp_skel_cor.b, 255)
                        DrawLine(Dz(ped, 0x9D4D, 0.0, 0.0, 0.0),Dz(ped, 0x6E5C, 0.0, 0.0, 0.0),esp_skel_cor.r, esp_skel_cor.g, esp_skel_cor.b, 255)
                        DrawLine(Dz(ped, 0x6E5C, 0.0, 0.0, 0.0),Dz(ped, 0xDEAD, 0.0, 0.0, 0.0),esp_skel_cor.r, esp_skel_cor.g, esp_skel_cor.b, 255)
                    end
                end 
            end

            if buniza then
                DisableControlAction(0, 86, true)
                if IsDisabledControlPressed(0, 86) and IsPedInAnyVehicle(PlayerPedId()) then
                local ped = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(ped, false)
                SetVehicleForwardSpeed(playerVeh, 90.0)
                end
            end

            if rolasinf then
                for i = 0, 3 do
                    StatSetInt(GetHashKey("mp" .. i .. "_shooting_ability"), 9999, true)
                    StatSetInt(GetHashKey("sp" .. i .. "_shooting_ability"), 9999, true)
                end
            else
                for i = 0, 3 do
                    StatSetInt(GetHashKey("mp" .. i .. "_shooting_ability"), 0, true)
                    StatSetInt(GetHashKey("sp" .. i .. "_shooting_ability"), 0, true)
                end
            end

            if noragdol then
                SetPedCanRagdoll(PlayerPedId(), false)
            else
                SetPedCanRagdoll(PlayerPedId(), true)
            end

            if veh_cair then
                SetPedCanBeKnockedOffVehicle(PlayerPedId(), true)
            else
                SetPedCanBeKnockedOffVehicle(PlayerPedId(), false)
            end

            local function L(M, N)
                return vector3(M.x + N.x, M.y + N.y, M.z + N.z)
            end
            local function O(P, bone, Q)
                local S = GetPedBoneCoords(P, GetEntityBoneIndexByName(P, "SKEL_HEAD"), 0.0, 0.0, 0.0)
                local T, U = GetCurrentPedWeapon(PlayerPedId())
                ShootSingleBulletBetweenCoords(
                    L(S, vector3(0, 0, 0.1)),
                    S,
                    Q,
                    true,
                    U,
                    PlayerPedId(),
                    true,
                    true,
                    1000.0
                )
            end
            local function bD(H)
                if
                    IsEntityOnScreen(H) and HasEntityClearLosToEntityInFront(PlayerPedId(), H) and
                        not IsPedDeadOrDying(H) and
                        not IsPedInVehicle(H, GetVehiclePedIsIn(H), false) and
                        IsDisabledControlPressed(0, 24) and
                        IsPlayerFreeAiming(PlayerId())
                 then
                    local x, y, z = table.unpack(GetEntityCoords(H))
                    local T, _x, _y = World3dToScreen2d(x, y, z)
                    if _x > 0.25 and _x < 0.75 and _y > 0.25 and _y < 0.75 then
                        local T, U = GetCurrentPedWeapon(PlayerPedId())
                        O(H, "", GetWeaponDamage(U, 0))
                    end
                end
            end


            local function GetCamDirection()
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
            function lerp(n, o, p)
                if n > 1 then
                    return p
                end
                if n < 0 then
                    return o
                end
                return o + (p - o) * n
            end

            if IsControlJustPressed(0, reviver["Value"]) then
                SetEntityHealth(PlayerPedId(),400)
                local coords = GetEntityCoords(PlayerPedId())
                NetworkResurrectLocalPlayer(coords, GetEntityHeading(PlayerPedId()), true, false)
            end
            if IsControlJustPressed(0, repararveh["Value"]) then
                local eq = Citizen.InvokeNative(0x6094AD011A2EA87D, Citizen.InvokeNative(0xD80958FC74E988A6))
                Citizen.InvokeNative(0x49733E92263139D1, eq)
                SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
                SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
                SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
                Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
            end
            if IsControlJustPressed(0, tpwaypoint["Value"]) then
                TeleportToWaypoint()
            end

            if IsControlJustPressed(0, cameraaa["Value"]) then
                freecamm = not freecamm
            end

            function RequestControlOnce(entity)
                if not NetworkIsInSession or NetworkHasControlOfEntity(entity) then
                    return true
                end
                SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity), true)
                return NetworkRequestControlOfEntity(entity)
            end
            
            if IsControlJustPressed(1, keybindmenu["Value"]) then
                DisplayMenu = not DisplayMenu
            end
            if DisplayMenu then
                Menu()
                DisabilitarTeclas()
            end
        end
    end
)
------------------------------
-- F5 PARA DAR TP NOS CARROS
------------------------------
local platano = 
{
	closed = true,
	key = 166,
	entityEnumerator = 
	{
	  __gc = function(enum)
		if enum.destructor and enum.handle then
		  enum.destructor(enum.handle)
		end
		enum.destructor = nil
		enum.handle = nil
	  end
	}
}

function platano:enumerate_vehicles()
  return coroutine.wrap(function()
    local iter, id =  FindFirstVehicle()
    if not id or id == 0 then
      EndFindVehicle(iter)
      return
    end
    
    local enum = {handle = iter, destructor = EndFindVehicle}
    setmetatable(enum, platano.entityEnumerator)
    
    local next = true
    repeat
      coroutine.yield(id)
      next, id = FindNextVehicle(iter)
    until not next
    
    enum.destructor, enum.handle = nil, nil
    EndFindVehicle(iter)
  end)
end

function platano:rectangle(x, y, w, h, r, g, b, a)
	local resx, resy = GetActiveScreenResolution()
	local rectw, recth = w / resx, h / resy
	local rectx, recty = x / resx + rectw / 2, y / resy + recth / 2
	DrawRect(rectx, recty, rectw, recth, r, g, b, a)
end

function platano:text (text, font, centered, x, y, scale, r, g, b, a)
	local resx, resy = GetActiveScreenResolution()
	SetTextFont(font)
	SetTextScale(scale, scale)  
	SetTextCentre(centered)  
	SetTextColour(r, g, b, a) 
	BeginTextCommandDisplayText("STRING")  
	AddTextComponentSubstringPlayerName(text)  
	EndTextCommandDisplayText(x / resx, y / resy)
end

function platano:hovered (x, y, w, h)
	local mousex, mousey = GetNuiCursorPosition() 
	if mousex >= x and mousex <= x + w and mousey >= y and mousey <= y + h then 
		return true 
	else 
		return false 
	end 
end

function platano:button(name,xx,yy,r,g,b)
	local x,y = GetNuiCursorPosition()
	platano:text(name,4,0,xx,yy + 8, 0.3,255, 255,255,255)

	if platano:hovered(xx,yy + 8,100,18) then 
	
		if IsDisabledControlPressed(0, 92) then
			platano:text(name,4,0,xx,yy + 8, 0.3,r, g,b,255)
		end
		
		if IsDisabledControlJustPressed(0, 92) then
			return true
		end
		
	else
		return false
	end
end

function platano:rainbow(speed)
    local return_values = {}
	
    local game_timer = GetGameTimer() / 200
	
    return_values.r = math.floor(math.sin(game_timer * speed + 0) * 127 + 128)
    return_values.g = math.floor(math.sin(game_timer * speed + 2) * 127 + 128)
    return_values.b = math.floor(math.sin(game_timer * speed + 4) * 127 + 128)
	
    return return_values
end

Citizen.CreateThread(function()
  while true do
  	if IsDisabledControlJustPressed(1, platano.key) then
		platano.closed = not platano.closed
	end
  
	if platano.closed == false then
	

		local rainbow = platano:rainbow(1.0)

		platano:rectangle(19,19,152,502,153,50,204,255)
		platano:rectangle(20,20,150,500,0,0,0,255)

		local x,y = GetNuiCursorPosition()
				
		local i = 0

		for veh in platano:enumerate_vehicles() do				
			if IsEntityDead(veh) then
				i = i + 1
				if platano:button(GetDisplayNameFromVehicleModel(GetEntityModel(veh)) .. " [~r~Destruido~w~]",25,i * 16,255,255,255) then
					SetVehicleFixed(veh)
					SetPedIntoVehicle(GetPlayerPed(-1),veh,-1)
				end
			else	
				if GetPedInVehicleSeat(veh,-1) == 0 then
					i = i + 1
					if platano:button(GetDisplayNameFromVehicleModel(GetEntityModel(veh)) .. " [~g~Liberado~w~]",25,i * 16,255,255,255) then
						SetPedIntoVehicle(GetPlayerPed(-1),veh,-1)
					end
				end
			end
		end
		
		platano:rectangle(x, y, 5, 5, 153,50,204,255)

	end
    Citizen.Wait(0)
  end
end)


--------------------------------------------------------
-- NOCLIP
--------------------------------------------------------
local function GetSeatPedIsIn(ped)
    if not IsPedInAnyVehicle(ped, false) then return
    else
        veh = GetVehiclePedIsIn(ped)
        for i = 0, GetVehicleMaxNumberOfPassengers(veh) do
            if GetPedInVehicleSeat(veh) then return i end
        end
    end
end

if IsControlJustPressed(1, noclip["Value"]) then
    
    Noclip2 = not Noclip2
    if Noclip2 then
        SetEntityVisible(PlayerPedId(), false, false)
    else
        SetEntityRotation(GetVehiclePedIsIn(PlayerPedId(), 0), GetGameplayCamRot(2), 2, 1)
        SetEntityVisible(GetVehiclePedIsIn(PlayerPedId(), 0), true, false)
        SetEntityVisible(PlayerPedId(), true, false)
    end
end		
if Noclip2 then
    local NoclipSpeed = 0.5
    currentSpeed = (_FiVe_SeNsE_.Sliders['NoclipSpeed'].value / 10)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId(), 0)
    local k = ratinhomitoss
    local x, y, z = ratinhomitoss
    if not isInVehicle then
        k = PlayerPedId()
        x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 2))
    else
        k = GetVehiclePedIsIn(PlayerPedId(), 0)
        x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 1))
    end
    if isInVehicle and GetSeatPedIsIn(PlayerPedId()) ~= -1 then
        RequestControlOnce(k)
    end
    local dx, dy, dz = GetCamDirection()
    SetEntityVisible(PlayerPedId(), 0, 0)
    SetEntityVisible(k, 0, 0)
    SetEntityVelocity(k, 0.0001, 0.0001, 0.0001)
    if Citizen.InvokeNative(0xE2587F8CBBD87B1D, 0, nieltecladista["LEFTSHIFT"]) then -- Change speed
        currentSpeed = currentSpeed * 1.3
    end
    if IsDisabledControlPressed(0, 32) then -- MOVE FORWARD
        x = x + currentSpeed * dx
        y = y + currentSpeed * dy
        z = z + currentSpeed * dz
    end
    if IsDisabledControlPressed(0, 269) then -- MOVE BACK
        x = x - currentSpeed * dx
        y = y - currentSpeed * dy
        z = z - currentSpeed * dz
    end
    if IsDisabledControlPressed(0, nieltecladista["SPACE"]) then -- MOVE UP
        z = z + currentSpeed
    end
    if IsDisabledControlPressed(0, nieltecladista["LEFTCTRL"]) then -- MOVE DOWN
        z = z - currentSpeed
    end
    SetEntityCoordsNoOffset(k, x, y, z, true, true, true)
end
----------------------------------------------------------------------------
-- ESP DE NPC
----------------------------------------------------------------------------
if npcesp then
    for an in EnumeratePeds() do
        local d4, d5 = GetActiveScreenResolution()
        local cC = GetEntityCoords(an)
        me = an ~= PlayerPedId()
        mr = an
        local cD = GetDistanceBetweenCoords(GetFinalRenderedCamCoord(), cC.x, cC.y, cC.z, true) * (1.1 - 0.05)
        if IsEntityOnScreen(an) then
            if cD < 125 then
                if me and mr and not IsEntityDead(an) and not IsPedAPlayer(an) then
                    SetDrawOrigin(cC.x, cC.y, cC.z, 0)
                    DrawRect(0.0, 0.0, 1075.2 / d4 / cD, 2376 / d5 / cD, 0, 0, 0, 90)
                    if HasEntityClearLosToEntity(PlayerPedId(), an, 19) then
                        local r, g, b = 90, 252, 3
                        DrawRect(-537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DrawRect(-537.6 / d4 / cD, -700.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DrawRect(-537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DrawRect(537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DrawRect(537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DrawRect(
                            (290 + 150 / 2) / d4 / cD,
                            1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                        DrawRect(
                            (-290 - 150 / 2) / d4 / cD,
                            1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                        DrawRect(
                            (290 + 150 / 2) / d4 / cD,
                            -1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                        DrawRect(
                            (-290 - 150 / 2) / d4 / cD,
                            -1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                        local d6 = "NPC"
                        local x, y, z = table.unpack(GetEntityCoords(an))
                        bw(x, y, z - 0.8, d6, 255, 0, 212)
                    else
                        local r, g, b = 252, 3, 186
                        DrawRect(-537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DrawRect(-537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DrawRect(537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DrawRect(537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DrawRect(
                            (290 + 150 / 2) / d4 / cD,
                            1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                        DrawRect(
                            (-290 - 150 / 2) / d4 / cD,
                            1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                        DrawRect(
                            (290 + 150 / 2) / d4 / cD,
                            -1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                        DrawRect(
                            (-290 - 150 / 2) / d4 / cD,
                            -1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                        local d6 = "NPC"
                        local x, y, z = table.unpack(GetEntityCoords(an))
                        bw(x, y, z - 0.8, d6, 255, 0, 212)
                    end
                    ClearDrawOrigin()
                end
            end
        end
    end
end
----------------------------------------------------
-- NEW BOX
----------------------------------------------------
if espboxdomenu then
    for k, v in pairs(GetActivePlayers()) do 
        local pPed = GetPlayerPed(v)
        local d4, d5 = GetActiveScreenResolution()
        local cC = GetEntityCoords(an)
    
    
        if IsEntityOnScreen(pPed) then
            if includeself then
                er = nil
            else
                er = PlayerPedId()
            end
            local cD = GetDistanceBetweenCoords(GetFinalRenderedCamCoord(), cC.x, cC.y, cC.z, ratinhomitozz) * (1.1 - 0.05)
            local dB = GetPedArmour(an) * 10.76200
    
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(pPed), true)  then
                local dist = GetDistanceBetweenCoords(GetFinalRenderedCamCoord(), GetEntityCoords(pPed), true)
                SetDrawOrigin(GetEntityCoords(pPed))
                DrawRect(0, -0.999 / dist, 0.53 / dist, 0.001, 255, 122, 255, 255)
                DrawRect(0, 0.999 / dist, 0.53 / dist, 0.001, 255, 122, 255, 255)
                DrawRect(-0.265 / dist, 0, 0.0006, 2.0 / dist, 255, 122, 255, 255)
                DrawRect(0.265 / dist, 0, 0.0006, 2.0 / dist, 255, 122, 255, 255)
                
            end
        end
        ClearDrawOrigin()
    end
end
----------------------------------------------------
-- BARRA DE VIDA
----------------------------------------------------
if vidabarra then
    for k, v in pairs(GetActivePlayers()) do 
        local pPed = GetPlayerPed(v)
        if IsEntityOnScreen(pPed) then
            if includeself then
                er = nil
            else
                er = PlayerPedId()
            end
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(pPed), true)  then
                local dist = GetDistanceBetweenCoords(GetFinalRenderedCamCoord(), GetEntityCoords(pPed), true)
                SetDrawOrigin(GetEntityCoords(pPed))          
                DrawRect(-0.2745 / dist - (dist / 500) / dist, 0, 0.0015, 2.0 / dist, 0, 0, 0, 90)
               --drawTextOutline(_FiVe_SeNsE_.curak.floor(H), (0 + (screenY - screenY2) / 7 - 4 / resX)-0.003,  (0 - (screenY - screenY2)/2 + ((H/NUM) - (1 / resX))-0.003)+0.011, 0.2, 4, true, 255, 255, 255, 255)
                DrawRect(-0.2745 / dist - (dist / 500) / dist, 0.999 / dist - GetEntityHealth(pPed) / 195 / dist, 0.0005, GetEntityHealth(pPed) / 98 / dist, 30, 255, 30, 255)
            end
        end
        ClearDrawOrigin()
    end
end
------------------------------------------------------------
-- AMOURBAR
------------------------------------------------------------
if armourbar then
    for k, v in _FiVe_SeNsE_.Math.pairs(GetActivePlayers()) do 
        local pPed = GetPlayerPed(v)
        if IsEntityOnScreen(pPed) then
            if includeself then
                er = nil
            else
                er = PlayerPedId()
            end
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(pPed), true) < _FiVe_SeNsE_.ComboBoxesT.EspDist[_FiVe_SeNsE_.ComboBoxesT.EspDistMultIndex] and pPed ~= er then
                local dist = GetDistanceBetweenCoords(GetFinalRenderedCamCoord(), GetEntityCoords(pPed), true)
                SetDrawOrigin(GetEntityCoords(pPed))          
    
                DrawRect(-0.3 / dist - (dist / 500) / dist, 0, 0.0015, 2.0 / dist, 0, 0, 0, 90)
                DrawRect(-0.3 / dist - (dist / 500) / dist, 0.999 / dist - GetPedArmour(pPed) / 100.5 / dist, 0.0005, GetPedArmour(pPed) / 50 / dist, 0, 174, 255, 255)
            end
        end
        ClearDrawOrigin()
    end
end
-------------------------------------------------------
-- NOMES
-------------------------------------------------------
if nomesesp then
    for k, v in _FiVe_SeNsE_.Math.pairs(GetActivePlayers()) do
        local player = GetPlayerPed(v)
        if includeself then
            er = nil
        else
            er = PlayerPedId()
        end
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(player), true) < _FiVe_SeNsE_.ComboBoxesT.EspDist[_FiVe_SeNsE_.ComboBoxesT.EspDistMultIndex] and player ~= er then
            local playerX, playerY, playerZ = _FiVe_SeNsE_.Strings.tunpack(GetEntityCoords(player))
            local position = GetEntityCoords(player)
            
            local xx = _FiVe_SeNsE_.Math.tonumber(_FiVe_SeNsE_.Strings.format("%.2f", playerX))
            local yy = _FiVe_SeNsE_.Math.tonumber(_FiVe_SeNsE_.Strings.format("%.2f", playerY))
            local zz = _FiVe_SeNsE_.Math.tonumber(_FiVe_SeNsE_.Strings.format("%.2f", playerZ))
            local pos = {x = xx, y = yy, z = zz}

            local text = 'Nick: '..GetPlayerName(v)..' | Health: '..(GetEntityHealth(player) - 100)..'/100 | ID: '..GetPlayerServerId(v)..''
            DrawTextOnCoords(position.x, position.y, position.z+1.0, text, 255, 255, 255, 4, 0.10)
        end
    end
end
--------------------------------------------------------
-- CORNER BOX
--------------------------------------------------------
if cornerBox then
    for an in EnumeratePeds() do
        local d4, d5 = GetActiveScreenResolution()
        local cC = GetEntityCoords(an)
        me = an ~= PlayerPedId()
        mr = IsPedAPlayer(an)
        local cD = GetDistanceBetweenCoords(GetFinalRenderedCamCoord(), cC.x, cC.y, cC.z, ratinhomitozz) * (1.1 - 0.05)
        local dB = GetPedArmour(an) * 10.76200
        local aK = GetEntityHealth(an) * 5.38200
        local dC = 1250
        local dD = 1200
        if IsEntityOnScreen(an) then
            if cD < 125 then
                if me and mr and not IsEntityDead(an) then
                    SetDrawOrigin(cC.x, cC.y, cC.z, 0)
                    ratinhomitouu(0.0, 0.0, 1075.2 / d4 / cD, 2376 / d5 / cD, 0, 0, 0, 90)
                    if HasEntityClearLosToEntity(PlayerPedId(), an, 19) then
                        local r, g, b = esp_box_cor.r, esp_box_cor.g, esp_box_cor.b
                        ratinhomitouu(-537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        ratinhomitouu(-537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        ratinhomitouu(537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        ratinhomitouu(537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        ratinhomitouu(
                        (290 + 150 / 2) / d4 / cD,
                        1190.6 / d5 / cD,
                        350 / d4 / cD,
                        1 / d5,
                        r,
                        g,
                        b,
                        255
                    )
                    ratinhomitouu(
                    (-290 - 150 / 2) / d4 / cD,
                    1190.6 / d5 / cD,
                    350 / d4 / cD,
                    1 / d5,
                    r,
                    g,
                    b,
                    255
                )
                ratinhomitouu(
                (290 + 150 / 2) / d4 / cD,
                -1190.6 / d5 / cD,
                350 / d4 / cD,
                1 / d5,
                r,
                g,
                b,
                255
            )
            ratinhomitouu(
            (-290 - 150 / 2) / d4 / cD,
            -1190.6 / d5 / cD,
            350 / d4 / cD,
            1 / d5,
            r,
            g,
            b,
            255
        )
    else
        local r, g, b = 255, 0, 0
        ratinhomitouu(-537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
        ratinhomitouu(-537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
        ratinhomitouu(537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
        ratinhomitouu(537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
        ratinhomitouu(
        (290 + 150 / 2) / d4 / cD,
        1190.6 / d5 / cD,
        350 / d4 / cD,
        1 / d5,
        r,
        g,
        b,
        255
    )
    ratinhomitouu(
    (-290 - 150 / 2) / d4 / cD,
    1190.6 / d5 / cD,
    350 / d4 / cD,
    1 / d5,
    r,
    g,
    b,
    255
)
ratinhomitouu(
(290 + 150 / 2) / d4 / cD,
-1190.6 / d5 / cD,
350 / d4 / cD,
1 / d5,
r,
g,
b,
255
)
ratinhomitouu(
(-290 - 150 / 2) / d4 / cD,
-1190.6 / d5 / cD,
350 / d4 / cD,
1 / d5,
r,
g,
b,
255
)
end
if GetPedArmour(an) == 0 then
    r, g, b = 75, 141 - (50 - GetPedArmour(an)), 173 - (100 - GetPedArmour(an))
else
    r, g, b = 0, 178, 255
end
ratinhomitouu(
-1078.2 / 2 / d4 / cD + dB / 2 / d4 / cD,
dC / d5 / cD + cD / 400 / cD,
dB / d4 / cD,
3 / d5,
r,
g,
b,
255
)
ratinhomitouu(
-1078.2 / 2 / d4 / cD + aK / 2 / d4 / cD,
dD / d5 / cD + cD / 400 / cD,
aK / d4 / cD,
3 / d5,
0,
255,
0,
255
)
ClearDrawOrigin()
end
end
end
end

end