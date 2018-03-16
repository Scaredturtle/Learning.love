--[[
	for now the insert function isn't finding the same table from Main unless
	i pass it explicitly. not sure how to pass that table along any other way.

	may be the way i passed it along. but for whatever reason it remembers
	the first input forever, and never returns false for enemy dying.
]]--


local battle = {}



local screen = love.graphics.newImage("Assets/battlescreen.png")
local run = false

local draw = function (self)
	--love.graphics.draw(screen)
	love.graphics.draw(screen)
	love.graphics.print({{0,255,0,255}, "Hero: "..battle.player.health}, 50, 50)
	love.graphics.print({{255,0,0,255}, "Ghost: "..battle.enemy.health}, 550, 50)
end

local function update(player, enemy, KEYPRESSED) 
	battle.player = player
	battle.enemy = enemy
	--if i create the input to the table within update it only takes input once.
	table.insert(KEYPRESSED, function (key) 
		if key == "f" then
			if enemy.health > 0 then 
				enemy.health = enemy.health - player.damage 
				if enemy.health > 0 then 
					player.health = player.health - enemy.damage 
				end 
			end
		elseif key == "r" then 
			run = true 
		end 
	end)

	--if you die
    if player.health <= 0 then
    	player.x = 50
    	player.y = 50
    	player.health = player.maxhealth
    	return false

    --if they die
	elseif enemy.health <= 0 then
		player.exp = player.exp + 50
		return false
	end

	--check if run command pressed
	if run == true then
		player.x = 50
    	player.y = 50
		return false
	end
	
	return true

end



--[[
--if i don't explicitly pass the keypressed table it doesn't compile
table.insert(KEYPRESSED, function (key) 
	if key == "f" then	
		if enemy.health > 0 then 
			enemy.health = enemy.health - player.damage 
			if enemy.health > 0 then 
				player.health = player.health - enemy.damage 
			end 
		end
	elseif key == "r" then 
		run = true 
	end 
end)
]]--


battle.update = update
battle.draw = draw

return battle