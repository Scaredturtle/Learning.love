module(..., package.seeall)

player = {}
player.__index = player
player.x = 0
player.y = 0
player.w = 0
player.h = 0
player.speed = 1.5

function player:moveRight ()
    self.x = self.x + self.speed
end

function player:moveLeft ()
    self.x = self.x - self.speed
end

function player:moveUp ()
    self.y = self.y - self.speed
end

function player:movedown ()
    self.y = self.y + self.speed
end

function player:draw ()
    --love.graphics.draw(image, quad, x, y)
end

return player