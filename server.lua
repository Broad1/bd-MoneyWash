    local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("bdmw:SendAmount")
AddEventHandler("bdmw:SendAmount", function (GiveAmount)
    local AmountToGive = GiveAmount / 2
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem(Config.Items.DirtyMoney, GiveAmount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Items.DirtyMoney], "remove", 1)
    Player.Functions.AddItem(Config.Items.CleanMoney, AmountToGive)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Items.CleanMoney], "add", 1)
end)