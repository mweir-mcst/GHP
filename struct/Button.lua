-- Code for the button sprite (connected doors are opened when another sprite is on top of it)
Button = Sprite:extend "Button"

-- Constructor
function Button:init(x, y, targets)
    Button.super.init(self, x, y, love.physics.newRectangleShape(love.physics.getMeter() / 2, love.physics.getMeter() / 2, love.physics.getMeter() * 2 / 3, love.physics.getMeter() * 2 / 3), "static")
    -- Disable collision
    self.fixture:setSensor(true)
    -- Store the targets of the button (the IDs of the doors that the button opens)
    self.targets = targets
    -- Store the number of sprites on top of the button
    self.triggers = 0
end

-- On contact, if there is at least one sprite touching the button, open the doors it connects to
function Button:beginContact(sprite)
    self.triggers = self.triggers + 1
    if self.triggers == 1 then
        for _, target in ipairs(self.targets) do
            if Doors[target] ~= nil then
                Doors[target].triggers = Doors[target].triggers + 1
            end
        end
    end
end

-- On contact end, if there are no sprites touching the button, close the doors it connects to
function Button:endContact(sprite)
    self.triggers = self.triggers - 1
    if self.triggers == 0 then
        for _, target in ipairs(self.targets) do
            if Doors[target] ~= nil then
                Doors[target].triggers = Doors[target].triggers - 1
            end
        end
    end
end