local vector = {}

function vector:distance (a, b)
    local dx = b.x - a.x
    local dy = b.y - a.y
    return math.sqrt(dx*dx + dy*dy)
end

function vector:normalise (a, b)
    local dx = b.x - a.x
    local dy = b.y - a.y
    local distance = vector:distance(a, b)

    return {
        dx = dx / distance
        dy = dy / distance
    }
end

return vector