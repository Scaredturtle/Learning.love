local levitate = {}

local dx = 0
local dy = 0

function levitate:update (entity)
    local aggro = false
    local moving = false


    if aggro == false then
        if dx < 10 and dy == 0 then
            entity.x = entity.x + entity.speed
            dx = dx + 1
        end
        if dx == 10 and dy < 10 then
            entity.y = entity.y + entity.speed
            dy = dy + 1
        end
        if dx > 0 and dy == 10 then
            entity.x = entity.x - entity.speed
            dx = dx - 1
        end
        if dx == 0 and dy > 0 then
            entity.y = entity.y - entity.speed
            dy = dy - 1
        end
    end


    --these won't print unless moved to the draw function right?
    --which is invoked in update when ran on the entity right?
    --right?
    love.graphics.print(dx, 0, 560)
    love.graphics.print(dy, 50, 560)

end

return levitate