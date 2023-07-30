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
for _, chest in pairs(wrappedChests) do
    for slot, item in pairs(chest.list()) do
        if allItems[item.name] == nil then
            allItems[item.name] = item.count
        else
            allItems[item.name] = allItems[item.name] + item.count
        end
    end
end

term.clear()
term.setCursorPos(1, 1)
for name, count in pairs(allItems) do
    print(name .. ": x" .. count)
end