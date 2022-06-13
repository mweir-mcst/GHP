Door = Sprite:extend "Door"

Doors = {}

function Door:init(x, y, id)
    Door.super.init(self, x, y, love.physics.newRectangleShape(love.physics.getMeter(), love.physics.getMeter(), love.physics.getMeter() * 2, love.physics.getMeter() * 2), "static")
    Doors[id] = self
    self.id = id
    self.triggers = 0
    self.quadClosed = love.graphics.newQuad(0 * 16, 11 * 16, 32, 32, Tileset:getWidth(), Tileset:getHeight())
    self.quadOpen = love.graphics.newQuad(7 * 16, 11 * 16, 32, 48, Tileset:getWidth(), Tileset:getHeight())
end

function Door:update()
    self.body:setActive(self.triggers <= 0)
end

function Door:draw()
    if self.triggers >= 1 then
        love.graphics.draw(Tileset, self.quadOpen, self.body:getX(), self.body:getY())
    else
        love.graphics.draw(Tileset, self.quadClosed, self.body:getX(), self.body:getY())
    end
end

function Door:destroy()
    Doors[self.id] = nil
    Door.super.destroy(self)
end