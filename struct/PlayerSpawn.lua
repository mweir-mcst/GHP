PlayerSpawn = Class "PlayerSpawn"

Spawns = {}

function PlayerSpawn:init(x, y, spawn)
    self.x = x
    self.y = y
    table.insert(Spawns, self)
    if spawn then
        self:spawnPlayer()
    end
end

function PlayerSpawn:spawnPlayer()
    LocalPlayer = Player(self.x, self.y)
end