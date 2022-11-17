local old_doMenuFromInventory = ISHotbar.doMenuFromInventory

function ISHotbar.doMenuFromInventory(playerNum, item, context)
    old_doMenuFromInventory(playerNum, item, context)
    if item:getAttachmentType() == 'Hide' then
        if context:getOptionFromName(getText('ContextMenu_Attach')) then
            context:removeOptionByName(getText('ContextMenu_Attach'))
        end
    end
end