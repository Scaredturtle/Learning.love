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

function collision:update (player, entity)
  touch = checkCollision(player.x, player.y, entity.x, entity.y)
  if touch then
    love.graphics.print({{0,0,0,255}, "Battle starts"}, 10, 50 )
  else
    love.graphics.print({{0,0,0,255}, "No Battle"}, 10, 50 )
  end
end

return collision