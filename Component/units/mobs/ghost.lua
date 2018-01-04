local sprite = require("Component/units/sprite")
local entity = require("Component/units/entity")
local levitate = require("Component/movement/ai/levitate")

local ghost = {}

local ghostSprite = sprite:create("Assets/Ghost2GreyRed.png")
local speed = 1

function ghost:create (xPos, yPos)
    return entity:create(ghostSprite, xPos, yPos, speed, levitate)
end

return ghost