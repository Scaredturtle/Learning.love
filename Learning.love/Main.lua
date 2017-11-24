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
	our_world = love.physics.newWorld( 0, 10, true)
	
	



	-- Player Init --
	player = {}
	player.x = 25
	player.y = 25
	player.width = 8 * scale
	player.height = 8 * scale
	player.body = love.physics.newBody(our_world, player.x, player.y, "dynamic")
	player.shape = love.physics.newRectangleShape(player.width, player.height)
	player.fixture = love.physics.newFixture(player.body, player.shape)
	player.speed = 1.5
	player.swing = function()
	
	end

	--ghost init--
	ghost = {}
	ghost.x = 50
	ghost.y = 50
	ghost.width = 8 * scale
	ghost.height = 8 * scale
	ghost.body = love.physics.newBody(our_world, ghost.x, ghost.y, "static")
	ghost.shape = love.physics.newRectangleShape(ghost.width, ghost.height)
	ghost.fixture = love.physics.newFixture(ghost.body, ghost.shape)
	ghost.speed = 1.25
	ghost.vanish = function()
		
	end
end

function love.update(dt)
	if dt > 0.04 then return end -- Stops the update function from running if alt-tabbed.
	our_world:update(dt)


	-- Player Movement -- 
	if (love.keyboard.isDown("right") and player.x < (screen.x - player.width)) then
		player.x = player.x + player.speed
		-- Walking Right Animation --

		--[[anim_timer = anim_timer * dt
		if anim_timer <= 0 then
			anim_timer = 1 / fps
			frame = frame + 1
			if frame > num_frames then frame = 1 end
			anim_xoffset = 16 * frame
			hero:setViewport(anim_xoffset, 16, 16, 16)
		end]]--

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
	player.body:setPosition(player.x, player.y)
end

function love.draw()
	--love.graphics.draw(hero_sheet, 25, 380, 0, 2, 2)

	love.graphics.draw(hero_sheet, hero, player.x, player.y, 0, scale, scale, player.width, player.height)
	love.graphics.draw(ghost_sheet, ghost_sprite, ghost.x, ghost.y, 0, scale, scale, 8, 8)


	love.graphics.rectangle("line", player.body:getX(), player.body:getY(), player.width, player.height) --player.body:getWorldPoints(player.shape:getPoints()))

end