--local battle = require("Component/battle")

local collision = {}

local touch = false

local checkCollision = function (x1, y1, x2, y2)
    if ((x1+27) >= x2 and x1 <= (x2+26)) and ((y1+27) >= y2 and y1 <= (y2+27)) then
        return true
    else
        return false
    end
end

function collision:check (player, entity)
  touch = checkCollision(player.x, player.y, entity.x, entity.y)
  love.graphics.print({{0,0,0,255}, "player.x within collision: "..player.x}, 250, 70 )
  love.graphics.print({{0,0,0,255}, "player.y within collision: "..player.y}, 250, 80 )
  if touch then
    love.graphics.print({{0,0,0,255}, "Battle starts"}, 250, 50 )
  else
    love.graphics.print({{0,0,0,255}, "No Battle"}, 250, 50 )
  end
end

return collision