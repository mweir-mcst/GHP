-- Base class for all sprites
Sprite = Class "Sprite"

-- Constructor
function Sprite:init(x, y, shape, bodyType)
    -- Create a body with the user data that points to the sprite
    self.body = love.physics.newBody(World, x, y, bodyType)
    self.body:setUserData(self)
    -- Store the shape
    self.shape = shape
    -- Create a fixture
    self.fixture = love.physics.newFixture(self.body, self.shape)
    -- Add the sprite to the list of sprites
    table.insert(Sprites.sprites, self)
end

-- Used to find the index of a sprite in the spirtes table
function Sprite.findIndex(sprite)
    for index, currentSprite in pairs(Sprites.sprites) do
        if sprite == currentSprite then
            return index
        end
    end
end

-- Destructor for the sprite
function Sprite:destroy()
    -- Remove the sprite from the list of sprites
    table.remove(Sprites.sprites, Sprite.findIndex(self))
    -- Destroy the body
    self.body:destroy()
end

-- Parent functions for all the sprite actions
function Sprite:update() end
function Sprite:draw() end
function Sprite:keypressed() end
function Sprite:beginContact() end
function Sprite:endContact() end