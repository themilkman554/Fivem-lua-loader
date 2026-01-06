local MMC = {}
MMC.MMC = {}
MMC.buttonCount = 0
MMC.loaded = false
MMC.selection = 0
MMC.time = 0
MMC.hidden = false
function MMC.addButton(name, func, xmin, xmax, ymin, ymax)
	MMC.MMC[MMC.buttonCount +1] = {}
	MMC.MMC[MMC.buttonCount +1]["name"] = name
	MMC.MMC[MMC.buttonCount+1]["func"] = func
    MMC.MMC[MMC.buttonCount+1]["args"] = args
	MMC.MMC[MMC.buttonCount+1]["active"] = false
	MMC.MMC[MMC.buttonCount+1]["xmin"] = xmin
	MMC.MMC[MMC.buttonCount+1]["ymin"] = ymin * (MMC.buttonCount + 0.01) +0.19
	MMC.MMC[MMC.buttonCount+1]["xmax"] = xmax
	MMC.MMC[MMC.buttonCount+1]["ymax"] = ymax
	MMC.buttonCount = MMC.buttonCount+1
end
function MMC.unload()
end
function MMC.init()

	MMC.loaded = true
end
function MMC.tick()
	if(not MMC.hidden)then
	    if( MMC.time == 0) then
		    MMC.time = GAMEPLAY.GET_GAME_TIMER()
	    end
	    if((GAMEPLAY.GET_GAME_TIMER() - MMC.time)> 100) then
		    MMC.updateSelection()
	    end	
	        MMC.renderMMC()	
	    if(not MMC.loaded ) then
		       MMC.init()	 
	    end
	end	
end

function MMC.updateSelection() 
	if(get_key_pressed(Keys.NumPad2)) then 
		if(MMC.selection < MMC.buttonCount -1  )then
			MMC.selection = MMC.selection +1
			MMC.time = 0
		end
	elseif (get_key_pressed(Keys.NumPad8))then
		if(MMC.selection > 0)then
			MMC.selection = MMC.selection -1
			MMC.time = 0
		end
	elseif (get_key_pressed(Keys.NumPad5)) then
		if(type(MMC.MMC[MMC.selection +1]["func"]) == "function") then
			MMC.MMC[MMC.selection +1]["func"](MMC.MMC[MMC.selection +1]["args"])
		else
			print(type(MMC.MMC[MMC.selection]["func"]))
		end
		MMC.time = 0
	end
	local iterator = 0
	for id, settings in ipairs(MMC.MMC) do
		MMC.MMC[id]["active"] = false
		if(iterator == MMC.selection ) then
			MMC.MMC[iterator +1]["active"] = true
		end
		iterator = iterator +1
	end
end

function MMC.renderMMC()
	 MMC.renderButtons()
end
function MMC.renderBox(xMin,xMax,yMin,yMax,color1,color2,color3,color4)
	GRAPHICS.DRAW_RECT(xMin, yMin,xMax, yMax, color1, color2, color3, color4);
end

function MMC.renderButtons()
	
	for id, settings in pairs(MMC.MMC) do
		local screen_w = 0
		local screen_h = 0
		screen_w, screen_h =  GRAPHICS.GET_SCREEN_RESOLUTION(0, 0)
		boxColor = {0,0,0,150}
		UI.SET_TEXT_COLOUR(255, 255, 255, 200)
		if(settings["active"]) then
			boxColor = {255,255,255,350}
			UI.SET_TEXT_COLOUR(0,0,0,200)
		end              

		UI.DISPLAY_CASH(true)
		UI.SET_TEXT_FONT(0)
		UI.SET_TEXT_SCALE(0.0, 0.34)
		UI.SET_TEXT_CENTRE(true)
        UI.SET_TEXT_DROPSHADOW(0, 0, 0, 0, 0)
		UI.SET_TEXT_EDGE(5, 255, 255, 255, 200)
		UI._SET_TEXT_ENTRY("STRING")
		UI._ADD_TEXT_COMPONENT_STRING(settings["name"])
		UI._DRAW_TEXT(settings["xmin"]+ 0.006, (settings["ymin"] - 0.0150 ))
		UI._ADD_TEXT_COMPONENT_STRING(settings["name"])
		MMC.renderBox(settings["xmin"] ,settings["xmax"], settings["ymin"], settings["ymax"],boxColor[1],boxColor[2],boxColor[3],boxColor[4])
		
		
		
		
		
		
	UI.SET_TEXT_FONT(0)
	UI.SET_TEXT_SCALE(0.0, 0.80)
	UI.SET_TEXT_COLOUR(255, 255, 255, 255)
	UI.SET_TEXT_CENTRE(false)
	UI.SET_TEXT_DROPSHADOW(255, 255, 255, 255, 200)
	UI.SET_TEXT_EDGE(0, 0, 0, 0, 0)
	UI._SET_TEXT_ENTRY("STRING")
	UI._ADD_TEXT_COMPONENT_STRING("Detailed Money Menu")
	UI._DRAW_TEXT(0.09+ 0.02, (0.045  + 0.00 + 0.0595 ))  
	
	
	UI.SET_TEXT_FONT(0)
	UI.SET_TEXT_SCALE(0.0, 0.30)
	UI.SET_TEXT_COLOUR(255, 0, 0, 235)
	UI.SET_TEXT_CENTRE(false)
	UI.SET_TEXT_DROPSHADOW(55, 255, 0, 255, 200)
	UI.SET_TEXT_EDGE(0, 0, 0, 0, 0)
	UI._SET_TEXT_ENTRY("STRING")
	UI._ADD_TEXT_COMPONENT_STRING("Created By MrGTAmodsgerman")
	UI._DRAW_TEXT(0.09+ 0.20, (0.045  + 0.00 + 0.1090 ))  
	 end     
end

return MMC