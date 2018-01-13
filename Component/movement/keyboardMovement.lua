local keyboardMovement = {}

function keyboardMovement:update (entity)
    --if you handle the diagonals first it works better.
    --when going diagonal moving at %75 speed in each direction
    --stops player from going off screen vertically. loop method
    if love.keyboard.isDown("right") and love.keyboard.isDown("down") then
        entity.x = entity.x + (entity.speed*.75)
        if entity.y + (entity.speed*.75) > 580 then
            entity.y = 10
        else
            entity.y = entity.y + (entity.speed*.75)
        end


    elseif love.keyboard.isDown("right") and love.keyboard.isDown("up") then
        entity.x = entity.x + (entity.speed*.75)
        if entity.y - (entity.speed*.75) < 10 then
            entity.y = 580
        else
            entity.y = entity.y - (entity.speed*.75)
        end


    elseif love.keyboard.isDown("left") and love.keyboard.isDown("down") then
        entity.x = entity.x - (entity.speed*.75)
        if entity.y + (entity.speed*.75) > 570 then
            entity.y = 10
        else
            entity.y = entity.y + (entity.speed*.75)
        end


    elseif love.keyboard.isDown("left") and love.keyboard.isDown("up") then
        entity.x = entity.x - (entity.speed*.75)
        if entity.y + (entity.speed*.75) < 10 then
            entity.y = 580
        else
            entity.y = entity.y - (entity.speed*.75)
        end


    elseif love.keyboard.isDown("right") then
        entity.x = entity.x + entity.speed


    elseif love.keyboard.isDown("left") then
        entity.x = entity.x - entity.speed


    elseif love.keyboard.isDown("down") then
        if entity.y + entity.speed > 580 then
            entity.y = 10
        else
            entity.y = entity.y + entity.speed
        end


    elseif love.keyboard.isDown ("up") then
        if entity.y - entity.speed < 10 then
            entity.y = 580
        else
            entity.y = entity.y - entity.speed
        end
    end 
end

return keyboardMovement