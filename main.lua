Class = require "lib.30log.30log"
STI = require "lib.sti.sti"

require "struct.Sprite"
require "struct.Player"
require "struct.PlayerSpawn"
require "struct.Lever"
require "struct.Door"

function love.load()
    love.physics.setMeter(16)

    World = love.physics.newWorld()

    Map = STI("level/draftFive.lua", {"box2d"})
    Map:box2d_init(World)

    Tileset = love.graphics.newImage("tileset/dungeon tileset calciumtrice.png", {})

    World:setCallbacks(function(fixture1, fixture2, contact)
        for _, sprite in pairs(Sprites.sprites) do
            local spriteFound = false
            local otherSprite
            if sprite.fixture == fixture1 then
                otherSprite = Sprite.findByFixture(fixture2)
                spriteFound = true
            elseif sprite.fixture == fixture2 then
                otherSprite = Sprite.findByFixture(fixture1)
                spriteFound = true
            end
            if spriteFound and otherSprite then
                sprite:beginContact(otherSprite, contact)
                otherSprite:beginContact(sprite, contact)
            return
            elseif spriteFound then
                sprite:beginContact(nil, contact)
                return
            end
        end
    end, nil, nil, nil)

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
            Lever(object.x, object.y, tonumber(string.sub(object.name, -1)))

        elseif object.type == "Door" then
            Door(object.x, object.y, tonumber(string.sub(object.name, -1)))

        end
    end
end

function love.update(dt)
    World:update(dt)
    Map:update(dt)
end

function love.draw()
    Map:draw(love.graphics.getWidth() / 4 - LocalPlayer.body:getX(), love.graphics.getHeight() / 4 - LocalPlayer.body:getY(), 2, 2)
end

function love.keypressed(key)
    for _, sprite in pairs(Sprites.sprites) do
        sprite:keypressed(key)
    end
end