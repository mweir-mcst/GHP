Lever = Sprite:extend "Lever"

function Lever:init(x, y, targets)
    Lever.super.init(self, x, y, love.physics.newRectangleShape(love.physics.getMeter() / 2, love.physics.getMeter() / 2, love.physics.getMeter(), love.physics.getMeter()), "static")
    self.targets = targets
    self.activated = false
    self.quadOff = love.graphics.newQuad(15 * 16, 19 * 16, 16, 16, Tileset:getWidth(), Tileset:getHeight())
    self.quadOn = love.graphics.newQuad(16 * 16, 19 * 16, 16, 16, Tileset:getWidth(), Tileset:getHeight())
end

function Lever:draw()
    if self.activated then
        love.graphics.draw(Tileset, self.quadOn, self.body:getX(), self.body:getY())
    else
        love.graphics.draw(Tileset, self.quadOff, self.body:getX(), self.body:getY())
    end
end

function Lever:beginContact(sprite)
    if not sprite:instanceOf(Player) then
        return
    end

    self.activated = not self.activated

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