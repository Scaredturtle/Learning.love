local map = require("Component/map/map")

local gamestate = {}


local update = function (self)
    self.map:update(self)
    self.player:update()

    --we update entities here and also within rooms...
    --[[
    for _, entity in ipairs(self.entities) do
        entity:update()
    end
    ]]--
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
    inst.map = map:create(self)

    inst.addEntity = addEntity
    inst.deleteEntity = deleteEntity
    inst.clearEntities = clearEntities
    inst.update = update
    inst.draw = draw

    return inst
end


return gamestate