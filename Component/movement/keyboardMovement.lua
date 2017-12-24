local keyboardMovement = {}

function keyboardMovement:update (entity)
    if love.keyboard.isDown("right") then
        entity.x = entity.x + entity.speed
        if entity.x >= 785 then 
            entity.x = -15
            --random spawn of enemies here?
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