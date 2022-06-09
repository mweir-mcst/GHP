Player = Sprite:extend "Player"

function Player:init()
    Player.super.init(self, 16, 16, love.physics.newRectangleShape(32, 32), "dynamic")

    self.moveX = 0;
    self.moveNX = 0;
    self.moveY = 0;
    self.moveNY = 0;
    self.inMotionX = false;
    self.inMotionNX = false;
    self.inMotionY = false;
    self.inMotionNY = false;
end

function Player:update(dt)
    if self.moveX > 0 then self.moveX = self.moveX - dt end
    if self.moveNX > 0 then self.moveNX = self.moveNX - dt end
    if self.moveY > 0 then self.moveY = self.moveY - dt end
    if self.moveNY > 0 then self.moveNY = self.moveNY - dt end

    local velX, velY = self.body:getLinearVelocity()

    if self.inMotionX and self.moveX <= 0 then
        self.moveX = 0
        self.body:setLinearVelocity(velX - 128, velY)
        if self.moveNX <= 0 then self.inMotionX = false end
    end

    if self.inMotionNX and self.moveNX <= 0 then
        self.moveNX = 0
        self.body:setLinearVelocity(velX + 128, velY)
        if self.moveX <= 0 then self.inMotionX = false end
    end

    if self.inMotionY and self.moveY <= 0 then
        self.moveY = 0
        self.body:setLinearVelocity(velX, velY - 128)
        if self.moveNY <= 0 then self.inMotionY = false end
    end

    if self.inMotionNY and self.moveNY <= 0 then
        self.moveNY = 0
        self.body:setLinearVelocity(velX, velY + 128)
        if self.moveY <= 0 then self.inMotionY = false end
    end
end

function Player:draw()
    love.graphics.setColor(0, 1, 0)
    love.graphics.circle("fill", self.body:getX(), self.body:getY(), 16)
end

function Player:keypressed(key)
    local velX, velY = self.body:getLinearVelocity()

    if key == "left" or key == "a" then
        self.moveNX = self.moveNX + 0.25;
        self.body:setLinearVelocity(velX - 128, velY)
        self.inMotionNX = true
    elseif key == "right" or key == "d" then
        self.moveX = self.moveX + 0.25;
        self.body:setLinearVelocity(velX + 128, velY)
        self.inMotionX = true
    end

    if key == "up" or key == "w" then
        self.moveNY = self.moveNY + 0.25;
        self.body:setLinearVelocity(velX, velY - 128)
        self.inMotionNY = true
    elseif key == "down" or key == "s" then
        self.moveY = self.moveY + 0.25;
        self.body:setLinearVelocity(velX, velY + 128)
        self.inMotionY = true
    end

    print(self.body:getLinearVelocity())
end