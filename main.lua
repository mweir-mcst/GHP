Class = require "lib.30log.30log"
STI = require "lib.sti.sti"

require "struct.Sprite"
require "struct.Player"

function love.load()
    love.physics.setMeter(16)

    World = love.physics.newWorld()
    Map = STI("level/githubathonLevelLuaTest.lua", {"box2d"})
    Map:box2d_init(World)

    Player()
end

function love.update(dt)
    World:update(dt)
    for _, sprite in pairs(Sprites) do
        sprite:update(dt)
    end
end

function love.draw()
    for _, sprite in pairs(Sprites) do
        sprite:draw()
    end
end

function love.keypressed(key)
    for _, sprite in pairs(Sprites) do
        sprite:keypressed(key)
    end
end