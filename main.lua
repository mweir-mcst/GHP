--[[
    Name: Jash Patel, Xander Russell, Matthew Weir

    Program Name: Github-athon 2022

    Date: 6/15/2022
]]

-- Loads libraries
Class = require "lib.30log.30log"
STI = require "lib.sti.sti"

-- Loads sprites
require "struct.Sprite"
require "struct.Player"
require "struct.PlayerSpawn"
require "struct.Lever"
require "struct.Door"
require "struct.Box"
require "struct.Button"
require "struct.Goal"

-- Determines if the world is active or not
WorldActive = true

-- Split a string into a list of strings (or numbers)
local function splitString(str, sep, parseInt)
    local t = {}
    for i in string.gmatch(str, "([^" .. sep .. "]+)") do
        if parseInt then
            table.insert(t, tonumber(i))
        else
            table.insert(t, i)
        end
    end
    return t
end

-- Parse a number of seconds into the string format "MM:SS.SS"
local function timeString(time)
    local minutes = math.floor(time / 60)
    local seconds = tostring(math.floor((time - (minutes * 60)) * 100) / 100)
    minutes = tostring(minutes)
    if string.sub(seconds, 2, 2) == "." then
        seconds = "0" .. seconds
    end
    if string.len(string.sub(seconds, 4, 5)) == 1 then
        seconds = seconds .. "0"
    end
    return minutes .. ":" .. seconds
end

-- Loads the map
local function loadMap()
    -- Create a new world
    World = love.physics.newWorld()

    -- Handle when two fixtures start and stop contacting eachother
    World:setCallbacks(function(fixture1, fixture2)
        -- Get each fixture's sprite
        local sprite1 = fixture1:getBody():getUserData()
        local sprite2 = fixture2:getBody():getUserData()
        -- If each fixture has a sprite, tell that sprite that it was contacted by the other sprite/fixture
        if sprite1 ~= nil then sprite1:beginContact(sprite2) end
        if sprite2 ~= nil then sprite2:beginContact(sprite1) end
    end, function(fixture1, fixture2)
        local sprite1 = fixture1:getBody():getUserData()
        local sprite2 = fixture2:getBody():getUserData()
        if sprite1 ~= nil then sprite1:endContact(sprite2) end
        if sprite2 ~= nil then sprite2:endContact(sprite1) end
    end, nil, nil)

    -- Read the map data from the map file and initialize it
    Map = STI("level/draftEight.lua", {"box2d"})
    Map:box2d_init(World)

    -- Create the sprites layer
    Sprites = Map:addCustomLayer("GameSprite", 5)
    Sprites.sprites = {}

    -- Handle updating each sprite every frame
    function Sprites:update(dt)
        for _, sprite in pairs(Sprites.sprites) do
            sprite:update(dt)
        end
    end

    -- Handle drawing each sprite every frame
    function Sprites:draw()
        for _, sprite in pairs(Sprites.sprites) do
            sprite:draw()
        end
    end

    -- Loop through each object and initialize it as a sprite depending on what type of object it is
    for _, object in pairs(Map.objects) do
        -- Initialize a PlayerSpawn (technically not a sprite)
        if object.type == "PlayerSpawn" then
            PlayerSpawn(object.x, object.y, object.name == "PlayerSpawn")

        -- Initialize a Lever
        elseif object.type == "Lever" then
            Lever(object.x, object.y, splitString(object.properties.targets, ",", true))

        -- Initialize a Door
        elseif object.type == "Door" then
            Door(object.x, object.y, tonumber(string.sub(object.name, -1)))

        -- Initialize a Box
        elseif object.type == "Box" then
            Box(object.x, object.y)

        -- Initialize a Button
        elseif object.type == "Button" then
            Button(object.x, object.y, splitString(object.properties.targets, ",", true))

        -- Initialize a Goal
        elseif object.type == "Goal" then
            Goal(object.x, object.y, object.width, object.height)

        end
    end

    -- Determine the starting time for the speedrun timer
    StartTime = love.timer.getTime()
    Time = 0
    WinTime = 0

    -- Mark the world as active
    WorldActive = true
end

-- Called when the game first loads
function love.load()
    -- Set the phyics meter and load the font in its various sizes
    love.physics.setMeter(16)
    Font12 = love.graphics.setNewFont("minecraft.ttf")
    Font30 = love.graphics.newFont("minecraft.ttf", 30)
    Font40 = love.graphics.newFont("minecraft.ttf", 40)

    -- Load the tileset
    Tileset = love.graphics.newImage("tileset/dungeon tileset calciumtrice.png", {})

    -- Load the map
    loadMap()
end

-- Called every frame to update stuff
function love.update(dt)
    -- If the world is not active return
    if not WorldActive then return end

    -- Update the world and the map
    World:update(dt)
    Map:update(dt)
end

-- Called every frame to draw stuff
function love.draw()
    -- Make the color white
    love.graphics.setColor(1, 1, 1)
    if WorldActive then
        -- If the world is active, draw the map and the speedrun timer
        Map:draw(love.graphics.getWidth() / 6 - LocalPlayer.body:getX(), love.graphics.getHeight() / 6 - LocalPlayer.body:getY(), 3, 3)
        Time = love.timer.getTime() - StartTime
        love.graphics.print(timeString(Time), 15, 15)

    else
        -- If the world is not active (you won), draw the winner screen
        love.graphics.setFont(Font40)

        local text = "You win!"
        love.graphics.print(text, love.graphics.getWidth() / 2 - Font40:getWidth(text) / 2, 40)

        love.graphics.setFont(Font30)

        text = "Your time: " .. timeString(WinTime)
        love.graphics.print(text, love.graphics.getWidth() / 2 - Font30:getWidth(text) / 2, 120)

        text = "Top scores: "
        love.graphics.print(text, love.graphics.getWidth() / 2 - Font30:getWidth(text) / 2, 200)
        for i = 1, math.min(#Times, 5) do
            if math.floor(Times[i] * 100) / 100 == math.floor(WinTime * 100) / 100 then
                love.graphics.setColor(1, 1, 0)
            else
                love.graphics.setColor(1, 1, 1)
            end
            text = timeString(Times[i])
            love.graphics.print(text, love.graphics.getWidth() / 2 - Font30:getWidth(text) / 2, 210 + 40 * i)
        end

        love.graphics.setColor(1, 1, 1)
        text = "Press R to restart"
        love.graphics.print(text, love.graphics.getWidth() / 2 - Font30:getWidth(text) / 2, 500)
    end
end

-- Called every time a key is pressed
function love.keypressed(key)
    -- If "r" is pressed
    if key == "r" then
        -- Destroy all sprites and the world
        for _, sprite in pairs(Sprites.sprites) do
            sprite:destroy()
        end
        World:destroy()
        -- Reload the map
        loadMap()
        return

    -- If "escape" is pressed
    elseif key == "escape" then
        -- Quit the game
        love.event.quit()
        return
    end

    -- Otherwise, tell all the sprites that the key was pressed
    for _, sprite in pairs(Sprites.sprites) do
        sprite:keypressed(key)
    end
end

-- Ends the game (called by the Goal)
function GameEnd()
    -- Determine the final speedrun time
    WinTime = Time
    -- If the scores file doesn't exist, create it
    if love.filesystem.getInfo("scores.txt", "file") == nil then
        love.filesystem.write("scores.txt", "")
    end
    -- Add the new time to the end of it
    love.filesystem.append("scores.txt", tostring(WinTime) .. "\n")
    -- Read all the times (including the new one) from the file
    Times = splitString(love.filesystem.read("scores.txt"), "\n", true)
    -- Sort it using Bubble sort
    local temp
    for i = 1, #Times do
        for j = 1, #Times - i do
            if Times[j] > Times[j + 1] then
                temp = Times[j]
                Times[j] = Times[j + 1]
                Times[j + 1] = temp
            end
        end
    end
    -- Mark the world as not active
    WorldActive = false
end