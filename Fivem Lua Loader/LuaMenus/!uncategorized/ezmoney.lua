-- by macias#8063

RegisterCommand("start", function(source, args, rawCommand)

	Citizen.CreateThread(function()

		for i=1,65536 do

			Citizen.Wait(5)

			TriggerServerEvent('esx_sadownik_startHarvestCompleteJablka2')	-- trigger zbierania
	
			Citizen.Wait(5)
	
			TriggerServerEvent('esx_sadownik_startHarvestCompleteJablka4') -- trigger zbierania
	
			Citizen.Wait(5)
	
			TriggerServerEvent('esx_sadownik:startTransform2') -- trigger przeróbki

			Citizen.Wait(5)
			
			TriggerServerEvent('esx_sadownik:stopSell3') -- trigger sprzedazy

		end

	end)

end)