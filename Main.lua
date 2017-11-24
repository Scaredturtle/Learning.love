local hero_sheet
local hero

-- Animation Parameters --
local fps = 10
local frame = 1
local anim_timer = 1 / fps
local anim_xoffset 
local num_frames = 6

function love.load()
	-- Screen Init --
	screen = {}
	screen.x = love.graphics.getWidth()
	screen.y = love.graphics.getHeight()
	
	-- Image File Import --
	love.graphics.setDefaultFilter("nearest", "nearest")
	hero_sheet = love.graphics.newImage("Assets/Oldhero.png")
	hero = love.graphics.newQuad(1, 1, 16, 16, hero_sheet:getDimensions())

	-- Player Init --
	player = {}
	player.x = 25
	player.y = 25
	player.width = 8
	player.height = 8
	player.speed = 1.5
	player.swing = function()
	
	end
end

function love.update(dt)
	if dt > 0.04 then return end -- Stops the update function from running if alt-tabbed.

	-- Player Movement -- 
	if (love.keyboard.isDown("right") and player.x < (screen.x - player.width)) then
		player.x = player.x + player.speed

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
	if (love.keyboard.isDown("left") and player.x > (0 + player.width)) then
		player.x = player.x - player.speed

		-- Walking Left Animation --

	end
	if (love.keyboard.isDown("up") and player.y > (0 + player.height)) then
		player.y = player.y - player.speed

		-- Walking Up Animation --

	end
	if (love.keyboard.isDown("down") and player.y < (screen.y - player.height)) then
		player.y = player.y + player.speed

		-- Walking Down Animation --
		--[[anim_timer = anim_timer * dt
		if anim_timer <= 0 then
			anim_timer = 1 / fps
			frame = frame + 1
			if frame > num_frames then frame = 2 end
			anim_xoffset = 25 * frame
			hero:setViewport(anim_xoffset, 1, 24, 28)
		end]]--
	end
end

function love.draw()
	--love.graphics.draw(hero_sheet, 25, 380, 0, 2, 2)
	love.graphics.draw(hero_sheet, hero, player.x, player.y, 0, 1.5, 1.5, 8, 8)
end