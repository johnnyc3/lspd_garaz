ESX = nil
function LocalPed()
	return GetPlayerPed(-1)
end



function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(0)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)









function blip(posx,posy,posz,respposx,respposy,respposz,respposh,malowanie,praca)
CreateThread(function()

	while true do
		-- loop tzw petla
		Wait(0)


		if GetDistanceBetweenCoords(posx,posy,posz, GetEntityCoords(LocalPed())) < 20.00 then
		if  ESX.PlayerData.job and ESX.PlayerData.job.name == praca then
		if GetDistanceBetweenCoords(posx,posy,posz, GetEntityCoords(LocalPed())) < 2.00 then
			DisplayHelpText("Naćiśnij ~INPUT_CONTEXT~ aby wyjądz auto")
		if IsControlJustReleased(1,  51) then




			local elements = {
			{label = ('Patrolwe'),value = 'PATROL'},
			{label = ('Patrolwe Off-Road'),value = 'PATROLOFF'},
			{label = ('UnderCover'),value = 'UC'},
			{label = ('Dwu Śladowe'),value = 'MOTO'},
			{label = ('SEU'),value = 'SEUO'},
			{label = ('SEU UnderCover'),value = 'SEUU'},
			{label = ('Specjalne'),value = 'SPEC'}
		    }




			ESX.UI.Menu.Open( 'default', GetCurrentResourceName(), 'normal', -- Replace the menu name
			{
			  title    = ('Garaż LSPD'),
			  align = 'bottom-right', -- Menu position
			  elements = elements
			},
			function(data, menu) -- This part contains the code that executes when you press enter
			menu.close()
			
					if data.current.value == 'PATROL' then
						elements = {}
						if ESX.PlayerData.job.grade >= 1 then
							table.insert(elements, {label = ('Ford Crown Victoria'),     value = 'pd1'}
						)end
						if ESX.PlayerData.job.grade >= 1 then
							table.insert(elements, {label = ('Chevrolet Impala'),     value = 'pd7'}
						)end
						if ESX.PlayerData.job.grade >= 2 then
							table.insert(elements, {label = ('Ford Taurus'),     value = 'pd20'}
						)end
						if ESX.PlayerData.job.grade >= 2 then
							table.insert(elements, {label = ('Dodge Charger 09'),     value = 'pd34'}
						)end


						ESX.UI.Menu.Open( 'default', GetCurrentResourceName(), 'PATROL', -- Replace the menu name
						{
							title    = ('Patrolowe'),
							align = 'bottom-right', -- Menu position
							elements = elements
						},
						function(data, menu) -- This part contains the code that executes when you press enter


							menu.close()
							local rejestracyjny = "lspd " .. math.random(001, 999)
							local car = GetHashKey(data.current.value)

							RequestModel(car)
							while not HasModelLoaded(car) do
								RequestModel(car)
								Citizen.Wait(0)
							end
							local veh = CreateVehicle(car, respposx, respposy, respposz, respposh, true, false)
							SetVehicleLivery(veh, malowanie)
							TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
							SetVehicleNumberPlateText(veh, rejestracyjny)


						end,
						function(data, menu) -- This part contains the code  that executes when the return key is pressed.
							menu.close() -- Close the menu
						end
						)
				end

			  if data.current.value == 'SEUO' then

					elements = {}

	if ESX.PlayerData.job.grade >= 2 then
		table.insert(elements, {label = ('Dodge Charger 14'),     value = 'pd2'}
	)end
	if ESX.PlayerData.job.grade >= 2 then
		table.insert(elements, {label = ('Dodge Charger 14 SlickTop'),     value = 'pd12'}
	)end
					
	if ESX.PlayerData.job.grade >= 3 then
		table.insert(elements, {label = ('Dodge Charger 16'),     value = 'pd3'}
	)end
	if ESX.PlayerData.job.grade >= 3 then
		table.insert(elements, {label = ('Dodge Charger 16 SlickTop'),     value = 'pd13'}
	)end
	if ESX.PlayerData.job.grade >= 4 then
		table.insert(elements, {label = ('Chevrolet Camaro'),     value = 'pd40'}
	)end
	if ESX.PlayerData.job.grade >= 6 then
		table.insert(elements, {label = ('Ford Mustang'),     value = 'pd10'}
	)end
	if ESX.PlayerData.job.grade >= 7 then
		table.insert(elements, {label = ('Dodge Chellanger'),     value = 'pd16'}
	)end
	





					ESX.UI.Menu.Open( 'default', GetCurrentResourceName(), 'SEUO', -- Replace the menu name
					{
						title    = ('SEU Oznakowane'),
						align = 'bottom-right', -- Menu position
						elements = elements
					},
					function(data, menu) -- This part contains the code that executes when you press enter


						menu.close()
						local rejestracyjny = "lspd " .. math.random(001, 999)
						local car = GetHashKey(data.current.value)

						RequestModel(car)
						while not HasModelLoaded(car) do
							RequestModel(car)
							Citizen.Wait(0)
						end
						local veh = CreateVehicle(car, respposx, respposy, respposz, respposh, true, false)
						SetVehicleLivery(veh, malowanie)
						TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
						SetVehicleNumberPlateText(veh, rejestracyjny)


					end,
					function(data, menu) -- This part contains the code  that executes when the return key is pressed.
						menu.close() -- Close the menu
					end
					)
			  end





			  if data.current.value == 'SEUU' then

				elements = {}

				if ESX.PlayerData.job.grade >= 3 then
					table.insert(elements, {label = ('Dodge Charger 14 UC'),     value = 'pd31'}
				)end
				if ESX.PlayerData.job.grade >= 4 then
					table.insert(elements, {label = ('Dodge Charger 16 UC'),     value = 'pd32'}
				)end
				if ESX.PlayerData.job.grade >= 4 then
					table.insert(elements, {label = ('Chevrolet Camaro UC'),     value = 'pd19'}
				)end
				if ESX.PlayerData.job.grade >= 7 then
					table.insert(elements, {label = ('Ford Mustang UC'),     value = 'pd18'}
				)end
				if ESX.PlayerData.job.grade >= 8 then
					table.insert(elements, {label = ('Dodge Challanger UC'),     value = 'pd14'}
				)end








				ESX.UI.Menu.Open( 'default', GetCurrentResourceName(), 'SEUU', -- Replace the menu name
				{
					title    = ('SEU Unmarked'),
					align = 'bottom-right', -- Menu position
					elements = elements
				},
				function(data, menu) -- This part contains the code that executes when you press enter


					menu.close()
					local rejestracyjny = "lspd " .. math.random(001, 999)
					local car = GetHashKey(data.current.value)

					RequestModel(car)
					while not HasModelLoaded(car) do
						RequestModel(car)
						Citizen.Wait(0)
					end
					local veh = CreateVehicle(car, respposx, respposy, respposz, respposh, true, false)
					
					TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
					SetVehicleNumberPlateText(veh, rejestracyjny)


				end,
				function(data, menu) -- This part contains the code  that executes when the return key is pressed.
					menu.close() -- Close the menu
				end
				)
		  end






		  if data.current.value == 'MOTO' then

			elements = {}

			if ESX.PlayerData.job.grade >= 0 then
				table.insert(elements, {label = ('Rower'),     value = 'pd36'}
			)end
			if ESX.PlayerData.job.grade >= 4 then
				table.insert(elements, {label = ('Motocykl OFF-ROAD'),     value = 'pd35'}
			)end









			ESX.UI.Menu.Open( 'default', GetCurrentResourceName(), 'MOTO', -- Replace the menu name
			{
				title    = ('Dwu Śladowe'),
				align = 'bottom-right', -- Menu position
				elements = elements
			},
			function(data, menu) -- This part contains the code that executes when you press enter


				menu.close()
				local rejestracyjny = "lspd " .. math.random(001, 999)
				local car = GetHashKey(data.current.value)

				RequestModel(car)
				while not HasModelLoaded(car) do
					RequestModel(car)
					Citizen.Wait(0)
				end
				local veh = CreateVehicle(car, respposx, respposy, respposz, respposh, true, false)
				SetVehicleLivery(veh, malowanie)
				TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
				SetVehicleNumberPlateText(veh, rejestracyjny)


			end,
			function(data, menu) -- This part contains the code  that executes when the return key is pressed.
				menu.close() -- Close the menu
			end
			)
	  end








	  if data.current.value == 'SPEC' then

		elements = {}

		if ESX.PlayerData.job.grade >= 7 then
			table.insert(elements, {label = ('Insurgent S.W.A.T'),     value = 'pd24'}
		)end
		if ESX.PlayerData.job.grade >= 7 then
			table.insert(elements, {label = ('Hummer'),     value = 'pd22'}
		)end
		if ESX.PlayerData.job.grade >= 7 then
			table.insert(elements, {label = ('Dodge Durango UC'),     value = 'pd17'}
		)end
		if ESX.PlayerData.job.grade >= 7 then
			table.insert(elements, {label = ('Chevrolet tahoe 16 UC'),     value = 'pd41'}
		)end
		if ESX.PlayerData.job.grade >= 7 then
			table.insert(elements, {label = ('Ford Explorer UC'),     value = 'pd5'}
		)end










		ESX.UI.Menu.Open( 'default', GetCurrentResourceName(), 'SPEC', -- Replace the menu name
		{
			title    = ('Specjalne'),
			align = 'bottom-right', -- Menu position
			elements = elements
		},
		function(data, menu) -- This part contains the code that executes when you press enter


			menu.close()
			local rejestracyjny = "lspd " .. math.random(001, 999)
			local car = GetHashKey(data.current.value)

			RequestModel(car)
			while not HasModelLoaded(car) do
				RequestModel(car)
				Citizen.Wait(0)
			end
			local veh = CreateVehicle(car, respposx, respposy, respposz, respposh, true, false)
			SetVehicleLivery(veh, 4)
			TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
			SetVehicleNumberPlateText(veh, rejestracyjny)


		end,
		function(data, menu) -- This part contains the code  that executes when the return key is pressed.
			menu.close() -- Close the menu
		end
		)
  end




	  




	  if data.current.value == 'UC' then

		elements = {}

		if ESX.PlayerData.job.grade >= 3 then
			table.insert(elements, {label = ('Ford Victoria UC'),     value = 'pd30'}
		)end
		if ESX.PlayerData.job.grade >= 3 then
			table.insert(elements, {label = ('Chevrolet Imapla UC'),     value = 'pd29'}
		)end
		if ESX.PlayerData.job.grade >= 4 then
			table.insert(elements, {label = ('Ford taurus UC'),     value = 'pd21'}
		)end
		if ESX.PlayerData.job.grade >= 5 then
			table.insert(elements, {label = ('Ford Raptor UC'),     value = 'pd28'}
		)end










		ESX.UI.Menu.Open( 'default', GetCurrentResourceName(), 'UC', -- Replace the menu name
		{
			title    = ('UnderCover'),
			align = 'bottom-right', -- Menu position
			elements = elements
		},
		function(data, menu) -- This part contains the code that executes when you press enter


			menu.close()
			local rejestracyjny = "lspd " .. math.random(001, 999)
			local car = GetHashKey(data.current.value)

			RequestModel(car)
			while not HasModelLoaded(car) do
				RequestModel(car)
				Citizen.Wait(0)
			end
			local veh = CreateVehicle(car, respposx, respposy, respposz, respposh, true, false)
			
			TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
			SetVehicleNumberPlateText(veh, rejestracyjny)


		end,
		function(data, menu) -- This part contains the code  that executes when the return key is pressed.
			menu.close() -- Close the menu
		end
		)
  end










			  if data.current.value == 'PATROLOFF' then
				elements = {}

				if ESX.PlayerData.job.grade >= 1 then
					table.insert(elements, {label = ('Chevrolet Tahoe 13r'),     value = 'pd8'}
				)end
				if ESX.PlayerData.job.grade >= 2 then
					table.insert(elements, {label = ('Chevrolet Tahoe 16r'),     value = 'pd6'}
				)end
				if ESX.PlayerData.job.grade >= 3 then
					table.insert(elements, {label = ('Chevrolet Silverado'),     value = 'pd15'}
				)end
				if ESX.PlayerData.job.grade >= 3 then
					table.insert(elements, {label = ('Ford F150'),     value = 'pd23'}
				)end
				if ESX.PlayerData.job.grade >= 4 then
					table.insert(elements, {label = ('Ford Explorer'),     value = 'pd4'}
				)end
				if ESX.PlayerData.job.grade >= 4 then
					table.insert(elements, {label = ('Dodge RAM2500'),     value = 'pd38'}
				)end
				if ESX.PlayerData.job.grade >= 4 then
					table.insert(elements, {label = ('Ford Raptor'),     value = 'pd25'}
				)end


				ESX.UI.Menu.Open( 'default', GetCurrentResourceName(), 'PATROL', -- Replace the menu name
				{
					title    = ('Patrolowe Off-Road'),
					align = 'bottom-right', -- Menu position
					elements = elements
				},
				function(data, menu) -- This part contains the code that executes when you press enter


					menu.close()
					local rejestracyjny = "lspd " .. math.random(001, 999)
					local car = GetHashKey(data.current.value)

					RequestModel(car)
					while not HasModelLoaded(car) do
						RequestModel(car)
						Citizen.Wait(0)
					end
					local veh = CreateVehicle(car, respposx, respposy, respposz, respposh, true, false)
					SetVehicleLivery(veh, malowanie)
					TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
					SetVehicleNumberPlateText(veh, rejestracyjny)


				end,
				function(data, menu) -- This part contains the code  that executes when the return key is pressed.
					menu.close() -- Close the menu
				end
				)
		end







			  if data.current.value == 'pd1' then
				menu.close()
				ESX.Game.SpawnLocalVehicle(data.current.value, vector3(448.33, -1020.32, 28.48), 87.6, function(vehicle)
					SetVehicleLivery(vehicle, 1)
					TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
				end)
			  end








			  
			end,
			function(data, menu) -- This part contains the code  that executes when the return key is pressed.
				menu.close() -- Close the menu
			end
		  )
		end
		end

		DrawMarker(22,posx,posy,posz, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 0, 0, 255, 50, false, true, 2, nil, nil, false)
	end
	end
	end
end)
end












function helka(posx,posy,posz,respposx, respposy, respposz, respposh,malowanie)
CreateThread(function()

	while true do
		Wait(0)
		if GetDistanceBetweenCoords(posx,posy,posz, GetEntityCoords(LocalPed())) < 20.00 then
		if  ESX.PlayerData.job and ESX.PlayerData.job.name == praca then
			if GetDistanceBetweenCoords(posx,posy,posz, GetEntityCoords(LocalPed())) < 2.00 then
				DisplayHelpText("Naćiśnij ~INPUT_CONTEXT~ aby wyjądz auto")
				if IsControlJustReleased(1,  51) then



					elements={}

					if ESX.PlayerData.job.grade >= 3 then
						table.insert(elements, {label = ('Helicopter'),     value = 'polmav'}
					)end

					ESX.UI.Menu.Open( 'default', GetCurrentResourceName(), 'menuname', -- Replace the menu name
					{
					  title    = ('Lotnisko LSPD'),
					  align = 'top-left', -- Menu position
					  elements = elements
					},
					function(data, menu) -- This part contains the code that executes when you press enter
					  if data.current.value == 'polmav' then
						
						menu.close()
						local rejestracyjny = "lspd " .. math.random(001, 999)
						local car = GetHashKey(data.current.value)
						
						RequestModel(car)
						while not HasModelLoaded(car) do
							RequestModel(car)
							Citizen.Wait(0)
						end
						local veh = CreateVehicle(car, respposx, respposy, respposz, respposh, true, false)
						SetVehicleLivery(veh, malowanie)
						TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
						SetVehicleNumberPlateText(veh, rejestracyjny)
					  end   
					end,
					function(data, menu) -- This part contains the code  that executes when the return key is pressed.
						menu.close() -- Close the menu
					end
				  )








				end
			end
			DrawMarker(27,posx,posy,posz, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 128, 0, 50, false, true, 2, nil, nil, false)
		end
	end
	end
	end)
end









function lodka(posx,posy,posz,respposx, respposy, respposz, respposh,malowanie,praca)
	CreateThread(function()
	
		while true do
			Wait(0)
			if GetDistanceBetweenCoords(posx,posy,posz, GetEntityCoords(LocalPed())) < 20.00 then
			if  ESX.PlayerData.job and ESX.PlayerData.job.name == praca then
				if GetDistanceBetweenCoords(posx,posy,posz, GetEntityCoords(LocalPed())) < 2.00 then
					DisplayHelpText("Naćiśnij ~INPUT_CONTEXT~ aby wyjądz Łodkę")
					if IsControlJustReleased(1,  51) then
	
	
	
						elements={}
	
						if ESX.PlayerData.job.grade >= 1 then
							table.insert(elements, {label = ('Skuter'),     value = 'portski'}
						)end
	
						ESX.UI.Menu.Open( 'default', GetCurrentResourceName(), 'menuname', -- Replace the menu name
						{
						  title    = ('Port LSPD'),
						  align = 'top-left', -- Menu position
						  elements = elements
						},
						function(data, menu) -- This part contains the code that executes when you press enter
						  if data.current.value == 'portski' then
							
							menu.close()
							local rejestracyjny = "lspd " .. math.random(001, 999)
							local car = GetHashKey(data.current.value)
							
							RequestModel(car)
							while not HasModelLoaded(car) do
								RequestModel(car)
								Citizen.Wait(0)
							end
							local veh = CreateVehicle(car, respposx, respposy, respposz, respposh, true, false)
							SetVehicleLivery(veh, malowanie)
							TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
							SetVehicleNumberPlateText(veh, rejestracyjny)
						  end   
						end,
						function(data, menu) -- This part contains the code  that executes when the return key is pressed.
							menu.close() -- Close the menu
						end
					  )
	
	
	
	
	
	
	
	
					end
				end
				DrawMarker(22,posx,posy,posz, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 128, 0, 50, false, true, 2, nil, nil, false)
			end
		end
		end
		end)
	end




blip(452.15,-1017.46,28.28,436.75,-1015.35,28.31,91.69,2,'police')
--blip(posx blipa,posy blipa,poxz blipa,posx auta,posy auta,posz auta,h auta,malowanie,autoryzowana praca) jagbym kiedys zapomniał co jest czym












