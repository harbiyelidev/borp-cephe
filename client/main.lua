local QBCore = exports['qb-core']:GetCoreObject()
local Config = require 'config.main'
local IsGameStarted = false
local InGame = false

function GetClosestLocation(playerCoords, locations)
   local closestLocation = nil
   local closestDistance = nil
   local locationData = nil
   for k, v in pairs(locations) do
      local distance = #(playerCoords - v.coords)
      if not closestDistance or (distance < closestDistance and distance < v.radius) then
         closestDistance = distance
         closestLocation = k
         locationData = v
      end
   end
   return closestLocation, locationData
end

RegisterNetEvent('borp-cephe:client:cephebaslat', function()
   IsGameStarted = true
   InGame = false
end)

RegisterNetEvent('borp-cephe:client:cephebitir', function()
   IsGameStarted = false
   InGame = false
end)

RegisterNetEvent('borp-cephe:client:cephekatil', function()
   if not IsGameStarted or InGame then return end

   local ped = PlayerPedId()
   local playerCoords = GetEntityCoords(ped)
   local closestLocation, locationData = GetClosestLocation(playerCoords, Config.Locations)

   if closestLocation then
      InGame = true
      TriggerServerEvent('borp-cephe:server:cephekatil', closestLocation, locationData)
   end
end)

RegisterNetEvent('borp-cephe:client:cepheayril', function()
   if not IsGameStarted or not InGame then return end

   InGame = false
   TriggerServerEvent('borp-cephe:server:cepheayril')
end)

exports('GetInGame', function()
   return InGame
end)