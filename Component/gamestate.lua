local map = require("Component/map/map")
local collide = require("Component/collision")

local gamestate = {}


local update = function (self)
    self.map:update(self)
    self.player:update()
    for _,entity in ipairs(self.map.rooms[self.map.i].entities) do
        love.graphics.print("player.x within collision: "..self.player.x, 250, 70 )
        love.graphics.print("player.y within collision: "..self.player.y, 250, 80 )
        collide:check(self.player, entity)
    end
    --we update entities here and also within rooms...
    --[[
    for _, entity in ipairs(self.entities) do
        entity:update()
    end
    ]]--
end

local draw = function (self)
    self.map:draw(self)
    j=1
    for _,entity in ipairs(self.map.rooms[self.map.i].entities) do
        --for _, entity in ipairs(self.map.rooms[j].entities) do
            love.graphics.print({{0,0,0,255}, "Ghost.x"..j..": "..entity.x}, 10, j*30 )
            love.graphics.print({{0,0,0,255}, "Ghost.y"..j..": "..entity.y}, 10, (j*30 + 10))
            j = j+1
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