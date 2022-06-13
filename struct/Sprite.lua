Sprite = Class "Sprite"

function Sprite:init(x, y, shape, bodyType)
    self.body = love.physics.newBody(World, x, y, bodyType)
    self.shape = shape
    self.fixture = love.physics.newFixture(self.body, self.shape)
    table.insert(Sprites.sprites, self)
end

function Sprite.findIndex(sprite)
    for index, currentSprite in pairs(Sprites.sprites) do
        if sprite == currentSprite then
            return index
        end
    end
end

function Sprite.findByFixture(fixture)
    for _, sprite in pairs(Sprites.sprites) do
        if sprite.fixture == fixture then
            return sprite
        end
    end
end

function Sprite:destroy()
    table.remove(Sprites.sprites, Sprite.findIndex(self))
    self.body:destroy()
end

function Sprite:update() end
function Sprite:draw() end
function Sprite:keypressed() end
function Sprite:leftMouseClick() end
function Sprite:beginContact() end
function Sprite:endContact() end