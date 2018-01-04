local collision = {}

local checkCollision = function (x1, y1, x2, y2)
    --fine tuned collision for now. feels real good.
    if ((x1+27) >= x2 and x1 <= (x2+26)) and ((y1+27) >= y2 and y1 <= (y2+27)) then
        return true
    else
        return false
    end
end


function collision:check (player, entities)
    for _, entity in ipairs(entities) do
        touch = checkCollision(player.x, player.y, entity.x, entity.y)
        if touch then
        return true
        end
    end
    return false
end
--[[
  function collision:check (a, b)
    vector:distance()
  end
]]--
return collision