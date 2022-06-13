Class = require "lib.30log.30log"
STI = require "lib.sti.sti"

require "struct.Sprite"
require "struct.Player"
require "struct.PlayerSpawn"
require "struct.Lever"
require "struct.Door"
require "struct.Box"
require "struct.Button"

local function splitTargets(str, sep)
    local t = {}
    for i in string.gmatch(str, "([^" .. sep .. "]+)") do
        table.insert(t, tonumber(i))
    end
    return t
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

    Sprites = Map:addCustomLayer("GameSprite", 3)
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
            Lever(object.x, object.y, splitTargets(object.properties.targets, ","))

        elseif object.type == "Door" then
            Door(object.x, object.y, tonumber(string.sub(object.name, -1)))

        elseif object.type == "Box" then
            Box(object.x, object.y)

        elseif object.type == "Button" then
            Button(object.x, object.y, splitTargets(object.properties.targets, ","))

        end
    end
end

function love.load()
    love.physics.setMeter(16)

    Tileset = love.graphics.newImage("tileset/dungeon tileset calciumtrice.png", {})

    loadMap()
end

function love.update(dt)
    World:update(dt)
    Map:update(dt)
end

function love.draw()
    Map:draw(love.graphics.getWidth() / 4 - LocalPlayer.body:getX(), love.graphics.getHeight() / 4 - LocalPlayer.body:getY(), 2, 2)
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