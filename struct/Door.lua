Door = Sprite:extend "Door"

Doors = {}

function Door:init(x, y, id)
    Door.super.init(self, x, y, love.physics.newRectangleShape(love.physics.getMeter(), love.physics.getMeter(), love.physics.getMeter() * 2, love.physics.getMeter() * 2), "static")
    self.id = id
    Doors[id] = self
end

function Door:open()
    self:destroy()
end

function Door:draw()
    love.graphics.polygon("line", self.body:getWorldPoints(self.shape:getPoints()))
end

function Door:destroy()
    Doors[self.id] = nil
    Door.super.destroy(self)
end