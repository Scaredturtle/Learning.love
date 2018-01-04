local keyboardMovement = {}

function keyboardMovement:update (entity)
    --if you handle the diagonals first it works better.
    --when going diagonal moving at %75 speed in each direction
    if love.keyboard.isDown("right") and love.keyboard.isDown("down") then
        entity.x = entity.x + (entity.speed*.75)
        entity.y = entity.y + (entity.speed*.75)
    elseif love.keyboard.isDown("right") and love.keyboard.isDown("up") then
        entity.x = entity.x + (entity.speed*.75)
        entity.y = entity.y - (entity.speed*.75)
    elseif love.keyboard.isDown("left") and love.keyboard.isDown("down") then
        entity.x = entity.x - (entity.speed*.75)
        entity.y = entity.y + (entity.speed*.75)
    elseif love.keyboard.isDown("left") and love.keyboard.isDown("up") then
        entity.x = entity.x - (entity.speed*.75)
        entity.y = entity.y - (entity.speed*.75)
    elseif love.keyboard.isDown("right") then
        entity.x = entity.x + entity.speed
    elseif love.keyboard.isDown("left") then
        entity.x = entity.x - entity.speed
    elseif love.keyboard.isDown ("up") then
        entity.y = entity.y - entity.speed
    elseif love.keyboard.isDown("down") then
        entity.y = entity.y + entity.speed
    end
end

return keyboardMovement