Lever = Sprite:extend "Lever"

function Lever:init(x, y, id)
    Lever.super.init(self, x, y, love.physics.newRectangleShape(love.physics.getMeter() / 2, love.physics.getMeter() / 2, love.physics.getMeter(), love.physics.getMeter()), "static")
    self.id = id
    self.activated = false
    print(self)
end

local leverQuad = love.graphics.newQuad(19, 16, 16, 16, Tileset:getWidth(), Tileset:getHeight())

function Lever:draw()

end

function Lever:beginContact(sprite)
    if not sprite:instanceOf(Player) then
        return
    end

    self.activated = true
    if Doors[self.id] ~= nil then
        Doors[self.id]:open()
    end
end