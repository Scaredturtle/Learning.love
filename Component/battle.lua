--[[
	no idea why nothing happens.
	gotta figure out why my ghost isn't printing to screen...

	i assume that running away or enemy dying could be done by
	deleting the screen? literally.
]]--
local battle = {}

local screen = love.graphics.newImage("Assets/battlescreen.png")

local draw = function ()
	love.graphics.draw(self.screen)
end

local run = function ()
	screen = nil
	--return to current screen with enemy still alive
end

local update = function (self)
	
end

function battle:engage(game, entity)  --game was self from gamestate. 
	local inst = {}
	--load up a new screen
    inst.entity = entity
    inst.run = run
    inst.draw = draw
    inst.update = update

    return inst
	--screen includes buttons fight, run, item, party?, etc.
	--run update on this screen until run/someone dies
end

function love.keypressed( key )
	if key == "f" then
		--hit/get hit
		--if someone dies, exit screen and enemy dies (+exp message), or GAME OVER
	elseif key == "r" then
		run()
	elseif key == "i" then
		--open screen and list inventory... probably another file...
	end
end


return battle