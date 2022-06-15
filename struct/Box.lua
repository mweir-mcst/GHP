-- Code for the box sprite (the box that the player pushes around)
Box = Sprite:extend "Box"

-- Constructor for the box
function Box:init(x, y)
    Box.super.init(self, x, y, love.physics.newRectangleShape(love.physics.getMeter() / 2, love.physics.getMeter() / 2, love.physics.getMeter(), love.physics.getMeter()), "dynamic")
    -- Disable rotation for the box
    self.body:setFixedRotation(true)
    -- Determine what part of the tileset to render
    self.quad = love.graphics.newQuad(0 * 16, 19 * 16, 16, 16, Tileset:getWidth(), Tileset:getHeight())
end

-- Draw the box
function Box:draw()
    love.graphics.draw(Tileset, self.quad, self.body:getX(), self.body:getY())
end

-- Stop moving the box when it is no longer being moved
function Box:endContact(sprite)
    if sprite == nil then
        return
    end

    self.body:setLinearVelocity(0, 0)
end