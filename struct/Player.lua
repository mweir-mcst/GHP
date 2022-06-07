Player = Sprite:extend "Player"

function Player:init()
    Player.super.init(self, 16, 16, love.physics.newRectangleShape(32, 32), "dynamic")
end

function Player:draw()
    love.graphics.setColor(0, 1, 0)
    love.graphics.circle("fill", self.body:getX(), self.body:getY(), 16)
end

function Player:keypressed(key)
    if key == "left" or key == "a" then

    elseif key == "right" or key == "d" then

    end

    if key == "up" or key == "w" then
        
    elseif key == "down" or key == "s" then

    end
end