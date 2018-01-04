local collision = {}

local smack = false

local checkCollision = function (x1, y1, x2, y2)
    --fine tuned collision for now. feels real good.
    if ((x1+27) >= x2 and x1 <= (x2+26)) and ((y1+27) >= y2 and y1 <= (y2+27)) then
        return true
    else
        return false
    end
end


local check = function (player, entity)
    touch = checkCollision(player.x, player.y, entity.x, entity.y)
    if touch then
      return true
    end
    return false
end

function collision:update (entities, game)
  for _, entity in ipairs(entities) do
    smack = check(game.player, entity)
    if smack then
      love.graphics.print({{0,0,0,255}, "Battle starts"}, 10, 50 )
    else
      love.graphics.print({{0,0,0,255}, "No Battle"}, 10, 50 )
    end
  end
end

return collision