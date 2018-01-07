local map = require("Component/map/map")
local collide = require("Component/collision")
local fight = require("Component/battle")

local gamestate = {}
local touching = false

local update = function (self)
    self.player:update()
    self.map:update(self)
    
    for _,entity in ipairs(self.map.rooms[self.map.i].entities) do
        --this is the entirety of the collision.lua
        if ((self.player.x +27) >= entity.x and self.player.x <= (entity.x+26)) and ((self.player.y+27) >= entity.y and self.player.y <= (entity.y+27)) then
            fight:engage(self.player, entity)
            touching = true
        end
        --collide:check(self.player, entity)
    end
    --we update entities here and also within rooms...
    --[[
    for _, entity in ipairs(self.entities) do
        entity:update()
    end
    ]]--
end

local draw = function (self)
    self.map:draw(self)
    j=1
    for _,entity in ipairs(self.map.rooms[self.map.i].entities) do
        --for _, entity in ipairs(self.map.rooms[j].entities) do
            love.graphics.print({{0,0,0,255}, "Ghost.x"..j..": "..entity.x}, 10, j*30 )
            love.graphics.print({{0,0,0,255}, "Ghost.y"..j..": "..entity.y}, 10, (j*30 + 10))
            j = j+1
    end
    love.graphics.print("player.x within gamestate: "..self.player.x, 250, 70 )
    love.graphics.print("player.y within gamestate: "..self.player.y, 250, 80 ) 
    self.player:draw()
    if touching then
        love.graphics.print({{0,0,0,255}, "Battle starts"}, 250, 50 )
        touching = false
    else
        love.graphics.print({{0,0,0,255}, "No Battle"}, 250, 50 )
    end
end

function gamestate:create (player)
    local inst = {}

    inst.entities = {}
    inst.player = player
    inst.map = map:create(self)

    inst.addEntity = addEntity
    inst.deleteEntity = deleteEntity
    inst.clearEntities = clearEntities
    inst.update = update
    inst.draw = draw

    return inst
end


return gamestate