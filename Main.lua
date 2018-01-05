local sprite = require("Component/units/sprite")
local entity = require("Component/units/entity")
local keyboardMovement = require("Component/movement/keyboardMovement")
local levitate = require("Component/movement/ai/levitate")
local gamestate = require("Component/gamestate")

local player = {}
player.exp = 0
local ghost = {}
local game

function love.load ()
	player.s = sprite:create("Assets/human.png") 
	--x,y of image is top left corner of image
	--width of player image is 30 x 30 for this particular image
	player.e = entity:create(player.s, 50, 50, 2, keyboardMovement)
	game = gamestate:create(player.e)
end

function love.update ()
	game:update()
	
	--picking up this info constantly, right now mouse is just display
	--mouse_x = love.mouse.getX()
	--mouse_y = love.mouse.getY()

	--for right now just to show saving/loading the exp just goes up 4ever
	player.exp = player.exp + 1
	
end

function love.draw ()
	game:draw()
	if Menu ~= nil then
		Menu:draw()
	end
	
	--	the debug boi cout << "test" << endl;
	--love.graphics.print("Player X Position:  "..player.e.x, 10, 80)
	--love.graphics.print("Player Y Position:  "..player.e.y, 10, 90)
	-- this cout line requires the mouse_x and mouse_y from update
	--love.graphics.print("Mouse X: ".. mouse_x .. " Mouse Y: " .. mouse_y, 10, 20 )
end

function love.keypressed( key )
	if key == "escape" and Menu ~= nil then
		Menu = nil
	elseif key == "escape" then
		Menu = sprite:create("Assets/menu.png")
	end
end

function love.mousepressed(x, y, button)
	if button == 1 and Menu ~= nil then
		if (x > 105 and x < 180 and y > 400 and y < 425) then
			love.event.quit()
		elseif (x > 105 and x < 180 and y > 250 and y < 275) then
			--save
			file = io.open("Learning.love/savefile.txt", "w+")
			file:write(player.exp, "\n")
			io.close(file)
			--saves the exp of current player only for now

		elseif (x > 270 and x < 340 and y > 245 and y < 275) then
			--load
			file = io.open("Learning.love/savefile.txt", "r")
			player.exp = file:read()
			io.close(file) 
			--this pulls the first line from file and replaces default/old
			--I assume the next read() invoke pulls next line until end?
		end
	end
end