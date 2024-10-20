if Config.version == 'revoked' then

    ESX = nil

    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

else
    ESX = exports["es_extended"]:getSharedObject()
    
end

ESX.RegisterServerCallback('dori_rent:pay', function(source, cb, pris)
    local xPlayer = ESX.GetPlayerFromId(source)

    local wallet = xPlayer.getMoney()

    if xPlayer then
        if wallet >= pris then

            xPlayer.removeMoney(pris)
            cb(true)
        else
            xPlayer.showNotification('Du hade inte tillräckligt med pengar!') 
        end
    end
end)
