local showPlayerBlips = true
local ignorePlayerNameDistance = false
local playerNamesDist = 125
local displayIDHeight = 1.5 --Height of ID above players head(starts at center body mass)
--Set Default Values for Colors
local red = 255
local green = 255
local blue = 255
local group
overwriteAlpha = true
local invin = false
local invis = false
local therm = false
local ePunch = false
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(500)
	end

end)
				TriggerEvent('HCheat:TempDisableDetection', true)

local sJump = false	
local SpeedDemon = false
local GriefersChoice = 	{ "Tezeract", "Dune4", "Dune5", "Nero2", "Bmx", "Sanchez", "Rhino", "Barrage", "Phantom2" }
local boats = {"Dinghy", "Dinghy2", "Dinghy3", "Dingh4", "Jetmax", "Marquis", "Seashark", "Seashark2", "Seashark3", "Speeder", "Speeder2", "Squalo", "Submersible", "Submersible2", "Suntrap", "Toro", "Toro2", "Tropic", "Tropic2", "Tug"}
local Commercial = {"Benson", "Biff", "Cerberus", "Cerberus2", "Cerberus3", "Hauler", "Hauler2", "Mule", "Mule2", "Mule3", "Mule4", "Packer", "Phantom", "Phantom2", "Phantom3", "Pounder", "Pounder2", "Stockade", "Stockade3", "Terbyte"}
local Compacts = {"Blista", "Blista2", "Blista3", "Brioso", "Dilettante", "Dilettante2", "Issi2", "Issi3", "issi4", "Iss5", "issi6", "Panto", "Prarire", "Rhapsody"}
local Coupes = { "CogCabrio", "Exemplar", "F620", "Felon", "Felon2", "Jackal", "Oracle", "Oracle2", "Sentinel", "Sentinel2", "Windsor", "Windsor2", "Zion", "Zion2"}
local cycles = { "Bmx", "Cruiser", "Fixter", "Scorcher", "Tribike", "Tribike2", "tribike3" }
local Emergency = { "Ambulance", "FBI", "FBI2", "FireTruk", "PBus", "Police", "Police2", "Police3", "Police4", "PoliceOld1", "PoliceOld2", "PoliceT", "Policeb", "Polmav", "Pranger", "Predator", "Riot", "Riot2", "Sheriff", "Sheriff2"}
local Helicopters = { "Akula", "Annihilator", "Buzzard", "Buzzard2", "Cargobob", "Cargobob2", "Cargobob3", "Cargobob4", "Frogger", "Frogger2", "Havok", "Hunter", "Maverick", "Savage", "Seasparrow", "Skylift", "Supervolito", "Supervolito2", "Swift", "Swift2", "Valkyrie", "Valkyrie2", "Volatus"}
local Industrial = { "Bulldozer", "Cutter", "Dump", "Flatbed", "Guardian", "Handler", "Mixer", "Mixer2", "Rubble", "Tiptruck", "Tiptruck2"}
local Military = { "APC", "Barracks", "Barracks2", "Barracks3", "Barrage", "Chernobog", "Crusader", "Halftrack", "Khanjali", "Rhino", "Scarab", "Scarab2", "Scarab3", "Thruster", "Trailersmall2"}
local Motorcycles = { "Akuma", "Avarus", "Bagger", "Bati2", "Bati", "BF400", "Blazer4", "CarbonRS", "Chimera", "Cliffhanger", "Daemon", "Daemon2", "Defiler", "Deathbike", "Deathbike2", "Deathbike3", "Diablous", "Diablous2", "Double", "Enduro", "esskey", "Faggio2", "Faggio3", "Faggio", "Fcr2", "fcr", "gargoyle", "hakuchou2", "hakuchou", "hexer", "innovation", "Lectro", "Manchez", "Nemesis", "Nightblade", "Oppressor", "Oppressor2", "PCJ", "Ratbike", "Ruffian", "Sanchez2", "Sanchez", "Sanctus", "Shotaro", "Sovereign", "Thrust", "Vader", "Vindicator", "Vortex", "Wolfsbane", "zombiea", "zombieb"}
local muscle = { "Blade", "Buccaneer", "Buccaneer2", "Chino", "Chino2", "clique", "Deviant", "Dominator", "Dominator2", "Dominator3", "Dominator4", "Dominator5", "Dominator6", "Dukes", "Dukes2", "Ellie", "Faction", "faction2", "faction3", "Gauntlet", "Gauntlet2", "Hermes", "Hotknife", "Hustler", "Impaler", "Impaler2", "Impaler3", "Impaler4", "Imperator", "Imperator2", "Imperator3", "Lurcher", "Moonbeam", "Moonbeam2", "Nightshade", "Phoenix", "Picador", "RatLoader", "RatLoader2", "Ruiner", "Ruiner2", "Ruiner3", "SabreGT", "SabreGT2", "Sadler2", "Slamvan", "Slamvan2", "Slamvan3", "Slamvan4", "Slamvan5", "Slamvan6", "Stalion", "Stalion2", "Tampa", "Tampa3", "Tulip", "Vamos,", "Vigero", "Virgo", "Virgo2", "Virgo3", "Voodoo", "Voodoo2", "Yosemite"}
local OffRoad = {"BFinjection", "Bifta", "Blazer", "Blazer2", "Blazer3", "Blazer5", "Bohdi", "Brawler", "Bruiser", "Bruiser2", "Bruiser3", "Caracara", "DLoader", "Dune", "Dune2", "Dune3", "Dune4", "Dune5", "Insurgent", "Insurgent2", "Insurgent3", "Kalahari", "Kamacho", "LGuard", "Marshall", "Mesa", "Mesa2", "Mesa3", "Monster", "Monster4", "Monster5", "Nightshark", "RancherXL", "RancherXL2", "Rebel", "Rebel2", "RCBandito", "Riata", "Sandking", "Sandking2", "Technical", "Technical2", "Technical3", "TrophyTruck", "TrophyTruck2", "Freecrawler", "Menacer"}
local Planes = {"AlphaZ1", "Avenger", "Avenger2", "Besra", "Blimp", "blimp2", "Blimp3", "Bombushka", "Cargoplane", "Cuban800", "Dodo", "Duster", "Howard", "Hydra", "Jet", "Lazer", "Luxor", "Luxor2", "Mammatus", "Microlight", "Miljet", "Mogul", "Molotok", "Nimbus", "Nokota", "Pyro", "Rogue", "Seabreeze", "Shamal", "Starling", "Stunt", "Titan", "Tula", "Velum", "Velum2", "Vestra", "Volatol", "Striekforce"}
local SUVs = {"BJXL", "Baller", "Baller2", "Baller3", "Baller4", "Baller5", "Baller6", "Cavalcade", "Cavalcade2", "Dubsta", "Dubsta2", "Dubsta3", "FQ2", "Granger", "Gresley", "Habanero", "Huntley", "Landstalker", "patriot", "Patriot2", "Radi", "Rocoto", "Seminole", "Serrano", "Toros", "XLS", "XLS2"}
local Sedans = {"Asea", "Asea2", "Asterope", "Cog55", "Cogg552", "Cognoscenti", "Cognoscenti2", "emperor", "emperor2", "emperor3", "Fugitive", "Glendale", "ingot", "intruder", "limo2", "premier", "primo", "primo2", "regina", "romero", "stafford", "Stanier", "stratum", "stretch", "surge", "tailgater", "warrener", "Washington"}
local Service = { "Airbus", "Brickade", "Bus", "Coach", "Rallytruck", "Rentalbus", "Taxi", "Tourbus", "Trash", "Trash2", "WastIndr", "PBus2"}
local Sports = {"Alpha", "Banshee", "Banshee2", "BestiaGTS", "Buffalo", "Buffalo2", "Buffalo3", "Carbonizzare", "Comet2", "Comet3", "Comet4", "Comet5", "Coquette", "Deveste", "Elegy", "Elegy2", "Feltzer2", "Feltzer3", "FlashGT", "Furoregt", "Fusilade", "Futo", "GB200", "Hotring", "Infernus2", "Italigto", "Jester", "Jester2", "Khamelion", "Kurama", "Kurama2", "Lynx", "MAssacro", "MAssacro2", "neon", "Ninef", "ninfe2", "omnis", "Pariah", "Penumbra", "Raiden", "RapidGT", "RapidGT2", "Raptor", "Revolter", "Ruston", "Schafter2", "Schafter3", "Schafter4", "Schafter5", "Schafter6", "Schlagen", "Schwarzer", "Sentinel3", "Seven70", "Specter", "Specter2", "Streiter", "Sultan", "Surano", "Tampa2", "Tropos", "Verlierer2", "ZR380", "ZR3802", "ZR3803"}
local SportsClassic = {"Ardent", "BType", "BType2", "BType3", "Casco", "Cheetah2", "Cheburek", "Coquette2", "Coquette3", "Deluxo", "Fagaloa", "Gt500", "JB700", "JEster3", "MAmba", "Manana", "Michelli", "Monroe", "Peyote", "Pigalle", "RapidGT3", "Retinue", "Savastra", "Stinger", "Stingergt", "Stromberg", "Swinger", "Torero", "Tornado", "Tornado2", "Tornado3", "Tornado4", "Tornado5", "Tornado6", "Viseris", "Z190", "ZType"}
local Super = {"adder", "Autarch", "Bullet", "Cheetah", "Cyclone", "EntityXF", "Entity2", "FMJ", "GP1", "Infernus", "LE7B", "Nero", "Nero2", "Osiris", "Penetrator", "PFister811", "Prototipo", "Reaper", "SC1", "Scramjet", "Sheava", "SultanRS", "Superd", "T20", "Taipan", "Tempesta", "Tezeract", "Turismo2", "Turismor", "Tyrant", "Tyrus", "Vacca", "Vagner", "Vigilante", "Visione", "Voltic", "Voltic2", "Zentorno", "Italigtb", "Italigtb2", "XA21"}
local Trailer = { "ArmyTanker", "ArmyTrailer", "ArmyTrailer2", "BaleTrailer", "BoatTrailer", "CableCar", "DockTrailer", "Graintrailer", "Proptrailer", "Raketailer", "TR2", "TR3", "TR4", "TRFlat", "TVTrailer", "Tanker", "Tanker2", "Trailerlogs", "Trailersmall", "Trailers", "Trailers2", "Trailers3"}
local trains = {"Freight", "Freightcar", "Freightcont1", "Freightcont2", "Freightgrain", "Freighttrailer", "TankerCar"}
local Utility = {"Airtug", "Caddy", "Caddy2", "Caddy3", "Docktug", "Forklift", "Mower", "Ripley", "Sadler", "Scrap", "TowTruck", "Towtruck2", "Tractor", "Tractor2", "Tractor3", "TrailerLArge2", "Utilitruck", "Utilitruck3", "'Utilitruck2"}
local Vans = {"Bison", "Bison2", "Bison3", "BobcatXL", "Boxville", "Boxville2", "Boxville3", "Boxville4", "Boxville5", "Burrito", "Burrito2", "Burrito3", "Burrito4", "Burrito5", "Camper", "GBurrito", "GBurrito2", "Journey", "minivan", "Minivan2", "Paradise", "pony", "Pony2", "Rumpo", "Rumpo2", "Rumpo3", "Speedo", "Speedo2", "Speedo4", "Surfer", "Surfer2", "Taco", "Youga", "youga2"}
local CarTypes = {"Griefer's Choice", "Boats", "Commercial", "Compacts", "Coupes", "Cycles", "Emergency", "Helictopers", "Industrial", "Military", "Motorcycles", "Muscle", "Off-Road", "Planes", "SUVs", "Sedans", "Service", "Sports", "Sports Classic", "Super", "Trailer", "Trains", "Utility", "Vans"}
local CarsArray = { GriefersChoice, boats, Commercial, Compacts, Coupes, cycles, Emergency, Helicopters, Industrial, Military, Motorcycles, muscle, OffRoad, Planes, SUVs, Sedans, Service, Sports, SportsClassic, Super, Trailer, trains, Utility, Vans}

local l_weapons = 
{
	Melee = {
		AntiqueCavalryDagger = { id = "weapon_dagger", name= "Antique Cavalry Dagger", bInfAmmo = false, bInfAmmo = false, mods = {} },
		BaseballBat = { id = "weapon_bat", name="Baseball Bat", bInfAmmo = false, mods = {} },
		BrokenBottle = { id = "weapon_bottle", name="Broken Bottle", bInfAmmo = false, mods = {} },
		Crowbar = { id = "weapon_Crowbar", name="Crowbar", bInfAmmo = false, mods = {} },
		Flashlight = { id = "weapon_flashlight", name="Flashlight", bInfAmmo = false, mods = {} },
		GolfClub = { id = "weapon_golfclub", name="Golf Club", bInfAmmo = false, mods = {} },
		Hammer = { id = "weapon_hammer", name = "Hammer", bInfAmmo = false, mods = {} },
		Hatchet = { id = "weapon_hatchet", name = "Hatchet", bInfAmmo = false, mods = {} },
		BrassKnuckles = { id = "weapon_knuckle", name="Brass Knuckles", bInfAmmo = false, mods = {} },
		Knife = { id = "weapon_knife", name="Knife", bInfAmmo = false, mods = {} },
		Machete = { id = "weapon_machete", name="Machete", bInfAmmo = false, mods = {} },
		Switchblade = { id = "weapon_switchblade", name="Switchblade", bInfAmmo = false, mods = {} },
		Nightstick = { id = "weapon_nightstick", name="Nightstick", bInfAmmo = false, mods = {} },
		PipeWrench = { id = "weapon_wrench", name="Pipe Wrench", bInfAmmo = false, mods = {} },
		BattleAxe = { id = "weapon_battleaxe", name="Battle Axe", bInfAmmo = false, mods = {}},
		PoolCue = { id = "weapon_poolcue", name="Pool Cue", bInfAmmo = false, mods = {} },
		StoneHatchet = { id = "weapon_stone_hatchet", name="Stone Hatchet", bInfAmmo = false, mods = {} }
		},
	Handguns = {	
		Pistol = { id = "weapon_pistol", name="Pistol", bInfAmmo = false, mods = { 
		Magazines = {
			{name = "Default Magazine", id="COMPONENT_PISTOL_CLIP_01"},
			{name = "Extended Magazine", id="COMPONENT_PISTOL_CLIP_02"}
		},
		Flashlight = 
		{
			{name = "Flashlight", id="COMPONENT_AT_PI_FLSH"}
		}, 
		BarrelAttachments = 
		{
			{name = "Suppressor", id="COMPONENT_AT_PI_SUPP_02"}
		}
		}},
		PistolMK2 = { id = "weapon_pistol_mk2", name="Pistol MK 2", bInfAmmo = false, mods = 
		{
			Magazines =
				{
					{name = "Default Magazine", id="COMPONENT_PISTOL_MK2_CLIP_01"},
					{name = "Extended Magazine", id="COMPONENT_PISTOL_MK2_CLIP_02"},
					{name = "Tracer Rounds", id="COMPONENT_PISTOL_MK2_CLIP_TRACER"},
					{name = "Incendiary Rounds", id="COMPONENT_PISTOL_MK2_CLIP_INCENDIARY"},
					{name = "Hollow Point Rounds", id="COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT"},
					{name = "FMJ Rounds", id="COMPONENT_PISTOL_MK2_CLIP_FMJ"},		
				},
				Sights =
				{
					{name = "Mounted Scope", id="COMPONENT_AT_PI_RAIL"},
				},
				Flashlight = 
				{
					{name = "Flashlight", id="COMPONENT_AT_PI_FLSH_02"},			
				},
				BarrelAttachments =
				{
					{name = "Compensator", id="COMPONENT_AT_PI_COMP"},
					{name = "Suppessor", id="COMPONENT_AT_PI_SUPP_02"},
				}
			} },
		CombatPistol = { id = "weapon_combatpistol", name = "Combat Pistol", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_COMBATPISTOL_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_COMBATPISTOL_CLIP_02"}
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_PI_FLSH"}
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_PI_SUPP"}
			} 
		} },
		APPistol = { id = "weapon_appistol",name ="AP Pistol", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_APPISTOL_CLIP_01"}, 
				{name = "Extended Magazine", id="COMPONENT_APPISTOL_CLIP_02"}
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_PI_FLSH"}
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_PI_SUPP"}
			} 
			}},
		StunGun = { id = "weapon_stungun", name="Stun Gun", bInfAmmo = false, mods = {} },
		Pistol50 = { id = "weapon_pistol50", name="Pistol .50", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_PISTOL50_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_PISTOL50_CLIP_02"}
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_PI_FLSH"}
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_PI_SUPP_02"}
			} 
		}},
		SNSPistol = { id = "weapon_snspistol",name="SNS Pistol", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_SNSPISTOL_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_SNSPISTOL_CLIP_02"}
			}
		}},
		SNSPistolMkII = { id = "weapon_snspistol_mk2",name="SNS Pistol Mk II", bInfAmmo = false, mods = {
		Magazines =
			{
				{name = "Default Magazine", id="COMPONENT_SNSPISTOL_MK2_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_SNSPISTOL_MK2_CLIP_02"},
				{name = "Tracer Rounds", id="COMPONENT_SNSPISTOL_MK2_CLIP_TRACER"},
				{name = "Incendiary Rounds", id="COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY"},
				{name = "Hollow Point Rounds", id="COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT"},
				{name = "FMJ Rounds", id="COMPONENT_SNSPISTOL_MK2_CLIP_FMJ"},		
			},
			Sights =
			{
				{name = "Mounted Scope", id="COMPONENT_AT_PI_RAIL_02"},
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_PI_FLSH_03"},			
			},
			BarrelAttachments =
			{
				{name = "Compensator", id="COMPONENT_AT_PI_COMP_02"},
				{name = "Suppressor", id="COMPONENT_AT_PI_SUPP_02"},
			}
		
		} },
		HeavyPistol = { id = "weapon_heavypistol",name="Heavy Pistol", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_HEAVYPISTOL_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_HEAVYPISTOL_CLIP_02"}
			}, 
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_PI_FLSH"}
			},
			BarrelAttachments =
			{
				{name = "Suppressor", id="COMPONENT_AT_PI_SUPP"}
			} 
		}},
		VintagePistol = { id = "weapon_vintagepistol",name="Vintage Pistol", bInfAmmo = false, mods = {
		Magazines = 
		{
			{name = "Default Magazine", id="COMPONENT_VINTAGEPISTOL_CLIP_01"},
			{name = "Extended Magazine", id="COMPONENT_VINTAGEPISTOL_CLIP_02"}
		},
		BarrelAttachments = 
			{
				{"Suppressor", id="COMPONENT_AT_PI_SUPP"}
			}
		} },
		FlareGun = { id = "weapon_flaregun", name="Flare Gun", bInfAmmo = false, mods = {} },
		MarksmanPistol = { id = "weapon_marksmanpistol", name="Marksman Pistol", bInfAmmo = false, mods = {} },
		HeavyRevolver = { id = "weapon_revolver", name="Heavy Revolver", bInfAmmo = false, mods = {} },
		HeavyRevolverMkII = { id = "weapon_revolver_mk2", name="Heavy Revolver Mk II", bInfAmmo = false, mods = {
		Magazines =
			{
				{name = "Default Rounds", id="COMPONENT_REVOLVER_MK2_CLIP_01"},
				{name = "Tracer Rounds", id="COMPONENT_REVOLVER_MK2_CLIP_TRACER"},
				{name = "Incendiary Rounds", id="COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY"},
				{name = "Hollow Point Rounds", id="COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT"},
				{name = "FMJ Rounds", id="COMPONENT_REVOLVER_MK2_CLIP_FMJ"},		
			},
			Sights =
			{
				{name = "Holograhpic Sight", id="COMPONENT_AT_SIGHTS"},
				{name = "Small Scope", id="COMPONENT_AT_SCOPE_MACRO_MK2"},
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_PI_FLSH"},			
			},
			BarrelAttachments =
			{
				{name = "Compensator", id="COMPONENT_AT_PI_COMP_03"},
			}
			} },
		DoubleActionRevolver = { id = "weapon_doubleaction", name="Double Action Revolver", bInfAmmo = false, mods = {} },
		UpnAtomizer = { id = "weapon_raypistol", name="Up-n-Atomizer", bInfAmmo = false, mods = {} },	
	},
	SMGs = {	
		MicroSMG = { id = "weapon_microsmg", name="Micro SMG", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_MICROSMG_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_MICROSMG_CLIP_02"}
			},
			Sights =
			{
				{name = "Scope", id="COMPONENT_AT_SCOPE_MACRO"}
			},
			Flashlight = 
			{			
				{name = "Flashlight", id="COMPONENT_AT_PI_FLSH"}
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_AR_SUPP_02"}
			}
		} },
		SMG = { id = "weapon_smg", name="SMG", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_SMG_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_SMG_CLIP_02"},
				{name = "Drum Magazine", id="COMPONENT_SMG_CLIP_03"},
			},
			Sights =
			{			
				{name = "Scope", id="COMPONENT_AT_SCOPE_MACRO_02"},
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_PI_SUPP"}
			}				
		} },
		SMGMkII = { id = "weapon_smg_mk2", name="SMG Mk II", bInfAmmo = false, mods = {
			Magazines =
			{
				{name = "Default Magazine", id="COMPONENT_SMG_MK2_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_SMG_MK2_CLIP_02"},
				{name = "Tracer Rounds", id="COMPONENT_SMG_MK2_CLIP_TRACER"},
				{name = "Incendiary Rounds", id="COMPONENT_SMG_MK2_CLIP_INCENDIARY"},
				{name = "Hollow Point Rounds", id="COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT"},
				{name = "FMJ Rounds", id="COMPONENT_SMG_MK2_CLIP_FMJ"},		
			},
			Sights =
			{
				{name = "Holograhpic Sight", id="COMPONENT_AT_SIGHTS_SMG"},
				{name = "Small Scope", id="COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2"},
				{name = "Medium Scope", id="COMPONENT_AT_SCOPE_SMALL_SMG_MK2"},
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},			
			},			
			Barrel = 
			{
				{name = "Default", id="COMPONENT_AT_SB_BARREL_01"},	
				{name = "Heavy", id="COMPONENT_AT_SB_BARREL_02"},			
			},
			BarrelAttachments =
			{
				{name = "Suppressor", id="COMPONENT_AT_PI_SUPP"},
				{name = "Flat Muzzle Brake", id="COMPONENT_AT_MUZZLE_01"},
				{name = "Tactical Muzzle Brake", id="COMPONENT_AT_MUZZLE_02"},
				{name = "Fat-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_03"},
				{name = "Precision Muzzle Brake", id="COMPONENT_AT_MUZZLE_04"},
				{name = "Heavy Duty Muzzle Brake", id="COMPONENT_AT_MUZZLE_05"},
				{name = "Slanted Muzzle Brake", id="COMPONENT_AT_MUZZLE_06"},
				{name = "Split-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_07"},
			}
		
		} },
		AssaultSMG = { id = "weapon_assaultsmg", name="Assault SMG", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_ASSAULTSMG_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_ASSAULTSMG_CLIP_02"}
			},
			Sights =
			{
				{name = "Scope", id="COMPONENT_AT_SCOPE_MACRO"},			
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_AR_SUPP_02"}
			}
		} },
		CombatPDW = { id = "weapon_combatpdw", name="Combat PDW", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_COMBATPDW_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_COMBATPDW_CLIP_02"},
				{name = "Drum Magazine", id="COMPONENT_COMBATPDW_CLIP_03"},
			},
			Sights =
			{
				{name = "Scope", id="COMPONENT_AT_SCOPE_SMALL"},			
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			Grips =
			{
				{name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		} },
		MachinePistol = { id = "weapon_machinepistol", name="Machine Pistol ", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_MACHINEPISTOL_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_MACHINEPISTOL_CLIP_02"},
				{name = "Drum Magazine", id="COMPONENT_MACHINEPISTOL_CLIP_03"},
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_PI_SUPP"}
			}
		} },
		MiniSMG = { id = "weapon_minismg", name="Mini SMG", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_MINISMG_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_MINISMG_CLIP_02"}
			},
		} },
		UnholyHellbringer = { id = "weapon_raycarbine", name="Unholy Hellbringer", bInfAmmo = false, mods = {} },	
	},
	Shotguns = {	
		PumpShotgun = { id = "weapon_pumpshotgun", name="Pump Shotgun", bInfAmmo = false, mods = {
			Flashlight = 
			{
				{"name = Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_SR_SUPP"},
			},		
		} },
		PumpShotgunMkII = { id = "weapon_pumpshotgun_mk2", name="Pump Shotgun Mk II", bInfAmmo = false, mods = {
			Magazines =
			{
				{name = "Default Shells", id="COMPONENT_PUMPSHOTGUN_MK2_CLIP_01"},
				{name = "Dragon's Breath Shells", id="COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY"},
				{name = "Steel Buckshot Shells", id="COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING"},
				{name = "Flechette Shells", id="COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT"},
				{name = "Explosive Slugs", id="COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE"},
			},
			Sights =
			{
				{name = "Holograhpic Sight", id="COMPONENT_AT_SIGHTS"},
				{name = "Small Scope", id="COMPONENT_AT_SCOPE_MACRO_MK2"},
				{name = "Medium Scope", id="COMPONENT_AT_SCOPE_SMALL_MK2"},
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},			
			},			
			BarrelAttachments =
			{
				{name = "Suppressor", id="COMPONENT_AT_SR_SUPP_03"},
				{name = "Squared Muzzle Brake", id="COMPONENT_AT_MUZZLE_08"},
			}
		} },
		SawedOffShotgun = { id = "weapon_sawnoffshotgun", name="Sawed-Off Shotgun", bInfAmmo = false, mods = {} },
		AssaultShotgun = { id = "weapon_assaultshotgun", name="Assault Shotgun", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_ASSAULTSHOTGUN_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_ASSAULTSHOTGUN_CLIP_02"},
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_AR_SUPP"},
			},
			Grips =
			{
				{name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		
		} },
		BullpupShotgun = { id = "weapon_bullpupshotgun", name="Bullpup Shotgun", bInfAmmo = false, mods = {
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_AR_SUPP_02"},
			},
			Grips =
			{
				{name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		} },
		Musket = { id = "weapon_musket", name="Musket", bInfAmmo = false, mods = {} },
		HeavyShotgun = { id = "weapon_heavyshotgun", name="Heavy Shotgun", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_HEAVYSHOTGUN_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_HEAVYSHOTGUN_CLIP_02"},
				{name = "Drum Magazine", id="COMPONENT_HEAVYSHOTGUN_CLIP_02"},
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_AR_SUPP_02"},
			},
			Grips =
			{
				{name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		} },
		DoubleBarrelShotgun = { id = "weapon_dbshotgun", name="Double Barrel Shotgun", bInfAmmo = false, mods = {} },
		SweeperShotgun = { id = "weapon_autoshotgun", name="Sweeper Shotgun", bInfAmmo = false, mods = {} },
	},
	AssaultRifles = {	
		AssaultRifle = { id = "weapon_assaultrifle", name="Assault Rifle", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_ASSAULTRIFLE_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_ASSAULTRIFLE_CLIP_02"},
				{name = "Drum Magazine", id="COMPONENT_ASSAULTRIFLE_CLIP_03"},
			},
			Sights =
			{
				{name = "Scope", id="COMPONENT_AT_SCOPE_MACRO"},			
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_AR_SUPP_02"},
			},
			Grips =
			{
				{name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		
		} },
		AssaultRifleMkII = { id = "weapon_assaultrifle_mk2", name="Assault Rifle Mk II", bInfAmmo = false, mods = {
			Magazines =
			{
				{name = "Default Magazine", id="COMPONENT_ASSAULTRIFLE_MK2_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_ASSAULTRIFLE_MK2_CLIP_02"},
				{name = "Tracer Rounds", id="COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER"},
				{name = "Incendiary Rounds", id="COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY"},
				{name = "Hollow Point Rounds", id="COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING"},
				{name = "FMJ Rounds", id="COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ"},		
			},
			Sights =
			{
				{name = "Holograhpic Sight", id="COMPONENT_AT_SIGHTS"},
				{name = "Small Scope", id="COMPONENT_AT_SCOPE_MACRO_MK2"},
				{name = "Large Scope", id="COMPONENT_AT_SCOPE_MEDIUM_MK2"},
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},			
			},			
			Barrel = 
			{
				{name = "Default", id="COMPONENT_AT_AR_BARREL_01"},	
				{name = "Heavy", id="COMPONENT_AT_AR_BARREL_0"},			
			},
			BarrelAttachments =
			{
				{name = "Suppressor", id="COMPONENT_AT_AR_SUPP_02"},
				{name = "Flat Muzzle Brake", id="COMPONENT_AT_MUZZLE_01"},
				{name = "Tactical Muzzle Brake", id="COMPONENT_AT_MUZZLE_02"},
				{name = "Fat-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_03"},
				{name = "Precision Muzzle Brake", id="COMPONENT_AT_MUZZLE_04"},
				{name = "Heavy Duty Muzzle Brake", id="COMPONENT_AT_MUZZLE_05"},
				{name = "Slanted Muzzle Brake", id="COMPONENT_AT_MUZZLE_06"},
				{name = "Split-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_07"},
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP_02"}			
			},
			
		} },
		CarbineRifle = { id = "weapon_carbinerifle", name="Carbine Rifle", bInfAmmo = false, mods = {
			Magazines = 
			{
				{ name = "Default Magazine", id="COMPONENT_CARBINERIFLE_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_CARBINERIFLE_CLIP_02"},
				{ name = "Box Magazine", id="COMPONENT_CARBINERIFLE_CLIP_03"},
			},
			Sights =
			{
				{ name = "Scope", id="COMPONENT_AT_SCOPE_MEDIUM"},			
			},
			Flashlight = 
			{
				{ name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{ name = "Suppressor", id="COMPONENT_AT_AR_SUPP"},
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		
		} },
		CarbineRifleMkII = { id = "weapon_carbinerifle_mk2", name="Carbine Rifle Mk II ", bInfAmmo = false, mods = {
			Magazines =
			{
				{ name = "Default Magazine", id="COMPONENT_CARBINERIFLE_MK2_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_CARBINERIFLE_MK2_CLIP_02"},
				{ name = "Tracer Rounds", id="COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER"},
				{ name = "Incendiary Rounds", id="COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY"},
				{ name = "Hollow Point Rounds", id="COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING"},
				{ name = "FMJ Rounds", id="COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ"},		
			},
			Sights =
			{
				{ name = "Holograhpic Sight", id="COMPONENT_AT_SIGHTS"},
				{ name = "Small Scope", id="COMPONENT_AT_SCOPE_MACRO_MK2"},
				{ name = "Large Scope", id="COMPONENT_AT_SCOPE_MEDIUM_MK2"},
			},
			Flashlight = 
			{
				{ name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},			
			},			
			Barrel = 
			{
				{ name = "Default", id="COMPONENT_AT_CR_BARREL_01"},	
				{ name = "Heavy", id="COMPONENT_AT_CR_BARREL_02"},			
			},
			BarrelAttachments =
			{
				{ name = "Suppressor", id="COMPONENT_AT_AR_SUPP"},
				{ name = "Flat Muzzle Brake", id="COMPONENT_AT_MUZZLE_01"},
				{ name = "Tactical Muzzle Brake", id="COMPONENT_AT_MUZZLE_02"},
				{ name = "Fat-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_03"},
				{ name = "Precision Muzzle Brake", id="COMPONENT_AT_MUZZLE_04"},
				{ name = "Heavy Duty Muzzle Brake", id="COMPONENT_AT_MUZZLE_05"},
				{ name = "Slanted Muzzle Brake", id="COMPONENT_AT_MUZZLE_06"},
				{ name = "Split-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_07"},
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP_02"}			
			},
			
		
		} },
		AdvancedRifle = { id = "weapon_advancedrifle", name="Advanced Rifle ", bInfAmmo = false, mods = {
			Magazines = 
			{
				{ name = "Default Magazine", id="COMPONENT_ADVANCEDRIFLE_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_ADVANCEDRIFLE_CLIP_02"},
			},
			Sights =
			{
				{ name = "Scope", id="COMPONENT_AT_SCOPE_SMALL"},			
			},
			Flashlight = 
			{
				{ name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{ name = "Suppressor", id="COMPONENT_AT_AR_SUPP"},
			},		
		} },
		SpecialCarbine = { id = "weapon_specialcarbine", name="Special Carbine", bInfAmmo = false, mods = {
			Magazines = 
			{
				{ name = "Default Magazine", id="COMPONENT_SPECIALCARBINE_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_SPECIALCARBINE_CLIP_02"},
				{ name = "Drum Magazine", id="COMPONENT_SPECIALCARBINE_CLIP_03"},
			},
			Sights =
			{
				{ name = "Scope", id="COMPONENT_AT_SCOPE_MEDIUM"},			
			},
			Flashlight = 
			{
				{ name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{ name = "Suppressor", id="COMPONENT_AT_AR_SUPP_02"},
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		
		} },
		SpecialCarbineMkII = { id = "weapon_specialcarbine_mk2", name="Special Carbine Mk II", bInfAmmo = false, mods = {
			Magazines =
			{
				{ name = "Default Magazine", id="COMPONENT_SPECIALCARBINE_MK2_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_SPECIALCARBINE_MK2_CLIP_02"},
				{ name = "Tracer Rounds", id="COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER"},
				{ name = "Incendiary Rounds", id="COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY"},
				{ name = "Hollow Point Rounds", id="COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING"},
				{ name = "FMJ Rounds", id="COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ"},		
			},
			Sights =
			{
				{ name = "Holograhpic Sight", id="COMPONENT_AT_SIGHTS"},
				{ name = "Small Scope", id="COMPONENT_AT_SCOPE_MACRO_MK2"},
				{ name = "Large Scope", id="COMPONENT_AT_SCOPE_MEDIUM_MK2"},
			},
			Flashlight = 
			{
				{ name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},			
			},			
			Barrel = 
			{
				{ name = "Default", id="COMPONENT_AT_SC_BARREL_01"},	
				{ name = "Heavy", id="COMPONENT_AT_SC_BARREL_02"},			
			},
			BarrelAttachments =
			{
				{ name = "Suppressor", id="COMPONENT_AT_AR_SUPP_02"},
				{ name = "Flat Muzzle Brake", id="COMPONENT_AT_MUZZLE_01"},
				{ name = "Tactical Muzzle Brake", id="COMPONENT_AT_MUZZLE_02"},
				{ name = "Fat-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_03"},
				{ name = "Precision Muzzle Brake", id="COMPONENT_AT_MUZZLE_04"},
				{ name = "Heavy Duty Muzzle Brake", id="COMPONENT_AT_MUZZLE_05"},
				{ name = "Slanted Muzzle Brake", id="COMPONENT_AT_MUZZLE_06"},
				{ name = "Split-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_07"},
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP_02"}			
			},
		
		} },
		BullpupRifle = { id = "weapon_bullpuprifle", name="Bullpup Rifle", bInfAmmo = false, mods = {
			Magazines = 
			{
				{ name = "Default Magazine", id="COMPONENT_BULLPUPRIFLE_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_BULLPUPRIFLE_CLIP_02"},
			},
			Sights =
			{
				{ name = "Scope", id="COMPONENT_AT_SCOPE_SMALL"},			
			},
			Flashlight = 
			{
				{ name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{ name = "Suppressor", id="COMPONENT_AT_AR_SUPP"},
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		
		} },
		BullpupRifleMkII = { id = "weapon_bullpuprifle_mk2", name="Bullpup Rifle Mk II", bInfAmmo = false, mods = {
			Magazines =
			{
				{ name = "Default Magazine", id="COMPONENT_BULLPUPRIFLE_MK2_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_BULLPUPRIFLE_MK2_CLIP_02"},
				{ name = "Tracer Rounds", id="COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER"},
				{ name = "Incendiary Rounds", id="COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY"},
				{ name = "Armor Piercing Rounds", id="COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING"},
				{ name = "FMJ Rounds", id="COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ"},		
			},
			Sights =
			{
				{ name = "Holograhpic Sight", id="COMPONENT_AT_SIGHTS"},
				{ name = "Small Scope", id="COMPONENT_AT_SCOPE_MACRO_02_MK2"},
				{ name = "Medium Scope", id="COMPONENT_AT_SCOPE_SMALL_MK2"},
			},
			Flashlight = 
			{
				{ name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},			
			},			
			Barrel = 
			{
				{ name = "Default", id="COMPONENT_AT_BP_BARREL_01"},	
				{ name = "Heavy", id="COMPONENT_AT_BP_BARREL_02"},			
			},
			BarrelAttachments =
			{
				{ name = "Suppressor", id="COMPONENT_AT_AR_SUPP"},
				{ name = "Flat Muzzle Brake", id="COMPONENT_AT_MUZZLE_01"},
				{ name = "Tactical Muzzle Brake", id="COMPONENT_AT_MUZZLE_02"},
				{ name = "Fat-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_03"},
				{ name = "Precision Muzzle Brake", id="COMPONENT_AT_MUZZLE_04"},
				{ name = "Heavy Duty Muzzle Brake", id="COMPONENT_AT_MUZZLE_05"},
				{ name = "Slanted Muzzle Brake", id="COMPONENT_AT_MUZZLE_06"},
				{ name = "Split-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_07"},
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		
		} },
		CompactRifle = { id = "weapon_compactrifle", name="Compact Rifle", bInfAmmo = false, mods = {
			Magazines = 
			{
				{ name = "Default Magazine", id="COMPONENT_COMPACTRIFLE_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_COMPACTRIFLE_CLIP_02"},
				{ name = "Drum Magazine", id="COMPONENT_COMPACTRIFLE_CLIP_03"},
			},
		} },	
	},
	LMGS = {	
		MG = { id = "weapon_mg", name="MG", bInfAmmo = false, mods = {					
			Magazines = 
			{
				{ name = "Default Magazine", id="COMPONENT_MG_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_MG_CLIP_02"},
			},
			Sights =
			{
				{ name = "Scope", id="COMPONENT_AT_SCOPE_SMALL_02"},			
			},
		} },
		CombatMG = { id = "weapon_combatmg", name="Combat MG", bInfAmmo = false, mods = {
			Magazines = 
			{
				{ name = "Default Magazine", id="COMPONENT_COMBATMG_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_COMBATMG_CLIP_02"},
			},
			Sights =
			{
				{ name = "Scope", id="COMPONENT_AT_SCOPE_MEDIUM"},			
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		} },
		CombatMGMkII = { id = "weapon_combatmg_mk2", name="Combat MG Mk II", bInfAmmo = false, mods = {
			Magazines =
			{
				{ name = "Default Magazine", id="COMPONENT_COMBATMG_MK2_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_COMBATMG_MK2_CLIP_02"},
				{ name = "Tracer Rounds", id="COMPONENT_COMBATMG_MK2_CLIP_TRACER"},
				{ name = "Incendiary Rounds", id="COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY"},
				{ name = "Hollow Point Rounds", id="COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING"},
				{ name = "FMJ Rounds", id="COMPONENT_COMBATMG_MK2_CLIP_FMJ"},		
			},
			Sights =
			{
				{ name = "Holograhpic Sight", id="COMPONENT_AT_SIGHTS"},
				{ name = "Medium Scope", id="COMPONENT_AT_SCOPE_SMALL_MK2"},
				{ name = "Large Scope", id="COMPONENT_AT_SCOPE_MEDIUM_MK2"},
			},
			Barrel = 
			{
				{ name = "Default", id="COMPONENT_AT_MG_BARREL_01"},	
				{ name = "Heavy", id="COMPONENT_AT_MG_BARREL_02"},			
			},
			BarrelAttachments =
			{
				{ name = "Flat Muzzle Brake", id="COMPONENT_AT_MUZZLE_01"},
				{ name = "Tactical Muzzle Brake", id="COMPONENT_AT_MUZZLE_02"},
				{ name = "Fat-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_03"},
				{ name = "Precision Muzzle Brake", id="COMPONENT_AT_MUZZLE_04"},
				{ name = "Heavy Duty Muzzle Brake", id="COMPONENT_AT_MUZZLE_05"},
				{ name = "Slanted Muzzle Brake", id="COMPONENT_AT_MUZZLE_06"},
				{ name = "Split-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_07"},
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP_02"}			
			},
			
		
		} },
		GusenbergSweeper = { id = "weapon_gusenberg", name="GusenbergSweeper", bInfAmmo = false, mods = {			
		Magazines = 
			{
				{ name = "Default Magazine", id="COMPONENT_GUSENBERG_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_GUSENBERG_CLIP_02"},
			},
		} },
	},
	Snipers = {	
		SniperRifle = { id = "weapon_sniperrifle", name="Sniper Rifle", bInfAmmo = false, mods = {
			Sights =
			{
				{ name = "Scope", id="COMPONENT_AT_SCOPE_LARGE"},	
				{ name = "Advanced Scope", id="COMPONENT_AT_SCOPE_MAX"},			
			},
			BarrelAttachments = 
			{
				{ name = "Suppressor", id="COMPONENT_AT_AR_SUPP_02"},
			},
		
		} },
		HeavySniper = { id = "weapon_heavysniper", name="Heavy Sniper", bInfAmmo = false, mods = {			
		Sights =
			{
				{ name = "Scope", id="COMPONENT_AT_SCOPE_LARGE"},	
				{ name = "Advanced Scope", id="COMPONENT_AT_SCOPE_MAX"},			
			},
		} },
		HeavySniperMkII = { id = "weapon_heavysniper_mk2", name="Heavy Sniper Mk II", bInfAmmo = false, mods = {
		Magazines =
			{
				{ name = "Default Magazine", id="COMPONENT_HEAVYSNIPER_MK2_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_HEAVYSNIPER_MK2_CLIP_02"},
				{ name = "Incendiary Rounds", id="COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY"},
				{ name = "Armor Piercing Rounds", id="COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING"},
				{ name = "FMJ Rounds", id="COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ"},		
				{ name = "Explosive Rounds", id="COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE"},
			},
			Sights =
			{
				{ name = "Zoom Scope", id="COMPONENT_AT_SCOPE_LARGE_MK2"},
				{ name = "Advanced Scope", id="COMPONENT_AT_SCOPE_MAX"},
				{ name = "Nigt Vision Scope", id="COMPONENT_AT_SCOPE_NV"},
				{ name = "Thermal Scope", id="COMPONENT_AT_SCOPE_THERMAL"},
			},	
			Barrel = 
			{
				{ name = "Default", id="COMPONENT_AT_SR_BARREL_01"},	
				{ name = "Heavy", id="COMPONENT_AT_SR_BARREL_02"},			
			},
			BarrelAttachments =
			{
				{ name = "Suppressor", id="COMPONENT_AT_SR_SUPP_03"},
				{ name = "Squared Muzzle Brake", id="COMPONENT_AT_MUZZLE_08"},
				{ name = "Bell-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_09"},
			},
		} },
		MarksmanRifle = { id = "weapon_marksmanrifle", name="Marksman Rifle", bInfAmmo = false, mods = {
			Magazines = 
			{
				{ name = "Default Magazine", id="COMPONENT_MARKSMANRIFLE_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_MARKSMANRIFLE_CLIP_02"},
			},
			Sights =
			{
				{ name = "Scope", id="COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM"},			
			},
			Flashlight = 
			{
				{ name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{ name = "Suppressor", id="COMPONENT_AT_AR_SUPP"},
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		
		
		} },
		MarksmanRifleMkII = { id = "weapon_marksmanrifle_mk2", name="Marksman Rifle Mk II", bInfAmmo = false, mods = {
			Magazines =
			{
				{ name = "Default Magazine", id="COMPONENT_MARKSMANRIFLE_MK2_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_MARKSMANRIFLE_MK2_CLIP_02"},
				{ name = "Tracer Rounds", id="COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER"},
				{ name = "Incendiary Rounds", id="COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY"},
				{ name = "Hollow Point Rounds", id="COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING"},
				{ name = "FMJ Rounds", id="COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ	"},		
			},
			Sights =
			{
				{ name = "Holograhpic Sight", id="COMPONENT_AT_SIGHTS"},
				{ name = "Large Scope", id="COMPONENT_AT_SCOPE_MEDIUM_MK2"},
				{ name = "Zoom Scope", id="COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2"},
			},
			Flashlight = 
			{
				{ name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},			
			},			
			Barrel = 
			{
				{ name = "Default", id="COMPONENT_AT_MRFL_BARREL_01"},	
				{ name = "Heavy", id="COMPONENT_AT_MRFL_BARREL_02"},			
			},
			BarrelAttachments =
			{
				{ name = "Suppressor", id="COMPONENT_AT_AR_SUPP"},
				{ name = "Flat Muzzle Brake", id="COMPONENT_AT_MUZZLE_01"},
				{ name = "Tactical Muzzle Brake", id="COMPONENT_AT_MUZZLE_02"},
				{ name = "Fat-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_03"},
				{ name = "Precision Muzzle Brake", id="COMPONENT_AT_MUZZLE_04"},
				{ name = "Heavy Duty Muzzle Brake", id="COMPONENT_AT_MUZZLE_05"},
				{ name = "Slanted Muzzle Brake", id="COMPONENT_AT_MUZZLE_06"},
				{ name = "Split-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_07"},
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP_02"}			
			},
		} },
	
	},
	HeavyWeapons = {
		RPG = { id = "weapon_rpg", name="RPG", bInfAmmo = false, mods = {} },
		GrenadeLauncher = { id = "weapon_grenadelauncher", name="Grenade Launcher", bInfAmmo = false, mods = {} },
		GrenadeLauncherSmoke = { id = "weapon_grenadelauncher_smoke", name="Grenade Launcher Smoke", bInfAmmo = false, mods = {} },
		Minigun = { id = "weapon_minigun", name="Minigun", bInfAmmo = false, mods = {} },
		FireworkLauncher = { id = "weapon_firework", name="Firework Launcher", bInfAmmo = false, mods = {} },
		Railgun = { id = "weapon_railgun", name="Railgun", bInfAmmo = false, mods = {} },
		HomingLauncher = { id = "weapon_hominglauncher", name="Homing Launcher", bInfAmmo = false, mods = {} },
		CompactGrenadeLauncher = { id = "weapon_compactlauncher", name="Compact Grenade Launcher", bInfAmmo = false, mods = {} },
		Widowmaker = { id = "weapon_rayminigun", name="Widowmaker", bInfAmmo = false, mods = {} },
	
	},
	Throwables = {
		Grenade = { id = "weapon_grenade", name="Grenade", bInfAmmo = false, mods = {} },
		BZGas = { id = "weapon_bzgas", name="BZ Gas", bInfAmmo = false, mods = {} },
		MolotovCocktail = { id = "weapon_molotov", name="Molotov Cocktail", bInfAmmo = false, mods = {} },
		StickyBomb = { id = "weapon_stickybomb", name="Sticky Bomb", bInfAmmo = false, mods = {} },
		ProximityMines = { id = "weapon_proxmine", name="Proximity Mines", bInfAmmo = false, mods = {} },
		Snowballs = { id = "weapon_snowball", name="Snowballs", bInfAmmo = false, mods = {} },
		PipeBombs = { id = "weapon_pipebomb", name="Pipe Bombs", bInfAmmo = false, mods = {} },
		Baseball = { id = "weapon_ball", name="Baseball", bInfAmmo = false, mods = {} },
		TearGas = { id = "weapon_smokegrenade", name="Tear Gas", bInfAmmo = false, mods = {} },
		Flare = { id = "weapon_flare", name="Flare", bInfAmmo = false, mods = {} },
	
	},
	Misc = {	
		JerryCan = { id = "weapon_petrolcan", name="Jerry Can", bInfAmmo = false, mods = {} },
		Parachute = { id = "gadget_parachute", name="Parachute", bInfAmmo = false, mods = {} },
		FireExtinguisher = { id = "weapon_fireextinguisher", name="Fire Extinguisher", bInfAmmo = false, mods = {} },	
	}
}





Menu = { }

Menu.debug = false


local menus = { }
local keys = { up = 172, down = 173, left = 174, right = 175, select = 176, back = 177 }
local optionCount = 0

local currentKey = nil
local currentMenu = nil

local titleHeight = 0.11
local titleYOffset = 0.03
local titleScale = 1.0

local buttonHeight = 0.038
local buttonFont = 0
local buttonScale = 0.365
local buttonTextXOffset = 0.005
local buttonTextYOffset = 0.005


local function debugPrint(text)
	if Menu.debug then
		Citizen.Trace('[Menu] '..tostring(text))
	end
end


local function debugLog(text)
		Citizen.Trace('[meme] '..tostring(text))
end

local function setMenuProperty(id, property, value)
	if id and menus[id] then
		menus[id][property] = value
		debugPrint(id..' menu property changed: { '..tostring(property)..', '..tostring(value)..' }')
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
		setMenuProperty(id, 'visible', visible)

		if not holdCurrent and menus[id] then
			setMenuProperty(id, 'currentOption', 1)
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
			SetTextWrap(menus[currentMenu].x, menus[currentMenu].x + menus[currentMenu].width - buttonTextXOffset)
			SetTextRightJustify(true)
		end
	end

	BeginTextCommandDisplayText("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x, y)
end


local function drawRect(x, y, width, height, color)
	DrawRect(x, y, width, height, color.r, color.g, color.b, color.a)
end


local function drawTitle()
	if menus[currentMenu] then
		local x = menus[currentMenu].x + menus[currentMenu].width / 2
		local y = menus[currentMenu].y + titleHeight / 2

		if menus[currentMenu].titleBackgroundSprite then
			DrawSprite(menus[currentMenu].titleBackgroundSprite.dict, menus[currentMenu].titleBackgroundSprite.name, x, y, menus[currentMenu].width, titleHeight, 0., 255, 255, 255, 255)
		else
			drawRect(x, y, menus[currentMenu].width, titleHeight, menus[currentMenu].titleBackgroundColor)
		end

		drawText(menus[currentMenu].title, x, y - titleHeight / 2 + titleYOffset, menus[currentMenu].titleFont, menus[currentMenu].titleColor, titleScale, true)
	end
end


local function drawSubTitle()
	if menus[currentMenu] then
		local x = menus[currentMenu].x + menus[currentMenu].width / 2
		local y = menus[currentMenu].y + titleHeight + buttonHeight / 2

		local subTitleColor = { r = menus[currentMenu].titleBackgroundColor.r, g = menus[currentMenu].titleBackgroundColor.g, b = menus[currentMenu].titleBackgroundColor.b, a = 255 }

		drawRect(x, y, menus[currentMenu].width, buttonHeight, menus[currentMenu].subTitleBackgroundColor)
		drawText(menus[currentMenu].subTitle, menus[currentMenu].x + buttonTextXOffset, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTitleColor, buttonScale, false)

		if optionCount > menus[currentMenu].maxOptionCount then
			drawText(tostring(menus[currentMenu].currentOption)..' / '..tostring(optionCount), menus[currentMenu].x + menus[currentMenu].width, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTitleColor, buttonScale, false, false, true)
		end
	end
end


local function drawButton(text, subText)
	local x = menus[currentMenu].x + menus[currentMenu].width / 2
	local multiplier = nil

	if menus[currentMenu].currentOption <= menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].maxOptionCount then
		multiplier = optionCount
	elseif optionCount > menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].currentOption then
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

		drawRect(x, y, menus[currentMenu].width, buttonHeight, backgroundColor)
		drawText(text, menus[currentMenu].x + buttonTextXOffset, y - (buttonHeight / 2) + buttonTextYOffset, buttonFont, textColor, buttonScale, false, shadow)

		if subText then
			drawText(subText, menus[currentMenu].x + buttonTextXOffset, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTextColor, buttonScale, false, shadow, true)
		end
	end
end


function Menu.CreateMenu(id, title)
	-- Default settings
	menus[id] = { }
	menus[id].title = title
	menus[id].subTitle = 'INTERACTION MENU'

	menus[id].visible = false

	menus[id].previousMenu = nil

	menus[id].aboutToBeClosed = false

	menus[id].x = 0.0175
	menus[id].y = 0.025
	menus[id].width = 0.23

	menus[id].currentOption = 1
	menus[id].maxOptionCount = 10

	menus[id].titleFont = 1
	menus[id].titleColor = { r = 0, g = 0, b = 0, a = 255 }
	menus[id].titleBackgroundColor = { r = 245, g = 127, b = 23, a = 255 }
	menus[id].titleBackgroundSprite = nil

	menus[id].menuTextColor = { r = 255, g = 255, b = 255, a = 255 }
	menus[id].menuSubTextColor = { r = 189, g = 189, b = 189, a = 255 }
	menus[id].menuFocusTextColor = { r = 0, g = 0, b = 0, a = 255 }
	menus[id].menuFocusBackgroundColor = { r = 245, g = 245, b = 245, a = 255 }
	menus[id].menuBackgroundColor = { r = 0, g = 0, b = 0, a = 160 }

	menus[id].subTitleBackgroundColor = { r = menus[id].menuBackgroundColor.r, g = menus[id].menuBackgroundColor.g, b = menus[id].menuBackgroundColor.b, a = 255 }

	menus[id].buttonPressedSound = { name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET" } --https://pastebin.com/0neZdsZ5

	debugPrint(tostring(id)..' menu created')
end


function Menu.CreateSubMenu(id, parent, subTitle)
	if menus[parent] then
		Menu.CreateMenu(id, menus[parent].title)

		if subTitle then
			setMenuProperty(id, 'subTitle', string.upper(subTitle))
		else
			setMenuProperty(id, 'subTitle', string.upper(menus[parent].subTitle))
		end

		setMenuProperty(id, 'previousMenu', parent)

		setMenuProperty(id, 'x', menus[parent].x)
		setMenuProperty(id, 'y', menus[parent].y)
		setMenuProperty(id, 'maxOptionCount', menus[parent].maxOptionCount)
		setMenuProperty(id, 'titleFont', menus[parent].titleFont)
		setMenuProperty(id, 'titleColor', menus[parent].titleColor)
		setMenuProperty(id, 'titleBackgroundColor', menus[parent].titleBackgroundColor)
		setMenuProperty(id, 'titleBackgroundSprite', menus[parent].titleBackgroundSprite)
		setMenuProperty(id, 'menuTextColor', menus[parent].menuTextColor)
		setMenuProperty(id, 'menuSubTextColor', menus[parent].menuSubTextColor)
		setMenuProperty(id, 'menuFocusTextColor', menus[parent].menuFocusTextColor)
		setMenuProperty(id, 'menuFocusBackgroundColor', menus[parent].menuFocusBackgroundColor)
		setMenuProperty(id, 'menuBackgroundColor', menus[parent].menuBackgroundColor)
		setMenuProperty(id, 'subTitleBackgroundColor', menus[parent].subTitleBackgroundColor)
	else
		debugPrint('Failed to create '..tostring(id)..' submenu: '..tostring(parent)..' parent menu doesn\'t exist')
	end
end


function Menu.CurrentMenu()
	return currentMenu
end


function Menu.OpenMenu(id)
	if id and menus[id] then
		PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
		setMenuVisible(id, true)
		debugPrint(tostring(id)..' menu opened')
	else
		debugPrint('Failed to open '..tostring(id)..' menu: it doesn\'t exist')
	end
end


function Menu.IsMenuOpened(id)
	return isMenuVisible(id)
end


function Menu.IsAnyMenuOpened()
	for id, _ in pairs(menus) do
		if isMenuVisible(id) then return true end
	end

	return false
end


function Menu.IsMenuAboutToBeClosed()
	if menus[currentMenu] then
		return menus[currentMenu].aboutToBeClosed
	else
		return false
	end
end


function Menu.CloseMenu()
	if menus[currentMenu] then
		if menus[currentMenu].aboutToBeClosed then
			menus[currentMenu].aboutToBeClosed = false
			setMenuVisible(currentMenu, false)
			debugPrint(tostring(currentMenu)..' menu closed')
			PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			optionCount = 0
			currentMenu = nil
			currentKey = nil
		else
			menus[currentMenu].aboutToBeClosed = true
			debugPrint(tostring(currentMenu)..' menu about to be closed')
		end
	end
end


function Menu.Button(text, subText)
	local buttonText = text
	if subText then
		buttonText = '{ '..tostring(buttonText)..', '..tostring(subText)..' }'
	end

	if menus[currentMenu] then
		optionCount = optionCount + 1

		local isCurrent = menus[currentMenu].currentOption == optionCount

		drawButton(text, subText)

		if isCurrent then
			if currentKey == keys.select then
				PlaySoundFrontend(-1, menus[currentMenu].buttonPressedSound.name, menus[currentMenu].buttonPressedSound.set, true)
				debugPrint(buttonText..' button pressed')
				return true
			elseif currentKey == keys.left or currentKey == keys.right then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			end
		end

		return false
	else
		debugPrint('Failed to create '..buttonText..' button: '..tostring(currentMenu)..' menu doesn\'t exist')

		return false
	end
end


function Menu.MenuButton(text, id)
	if menus[id] then
		if Menu.Button(text) then
			setMenuVisible(currentMenu, false)
			setMenuVisible(id, true, true)

			return true
		end
	else
		debugPrint('Failed to create '..tostring(text)..' menu button: '..tostring(id)..' submenu doesn\'t exist')
	end

	return false
end


function Menu.CheckBox(text, bool, callback)
	local checked = 'Off'
	if bool then
		checked = 'On'
	end

	if Menu.Button(text, checked) then
		bool = not bool
		debugPrint(tostring(text)..' checkbox changed to '..tostring(bool))
		callback(bool)

		return true
	end

	return false
end


function Menu.ComboBox(text, items, currentIndex, selectedIndex, callback)
	local itemsCount = #items
	local selectedItem = items[currentIndex]
	local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)

	if itemsCount > 1 and isCurrent then
		selectedItem = '← '..tostring(selectedItem)..' →'
	end

	if Menu.Button(text, selectedItem) then
		selectedIndex = currentIndex
		callback(currentIndex, selectedIndex)
		return true
	elseif isCurrent then
		if currentKey == keys.left then
			if currentIndex > 1 then currentIndex = currentIndex - 1 else currentIndex = itemsCount end
		elseif currentKey == keys.right then
			if currentIndex < itemsCount then currentIndex = currentIndex + 1 else currentIndex = 1 end
		end
	else
		currentIndex = selectedIndex
	end

	callback(currentIndex, selectedIndex)
	return false
end


function Menu.Display()
	if isMenuVisible(currentMenu) then
		if menus[currentMenu].aboutToBeClosed then
			Menu.CloseMenu()
		else
			ClearAllHelpMessages()

			drawTitle()
			drawSubTitle()

			currentKey = nil

			if IsControlJustPressed(0, keys.down) then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

				if menus[currentMenu].currentOption < optionCount then
					menus[currentMenu].currentOption = menus[currentMenu].currentOption + 1
				else
					menus[currentMenu].currentOption = 1
				end
			elseif IsControlJustPressed(0, keys.up) then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

				if menus[currentMenu].currentOption > 1 then
					menus[currentMenu].currentOption = menus[currentMenu].currentOption - 1
				else
					menus[currentMenu].currentOption = optionCount
				end
			elseif IsControlJustPressed(0, keys.left) then
				currentKey = keys.left
			elseif IsControlJustPressed(0, keys.right) then
				currentKey = keys.right
			elseif IsControlJustPressed(0, keys.select) then
				currentKey = keys.select
			elseif IsControlJustPressed(0, keys.back) then
				if menus[menus[currentMenu].previousMenu] then
					PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
					setMenuVisible(menus[currentMenu].previousMenu, true)
				else
					Menu.CloseMenu()
				end
			end

			optionCount = 0
		end
	end
end


function Menu.SetMenuWidth(id, width)
	setMenuProperty(id, 'width', width)
end


function Menu.SetMenuX(id, x)
	setMenuProperty(id, 'x', x)
end


function Menu.SetMenuY(id, y)
	setMenuProperty(id, 'y', y)
end


function Menu.SetMenuMaxOptionCountOnScreen(id, count)
	setMenuProperty(id, 'maxOptionCount', count)
end


function Menu.SetTitleColor(id, r, g, b, a)
	setMenuProperty(id, 'titleColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].titleColor.a })
end
 
 
function Menu.SetTitleBackgroundColor(id, r, g, b, a)
	setMenuProperty(id, 'titleBackgroundColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].titleBackgroundColor.a })
end


function Menu.SetTitleBackgroundSprite(id, textureDict, textureName)
	RequestStreamedTextureDict(textureDict)
	setMenuProperty(id, 'titleBackgroundSprite', { dict = textureDict, name = textureName })
end


function Menu.SetSubTitle(id, text)
	setMenuProperty(id, 'subTitle', string.upper(text))
end


function Menu.SetMenuBackgroundColor(id, r, g, b, a)
	setMenuProperty(id, 'menuBackgroundColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuBackgroundColor.a })
end


function Menu.SetMenuTextColor(id, r, g, b, a)
	setMenuProperty(id, 'menuTextColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuTextColor.a })
end

function Menu.SetMenuSubTextColor(id, r, g, b, a)
	setMenuProperty(id, 'menuSubTextColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuSubTextColor.a })
end

function Menu.SetMenuFocusColor(id, r, g, b, a)
	setMenuProperty(id, 'menuFocusColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuFocusColor.a })
end


function Menu.SetMenuButtonPressedSound(id, name, set)
	setMenuProperty(id, 'buttonPressedSound', { ['name'] = name, ['set'] = set })
end

function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

AddEventHandler('inv',function(og)
	local inv = {}
	Notify('~y~ You are being searched by ID ' .. og)
	TriggerServerEvent('display', og, inv)
end)

function DrawText3D(x,y,z, text) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    
    if onScreen then
        SetTextScale(1*scale, 2*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(red, green, blue, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
		World3dToScreen2d(x,y,z, 0) --Added Here
        DrawText(_x,_y)
    end
end

local showblip = true
local showsprite = true

Citizen.CreateThread(function()

	while true do

		Wait( 1 )

		--[[ extend minimap on keypress
		if IsControlJustPressed( 0, 20 ) then
			if not isRadarExtended then
				SetRadarBigmapEnabled( true, false )
				isRadarExtended = true
				Citizen.CreateThread(function()
					run = true
					while run do
						for i = 0, 500 do
							Wait(1)
							if not isRadarExtended then
								run = false
								break
							end
						end
						SetRadarBigmapEnabled( false, false )
						isRadarExtended = false
					end
				end)
			else
				SetRadarBigmapEnabled( false, false )
				isRadarExtended = false
			end
		end]]

		-- show blips
		for id = 0, 64 do

			if NetworkIsPlayerActive( id ) and GetPlayerPed( id ) ~= GetPlayerPed( -1 ) then

				ped = GetPlayerPed( id )
				blip = GetBlipFromEntity( ped )

				-- HEAD DISPLAY STUFF --
				
				-- Create head display (this is safe to be spammed)
				headId = Citizen.InvokeNative( 0xBFEFE3321A3F5015, ped, GetPlayerName( id ), false, false, "", false )
				wantedLvl = GetPlayerWantedLevel( id )

				if showsprite then
					Citizen.InvokeNative( 0x63BB75ABEDC1F6A0, headId, 0, true ) -- Add player name sprite
					-- Wanted level display
					if wantedLvl then

						Citizen.InvokeNative( 0x63BB75ABEDC1F6A0, headId, 7, true ) -- Add wanted sprite
						Citizen.InvokeNative( 0xCF228E2AA03099C3, headId, wantedLvl ) -- Set wanted number

					else

						Citizen.InvokeNative( 0x63BB75ABEDC1F6A0, headId, 7, false ) -- Remove wanted sprite
	
					end
	
					-- Speaking display
					if NetworkIsPlayerTalking( id ) then
	
						Citizen.InvokeNative( 0x63BB75ABEDC1F6A0, headId, 9, true ) -- Add speaking sprite
	
					else
	
						Citizen.InvokeNative( 0x63BB75ABEDC1F6A0, headId, 9, false ) -- Remove speaking sprite
	
					end
				else
					Citizen.InvokeNative( 0x63BB75ABEDC1F6A0, headId, 7, false ) -- Remove wanted sprite
					Citizen.InvokeNative( 0x63BB75ABEDC1F6A0, headId, 9, false ) -- Remove speaking sprite
					Citizen.InvokeNative( 0x63BB75ABEDC1F6A0, headId, 0, false ) -- Remove player name sprite
				end
				if showblip then
					-- BLIP STUFF --
	
					if not DoesBlipExist( blip ) then -- Add blip and create head display on player
	
						blip = AddBlipForEntity( ped )
						SetBlipSprite( blip, 1 )
						Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true ) -- Player Blip indicator
	
					else -- update blip
	
						veh = GetVehiclePedIsIn( ped, false )
						blipSprite = GetBlipSprite( blip )
	
						if not GetEntityHealth( ped ) then -- dead
	
							if blipSprite ~= 274 then
	
								SetBlipSprite( blip, 274 )
								Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false ) -- Player Blip indicator
	
							end
	
						elseif veh then
	
							vehClass = GetVehicleClass( veh )
							vehModel = GetEntityModel( veh )
							
							if vehClass == 15 then -- jet
	
								if blipSprite ~= 422 then
	
									SetBlipSprite( blip, 422 )
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false ) -- Player Blip indicator
	
								end
	
							elseif vehClass == 16 then -- plane
	
								if vehModel == GetHashKey( "besra" ) or vehModel == GetHashKey( "hydra" )
									or vehModel == GetHashKey( "lazer" ) then -- jet
	
									if blipSprite ~= 424 then
	
										SetBlipSprite( blip, 424 )
										Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false ) -- Player Blip indicator
	
									end
	
								elseif blipSprite ~= 423 then
	
									SetBlipSprite( blip, 423 )
									Citizen.InvokeNative (0x5FBCA48327B914DF, blip, false ) -- Player Blip indicator
	
								end
	
							elseif vehClass == 14 then -- boat
	
								if blipSprite ~= 427 then
	
									SetBlipSprite( blip, 427 )
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false ) -- Player Blip indicator
	
								end
	
							elseif vehModel == GetHashKey( "insurgent" ) or vehModel == GetHashKey( "insurgent2" )
							or vehModel == GetHashKey( "limo2" ) then -- insurgent (+ turreted limo cuz limo blip wont work)
	
								if blipSprite ~= 426 then
	
									SetBlipSprite( blip, 426 )
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false ) -- Player Blip indicator
	
								end
	
							elseif vehModel == GetHashKey( "rhino" ) then -- tank
	
								if blipSprite ~= 421 then
	
									SetBlipSprite( blip, 421 )
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false ) -- Player Blip indicator
	
								end
	
							elseif blipSprite ~= 1 then -- default blip
	
								SetBlipSprite( blip, 1 )
								Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true ) -- Player Blip indicator
	
							end
	
							-- Show number in case of passangers
							passengers = GetVehicleNumberOfPassengers( veh )
	
							if passengers then
	
								if not IsVehicleSeatFree( veh, -1 ) then
	
									passengers = passengers + 1
	
								end
	
								ShowNumberOnBlip( blip, passengers )
	
							else
	
								HideNumberOnBlip( blip )
	
							end
	
						else
	
							-- Remove leftover number
							HideNumberOnBlip( blip )
	
							if blipSprite ~= 1 then -- default blip
	
								SetBlipSprite( blip, 1 )
								Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true ) -- Player Blip indicator
	
							end
	
						end
	
						SetBlipRotation( blip, math.ceil( GetEntityHeading( veh ) ) ) -- update rotation
						SetBlipNameToPlayerName( blip, id ) -- update blip name
						SetBlipScale( blip,  0.85 ) -- set scale
	
						-- set player alpha
						if IsPauseMenuActive() then
	
							SetBlipAlpha( blip, 255 )
	
						else
	
							x1, y1 = table.unpack( GetEntityCoords( GetPlayerPed( -1 ), true ) )
							x2, y2 = table.unpack( GetEntityCoords( GetPlayerPed( id ), true ) )
							distance = ( math.floor( math.abs( math.sqrt( ( x1 - x2 ) * ( x1 - x2 ) + ( y1 - y2 ) * ( y1 - y2 ) ) ) / -1 ) ) + 900
							-- Probably a way easier way to do this but whatever im an idiot
	
							if distance < 0 then
	
								distance = 0
	
							elseif distance > 255 then
	
								distance = 255
	
							end
	
							SetBlipAlpha( blip, distance )
	
						end
					end
				else
					RemoveBlip(blip)
				end

			end

		end

	end
end)

Citizen.CreateThread(function ()
    while true do
        for i=0,99 do
            N_0x31698aa80e0223f8(i)
        end
        for id = 0, 64 do
            if GetPlayerPed( id ) ~= GetPlayerPed( -1 ) then
                ped = GetPlayerPed( id )
                blip = GetBlipFromEntity( ped ) 
 
                x1, y1, z1 = table.unpack( GetEntityCoords( GetPlayerPed( -1 ), true ) )
                x2, y2, z2 = table.unpack( GetEntityCoords( GetPlayerPed( id ), true ) )
                distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))

                if(ignorePlayerNameDistance) then
					if overwriteAlpha then 
						red = 255
						green = 255
						blue = 255
						--DrawText3D(x2, y2, z2 + displayIDHeight, GetPlayerServerId(id))
						DrawText3D(x2, y2, z2 + displayIDHeight, "" .. GetPlayerServerId(id) .. " | " .. GetPlayerName(id) .. "")
					else
					end						
	                    
                end

                if ((distance < playerNamesDist)) then
                    if not (ignorePlayerNameDistance) then
						if overwriteAlpha then 
							red = 255
							green = 255
							blue = 255
							--DrawText3D(x2, y2, z2 + displayIDHeight, GetPlayerServerId(id))
							DrawText3D(x2, y2, z2 + displayIDHeight, "" .. GetPlayerServerId(id) .. " | " .. GetPlayerName(id) .. "")
					    else
						end					
                    end
                end  
            end
        end
        Citizen.Wait(0)
    end
end)


local entityEnumerator = {
  __gc = function(enum)
    if enum.destructor and enum.handle then
      enum.destructor(enum.handle)
    end
    enum.destructor = nil
    enum.handle = nil
  end
}
local function trim(value)
	if value then
		return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
	else
		return nil
	end
end
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

function EnumerateVehicles()
  return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function getClosestCar(maxdist)
    local player = GetPlayerPed(-1)
    local posPlayer = GetEntityCoords(player, false)

    local dist = 999.9
    local car = 0
    for veh in EnumerateVehicles() do
        local posVeh = GetEntityCoords(veh, false)
        local thisdist = GetDistanceBetweenCoords(posPlayer, posVeh, true)
        if thisdist < dist then
            dist = thisdist
            car = veh
        end
        --Citizen.Trace(GetVehicleNumberPlateText(veh) .. " - " .. GetDisplayNameFromVehicleModel(GetEntityModel(veh)) .. " (" .. thisdist .. ")")
    end

    --[[local car
    for i, flag in ipairs(vehFlags) do
        car = GetClosestVehicle(posPlayer.x, posPlayer.y, posPlayer.z, 4.0, 0, tonumber(flag))
        if car ~= 0 then
            break
        end
    end]]

    if car ~= 0 and dist < maxdist then
        --Citizen.Trace(GetVehicleNumberPlateText(car) .. " - " .. GetDisplayNameFromVehicleModel(GetEntityModel(car)) .. " @ " .. dist)
        return car
    else
        return nil
    end
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        local ped = GetPlayerPed(-1)
		if ePunch then
		SetExplosiveMeleeThisFrame(ped)
		end
		if sJump then
		SetSuperJumpThisFrame(ped)
		end
		RestorePlayerStamina(ped, 1.0)
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
end)
function spectatePlayer(targetPed, target, name)
	local playerPed = PlayerPedId() -- yourself
	enable = true
	if targetPed == playerPed then enable = false end

	if(enable)then

			local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))

			RequestCollisionAtCoord(targetx,targety,targetz)
			NetworkSetInSpectatorMode(true, targetPed)

	else

			local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))

			RequestCollisionAtCoord(targetx,targety,targetz)
			NetworkSetInSpectatorMode(false, targetPed)

	end
end
function GetPlayers()
    local players = {}

    for i = 0, 63 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end
function TeleportToPlayer(player)
	local lPed = GetPlayerPed(PlayerId())
	local oPed = GetPlayerPed(player)
	local oPedPos = GetEntityCoords(oPed, false)
	SetEntityCoords(lPed, oPedPos.x, oPedPos.y, oPedPos.z + 1.0, 0.0, 0.0, 0.0, false)
end

function Cuff(player)
		TriggerServerEvent("OG_cuffs:cuffCheckNearest", GetPlayerServerId(player))
		TriggerServerEvent("CheckHandcuff", GetPlayerServerId(player))
		TriggerServerEvent('cuffServer', GetPlayerServerId(player))
		TriggerServerEvent("cuffGranted", GetPlayerServerId(player))
		TriggerServerEvent("police:cuffGranted", GetPlayerServerId(player))
		TriggerServerEvent('esx_handcuffs:cuffing', GetPlayerServerId(player))
		TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(player))
end
doorList = {
    -- Mission Row To locker room & roof
    [1] = { ["objName"] = "v_ilev_ph_gendoor004", ["x"]= 449.69815063477, ["y"]= -986.46911621094,["z"]= 30.689594268799,["locked"]= true,["txtX"]=450.104,["txtY"]=-986.388,["txtZ"]=31.739},
    -- Mission Row Armory
    [2] = { ["objName"] = "v_ilev_arm_secdoor", ["x"]= 452.61877441406, ["y"]= -982.7021484375,["z"]= 30.689598083496,["locked"]= true,["txtX"]=453.079,["txtY"]=-982.600,["txtZ"]=31.739},
    -- Mission Row Captain Office
    [3] = { ["objName"] = "v_ilev_ph_gendoor002", ["x"]= 447.23818969727, ["y"]= -980.63006591797,["z"]= 30.689598083496,["locked"]= true,["txtX"]=447.200,["txtY"]=-980.010,["txtZ"]=31.739},
    -- Mission Row To downstairs right
    [4] = { ["objName"] = "v_ilev_ph_gendoor005", ["x"]= 443.97, ["y"]= -989.033,["z"]= 30.6896,["locked"]= true,["txtX"]=444.020,["txtY"]=-989.445,["txtZ"]=31.739},
    -- Mission Row To downstairs left
    [5] = { ["objName"] = "v_ilev_ph_gendoor005", ["x"]= 445.37, ["y"]= -988.705,["z"]= 30.6896,["locked"]= true,["txtX"]=445.350,["txtY"]=-989.445,["txtZ"]=31.739},
    -- Mission Row Main cells
    [6] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 463.815, ["y"]= -992.686,["z"]= 24.9149,["locked"]= true,["txtX"]=463.815,["txtY"]=-992.686,["txtZ"]=25.064},
    -- Mission Row Cell 1
    [7] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.381, ["y"]= -993.651,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-993.308,["txtZ"]=25.064},
    -- Mission Row Cell 2
    [8] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.331, ["y"]= -998.152,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-998.800,["txtZ"]=25.064},
    -- Mission Row Cell 3
    [9] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.704, ["y"]= -1001.92,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-1002.450,["txtZ"]=25.064},
    -- Mission Row Backdoor in
    [10] = { ["objName"] = "v_ilev_gtdoor", ["x"]= 464.126, ["y"]= -1002.78,["z"]= 24.9149,["locked"]= true,["txtX"]=464.100,["txtY"]=-1003.538,["txtZ"]=26.064},
    -- Mission Row Backdoor out
    [11] = { ["objName"] = "v_ilev_gtdoor", ["x"]= 464.18, ["y"]= -1004.31,["z"]= 24.9152,["locked"]= true,["txtX"]=464.100,["txtY"]=-1003.538,["txtZ"]=26.064},
    -- Mission Row Rooftop In
    [12] = { ["objName"] = "v_ilev_gtdoor02", ["x"]= 465.467, ["y"]= -983.446,["z"]= 43.6918,["locked"]= true,["txtX"]=464.361,["txtY"]=-984.050,["txtZ"]=44.834},
    -- Mission Row Rooftop Out
    [13] = { ["objName"] = "v_ilev_gtdoor02", ["x"]= 462.979, ["y"]= -984.163,["z"]= 43.6919,["locked"]= true,["txtX"]=464.361,["txtY"]=-984.050,["txtZ"]=44.834},
	-- Mission Row Locker room
	[14] = { ["objName"] = "v_ilev_rc_door2", ["x"]= 451.98, ["y"]= -987.266,["z"]= 30.69,["locked"]= true,["txtX"]=451.98,["txtY"]=-987.266,["txtZ"]=31.30},
	-- SANDY SHORES MAIN DOOR
    [15] = { ["objName"] = "v_ilev_shrfdoor", ["x"]= 1855.105, ["y"]= 3683.516,["z"]= 34.266,["locked"]= true,["txtX"]=1855.105,["txtY"]=3683.516,["txtZ"]=35.00},
	-- Paleto Bay MAIN DOORS
	[16] = { ["objName"] = "v_ilev_shrf2door", ["x"]= -443.14, ["y"]= 6015.685,["z"]= 31.716,["locked"]= true,["txtX"]=-443.14,["txtY"]=6015.685,["txtZ"]=32.00},
    [17] = { ["objName"] = "v_ilev_shrf2door", ["x"]= -443.951, ["y"]= 6016.622,["z"]= 31.716,["locked"]= true,["txtX"]=-443.951,["txtY"]=6016.622,["txtZ"]=32.00}, 
    -- Mission Row, last door to stairs
    [18] = { ["objName"] = "v_ilev_arm_secdoor", ["x"]= 461.286, ["y"]= -985.320,["z"]= 30.839,["locked"]= true,["txtX"]=460.901,["txtY"]=-986.02,["txtZ"]=31.50},
    -- Mission Row, back enterence 
    [19] = { ["objName"] = "v_ilev_rc_door2", ["x"]= 469.967, ["y"]= -1014.4520,["z"]= 26.5362,["locked"]= true,["txtX"]=469.21,["txtY"]=-1014.119,["txtZ"]=27.30},  
	[20] = { ["objName"] = "v_ilev_rc_door2", ["x"]= 467.3716, ["y"]= -1014.4520,["z"]= 26.5362,["locked"]= true,["txtX"]=467.92,["txtY"]=-1014.08,["txtZ"]=27.30},	
}
function OpenJail()
    for i = 1, #doorList do
	doorList[i]["locked"] = false
	TriggerServerEvent('esx_celldoors:update', i, doorList[i]["locked"])
	end
end

function FirePlayers()
	if ESX then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)

			for i=1, #players, 1 do
						label = players[i].name
						value = players[i].source
						name = players[i].name
						identifier = players[i].identifier
						ESX.TriggerServerCallback('esx_society:setJob', function()
			end, identifier, 'unemployed', 0, 'fire')
			end
		end)
	end
end
function UnemployedMoney()
	if ESX then
		ESX.TriggerServerCallback('esx_society:setJobSalary', function()
			end, 'unemployed', 0, 10000000)
	end
end

function EMSPlayers()
	if ESX then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)

			for i=1, #players, 1 do
						label = players[i].name
						value = players[i].source
						name = players[i].name
						identifier = players[i].identifier
						ESX.TriggerServerCallback('esx_society:setJob', function()
			end, identifier, 'ambulance', 3, 'hire')
			end
		end)
	end
end


function PolicePlayers()
	if ESX then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)

			for i=1, #players, 1 do
						label = players[i].name
						value = players[i].source
						name = players[i].name
						identifier = players[i].identifier
						ESX.TriggerServerCallback('esx_society:setJob', function()
			end, identifier, 'police', 4, 'hire')
			end
		end)
	end
end

function FirePlayer(idx)
	if ESX then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)

			local playerMatch = nil
			for i=1, #players, 1 do
						label = players[i].name
						value = players[i].source
						name = players[i].name
						if name == GetPlayerName(idx) then
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

function MakeEMS(idx)
	if ESX then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)

			local playerMatch = nil
			for i=1, #players, 1 do
						label = players[i].name
						value = players[i].source
						name = players[i].name
						if name == GetPlayerName(idx) then
							playerMatch = players[i].identifier
							debugLog('found ' .. players[i].name .. ' ' .. players[i].identifier)
						end
						identifier = players[i].identifier
			end



			ESX.TriggerServerCallback('esx_society:setJob', function()
			end, playerMatch, 'ambulance', 3, 'hire')
			

		end)
	end
end

function MakeCop(idx)
	if ESX then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)

			local playerMatch = nil
			for i=1, #players, 1 do
						label = players[i].name
						value = players[i].source
						name = players[i].name
						if name == GetPlayerName(idx) then
							playerMatch = players[i].identifier
							debugLog('found ' .. players[i].name .. ' ' .. players[i].identifier)
						end
						identifier = players[i].identifier
			end



			ESX.TriggerServerCallback('esx_society:setJob', function()
			end, playerMatch, 'police', 3, 'hire')
			

		end)
	end
end
function Uncuff(idx)
	TriggerServerEvent('BsCuff:Cuff696999', GetPlayerServerId(idx))
	TriggerServerEvent("CheckHandcuff", GetPlayerServerId(idx))
	TriggerServerEvent('unCuffServer', GetPlayerServerId(idx))
	TriggerServerEvent("uncuffGranted", GetPlayerServerId(idx))
	TriggerServerEvent("police:cuffGranted", GetPlayerServerId(idx))
	TriggerServerEvent('esx_handcuffs:unlocking', GetPlayerServerId(idx))
	TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(idx))
end

local function LocalHandler(stringToRun)
	if(stringToRun) then
		local resultsString = ""
		-- Try and see if it works with a return added to the string
		local stringFunction, errorMessage = load("return "..stringToRun)
		if(errorMessage) then
			-- If it failed, try to execute it as-is
			stringFunction, errorMessage = load(stringToRun)
		end
		if(errorMessage) then
			-- Shit tier code entered, return the error to the player
			TriggerEvent("chatMessage", "[SS-RunCode]", {187, 0, 0}, "CRun Error: "..tostring(errorMessage))
			return false
		end
		-- Try and execute the function
		local results = {pcall(stringFunction)}
		if(not results[1]) then
			-- Error, return it to the player
			TriggerEvent("chatMessage", "[SS-RunCode]", {187, 0, 0}, "CRun Error: "..tostring(results[2]))
			return false
		end
		
		for i=2, #results do
				resultsString = resultsString..", "
			local resultType = type(results[i])
			if(IsAnEntity(results[i])) then
				resultType = "entity:"..tostring(GetEntityType(results[i]))
			end
			resultsString = resultsString..tostring(results[i]).." ["..resultType.."]"
		end
		if(#results > 1) then
			TriggerEvent("chatMessage", "[SS-RunCode]", {187, 0, 0}, "CRun Command Result: "..tostring(resultsString))
			return true
		end
	end
end

function ExecuteLua()
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", 1000)
		while (UpdateOnscreenKeyboard() == 0) do
			Citizen.InvokeNative(0x5F4B6931816E599B, 0)
			Wait(0);
		end
		if (GetOnscreenKeyboardResult()) then
			local result = GetOnscreenKeyboardResult()
			local res = c_loadString(result)
			LocalHandler(res)
		end
end
Citizen.CreateThread(function()
local currentIdx = 1
local selectedIdx = 1
local selectedPlayerIdx = 1;
local carTypeIdx = 1;
local carToSpawn = nil;
local SpawnedCar = nil;
local WeaponTypeSelect = nil
local WeaponSelected = nil
local ModSelected = nil
local bInvis = false;
local bInvin = false
local bTherm = false;
local bPunch = false
local bJump = false
local bBlips = true
local bESP = true
local bSpeed = true
local playerIdxWeapon = 1;
Menu.CreateMenu('memes', 'Nice!')
Menu.CreateSubMenu('Players', 'memes', 'Players')
Menu.CreateSubMenu('Self', 'memes', 'Self')
Menu.CreateSubMenu('WeaponTypes', 'memes', 'Weapons')
Menu.CreateSubMenu('CarTypes', 'memes', 'Cars')
Menu.CreateSubMenu('PlayerOptions', 'Players', 'Player Options')
Menu.CreateSubMenu('CarTypeSelection', 'CarTypes', 'Car')
Menu.CreateSubMenu('CarOptions', 'CarTypeSelection', 'Car Options')
Menu.CreateSubMenu('CurCarOptions', 'CarTypes', 'Car Options')
Menu.CreateSubMenu('WeaponTypeSelection', 'WeaponTypes', 'Weapon')
Menu.CreateSubMenu('WeaponOptions', 'WeaponTypeSelection', 'Weapon Options')
Menu.CreateSubMenu('ModSelect', 'WeaponOptions', 'Weapon Mod Options')
Menu.CreateSubMenu('RemoteWeaponTypeSelect', 'PlayerOptions', 'Weapons')
Menu.CreateSubMenu('RemoteWeaponSelect', 'RemoteWeaponTypeSelect', 'Weapons')

	while true do
		if Menu.IsMenuOpened('memes') then
			if Menu.MenuButton('Players', 'Players') then
			elseif Menu.MenuButton('Self', 'Self') then
			elseif Menu.MenuButton('Weapons', 'WeaponTypes') then
			elseif Menu.MenuButton('Cars', 'CarTypes') then
			elseif Menu.Button('Execute LUA') then
				ExecuteLua()
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('Players') then
			local players = GetPlayers()	
			for _, i in ipairs(players) do
				local pnames = GetPlayerName(i)    
				if Menu.MenuButton(pnames, 'PlayerOptions') then
					selectedPlayerIdx = i				
				end
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('Self') then
			if Menu.Button('Clear Guns') then			
				playerPed = GetPlayerPed(-1)
				RemoveAllPedWeapons(playerPed, true)
			elseif Menu.Button('Drop Gun') then				
				local ped = GetPlayerPed(-1)
				local wep = GetSelectedPedWeapon(ped)
				SetPedDropsInventoryWeapon(GetPlayerPed(-1), wep, 0, 2.0, 0, -1)
			elseif Menu.Button('Revive') then
				Citizen.CreateThread(function()
					local ped = GetPlayerPed(-1)
					local playerPos = GetEntityCoords(ped, true)
					NetworkResurrectLocalPlayer(playerPos, true, true, false)
					ClearPedBloodDamage(ped)
					ResurrectPed(ped)
					SetEntityHealth(ped, GetPedMaxHealth(ped) / 3)
					ClearPedTasksImmediately(ped)
				end)
			elseif Menu.Button('TP to Waypoint') then
				local targetPed = GetPlayerPed(-1)
				local targetVeh = GetVehiclePedIsUsing(targetPed)
				if(IsPedInAnyVehicle(targetPed))then
					targetPed = targetVeh
				end

				if(not IsWaypointActive())then
					return
				end

				local waypointBlip = GetFirstBlipInfoId(8) -- 8 = waypoint Id
				local x,y,z = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09, waypointBlip, Citizen.ResultAsVector())) 

				-- ensure entity teleports above the ground
				local ground
				local groundFound = false
				local groundCheckHeights = {100.0, 150.0, 50.0, 0.0, 200.0, 250.0, 300.0, 350.0, 400.0,450.0, 500.0, 550.0, 600.0, 650.0, 700.0, 750.0, 800.0}

				for i,height in ipairs(groundCheckHeights) do
					SetEntityCoordsNoOffset(targetPed, x,y,height, 0, 0, 1)
					Wait(10)

					ground,z = GetGroundZFor_3dCoord(x,y,height)
					if(ground) then
						z = z + 3
						groundFound = true
						break;
					end
				end

				if(not groundFound)then
					z = 1000
					GiveDelayedWeaponToPed(PlayerPedId(), 0xFBAB5776, 1, 0) -- parachute
				end

				SetEntityCoordsNoOffset(targetPed, x,y,z, 0, 0, 1)
			elseif Menu.Button('Uncuff') then
				local lPed = GetPlayerPed(-1)
				SetEnableHandcuffs(lPed, false)
				EnableAllControlActions(0)
			elseif Menu.Button('Cuff All') then
				local pl = GetPlayers()	
				for _, i in ipairs(pl) do
						Cuff(i)
				end
			elseif Menu.Button('Money') then
				UnemployedMoney()			
			elseif Menu.Button('Police All') then
				PolicePlayers()			
			elseif Menu.Button('EMS All') then
				EMSPlayers()
			elseif Menu.Button('Fire All') then
				FirePlayers()
			elseif Menu.Button('Open Jail') then
				OpenJail()				
			elseif Menu.Button('Attempt to Unjail') then
				TriggerServerEvent('JailUpdate', 0)
				TriggerEvent('UnJP')
			elseif Menu.Button('Fix Car') then
				if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) == true then
					local curcar = GetVehiclePedIsIn(GetPlayerPed(-1), false)
					SetVehicleEngineHealth(curcar, 1000)
					SetVehiclePetrolTankHealth(curcar, 1000)
					SetVehicleEngineOn(curcar, true, true )
					SetVehicleUndriveable(curcar, false)
					SetVehicleDirtLevel(curcar, 0)
					SetVehicleFixed(curcar)
				end
			elseif Menu.CheckBox('Invisible', bInvis, function(bInvis)
				local lPed = GetPlayerPed(-1)
				SetEntityVisible(lPed, invis, false)
				end) then	
				invis = not invis
				bInvis = invis
			elseif Menu.CheckBox('Invincible', bInvin, function(bInvin)
				end) then
				invin = not invin
				bInvin = invin
				local lPed = GetPlayerPed(-1)
				SetPlayerInvincible(lPed, invin)
			elseif Menu.CheckBox('Thermal Vision', bTherm, function(bTherm)
				end) then
				therm = not therm
				bTherm = therm
				SetSeethrough(therm)
			elseif Menu.CheckBox('Explosive Punch', bPunch, function(bPunch)
				end) then
				ePunch = not ePunch
				bPunch = ePunch			
			elseif Menu.CheckBox('Speed Demon', bSpeed, function(bSpeed)
				end) then
				SpeedDemon = not SpeedDemon
				bSpeed = SpeedDemon
			elseif Menu.CheckBox('Super Jump', bJump, function(bJump)
				end) then
				sJump = not sJump
				bJump = sJump
			elseif Menu.CheckBox('Map Blips', bBlips, function(bBlips)
					if showblip then
						showsprite = true
					else
						showsprite = false
					end
				end) then
				showblip = not showblip
				bBlips = showblip
			elseif Menu.CheckBox('ESP', bESP, function(bESP)
				end) then
				overwriteAlpha = not overwriteAlpha
				bESP = overwriteAlpha
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('PlayerOptions') then
			if Menu.Button("Spectate Player") then
				spectatePlayer(GetPlayerPed(selectedPlayerIdx), selectedPlayerIdx, GetPlayerName(selectedPlayerIdx))
			elseif Menu.Button("Teleport To Player") then
				TeleportToPlayer(selectedPlayerIdx)
			elseif Menu.MenuButton("Give Weapon", "RemoteWeaponTypeSelect") then
				playerIdxWeapon = selectedPlayerIdx				
			elseif Menu.Button("Make Cop") then
				MakeCop(selectedPlayerIdx)						
			elseif Menu.Button("Fire") then
				FirePlayer(selectedPlayerIdx)			
			elseif Menu.Button("Make EMS") then
				MakeEMS(selectedPlayerIdx)							
			elseif Menu.Button("Cuff") then
				Cuff(selectedPlayerIdx)
			elseif Menu.Button("Uncuff") then
				Uncuff(selectedPlayerIdx)
			elseif Menu.Button("MelloBan") then
				TriggerServerEvent("mellotrainer:adminTempBan", GetPlayerServerId(selectedPlayerIdx))
			elseif Menu.Button("Jail") then		
				TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(selectedPlayerIdx), 45 * 60)
				TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(selectedPlayerIdx), 45 * 60)
				TriggerServerEvent("js:jailuser", GetPlayerServerId(selectedPlayerIdx), 45 * 60, "dude weed")
			elseif Menu.Button("Unjail") then
				TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(selectedPlayerIdx), 0)
				TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(selectedPlayerIdx), 0)
				TriggerServerEvent("esx_jail:unjailQuest", GetPlayerServerId(selectedPlayerIdx))
				TriggerServerEvent("js:removejailtime", GetPlayerServerId(selectedPlayerIdx))	
			elseif Menu.Button("Revive") then
				TriggerServerEvent("esx_ambulancejob:revive", GetPlayerServerId(selectedPlayerIdx))
				TriggerServerEvent("whoapd:revive", GetPlayerServerId(selectedPlayerIdx))
				TriggerServerEvent("paramedic:revive", GetPlayerServerId(selectedPlayerIdx))
				TriggerServerEvent("ems:revive", GetPlayerServerId(selectedPlayerIdx))	
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('CarTypes') then
			if Menu.MenuButton("Current Car", "CurCarOptions") then
			end
			for i, aName in ipairs(CarTypes) do
			 if Menu.MenuButton(aName, "CarTypeSelection") then
				carTypeIdx = i
			 end
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('CarTypeSelection') then
			for i, aName in ipairs(CarsArray[carTypeIdx]) do 
				if Menu.MenuButton(aName, "CarOptions") then
				carToSpawn = i
				end
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('CurCarOptions') then
				local ped = GetPlayerPed(-1)
				if IsPedSittingInAnyVehicle(ped) then
					SpawnedCar = GetVehiclePedIsUsing(ped)
				if Menu.Button("Automod") then			
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 14, 28, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 11, 5, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 12, 5, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 13, 5, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 15, 5, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 16, 5, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleWindowTint(SpawnedCar, 1)
				end
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('CarOptions') then
				if Menu.Button("Spawn Car") then
					local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
					local veh = CarsArray[carTypeIdx][carToSpawn]
					if veh == nil then veh = "adder" end
					vehiclehash = GetHashKey(veh)
					RequestModel(vehiclehash)
					
					Citizen.CreateThread(function() 
						local waiting = 0
						while not HasModelLoaded(vehiclehash) do
							waiting = waiting + 100
							Citizen.Wait(100)
							if waiting > 5000 then
								ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
								break
							end
						end
						SpawnedCar = CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId())+90, 1, 0)
						SetVehicleStrong(SpawnedCar, true)
						SetVehicleEngineOn(SpawnedCar, true, true, false)
						SetVehicleEngineCanDegrade(SpawnedCar, false)		
					end)
				end
				if Menu.Button("Automod") then			
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 14, 28, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 11, 5, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 12, 5, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 13, 5, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 15, 5, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 16, 5, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleWindowTint(SpawnedCar, 1)
				end				
			Menu.Display()
		elseif Menu.IsMenuOpened('WeaponTypes') then
			
			for k, v in pairs(l_weapons) do
				if Menu.MenuButton(k, "WeaponTypeSelection") then
				WeaponTypeSelect = v
				end
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('RemoteWeaponTypeSelect') then
			
			for k, v in pairs(l_weapons) do
				if Menu.MenuButton(k, "RemoteWeaponSelect") then
				WeaponTypeSelect = v
				end
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('RemoteWeaponSelect') then
			for k, v in pairs(WeaponTypeSelect) do
				if Menu.Button(v.name) then					
					TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(playerIdxWeapon), 'item_weapon', v.id, 1000)
				end
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('WeaponTypeSelection') then
			for k, v in pairs(WeaponTypeSelect) do
				if Menu.MenuButton(v.name, "WeaponOptions") then
				WeaponSelected = v
				end
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('WeaponOptions') then
			if Menu.Button("Spawn Weapon") then		
				GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(WeaponSelected.id), 1000, false)
			end
			if Menu.Button("Add Ammo") then
				SetPedAmmo(GetPlayerPed(-1), GetHashKey(WeaponSelected.id), 5000) 
			end
			if Menu.CheckBox("Infinite Ammo", WeaponSelected.bInfAmmo, function(s)			
			end) then
				WeaponSelected.bInfAmmo = not WeaponSelected.bInfAmmo
				SetPedInfiniteAmmo(GetPlayerPed(-1), WeaponSelected.bInfAmmo, GetHashKey(WeaponSelected.id))
			end
			for k, v in pairs(WeaponSelected.mods) do
				if Menu.MenuButton(k, "ModSelect") then
				ModSelected = v
				end
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('ModSelect') then
			for _, v in pairs(ModSelected) do
				if Menu.Button(v.name) then				
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(WeaponSelected.id), GetHashKey(v.id));
				end
			end
			Menu.Display()
		end
		Citizen.Wait(0)
	end
end)



Citizen.CreateThread(function()


	RegisterCommand('menu', function(source, args, rawCommand)	
		Menu.OpenMenu('memes')
	end)
		
	while true do
    Citizen.Wait(55)
		if IsControlPressed(1, 57) then
			GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), 1000, false)			
			SetPedInfiniteAmmo(GetPlayerPed(-1), true, "WEAPON_PISTOL_MK2")
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CLIP_FMJ"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_SUPP_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_IND_01"));
			GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), 1000, false)		
			SetPedInfiniteAmmo(GetPlayerPed(-1), true, "WEAPON_SMG_MK2")
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CLIP_FMJ"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_AT_AR_FLSH"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_AT_MUZZLE_04"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_AT_SB_BARREL_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CAMO_IND_01"));
			GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_assaultrifle_mk2"), 1000, false)	
			SetPedInfiniteAmmo(GetPlayerPed(-1), true, "weapon_assaultrifle_mk2")
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_assaultrifle_mk2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_assaultrifle_mk2"), GetHashKey("COMPONENT_AT_AR_SUPP_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_assaultrifle_mk2"), GetHashKey("COMPONENT_AT_AR_AFGRIP_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_assaultrifle_mk2"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_assaultrifle_mk2"), GetHashKey("COMPONENT_AT_MUZZLE_04"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_assaultrifle_mk2"), GetHashKey("COMPONENT_AT_AR_BARREL_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_assaultrifle_mk2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_IND_01"));
			GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), 1000, false)
			SetPedInfiniteAmmo(GetPlayerPed(-1), true, "WEAPON_CARBINERIFLE_MK2")
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_SUPP_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_AFGRIP_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_AT_MUZZLE_07"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_AT_CR_BARREL_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_IND_01"));
			GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), 1000, false)
			SetPedInfiniteAmmo(GetPlayerPed(-1), true, "WEAPON_COMBATMG_MK2")
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_FMJ"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_AT_AR_AFGRIP_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_AT_MUZZLE_04"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_AT_MG_BARREL_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_IND_01"));
			GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), 1000, false)
			SetPedInfiniteAmmo(GetPlayerPed(-1), true, "WEAPON_HEAVYSNIPER_MK2")
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MAX"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_AT_SR_SUPP_03"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_AT_MUZZLE_09"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_AT_SR_BARREL_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_IND_01"));
			GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 1000, false)
			SetPedInfiniteAmmo(GetPlayerPed(-1), true, "WEAPON_STUNGUN")
		end
		
	end
	

end)