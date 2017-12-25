local rooms = {}

local roomw = 800
local roomh = 600

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

    inst.draw = draw
    inst.update = update

    return inst
end

return rooms