local collide = require("Component/collision")

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
        collide:update(game.player, entity)
        entity:update(game) --why pass game to entity?
    end
    
    --[[
    sooo... either this update is never run (doubt becuz ghosts are moving)
    or i dunno. but this line should print. was trying to see if for some 
    reason game.player was nil or junk data. but it turns out this line is
    never ran?
    ]]--
    love.graphics.print({{0,0,0,255}, "Inside rooms.update() player.x: "..game.player.x}, 10, 100 )

    if game.player.x > roomw then
        map:nextRoom(game)
    end

    --but these bits get run? so why are these two working if the print isn't?

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