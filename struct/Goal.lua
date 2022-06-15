Goal = Sprite:extend "Goal"

function Goal:init(x, y, w, h)
    Goal.super.init(self, x, y, love.physics.newRectangleShape(w / 2, h / 2, w, h), "static")
    self.fixture:setSensor(true)
end

function Goal:beginContact(sprite)
    if not sprite:instanceOf(Player) then return end

    GameEnd()
end