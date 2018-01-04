local map = require("Component/map/map")
local battle = require("Component/battle")

local gamestate = {}
local touch

function checkCollision(x1, y1, x2, y2)
    --fine tuned collision for now. feels real good.
    if ((x1+27) >= x2 and x1 <= (x2+26)) and ((y1+27) >= y2 and y1 <= (y2+27)) then
        return true
    else
        return false
    end
end

local addEntity = function (self, entity)
    table.insert(self.entities, entity)
end

--delete function to remove defeated entitites
local deleteEntity = function (self, passedEntity)
    --for some reason the other ghost slows down when I delete one. 
    --does their speed stack the more you put in the game?
    for index, entity in ipairs(self.entities) do
        if entity == passedEntity then
            table.remove(self.entities, index)
        end
    end
end

local update = function (self)
    self.map:update(self)
    self.player:update()

    for _, entity in ipairs(self.entities) do
        entity:update()
        touch = checkCollision(self.player.x, self.player.y, entity.x, entity.y)
        if touch then
            --deleteEntity(self, entity) --not sure why it required the argument self to work...
            --right now delete when they touch. the dream is 
            battle:engage(self, entity)
        end
    end
end

local draw = function (self)
    self.map:draw(self)

    for _, entity in ipairs(self.entities) do
        entity:draw()
    end

    self.player:draw()
end

function gamestate:create (player)
    local inst = {}

    inst.entities = {}
    inst.player = player
    inst.map = map:create()

    inst.addEntity = addEntity
    inst.deleteEntity = deleteEntity
    inst.update = update
    inst.draw = draw

    return inst
end


return gamestate