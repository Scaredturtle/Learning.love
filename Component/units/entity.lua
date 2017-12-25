local entity = {}

local draw = function (self)
    self.sprite:draw(self.x, self.y)
end

local update = function (self)
    self.movement:update(self)
end

function entity:position (self)
    return {
        x = self.x,
        y = self.y
    }
end

function entity:create (sprite, x, y, speed, movement)
    local inst = {}

    inst.sprite = sprite
    inst.x = x
    inst.y = y
    inst.speed = speed
    inst.movement = movement

    inst.draw = draw
    inst.update = update

    return inst
end

return entity