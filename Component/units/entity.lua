local entity = {}

local draw = function (self)
    if self.health > 0 then
        self.sprite:draw(self.x, self.y)
        love.graphics.print({{0,255,0,255}, self.health}, self.x+3, self.y-10)
    end

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

function entity:create (sprite, x, y, speed, movement, health, damage)
    local inst = {}

    inst.sprite = sprite
    inst.x = x
    inst.y = y
    inst.speed = speed
    inst.movement = movement
    inst.health = health
    inst.maxhealth = health
    inst.damage = damage

    inst.draw = draw
    inst.update = update

    return inst
end

return entity