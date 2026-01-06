--Made By MrGTAmodsgerman--
--Dont Edit it and Reupload it without my Permission!--



key = {}
key.openmenu       = 117 --Open Menu Key
key.closemenu      = 118 --Close Menu Key

local moneyMenu = {}

function moneyMenu.tick()

	moneyMenu.GUI.tick()

	if(get_key_pressed(key.closemenu)) then
		moneyMenu.GUI.hidden = true
	end

	if(get_key_pressed(key.openmenu)) then
		moneyMenu.GUI.hidden = false
	end
end


function booltoint(bool)
	if bool then
		return 1
	else
		return 0
	end
end
function moneyMenu.keyDelay()
	wait(500)
end



function moneyMenu.Geld1k()
    local playerPed = PLAYER.PLAYER_PED_ID()
    local player = PLAYER.GET_PLAYER_PED(playerPed)
    local playerExists = ENTITY.DOES_ENTITY_EXIST(playerPed) 
    local playerGroup = PED.GET_PED_GROUP_INDEX(playerPed)
    if(playerExists) then
    local playerPosition = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), false)
         OBJECT.CREATE_AMBIENT_PICKUP(GAMEPLAY.GET_HASH_KEY("PICKUP_MONEY_VARIABLE"), playerPosition.x, playerPosition.y, playerPosition.z, 0, 1000, 1, false, true)
    end
end

function moneyMenu.Geld50k()
    local playerPed = PLAYER.PLAYER_PED_ID()
    local player = PLAYER.GET_PLAYER_PED(playerPed)
    local playerExists = ENTITY.DOES_ENTITY_EXIST(playerPed) 
    local playerGroup = PED.GET_PED_GROUP_INDEX(playerPed)
    if(playerExists) then
    local playerPosition = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), false)
         OBJECT.CREATE_AMBIENT_PICKUP(GAMEPLAY.GET_HASH_KEY("PICKUP_MONEY_VARIABLE"), playerPosition.x, playerPosition.y, playerPosition.z, 0, 50000, 1, false, true)
    end
end

function moneyMenu.Geld100k()
    local playerPed = PLAYER.PLAYER_PED_ID()
    local player = PLAYER.GET_PLAYER_PED(playerPed)
    local playerExists = ENTITY.DOES_ENTITY_EXIST(playerPed) 
    local playerGroup = PED.GET_PED_GROUP_INDEX(playerPed)
    if(playerExists) then
    local playerPosition = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), false)
         OBJECT.CREATE_AMBIENT_PICKUP(GAMEPLAY.GET_HASH_KEY("PICKUP_MONEY_VARIABLE"), playerPosition.x, playerPosition.y, playerPosition.z, 0, 100000, 1, false, true)
    end
end

function moneyMenu.Geld500k()
    local playerPed = PLAYER.PLAYER_PED_ID()
    local player = PLAYER.GET_PLAYER_PED(playerPed)
    local playerExists = ENTITY.DOES_ENTITY_EXIST(playerPed) 
    local playerGroup = PED.GET_PED_GROUP_INDEX(playerPed)
    if(playerExists) then
    local playerPosition = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), false)
         OBJECT.CREATE_AMBIENT_PICKUP(GAMEPLAY.GET_HASH_KEY("PICKUP_MONEY_VARIABLE"), playerPosition.x, playerPosition.y, playerPosition.z, 0, 500000, 1, false, true)
    end
end

function moneyMenu.GeldMillionen1()
    local playerPed = PLAYER.PLAYER_PED_ID()
    local player = PLAYER.GET_PLAYER_PED(playerPed)
    local playerExists = ENTITY.DOES_ENTITY_EXIST(playerPed) 
    local playerGroup = PED.GET_PED_GROUP_INDEX(playerPed)
    if(playerExists) then
    local playerPosition = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), false)
         OBJECT.CREATE_AMBIENT_PICKUP(GAMEPLAY.GET_HASH_KEY("PICKUP_MONEY_VARIABLE"), playerPosition.x, playerPosition.y, playerPosition.z, 0, 1000000, 1, false, true)
    end
end

function moneyMenu.GeldMillionen5()
    local playerPed = PLAYER.PLAYER_PED_ID()
    local player = PLAYER.GET_PLAYER_PED(playerPed)
    local playerExists = ENTITY.DOES_ENTITY_EXIST(playerPed) 
    local playerGroup = PED.GET_PED_GROUP_INDEX(playerPed)
    if(playerExists) then
    local playerPosition = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), false)
         OBJECT.CREATE_AMBIENT_PICKUP(GAMEPLAY.GET_HASH_KEY("PICKUP_MONEY_VARIABLE"), playerPosition.x, playerPosition.y, playerPosition.z, 0, 5000000, 1, false, true)
    end
end

function moneyMenu.GeldMillionen100()
    local playerPed = PLAYER.PLAYER_PED_ID()
    local player = PLAYER.GET_PLAYER_PED(playerPed)
    local playerExists = ENTITY.DOES_ENTITY_EXIST(playerPed) 
    local playerGroup = PED.GET_PED_GROUP_INDEX(playerPed)
    if(playerExists) then
    local playerPosition = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), false)
         OBJECT.CREATE_AMBIENT_PICKUP(GAMEPLAY.GET_HASH_KEY("PICKUP_MONEY_VARIABLE"), playerPosition.x, playerPosition.y, playerPosition.z, 0, 100000000, 1, false, true)
    end
end

function moneyMenu.GeldMillionen500()
    local playerPed = PLAYER.PLAYER_PED_ID()
    local player = PLAYER.GET_PLAYER_PED(playerPed)
    local playerExists = ENTITY.DOES_ENTITY_EXIST(playerPed) 
    local playerGroup = PED.GET_PED_GROUP_INDEX(playerPed)
    if(playerExists) then
    local playerPosition = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), false)
         OBJECT.CREATE_AMBIENT_PICKUP(GAMEPLAY.GET_HASH_KEY("PICKUP_MONEY_VARIABLE"), playerPosition.x, playerPosition.y, playerPosition.z, 0, 500000000, 1, false, true)
    end
end

function moneyMenu.GeldMillarde1()
    local playerPed = PLAYER.PLAYER_PED_ID()
    local player = PLAYER.GET_PLAYER_PED(playerPed)
    local playerExists = ENTITY.DOES_ENTITY_EXIST(playerPed) 
    local playerGroup = PED.GET_PED_GROUP_INDEX(playerPed)
    if(playerExists) then
    local playerPosition = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), false)
         OBJECT.CREATE_AMBIENT_PICKUP(GAMEPLAY.GET_HASH_KEY("PICKUP_MONEY_VARIABLE"), playerPosition.x, playerPosition.y, playerPosition.z, 0, 1000000000, 1, false, true)
    end
end


function moneyMenu.GeldMillarde5()
    local playerPed = PLAYER.PLAYER_PED_ID()
    local player = PLAYER.GET_PLAYER_PED(playerPed)
    local playerExists = ENTITY.DOES_ENTITY_EXIST(playerPed) 
    local playerGroup = PED.GET_PED_GROUP_INDEX(playerPed)
    if(playerExists) then
    local playerPosition = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), false)
         OBJECT.CREATE_AMBIENT_PICKUP(GAMEPLAY.GET_HASH_KEY("PICKUP_MONEY_VARIABLE"), playerPosition.x, playerPosition.y, playerPosition.z, 0, 5000000000, 1, false, true)
    end
end


function moneyMenu.By()
         print("Created By MrGTAmodsgerman")
end
function moneyMenu.init()
	
	moneyMenu.GUI = Libs["MMC"]

	moneyMenu.GUI.addButton("Get 1 Thousand $",moneyMenu.Geld1k,0.25,0.4,0.033,0.03)
	moneyMenu.GUI.addButton("Get 50 Thousand $",moneyMenu.Geld50k,0.25,0.4,0.033,0.03)
	moneyMenu.GUI.addButton("Get 100 Thousand $",moneyMenu.Geld100k,0.25,0.4,0.033,0.03)
	moneyMenu.GUI.addButton("Get 500 Thousand $",moneyMenu.Geld500k,0.25,0.4,0.033,0.03)
	moneyMenu.GUI.addButton("Get 1 Million $",moneyMenu.GeldMillionen1,0.25,0.4,0.033,0.03)
	moneyMenu.GUI.addButton("Get 5 Million $",moneyMenu.GeldMillionen5,0.25,0.4,0.033,0.03)
	moneyMenu.GUI.addButton("Get 100 Million $",moneyMenu.GeldMillionen100,0.25,0.4,0.033,0.03)
	moneyMenu.GUI.addButton("Get 500 Million $",moneyMenu.GeldMillionen500,0.25,0.4,0.033,0.03)
	moneyMenu.GUI.addButton("Get 1 Milliard $",moneyMenu.GeldMillarde1,0.25,0.4,0.033,0.03)
	moneyMenu.GUI.addButton("Get 5 Milliard $",moneyMenu.GeldMillarde5,0.25,0.4,0.033,0.03)
    moneyMenu.GUI.hidden = true
end
function moneyMenu.unload()

end

return moneyMenu