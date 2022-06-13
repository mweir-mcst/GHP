Lever = Sprite:extend "Lever"

function Lever:init(x, y, id)
    Lever.super.init(self, x, y, love.physics.newRectangleShape(love.physics.getMeter() / 2, love.physics.getMeter() / 2, love.physics.getMeter(), love.physics.getMeter()), "static")
    self.id = id
    self.activated = false
    self.quad = love.graphics.newQuad(15 * 16, 19 * 16, 16, 16, Tileset:getWidth(), Tileset:getHeight())
end

function Lever:draw()
    love.graphics.draw(Tileset, self.quad, self.body:getX(), self.body:getY())
end

function Lever:beginContact(sprite)
    if not sprite:instanceOf(Player) then
        return
    end

    self.activated = not self.activated
    if self.activated then
        self.quad = love.graphics.newQuad(16 * 16, 19 * 16, 16, 16, Tileset:getWidth(), Tileset:getHeight())
    else
        self.quad = love.graphics.newQuad(15 * 16, 19 * 16, 16, 16, Tileset:getWidth(), Tileset:getHeight())
    end
    if Doors[self.id] ~= nil then
        Doors[self.id]:toggle(self.activated)
    end
end