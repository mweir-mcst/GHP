-- Code for the lever sprite (togglable sprite that opens/closes target doors)
Lever = Sprite:extend "Lever"

function Lever:init(x, y, targets)
    Lever.super.init(self, x, y, love.physics.newRectangleShape(love.physics.getMeter() / 2, love.physics.getMeter() / 2, love.physics.getMeter(), love.physics.getMeter()), "static")
    -- Store the targets of the lever (the IDs of the doors that the button opens)
    self.targets = targets
    -- Whether the lever is activated or not
    self.activated = false
    -- The two regions of the tileset: one for the lever on and one for it off
    self.quadOff = love.graphics.newQuad(15 * 16, 19 * 16, 16, 16, Tileset:getWidth(), Tileset:getHeight())
    self.quadOn = love.graphics.newQuad(16 * 16, 19 * 16, 16, 16, Tileset:getWidth(), Tileset:getHeight())
end

-- Called when the sprite is being drawn
function Lever:draw()
    -- Draw the right image depending on if the sprite is on or not
    if self.activated then
        love.graphics.draw(Tileset, self.quadOn, self.body:getX(), self.body:getY())
    else
        love.graphics.draw(Tileset, self.quadOff, self.body:getX(), self.body:getY())
    end
end

-- Called when the sprite begins a contact with another sprite
function Lever:beginContact(sprite)
    -- If it's not a player return
    if not sprite:instanceOf(Player) then
        return
    end

    -- Toggle its activated state
    self.activated = not self.activated

    -- Open or close target doors depending on activation state
    for _, target in ipairs(self.targets) do
        if Doors[target] ~= nil then
            local change
            if self.activated then
                change = 1
            else
                change = -1
            end
            Doors[target].triggers = Doors[target].triggers + change
        end
    end
end