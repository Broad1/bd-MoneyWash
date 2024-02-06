local QBCore = exports['qb-core']:GetCoreObject()


for _, loc in ipairs(Config.WasherLocations) do 
    local washer_prop = CreateObject(Config.WasherProp, loc.x, loc.y, loc.z - 1, loc.w, true, true, true)
    FreezeEntityPosition(washer_prop, true)


    if Config.Blip then
        Citizen.CreateThread(function()
                local blip = AddBlipForCoord(loc.x, loc.y, loc.z)
                SetBlipSprite(blip, 500)
                SetBlipDisplay(blip, 2)
                SetBlipScale(blip, 0.4)
                SetBlipColour(blip, 11)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Money Wash Stations") 
                EndTextCommandSetBlipName(blip)
  
          
        end)
    end
end
  
exports['qb-target']:AddTargetModel(Config.WasherProp, { -- This defines the models, can be a string or a table
options = { 
  {
    num = 1,
    type = "client", 
    action = function ()
        local CleanserAmount = lib.inputDialog("Dirty Money Wash Cleaner", {
            {
                type = "number",
                label = "Insert Dirty Money",
                min = 1,
                max = 250,
                required = true,
            },
          })
          if CleanserAmount == nil then return end
          local Amount = json.encode(CleanserAmount[1])

          local function TimeToClean(time)
            TriggerEvent('QBCore:Notify', "Please Wait " .. time .. " Minutes To Recieve Your Clean Money!", "success", 3500)
            Wait(time * 60000)
            TriggerServerEvent("bdmw:SendAmount", Amount)
        end

          QBCore.Functions.Progressbar("money_cleanse_phase 1", "Inserting Money", 3500, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
         }, {
            animDict = "missheistfbisetup1",
            anim = "hassle_intro_loop_f",
            flags = 49,
         }, {}, {}, function()
            TimeToClean(Config.CleaningTime)
          
         end, function()
            -- Cancel
         end)

   
        
    end,
    icon = 'fa-solid fa-jug-detergent',
    label = 'Wash Money', 
},
},
distance = 2, 
})


