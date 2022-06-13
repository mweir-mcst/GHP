Box = Sprite:extend "Box"

function Box:init(x, y)
    Box.super.init(self, x, y, love.physics.newRectangleShape(love.physics.getMeter() / 2, love.physics.getMeter() / 2, love.physics.getMeter(), love.physics.getMeter()), "dynamic")
    self.body:setFixedRotation(true)
    self.quad = love.graphics.newQuad(0 * 16, 19 * 16, 16, 16, Tileset:getWidth(), Tileset:getHeight())
end

function Box:draw()
    love.graphics.draw(Tileset, self.quad, self.body:getX(), self.body:getY())
end

function Box:endContact(sprite)
    if sprite == nil or not sprite:instanceOf(Player) then
        return
    end

    self.body:setLinearVelocity(0, 0)
end