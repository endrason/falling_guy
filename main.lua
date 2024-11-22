-- project by endrason
-- make sure you have lua and love2d installed in your computer

local guy_scale = 3 -- set image scale
local falling_speed_state = 0 -- initial falling state
local relative_falling_speed = 500 -- update value as the falling speed increases

function love.load()
    -- set window and viewport properties 
    love.window.setTitle("Falling Guy")
    love.window.setMode(900, 800)

    love.graphics.setBackgroundColor(0.33, 0.33, 0.33)

    -- get sprite and remove blurry effect
    guy_sprite = love.graphics.newImage("asset_collection/sprite_collection/prototyping_character_platformer.png")
    guy_sprite:setFilter("nearest", "nearest")

    -- set initial guy position
    guy_horizontal = 300  
    guy_vertical = 0
end

function love.update(dt)
    -- falling system
    falling_speed_state = falling_speed_state + relative_falling_speed * dt
    guy_vertical = guy_vertical + falling_speed_state * dt
end

function love.draw()
    -- draw relative falling speed parameter and 
    love.graphics.print("Falling speed:")
    love.graphics.print(guy_vertical, 0, 15)
    love.graphics.draw(guy_sprite, guy_horizontal, guy_vertical, 0, guy_scale)
end