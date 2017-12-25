local map = require("Component/map/map")

local gamestate = {}

local addEntity = function (self, entity)
    table.insert(self.entities, entity)
end

local update = function (self)
    self.map:update(self)

    for _, entity in ipairs(self.entities) do
        entity:update()
    end

    self.player:update()
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
    inst.update = update
    inst.draw = draw

    return inst
end


return gamestate