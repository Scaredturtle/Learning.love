local collide = require("Component/collision")

local rooms = {}

local roomw = 800
local roomh = 600

local smack = false

local collision = function (self, game)
  for _, entity in ipairs(self.entities) do
    smack = collide:check(game.player, entity)
    if smack then
      love.graphics.print({{0,0,0,255}, "Battle starts"}, 10, 50 )
    end
    end
end


local draw = function (self)
    love.graphics.push('all')
    love.graphics.setColor(unpack(self.color))
    love.graphics.rectangle("fill", 0, 0, roomw, roomh)
    love.graphics.pop()

    for _, entity in ipairs(self.entities) do
        entity:draw()
    end
end



local update = function (self, game, map)
    collision(self, game)
    for _, entity in ipairs(self.entities) do
        entity:update(game)
    end
    

    if game.player.x > roomw then
        map:nextRoom(game)
    end

    if game.player.x < 0 then
        map:previousRoom(game)
    end
end

function rooms:create (entities)
    local inst = {}

    inst.color = {math.random(255), math.random(255), math.random(255)}

    inst.entities = entities
    inst.collision = collision
    inst.draw = draw
    inst.update = update

    return inst
end

return rooms