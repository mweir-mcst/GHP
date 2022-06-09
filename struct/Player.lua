Player = Sprite:extend "Player"

function Player:init()
    -- making the player sprite (currently a rectangle)
    Player.super.init(self, 100, 100, love.physics.newRectangleShape(love.physics.getMeter(), love.physics.getMeter() * 2), "dynamic")
    self.body:setFixedRotation(true)
    -- setting the speed to 6
    self.speed = 6
end

function Player:handleMovement(dt)
    local xVel, yVel = self.body:getLinearVelocity()
    xVel = xVel / love.physics.getMeter()
    yVel = yVel / love.physics.getMeter()

    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        if xVel > self.speed / 2 then
            xVel = self.speed / 2
        end

        if xVel > -self.speed then
            xVel = xVel - self.speed * dt * 4;
            if xVel < -self.speed then
                xVel = -self.speed
            end
        end

    elseif love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        if xVel < -self.speed / 2 then
            xVel = -self.speed / 2
        end

        if xVel < self.speed then
            xVel = xVel + self.speed * dt * 4;
            if xVel > self.speed then
                xVel = self.speed
            end
        end

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
-- updating the handleMovement function
function Player:update(dt)
    self:handleMovement(dt)
end
-- drawing the player sprite
function Player:draw()
    love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
end