Class = require "lib.30log.30log"

require "struct.Sprite"
require "struct.Player"

function love.load()
    love.physics.setMeter(16)
    World = love.physics.newWorld()
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