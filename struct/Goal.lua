-- Code for the goal sprite (invisble sprite that shows the win screen when the player it)
Goal = Sprite:extend "Goal"

-- Constructor
function Goal:init(x, y, w, h)
    Goal.super.init(self, x, y, love.physics.newRectangleShape(w / 2, h / 2, w, h), "static")
    -- Disable collision
    self.fixture:setSensor(true)
end

-- When a player contacts it, end the game
function Goal:beginContact(sprite)
    if not sprite:instanceOf(Player) then return end

    GameEnd()
end