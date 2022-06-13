Button = Sprite:extend "Button"

function Button:init(x, y, targets)
    Button.super.init(self, x, y, love.physics.newRectangleShape(love.physics.getMeter() / 2, love.physics.getMeter() / 2, love.physics.getMeter(), love.physics.getMeter()), "static")
    self.fixture:setSensor(true)
    self.targets = targets
    self.triggers = 0
end

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