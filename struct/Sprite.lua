Sprite = Class "Sprite"
Sprites = {}

function Sprite:init(x, y, shape, bodyType)
    self.body = love.physics.newBody(World, x, y, bodyType)
    self.shape = shape
    self.fixture = love.physics.newFixture(self.body, self.shape)
    table.insert(Sprites, self)
end

function Sprite.findIndex(sprite)
    for index, currentSprite in pairs(Sprites) do
        if sprite == currentSprite then
            return index
        end
    end
end

function Sprite:destroy()
    table.remove(Sprites, Sprite.findIndex(self))
    self.body:destroy()
end

function Sprite:update() end
function Sprite:draw() end
function Sprite:keypressed() end
function Sprite:leftMouseClick() end
function Sprite:beginContact() end