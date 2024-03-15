QBCore = exports["qb-core"]:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()

RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
    PlayerData = {}
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function ()
    PlayerData = {}
end)

local ped, pid, Player, playerId

Citizen.CreateThread(function ()
    while true do 
        Wait(500)
        if LocalPlayer.state.isLoggedIn then 

            SendNUIMessage({
                action = "playerLoggedIn",
            })            

            QBCore.Functions.GetPlayerData(function(PlayerData)
                ped = PlayerPedId()
                pid = GetPlayerServerId(PlayerId())
                Player = QBCore.Functions.GetPlayerData()    
                playerId = PlayerId()
                SendNUIMessage({
                    wallet = " " ..Player.money['cash'],
                })

                SendNUIMessage({
                    bank = " " ..Player.money['bank'],
                })

                SendNUIMessage({
                    id = " " ..GetPlayerServerId(playerId),
                })

                SendNUIMessage({
                    job = " " .. Player.job.label,
                })

            end)
        end
        Wait(500)
    end
end)