local rooms = require("Component/map/rooms")
local ghost = require("Component/units/mobs/ghost")

local map = {}

local draw = function (self)
    self.rooms[self.i]:draw()
    love.graphics.printf("Room " .. self.i, 350, 20, 100, "center")
end

local update = function (self, game)
    self.rooms[self.i]:update(game, self)
end

local _createRoom = function ()
    --local ghostSprite = sprite:create("Assets/Ghost2GreyRed.png")

    local entities = {}
    local xPos = math.random(800)
    local yPos = math.random(600)
    entities[1] = ghost:create(xPos, yPos)

    return rooms:create(entities)
end

local nextRoom = function (self, game)
    if self.i == #self.rooms then
        table.insert(self.rooms, _createRoom())
    end

    game.player.x = 1
    self.i = self.i + 1
end

local previousRoom = function (self,game)
    if self.i > 1 then
        self.i = self.i - 1
        game.player.x = 750
    end
end

function map:create ()
    local inst = {}

    inst.i = 1
    inst.rooms = {}
    inst.rooms[1] = rooms:create({})

    inst.draw = draw
    inst.update = update
    inst.nextRoom = nextRoom
    inst.previousRoom = previousRoom

    return inst
end

return map