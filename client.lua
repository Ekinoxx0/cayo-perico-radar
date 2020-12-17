local interiorId = 0

Citizen.CreateThread(function()
	local interiorsOnIsland = {
		[GetInteriorAtCoords(5040.0, -5709.0, 17.0)] = true,
		[GetInteriorAtCoords(5043.0, -5741.0, 17.0)] = true,
		[GetInteriorAtCoords(4998.0, -5777.0, 17.0)] = true,
		[GetInteriorAtCoords(5011.34, -5752.44, 28.85)] = true,
	}

	while true do
		interiorId = GetInteriorAtCoords(GetEntityCoords(PlayerPedId()))
		if interiorsOnIsland[interiorId] then
			interiorId = 0
		end
		Citizen.Wait(500)
	end
end)

Citizen.CreateThread(function()
	while true do
		if interiorId == 0 then
			SetRadarAsInteriorThisFrame(`h4_fake_islandx`, 4700.0, -5145.0, 0, 0)
			SetRadarAsExteriorThisFrame()
		end
		Citizen.Wait(0)
	end
end)