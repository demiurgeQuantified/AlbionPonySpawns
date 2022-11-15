---Returns a numerically indexed table that is the combination of the two input tables.
---@param a table
---@param b table
---@return table
local function MergeTables(a, b)
    local result = {}
    for _,v in pairs(a) do
        table.insert(result, v)
    end
    for _,v in pairs(b) do
        table.insert(result, v)
    end
    return a
end

local itemLists = {}
do
    local allPonies = {}
    local PonyList = require 'PI_PonyList' -- why is this an ArrayList?
    for i = 0, PonyList:size()-1 do
        table.insert(allPonies, PonyList:get(i))
    end
    itemLists[1] = allPonies

    local gen4Ponies = {'FluttershyPlushie', 'RarityPlushie', 'ApplejackPlushieHat', 'ShiningArmorPlushie', 'RainbowDashPlushie', 'DerpyHoovesPlushie',
    'TwilightSparklePlushie', 'PinkiePiePlushie', 'CelestiaPlushie', 'LunaPlushie', 'CadancePlushie', 'ChrysalisPlushie', 'SpitfirePlushie',
    'OctaviaPlushie', 'VinylScratchPlushie', 'HoovesPlushie', 'CheerileePlushie', 'LyraPlushie', 'BonbonPlushie', 'BigMacPlushie', 'SongbirdPlushie',
    'ZecoraPlushie', 'TrixieLulamoonPlushie', 'SoarinPlushie', 'GrannySmithPlushie', 'BraeburnPlushieComplete', 'CaramelApplePlushie',
    'NightmareMoonPlushie', 'StarlightGlimmerPlushie', 'SunsetShimmerPlushie'}
    local otherGens = {'HitchPlushie', 'SproutPlushie', 'ZippPlushie', 'SunnyPlushie', 'IzzyPlushie', 'PippPetalsPlushie', 'FizzyPlushie'}

    itemLists[2] = MergeTables(gen4Ponies, otherGens)
    itemLists[3] = gen4Ponies

    -- my faves :2
    itemLists[4] = {'FluttershyPlushie', 'RarityPlushie', 'ApplejackPlushieHat', 'RainbowDashPlushie', 'DerpyHoovesPlushie',
    'TwilightSparklePlushie', 'PinkiePiePlushie', 'CelestiaPlushie', 'LunaPlushie', 'CadancePlushie', 'ChrysalisPlushie', 'SpitfirePlushie',
    'OctaviaPlushie', 'VinylScratchPlushie', 'HoovesPlushie', 'CheerileePlushie', 'LyraPlushie', 'BonbonPlushie', 'SongbirdPlushie',
    'ZecoraPlushie', 'TrixieLulamoonPlushie', 'GrannySmithPlushie', 'NightmareMoonPlushie', 'StarlightGlimmerPlushie', 'SunsetShimmerPlushie',
    'SunnyPlushie', 'PippPetalsPlushie', 'IzzyPlushie'}
end
local itemList = {}


---Replaces an item in a container with a random item from the item list.
---@param container ItemContainer
local function replaceDummies(container)
    local dummies = container:getAllType('Base.Apple') -- dummy item type
    for i = 0, dummies:size()-1 do
        container:Remove(dummies:get(i))
        local itemChoice = ZombRand(#itemList)+1
        local item = container:AddItem(itemList[itemChoice])
        container:addItemOnServer(item)
    end
end

local function replaceDummies(inventoryPage)
    if not inventoryPage.inventory or not instanceof(inventoryPage.inventory:getParent(), "IsoDeadBody") then return end
    local container = inventoryPage.inventory
    local dummies = container:getAllType('Ponies.Dummy')
    for i = 0, dummies:size()-1 do
        container:Remove(dummies:get(i))
        local itemChoice = ZombRand(#itemList)+1
        local item = container:AddItem(itemList[itemChoice])
        container:addItemOnServer(item)
    end
end

-- for items in containers
local function onFillContainer(_roomName, _containerType, container)
    replaceDummies(container)
end

Events.OnFillContainer.Add(onFillContainer)

-- for items found on zombies
local function onRefreshInventoryWindowContainers(inventoryPage)
    if not inventoryPage.inventory or not instanceof(inventoryPage.inventory:getParent(), "IsoDeadBody") then return end
    replaceDummies(inventoryPage.inventory)
end

Events.OnInitGlobalModData.Add(function()
    itemList = itemLists[SandboxVars.AlbionPonies.SpawnList]

    table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Ponies.Dummy")
    table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.001)
    table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Ponies.Dummy")
    table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.001)

    Events.OnRefreshInventoryWindowContainers.Add(onRefreshInventoryWindowContainers)
end)

return itemLists