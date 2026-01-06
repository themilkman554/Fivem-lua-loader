Citizen.CreateThread(function()
  while true do
	   Citizen.Wait(1000)
	for id = 0, 256 do
	 if NetworkIsPlayerActive(id) then
		 local serverID = GetPlayerServerId(id)
         TriggerServerEvent('esx_policejob:message', serverID, "~r~[PSK] ~y~Pasukan ~g~Sok ~b~Keras ~b~http://gg.gg/joinpsk ~w~By ~p~ROC")
	 end
	end
  end
end)