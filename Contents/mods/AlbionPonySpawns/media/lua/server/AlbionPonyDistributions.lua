local Ponies = require 'AlbionPonies'

Ponies.wantedPonies = {}

---Replaces an item in a container with a random item from the item list.
---@param container ItemContainer
local function replaceDummies(container)
    local dummies = container:getAllType('Ponies.Dummy') -- dummy item type
    for i = 0, dummies:size()-1 do
        container:Remove(dummies:get(i))
        local itemChoice = ZombRand(#Ponies.wantedPonies)+1
        local item = container:AddItem(Ponies.wantedPonies[itemChoice])
        container:addItemOnServer(item)
    end
end

-- for items in containers
local function onFillContainer(_roomName, _containerType, container)
    replaceDummies(container)
end

table.insert(ProceduralDistributions["list"]["GigamartToys"].items, "Ponies.Dummy")
table.insert(ProceduralDistributions["list"]["GigamartToys"].items, 1.32)
table.insert(ProceduralDistributions["list"]["WardrobeChild"].items, "Ponies.Dummy")
table.insert(ProceduralDistributions["list"]["WardrobeChild"].items, 2.64)
table.insert(ProceduralDistributions["list"]["DaycareCounter"].items, "Ponies.Dummy")
table.insert(ProceduralDistributions["list"]["DaycareCounter"].items, 0.66)
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, "Ponies.Dummy")
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, 0.66)
table.insert(ProceduralDistributions["list"]["CrateToys"].items, "Ponies.Dummy")
table.insert(ProceduralDistributions["list"]["CrateToys"].items, 2.64)

Events.OnFillContainer.Add(onFillContainer)

-- for items found on zombies
local function onRefreshInventoryWindowContainers(inventoryPage)
    if not inventoryPage.inventory or not instanceof(inventoryPage.inventory:getParent(), "IsoDeadBody") then return end
    replaceDummies(inventoryPage.inventory)
end

table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Ponies.Dummy")
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 1.8)
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Ponies.Dummy")
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 1.8)

Events.OnRefreshInventoryWindowContainers.Add(onRefreshInventoryWindowContainers)

---Returns a numerically indexed table that is the combination of the two input tables.
---@param a table
---@param b table
---@return table
local function MergeTables(a, b)
    if not a then return b elseif not b then return a end
    local result = {}
    for _,v in pairs(a) do
        table.insert(result, v)
    end
    for _,v in pairs(b) do
        table.insert(result, v)
    end
    return result
end

function Ponies.createSpawnList()
    if SandboxVars.AlbionPonies.AlbionSpawnlist then
        return Ponies.albionSpawnlist
    end
    
    local wantedPonies
    if SandboxVars.AlbionPonies.WantG4Ponies then
        wantedPonies = Ponies.gen4Ponies
    end

    if SandboxVars.AlbionPonies.WantOtherGenPonies then
        wantedPonies = MergeTables(wantedPonies, Ponies.otherGens)
    end

    if SandboxVars.AlbionPonies.WantOCs then
        wantedPonies = MergeTables(wantedPonies, Ponies.ocs)
    end

    return wantedPonies
end

Events.OnInitGlobalModData.Add(function()
    Ponies.wantedPonies = Ponies.createSpawnList()
end)

return Ponies