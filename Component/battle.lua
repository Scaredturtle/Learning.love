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


function battle:engage(player, entity)  --game was self from gamestate. 
	--[[
	local inst = {}
	--load up a new screen
	inst.screen = screen
    inst.entity = entity
    inst.run = run
    inst.draw = draw
    inst.draw()
    return inst
    ]]--
    --while (not run) do
    --draw()
    love.graphics.print({{0,0,0,255}, "Test"}, 240, 10 )
	--end
	--screen includes buttons fight, run, item, party?, etc.
	--run update on this screen until run/someone dies
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


return battle