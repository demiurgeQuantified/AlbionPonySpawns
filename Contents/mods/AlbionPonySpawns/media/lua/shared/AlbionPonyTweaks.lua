local authenticZEnabled = getActivatedMods():contains('Authentic Z - Current') or getActivatedMods():contains('AuthenticZBackpacks+') or getActivatedMods():contains('AuthenticZLite')

local scriptManager = getScriptManager()

--don't worry... not an item tweaker derivative
local function doItemParams(type, ...)
    local item = scriptManager:getItem(type)
    if item then
        for _,param in ipairs({...}) do
            item:DoParam(param)
        end
    end
end

Events.OnInitGlobalModData.Add(function()
    local items = require 'AlbionPonies'.getAllPonies() -- evil syntax
    if not SandboxVars.AlbionPonies.ReadablePonies then
        for _,type in ipairs(items) do
            doItemParams(type, 'Type = Normal', 'UnhappyChange = 0', 'StressChange = 0', 'BoredomChange = 0', 'ReplaceOnUse = ', 'CustomContextMenu = ')
        end
    end
    if not authenticZEnabled then
        for _,type in ipairs(items) do
            doItemParams(type, 'AttachmentType = Hide')
        end
    end
end)