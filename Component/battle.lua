--[[
	i assume that running away or enemy dying could be done by
	deleting the screen? literally.

	for now I just want to get something to print to the screen
]]--
local battle = {}

local screen = love.graphics.newImage("Assets/battlescreen.png")
local run = false

local draw = function ()
	--love.graphics.draw(screen)
	love.graphics.print({{0,0,0,255}, "Battle starts"}, 240, 50 )
end

local run = function ()
	screen = nil
	--return to current screen with enemy still alive
end


local function engage(player, enemy)  --game was self from gamestate. 
	if enemy.health > 0 then
	enemy.health = enemy.health - player.damage		--this works regardless if its returned?
	
		if enemy.health > 0 then
			player.health = player.health - enemy.damage
		end
	end

    if player.health <= 0 then
    	player.x = 50
    	player.y = 50
    	player.health = 100
	elseif enemy.health == 0 then
		player.exp = player.exp + 50
	end

	--screen includes buttons fight, run, item, party?, etc.
	--run update on this screen until run/someone dies
	return	player
end

function love.keypressed( key )
	if key == "f" then
		--hit/get hit
		--if someone dies, exit screen and enemy dies (+exp message), or GAME OVER
	elseif key == "r" then
		run = true
	elseif key == "i" then
		--open screen and list inventory... probably another file...
	end
end

battle.engage = engage

return battle