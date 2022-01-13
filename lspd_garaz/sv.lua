RegisterNetEvent("zresp_auto")


AddEventHandler("zresp_auto", function(auto, malowanie,rejestracyjny)
    TriggerClientEvent("zresp_auto2", -1, auto, malowanie,rejestracyjny)
    --ESX.Game.SpawnLocalVehicle(data.current.value, vector3(448.33, -1020.32, 28.48), 87.6, function(vehicle)
     --   SetVehicleNumberPlateText(vehicle, rejestracyjny)
       -- SetVehicleLivery(vehicle, malowanie)
        --TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
 --   end) 
end)