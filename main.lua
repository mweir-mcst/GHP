Class = require "lib.30log.30log"
STI = require "lib.sti.sti"

require "struct.Sprite"
require "struct.Player"
require "struct.PlayerSpawn"
require "struct.Lever"
require "struct.Door"
require "struct.Box"
require "struct.Button"
require "struct.Goal"

WorldActive = true

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

local function loadMap()
    World = love.physics.newWorld()

    World:setCallbacks(function(fixture1, fixture2)
        local sprite1 = fixture1:getBody():getUserData()
        local sprite2 = fixture2:getBody():getUserData()
        if sprite1 ~= nil then sprite1:beginContact(sprite2) end
        if sprite2 ~= nil then sprite2:beginContact(sprite1) end
    end, function(fixture1, fixture2)
        local sprite1 = fixture1:getBody():getUserData()
        local sprite2 = fixture2:getBody():getUserData()
        if sprite1 ~= nil then sprite1:endContact(sprite2) end
        if sprite2 ~= nil then sprite2:endContact(sprite1) end
    end, nil, nil)

    Map = STI("level/draftSeven.lua", {"box2d"})
    Map:box2d_init(World)

    Sprites = Map:addCustomLayer("GameSprite", 5)
    Sprites.sprites = {}

    function Sprites:update(dt)
        for _, sprite in pairs(Sprites.sprites) do
            sprite:update(dt)
        end
    end

    function Sprites:draw()
        for _, sprite in pairs(Sprites.sprites) do
            sprite:draw()
        end
    end

    for _, object in pairs(Map.objects) do
        if object.type == "PlayerSpawn" then
            PlayerSpawn(object.x, object.y, object.name == "PlayerSpawn")

        elseif object.type == "Lever" then
            Lever(object.x, object.y, splitString(object.properties.targets, ",", true))

        elseif object.type == "Door" then
            Door(object.x, object.y, tonumber(string.sub(object.name, -1)))

        elseif object.type == "Box" then
            Box(object.x, object.y)

        elseif object.type == "Button" then
            Button(object.x, object.y, splitString(object.properties.targets, ",", true))

        elseif object.type == "Goal" then
            Goal(object.x, object.y, object.width, object.height)

        end
    end

    StartTime = love.timer.getTime()
    Time = 0
    WinTime = 0
    WorldActive = true
end

function love.load()
    love.physics.setMeter(16)
    Font12 = love.graphics.setNewFont("minecraft.ttf")
    Font30 = love.graphics.newFont("minecraft.ttf", 30)
    Font40 = love.graphics.newFont("minecraft.ttf", 40)

    Tileset = love.graphics.newImage("tileset/dungeon tileset calciumtrice.png", {})

    loadMap()
end

function love.update(dt)
    if not WorldActive then return end

    World:update(dt)
    Map:update(dt)
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    if WorldActive then
        Map:draw(love.graphics.getWidth() / 6 - LocalPlayer.body:getX(), love.graphics.getHeight() / 6 - LocalPlayer.body:getY(), 3, 3)
        Time = love.timer.getTime() - StartTime
        love.graphics.print(timeString(Time), 15, 15)

    else
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

function love.keypressed(key)
    if key == "r" then
        for _, sprite in pairs(Sprites.sprites) do
            sprite:destroy()
        end
        World:destroy()
        loadMap()
        return
    elseif key == "escape" then
        love.event.quit()
        return
    end
    for _, sprite in pairs(Sprites.sprites) do
        sprite:keypressed(key)
    end
end

function GameEnd()
    WinTime = Time
    if love.filesystem.getInfo("scores.txt", "file") == nil then
        love.filesystem.write("scores.txt", "")
    end
    love.filesystem.append("scores.txt", tostring(WinTime) .. "\n")
    Times = splitString(love.filesystem.read("scores.txt"), "\n", true)
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
    WorldActive = false
end