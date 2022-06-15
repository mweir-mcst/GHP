-- Code for the player sprite (the cute little guy you move around)
Player = Sprite:extend "Player"

-- Constructor for the player
function Player:init(x, y)
    Player.super.init(self, x, y, love.physics.newCircleShape(love.physics.getMeter() * 2 / 5), "dynamic")
    -- Make it not rotate
    self.body:setFixedRotation(true)
    -- Give the player a speed of 6
    self.speed = 6
    -- Determine the region of the tileset to draw
    self.quad = love.graphics.newQuad(4 * 16, 29 * 16, 16, 16, Tileset:getWidth(), Tileset:getHeight())
end

-- Handle the player's movement
function Player:handleMovement(dt)
    local xVel, yVel = self.body:getLinearVelocity()
    xVel = xVel / love.physics.getMeter()
    yVel = yVel / love.physics.getMeter()

    -- Move left if left is down
    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        self.sxFactor = 1

        if xVel > self.speed / 2 then
            xVel = self.speed / 2
        end

        if xVel > -self.speed then
            xVel = xVel - self.speed * dt * 4;
            if xVel < -self.speed then
                xVel = -self.speed
            end
        end

    -- Move right if right is down
    elseif love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        self.sxFactor = -1

        if xVel < -self.speed / 2 then
            xVel = -self.speed / 2
        end

        if xVel < self.speed then
            xVel = xVel + self.speed * dt * 4;
            if xVel > self.speed then
                xVel = self.speed
            end
        end
    
    -- Friction
    elseif xVel > 0 then
        xVel = xVel - self.speed * dt * 2

        if xVel < 0 then
            xVel = 0
        end

    elseif xVel < 0 then
        xVel = xVel + self.speed * dt * 2

        if xVel > 0 then
            xVel = 0
        end
    end

    -- Move up if up is down
    if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        if yVel > self.speed / 2 then
            yVel = self.speed / 2
        end

        if yVel > -self.speed then
            yVel = yVel - self.speed * dt * 4;
            if yVel < -self.speed then
                yVel = -self.speed
            end
        end

    -- Move down if down is down
    elseif love.keyboard.isDown("down") or love.keyboard.isDown("s") then
        if yVel < -self.speed / 2 then
            yVel = -self.speed / 2
        end
        if yVel < self.speed then
            yVel = yVel + self.speed * dt * 4;
            if yVel > self.speed then
                yVel = self.speed
            end
        end

    -- Friction
    elseif yVel > 0 then
        yVel = yVel - self.speed * dt * 2

        if yVel < 0 then
            yVel = 0
        end

    elseif yVel < 0 then
        yVel = yVel + self.speed * dt * 2

        if yVel > 0 then
            yVel = 0
        end
    end

    self.body:setLinearVelocity(xVel * love.physics.getMeter(), yVel * love.physics.getMeter())
end

-- Handle the player's movement every time the sprite updates
function Player:update(dt)
    self:handleMovement(dt)
end

-- Draw the player
function Player:draw()
    love.graphics.draw(Tileset, self.quad, self.body:getX(), self.body:getY() - love.physics.getMeter() * 3 / 5, 0, self.sxFactor, 1, love.physics.getMeter() / 2, 0)
end