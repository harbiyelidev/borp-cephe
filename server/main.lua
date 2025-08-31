local QBCore = exports['qb-core']:GetCoreObject()
local Config = require 'config.main'
local InGame = {}
local IsGameStarted = false

CreateThread(function()
   for k, v in pairs(Config.Commands) do
      QBCore.Commands.Add(v.command, v.description, {}, false, function(source, args)
         if v.command == 'cephebaslat' then
            if IsGameStarted then return end

            TriggerClientEvent("txcl:showAnnouncement", -1, 'Cephe savaşı başlamıştır! Cepheye katılmak için karargahtaki paralı askerler /cephekatil komutunu kullanıp kayıt işlemini tamamlamalıdır.', "BORP")
            IsGameStarted = true
            InGame = {}

            TriggerClientEvent('borp-cephe:client:cephebaslat', -1)
         elseif v.command == 'cephebitir' then
            if not IsGameStarted then return end

            TriggerClientEvent("txcl:showAnnouncement", -1, 'Cephe savaşı bitmiştir. Kayıtlarınız otomatik olarak alınmıştır, katılım için teşekkür ederiz.', "BORP")
            TriggerClientEvent('borp-cephe:client:cephebitir', -1)

            for k, v in pairs(InGame) do
               local Player = QBCore.Functions.GetPlayer(k)
               for x, y in pairs(Config.Equipments) do
                  local count = exports.ox_inventory:GetItem(k, y.name, false, true)
                  if count and count > 0 then
                     exports.ox_inventory:RemoveItem(k, y.name, count)
                  end
               end
            end

            IsGameStarted = false
            InGame = {}
         elseif v.command == 'cephekatil' then
            if not IsGameStarted then
               TriggerClientEvent("txcl:showDirectMessage", source, 'Cephe savaşı başlamamıştır, lütfen cephe başlamasını bekleyin.', "BORP")
               return
            end

            if InGame[source] then
               TriggerClientEvent("txcl:showDirectMessage", source, 'Zaten cepheye katılmışsınız.', "BORP")
               return
            end
            InGame[source] = true
            TriggerClientEvent("txcl:showDirectMessage", source, 'Cepheye katıldınız, hayırlı savaşlar.', "BORP")
            TriggerClientEvent('borp-cephe:client:cephekatil', source)
         elseif v.command == 'cepheayril' then
            if not IsGameStarted then
               TriggerClientEvent("txcl:showDirectMessage", source, 'Cephe savaşı başlamamıştır, lütfen cephe başlamasını bekleyin.', "BORP")
               return
            end

            if not InGame[source] then
               TriggerClientEvent("txcl:showDirectMessage", source, 'Zaten cepheye katılmamışsınız.', "BORP")
               return
            end

            InGame[source] = false
            TriggerClientEvent("txcl:showDirectMessage", source, 'Cephe savaşından ayrıldınız, teşekkür ederiz.', "BORP")
            TriggerClientEvent('borp-cephe:client:cepheayril', source)
         end
      end, v.permission)
   end

   for k, v in pairs(Config.Bags) do
      QBCore.Functions.CreateUseableItem(k, function(source, item)
         local Player = QBCore.Functions.GetPlayer(source)

         exports.ox_inventory:RemoveItem(source, k, 1)

         if InGame[source] and InGame[source] then
            local items = Config.Bags[k]
            for x, y in pairs(items) do
               exports.ox_inventory:AddItem(source, y.name, y.amount)
            end
         end
      end)
   end
end)

RegisterNetEvent('borp-cephe:server:cephekatil', function(_, locationData)
   local src = source
   local Player = QBCore.Functions.GetPlayer(src)

   if Player then
      if not InGame[src] or not IsGameStarted then return end
      for k, v in pairs(locationData.items) do
         Player.Functions.AddItem(v.name, v.amount)
      end
   end
end)

RegisterNetEvent('borp-cephe:server:cepheayril', function()
   local src = source
   local Player = QBCore.Functions.GetPlayer(src)

   if Player then
      for k, v in pairs(Config.Equipments) do
         local count = exports.ox_inventory:GetItem(src, v.name, false, true)
         if count and count > 0 then
            exports.ox_inventory:RemoveItem(src, v.name, count)
         end
      end
   end
end)