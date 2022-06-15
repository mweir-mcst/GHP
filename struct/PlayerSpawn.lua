-- Code for the playerspawn "sprite" (actually just a class that is used to spawn the player)
PlayerSpawn = Class "PlayerSpawn"

-- Constructor
function PlayerSpawn:init(x, y, spawn)
    -- Store the position and the actual spawn
    self.x = x
    self.y = y
    Spawn = self
    -- If we want, spawn the player immediately
    if spawn then
        self:spawnPlayer()
    end
end

-- Spawns the player
function PlayerSpawn:spawnPlayer()
    LocalPlayer = Player(self.x, self.y)
end