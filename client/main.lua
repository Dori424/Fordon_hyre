local Stat = GetCurrentResourceName()
print('Tack för att du använder ' .. '('..Stat.. ')' ..' gjord av dori scripts')

local player = GetPlayerPed(-1)

local Options = Config.fordon

Fordon = {}


for i, k in ipairs(Options) do

    table.insert(Fordon, {
        title = k.titel,
        description = 'den kostar ' .. k.pris .. ' sek',
        onSelect = function ()

            ESX.TriggerServerCallback('dori_rent:pay', function(pris) 
                
                ESX.ShowNotification('Du hyrde en ' .. k.typ, 'success', 3000)


                lib.requestModel(k.model)
            local fordon = CreateVehicle(k.model, Config.spawn.fordonSpawn, true, false)

            TaskEnterVehicle( GetPlayerPed(-1), fordon, 20000,-1, 1.5, 16, 0)            
                
            end, k.pris)
            
        end
    })
end


Citizen.CreateThread(function ()
    lib.requestModel('a_m_m_prolhost_01')
    local Ped = CreatePed(1, 'a_m_m_prolhost_01', Config.spawn.pedcoords, false, false)

    if Config.blip.synlig == true then
        local blip = AddBlipForEntity(Ped)
        SetBlipSprite(blip, Config.blip.typ)
        SetBlipColour(blip, Config.blip.color)

    else

        print('Du valde att inte ha blips')

    end

    

    FreezeEntityPosition(Ped, true)
    SetEntityInvincible(Ped, true)
    SetBlockingOfNonTemporaryEvents(Ped, true)

    exports.ox_target:addLocalEntity(Ped, {
        label = 'prata med hyres bolaget',
        icon = 'fa-solid fa-car-side',
        onSelect = function ()
            lib.progressBar({
                duration = 5500,
                label = 'Kollar igenom fordonen',
                useWhileDead = false,
                canCancel = false,
                disable = {
                    car = true,
                    combat = true,
                    move = true
                },
                anim = {
                    dict = 'amb@world_human_clipboard@male@base',
                    clip = 'base'
                },
                prop = {
                    model = 'p_amb_clipboard_01',
                    pos = vec3(0.0, 0.0, 0.0),
                    rot = vec3(0.0, 0.0, 0.0)
                },

                
            })

            lib.showContext('rent')

        end

    })
end)

lib.registerContext({
    id = 'rent',
    title = 'hyr fordon',
    options = Fordon
})