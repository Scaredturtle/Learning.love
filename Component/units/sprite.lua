local sprite = {}

local draw = function(self, x, y)
    love.graphics.draw(self.image, x, y)
end

function sprite:create (imagePath, x, y)
    local inst = {}

    inst.image = love.graphics.newImage(imagePath)
    inst.image:setFilter("nearest", "nearest")

    inst.draw = draw

    return inst
end

return sprite