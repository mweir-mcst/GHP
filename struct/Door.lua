-- Code for the door sprite (the doors that the player has to open to go through)
Door = Sprite:extend "Door"

-- List of doors indexed by door ID
Doors = {}

-- Constructor for the Door
function Door:init(x, y, id)
    Door.super.init(self, x, y, love.physics.newRectangleShape(love.physics.getMeter(), love.physics.getMeter(), love.physics.getMeter() * 2, love.physics.getMeter() * 2), "static")
    -- Add this door to the list of doors
    Doors[id] = self
    -- Store the ID of this door
    self.id = id
    -- The number of buttons/levers that are opening this door
    self.triggers = 0
    -- The two regions of the tileset: one for the door being open and one for it being closed
    self.quadClosed = love.graphics.newQuad(0 * 16, 11 * 16, 32, 32, Tileset:getWidth(), Tileset:getHeight())
    self.quadOpen = love.graphics.newQuad(7 * 16, 11 * 16, 32, 48, Tileset:getWidth(), Tileset:getHeight())
end

-- Set the body as active (has collision) if there is nothing opening the door
function Door:update()
    self.body:setActive(self.triggers <= 0)
end

-- Draw the door being open or closed
function Door:draw()
    if self.triggers >= 1 then
        love.graphics.draw(Tileset, self.quadOpen, self.body:getX(), self.body:getY())
    else
        love.graphics.draw(Tileset, self.quadClosed, self.body:getX(), self.body:getY())
    end
end

-- Destructor for the door
function Door:destroy()
    -- Remove the door from the list of doors
    Doors[self.id] = nil
    Door.super.destroy(self)
end