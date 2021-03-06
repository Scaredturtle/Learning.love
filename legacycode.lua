love.graphics.print({{0,0,0,255}, "TOUCH"}, 205, 205)




--[[local camera = require ("Component.camera")
--local player = require ("Component.player")
--local ghosts = require ("Component.ghosts")

local hero_sheet
local hero
local ghost_sprite
local ghost_sheet
local scale = 1.5

-- Animation Parameters --
local fps = 60
local frame = 1
local anim_timer = 1 / fps
local anim_xoffset 
local num_frames = 6

-- Collision Functions --
local touch
local dist

function checkCollision(x1,y1,w1,h1, x2,y2,w2,h2)
	if (x1 < x2 + w2 and x2 < x1 + w1 and y1 < y2 + h2 and y2 < y1 + h1) then
		return true
	else
		return false
	end
end

function checkDistance(x1, y1, x2, y2)
	local dx = x1 - x2
	local dy = y1 - y2
	return math.sqrt(dx*dx + dy*dy)
end

function love.load()
	-- Screen Init --
	screen = {}
	screen.x = love.graphics.getWidth()
	screen.y = love.graphics.getHeight()
	
	-- Image File Import --
	love.graphics.setDefaultFilter("nearest", "nearest")
	hero_sheet = love.graphics.newImage("Assets/Oldhero.png")
	hero = love.graphics.newQuad(1, 1, 16, 16, hero_sheet:getDimensions())
	ghost_sheet = love.graphics.newImage("Assets/characters.png")
	ghost_sprite = love.graphics.newQuad(112, 64, 16, 16, ghost_sheet:getDimensions())

	--world init--
	our_world = love.physics.newWorld( 0, 0, false)
	
	-- Player Init --
	player = {}
	player.x = 25
	player.y = 25
	player.width = select(3, hero:getViewport())
	player.height = select(4, hero:getViewport())
	player.body = love.physics.newBody(our_world, player.x, player.y, "dynamic")
	player.shape = love.physics.newRectangleShape(player.width, player.height)
	player.fixture = love.physics.newFixture(player.body, player.shape)
	player.hp = 100
	player.damage = 100
	player.speed = 1.5
	
	--ghost init--
	ghost = {}
	ghost.x = 50
	ghost.y = 50
	ghost.width = select(3, ghost_sprite:getViewport())
	ghost.height = select(4, ghost_sprite:getViewport())
	ghost.body = love.physics.newBody(our_world, ghost.x, ghost.y, "static")
	ghost.shape = love.physics.newRectangleShape(ghost.width, ghost.height)
	ghost.fixture = love.physics.newFixture(ghost.body, ghost.shape)
	ghost.hp = 100
	ghost.speed = 1.25
	ghost.vanish = function()
		
	end
end

function love.update(dt)
	if dt > 0.04 then return end -- Stops the update function from running if alt-tabbed.
	our_world:update(dt)


	-- Player Movement -- 

	touch = checkCollision(player.x,player.y,player.width,player.height, ghost.x,ghost.y,ghost.width,ghost.height)
	dist = checkDistance(player.x, player.y, ghost.x, ghost.y)

	if (love.keyboard.isDown("right") and player.x < (screen.x - player.width)) then
		if not checkCollision((player.x+player.speed),player.y,player.width,player.height, ghost.x,ghost.y,ghost.width,ghost.height) then
			player.x = player.x + player.speed
		end

		-- Walking Right Animation --

		anim_timer = anim_timer * dt
		if anim_timer <= 0 then
			anim_timer = 1 / fps
			frame = frame + 1
			if frame > num_frames then frame = 1 end
			anim_xoffset = 16 * frame
			hero:setViewport(anim_xoffset, 16, 16, 16)
		end

	end
	if (love.keyboard.isDown("left") and player.x > 0) then
		if not checkCollision((player.x-player.speed),player.y,player.width,player.height, ghost.x,ghost.y,ghost.width,ghost.height) then
			player.x = player.x - player.speed
		end

		-- Walking Left Animation --

	end
	if (love.keyboard.isDown("up") and player.y > 0) then
		if not checkCollision(player.x,(player.y-player.speed),player.width,player.height, ghost.x,ghost.y,ghost.width,ghost.height) then
			player.y = player.y - player.speed
		end

		-- Walking Up Animation --

	end
	if (love.keyboard.isDown("down") and player.y < (screen.y - player.height)) then
		if not checkCollision(player.x,(player.y+player.speed),player.width,player.height, ghost.x,ghost.y,ghost.width,ghost.height) then
			player.y = player.y + player.speed
		end

		-- Walking Down Animation --

	end
	player.body:setPosition(player.x, player.y)

	if (love.keyboard.isDown("v")) then
		for i, v in pairs(enemies) do
			local reach = checkDistance(player.x, player.y, v.x, v.y)
			if reach < 20 then
				v.hp = v.hp - player.damage
			end
		end
	end


	-- Camera Adjustment --
	camera:setPosition (player.x - (screen.x / 5), player.y - (screen.y / 5)) -- this is to move the camera over the player
	camera:setScale (.5, .5) -- this is to control the zoom of the camera

	
end

function love.draw()
	--love.graphics.draw(hero_sheet, 25, 380, 0, 2, 2)

	love.graphics.print(player.x, 0, 560)
	love.graphics.print(player.y, 50, 560)
	love.graphics.print(player.width, 100, 560)
	love.graphics.print(player.height, 150, 560)

	love.graphics.print(ghost.x, 250, 560)
	love.graphics.print(ghost.y, 300, 560)
	love.graphics.print(ghost.width, 350, 560)
	love.graphics.print(ghost.height, 400, 560)

	love.graphics.print(tostring(touch), 500, 560)
	love.graphics.print(tostring(dist), 550, 560)
	love.graphics.print(ghost.hp, 500, 510)

	camera:set()

	love.graphics.draw(hero_sheet, hero, player.x, player.y)
	love.graphics.draw(ghost_sheet, ghost_sprite, ghost.x, ghost.y)

	love.graphics.rectangle("line", player.body:getX(), player.body:getY(), player.width, player.height) --player.body:getWorldPoints(player.shape:getPoints()))
	love.graphics.rectangle("line", ghost.body:getX(), ghost.body:getY(), ghost.width, ghost.height)

	camera:unset()
end]]--