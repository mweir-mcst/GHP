Box = Sprite:extend "Box"

function Box:init(x, y)
    Box.super.init(self, x + love.physics.getMeter() / 2, y + love.physics.getMeter() / 2, love.physics.newRectangleShape(love.physics.getMeter(), love.physics.getMeter()), "dynamic")
    self.body:setFixedRotation(true)
    self.fixture:setDensity(30)
    self.body:resetMassData()
    self.quad = love.graphics.newQuad(0 * 16, 19 * 16, 16, 16, Tileset:getWidth(), Tileset:getHeight())
end

function Box:draw()
    love.graphics.draw(Tileset, self.quad, self.body:getX() - love.physics.getMeter() / 2, self.body:getY() - love.physics.getMeter() / 2)
end

function Box:endContact()
    
end