Class = require "lib.30log.30log"
STI = require "lib.sti.sti"

require "struct.Sprite"
require "struct.Player"

function love.load()
    love.physics.setMeter(16)

    World = love.physics.newWorld()
    -- linking to the github that we made
    Map = STI("level/githubathonLevelLuaTest.lua", {"box2d"})
    Map:box2d_init(World)
    -- converting all the layers into a custom layer that we will use for the game
    Sprites = Map:addCustomLayer("SpriteLayer", 3)
    Sprites.sprites = {}
    -- updating the deltatime
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

    LocalPlayer = Player()
end

function love.update(dt)
    World:update(dt)
    Map:update(dt)
end

function love.draw()
    Map:draw(love.graphics.getWidth() / 2 - LocalPlayer.body:getX(), love.graphics.getHeight() / 2 - LocalPlayer.body:getY())
end

function love.keypressed(key)
    for _, sprite in pairs(Sprites.sprites) do
        sprite:keypressed(key)
    end
end