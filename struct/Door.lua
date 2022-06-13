Door = Sprite:extend "Door"

Doors = {}

function Door:init(x, y, id)
    Door.super.init(self, x, y, love.physics.newRectangleShape(love.physics.getMeter(), love.physics.getMeter(), love.physics.getMeter() * 2, love.physics.getMeter() * 2), "static")
    Doors[id] = self
    self.id = id
    self.open = false
    self.quad = love.graphics.newQuad(0 * 16, 11 * 16, 32, 32, Tileset:getWidth(), Tileset:getHeight())
end

function Door:toggle(open)
    self.open = open
    if open then
        self.quad = love.graphics.newQuad(7 * 16, 11 * 16, 32, 48, Tileset:getWidth(), Tileset:getHeight())
    else
        self.quad = love.graphics.newQuad(0 * 16, 11 * 16, 32, 32, Tileset:getWidth(), Tileset:getHeight())
    end
end

function Door:update()
    self.body:setActive(not self.open)
end

function Door:draw()
    love.graphics.draw(Tileset, self.quad, self.body:getX(), self.body:getY())
end

function Door:destroy()
    Doors[self.id] = nil
    Door.super.destroy(self)
end