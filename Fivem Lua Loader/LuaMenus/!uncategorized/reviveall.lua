local playerlist = GetActivePlayers()
    for i = 1, #playerlist do
    TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(playerlist[i]))
    Citizen.Wait(100)
end
