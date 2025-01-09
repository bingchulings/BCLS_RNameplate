local display = false

RegisterNetEvent("showPlayerInfo")
AddEventHandler("showPlayerInfo", function(playerName, job, grade)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local x, y, z = table.unpack(coords)

    SendNUIMessage({
        type = "updateInfo",
        playerName = playerName,
        job = job,
        grade = grade,
        x = x,
        y = y - 50,
        visible = true
    })
    display = true
end)

RegisterCommand("hideinfo", function()
    SendNUIMessage({
        type = "updateInfo",
        visible = false
    })
    display = false
end)

Citizen.CreateThread(function()
    while display do
        Wait(0)
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local x, y, z = table.unpack(coords)
        SendNUIMessage({
            type = "updateInfo",
            x = x,
            y = y - 50
        })
    end
end)
