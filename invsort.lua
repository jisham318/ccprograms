local chests = { "minecraft:chest_6", "minecraft:chest_7", "minecraft:chest_8" }
local wrappedChests = {}

for _, key in pairs(chests) do
    wrappedChests[key] = peripheral.wrap(key)
end

local allItems = {}
for chestName, chest in pairs(wrappedChests) do
    for slot, item in pairs(chest.list()) do
        local gItem = allItems[item.name]
        if gItem == nil then
            allItems[item.name] = {count = item.count, inventory = chestName, slot = item.slot}
        else
            local count = gItem.count + item.count
            local targetInventory, targetSlot = gItem.inventory, item.slot
            allItems[item.name] = {count = count, inventory = targetInventory, slot = targetSlot}
            chest.pushItems(targetInventory, slot)
        end
    end
end