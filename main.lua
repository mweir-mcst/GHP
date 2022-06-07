Class = require "lib.30log"

require "struct.Sprite"
require "struct.Player"

function love.load()
    love.physics.setMeter(32)
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
    love.graphics.setColor(1, 1, 1)
    for x = 0, love.graphics.getWidth(), 32 do
        for y = 0, love.graphics.getHeight(), 32 do
            love.graphics.rectangle("line", x, y, 32, 32)
        end
    end

    for _, sprite in pairs(Sprites) do
        sprite:draw()
    end
end

function love.keypressed(key)
    for _, sprite in pairs(Sprites) do
        sprite:keypressed(key)
    end
end