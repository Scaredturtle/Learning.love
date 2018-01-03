local keyboardMovement = {}

function keyboardMovement:update (entity)
    --if you handle the diagonals first it works better.
    --when going diagonal moving at %75 speed in each direction
    if love.keyboard.isDown("right") and love.keyboard.isDown("down") then
        entity.x = entity.x + (entity.speed*.75)
        entity.y = entity.y + (entity.speed*.75)
        if entity.x >= 785 then 
            entity.x = -15
        end
        if entity.y >= 585 then
            entity.y = -15
        end
    elseif love.keyboard.isDown("right") and love.keyboard.isDown("up") then
        entity.x = entity.x + (entity.speed*.75)
        entity.y = entity.y - (entity.speed*.75)
        if entity.x >= 785 then 
            entity.x = -15
        end
        if entity.y <= -15 then
            entity.y = 585
        end
    elseif love.keyboard.isDown("left") and love.keyboard.isDown("down") then
        entity.x = entity.x - (entity.speed*.75)
        entity.y = entity.y + (entity.speed*.75)
        if entity.x <= -15 then
            entity.x = 785
        end
        if entity.y >= 585 then
            entity.y = -15
        end
    elseif love.keyboard.isDown("left") and love.keyboard.isDown("up") then
        entity.x = entity.x - (entity.speed*.75)
        entity.y = entity.y - (entity.speed*.75)
        if entity.x <= -15 then
            entity.x = 785
        end
        if entity.y <= -15 then
            entity.y = 585
        end
    elseif love.keyboard.isDown("right") then
        entity.x = entity.x + entity.speed
        if entity.x >= 785 then 
            entity.x = -15
        end
    elseif love.keyboard.isDown("left") then
        entity.x = entity.x - entity.speed
        if entity.x <= -15 then
            entity.x = 785
        end
    elseif love.keyboard.isDown ("up") then
        entity.y = entity.y - entity.speed
        if entity.y <= -15 then
            entity.y = 585
        end
    elseif love.keyboard.isDown("down") then
        entity.y = entity.y + entity.speed
        if entity.y >= 585 then
            entity.y = -15
        end
    end
end

return keyboardMovement