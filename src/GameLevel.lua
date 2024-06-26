--[[
    GD50
    Super Mario Bros. Remake

    -- GameLevel Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GameLevel = Class{}

function GameLevel:init(entities, objects, tilemap, keyColor)
    self.entities = entities
    self.objects = objects
    self.tileMap = tilemap
    self.unlocked = false
    self.keyColor = keyColor
end

--[[
    Remove all nil references from tables in case they've set themselves to nil.
]]
function GameLevel:clear()
    for i = #self.objects, 1, -1 do
        if not self.objects[i] then
            table.remove(self.objects, i)
        end
    end

    for i = #self.entities, 1, -1 do
        if not self.objects[i] then
            table.remove(self.objects, i)
        end
    end
end

function GameLevel:update(dt)
    self.tileMap:update(dt)

    for k, object in pairs(self.objects) do
        object:update(dt)
    end

    for k, entity in pairs(self.entities) do
        entity:update(dt)
    end
end

function GameLevel:render()
    self.tileMap:render()

    for k, object in pairs(self.objects) do
        object:render()
    end

    for k, entity in pairs(self.entities) do
        entity:render()
    end
end

function GameLevel:getFirstGroundColumn()
    for x = 1, self.tileMap.width do
        for y = 1, self.tileMap.height do
            if self.tileMap.tiles[y][x].id == TILE_ID_GROUND then
                return x 
            end
        end
    end
end

function GameLevel:unlock()
    self.unlocked = true
end