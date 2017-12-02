module (..., package.seeall)

camera = {}
--local cameraMT = {__index = camera} -- test code attempting to fix camera returning nil
camera.__index = camera
camera.x = 0
camera.y = 0
camera.scalex = 1
camera.scaley = 1
camera.rotation = 0

function camera:set ()
    local cam = {}
    setmetatable(cam, camera)

    love.graphics.push()
    love.graphics.rotate(-self.rotation)
    love.graphics.scale(1 / self.scalex, 1 / self.scaley)
    love.graphics.translate(-self.x, -self.y)
end

function camera:unset ()
    love.graphics.pop()
end

function camera:move (dx, dy)
    self.x = self.x + (dx or 0)
    self.y = self.y + (dy or 0)
end

function camera:rotate (dr)
    self.rotation = self.rotation + dr
end

function camera:scale (sx, sy)
    sx = sx or 1
    self.scalex = self.scalex * sx
    self.scaley = self.scaley * (sy or sx)
end

function camera:setPosition (x, y)
    self.x = x or self.x
    self.y = y or self.y
end

function camera:setScale (sx, sy)
    self.scalex = sx or self.scalex
    self.scaley = sy or self.scaley
end

return camera