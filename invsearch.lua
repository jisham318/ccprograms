local chests = {
    ["minecraft:chest_6"] = vector.new(0, 1, 0),
    ["minecraft:chest_7"] = vector.new(0, 0, 0),
    ["minecraft:chest_8"] = vector.new(0, -1, 0)
}

local wrappedChests = {}

for key, position in pairs(chests) do
    wrappedChests[key] = peripheral.wrap(key)
end

local allItems = {}
for chestName, chest in pairs(wrappedChests) do
    for slot, item in pairs(chest.list()) do
        if allItems[item.name] == nil then
            allItems[item.name] = {count = item.count, inventory = chestName}
        else
            local count = allItems[item.name].count + item.count
            local inventoryName = allItems[item.name].inventory
            allItems[item.name] = {count = count, inventory = inventoryName}
            chest.pushItems(inventoryName, slot)
        end
    end
end

local xSize, ySize = term.getSize()

term.clear()
term.setCursorPos(1, 1)
--local yPosition = 1
for name, count in pairs(allItems) do
    --term.setCursorPos(1, yPosition)
    print(name .. ": x" .. count)
    --yPosition = yPosition + 1
    --if yPosition > ySize then
    --    break
    --end
end