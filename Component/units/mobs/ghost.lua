local sprite = require("Component/units/sprite")
local entity = require("Component/units/entity")
local levitate = require("Component/movement/ai/levitate")

local ghost = {}

local ghostSprite = sprite:create("Assets/Ghost2GreyRed.png")
local speed = 1
math.randomseed(os.time())

function ghost:create (xPos, yPos)
    return entity:create(ghostSprite, xPos, yPos, speed, levitate, math.random(50,80), math.random(5,20))
end

return ghost