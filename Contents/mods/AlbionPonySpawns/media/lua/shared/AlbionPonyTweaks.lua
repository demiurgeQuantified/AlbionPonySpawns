local scriptManager = getScriptManager()

local function doItemParams(type, ...)
    local item = scriptManager:getItem(type)
    if item then
        for _,param in ipairs({...}) do
            item:DoParam(param)
        end
    end
end

if SandboxVars.AlbionPonies.DisableReadablePonies then
    local items = require 'AlbionPonies'.getAllPonies() -- what the fuck
    for _,type in ipairs(items) do
        doItemParams(type, 'Type = Normal', 'UnhappyChange = 0', 'StressChange = 0', 'BoredomChange = 0', 'ReplaceOnUse = ', 'CustomContextMenu = ')
    end
end