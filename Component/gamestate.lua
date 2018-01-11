local map = require("Component/map/map")
local collide = require("Component/collision")
local fight = require("Component/battle")

local gamestate = {}
local touching = false

local update = function (self)
    
    for _,entity in ipairs(self.map.rooms[self.map.i].entities) do
    --this is the entirety of the collision.lua
        if ((self.player.x +27) >= entity.x and self.player.x <= (entity.x+26)) and ((self.player.y+27) >= entity.y and self.player.y <= (entity.y+27)) and (entity.health > 0) then
            self.player = fight.engage(self.player, entity)
            touching = true
        end
    end

    --assign level to a holder if its not nil
    if self.player.level ~= nil then
        templevel = self.player.level
    else
        templevel = 1 --if nil its 1
    end
    --assign level based on exp
    self.player.level =  math.floor(self.player.exp / 250) + 1
    
    --if level up raise max health + damage
    if templevel < self.player.level then
        self.player.maxhealth = (self.player.level*100)
        self.player.damage = self.player.damage + 5
    end

    self.player:update()
    self.map:update(self)
end

local draw = function (self)
    self.map:draw(self)

    --[[  --debugging helps
    j=1
    for _,entity in ipairs(self.map.rooms[self.map.i].entities) do
        --for _, entity in ipairs(self.map.rooms[j].entities) do
            love.graphics.print({{0,0,0,255}, "Ghost.x"..j..": "..entity.x}, 10, j*30 )
            love.graphics.print({{0,0,0,255}, "Ghost.y"..j..": "..entity.y}, 10, (j*30 + 10))
            j = j+1
    end
    love.graphics.print("player.x within gamestate: "..self.player.x, 250, 70 )
    love.graphics.print("player.y within gamestate: "..self.player.y, 250, 80 ) 
    ]]--
    love.graphics.print({{0,0,0,255}, "EXP: "..self.player.exp}, 50, 550)
    love.graphics.print({{0,0,0,255}, "LEVEL: "..self.player.level}, 50, 570)
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