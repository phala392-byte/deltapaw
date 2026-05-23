--- Centers the current world map on the viewport (no scaling).
--- Uses world offset (world.x, world.y) so camera follow is unaffected.
--- Call after map is loaded; works for any TMX map size.
---@param world World
local function centerMap(world)
    if not world or not world.map then return end

    local map = world.map

    local map_w = map.width * map.tile_width
    local map_h = map.height * map.tile_height

    world.x = math.floor((SCREEN_WIDTH - map_w) / 2)
    world.y = math.floor((SCREEN_HEIGHT - map_h) / 2)
end

-- Backwards compatibility:
-- Some older code may still call centerMapOnScreen(world, zoom)
-- so we provide this global function to prevent crashes.
function centerMapOnScreen(world, _zoom)
    centerMap(world)
end

-- Transition cooldown (seconds) to prevent instant re-trigger when entering a zone
local TRANSITION_COOLDOWN = 0.25

Game._start_map_just_loaded = false

local function installHooks()
    if HookSystem then
        HookSystem.hook(World, "loadMap", function(orig, self, map, marker, facing, callback)
            if Game.started then
                Game._start_map_just_loaded = false
            end

            if type(map) == "string" and map == "kitchen" and Game._start_map_just_loaded then
                Game._start_map_just_loaded = false
                return
            end

            local ok, res = pcall(function()
                return orig(self, map, marker, facing, callback)
            end)

            if not ok then
                print("[World:loadMap] ERROR:", res)
                error(res)
            end

            if self.map and self.map.id == "hallway" and not Game.started then
                Game._start_map_just_loaded = true
            end

            if self.player then
                self.player:setScale(1)
            end

            self.door_delay = 0
            return res
        end)

        HookSystem.hook(World, "setupMap", function(orig, self, map, ...)
            orig(self, map, ...)
            self.door_delay = 0

            -- Center map after setup
            centerMap(self)
        end)

        HookSystem.hook(Transition, "onEnter", function(orig, self, chara)
            if not chara.is_player or not self.target or not self.target.map then
                return orig(self, chara)
            end

            local door_delay_value = Game.world.door_delay
            if door_delay_value and door_delay_value > TRANSITION_COOLDOWN then
                return
            end

            Game.world.door_delay = TRANSITION_COOLDOWN
            return orig(self, chara)
        end)

        return
    end

    -- Fallback for Kristal < 0.10 (no HookSystem): wrap methods manually
    local orig_loadMap = World.loadMap
    World.loadMap = function(self, map, marker, facing, callback)
        if Game.started then
            Game._start_map_just_loaded = false
        end

        if type(map) == "string" and map == "kitchen" and Game._start_map_just_loaded then
            Game._start_map_just_loaded = false
            return
        end

        local ok, res = pcall(function()
            return orig_loadMap(self, map, marker, facing, callback)
        end)

        if not ok then
            print("[World:loadMap] ERROR:", res)
            error(res)
        end

        if self.map and self.map.id == "hallway" and not Game.started then
            Game._start_map_just_loaded = true
        end

        if self.player then
            self.player:setScale(1)
        end

        self.door_delay = 0
        return res
    end

    local orig_setupMap = World.setupMap
    World.setupMap = function(self, map, ...)
        orig_setupMap(self, map, ...)
        self.door_delay = 0

        -- Center map after setup
        centerMap(self)
    end

    local orig_Transition_onEnter = Transition.onEnter
    Transition.onEnter = function(self, chara)
        if not chara.is_player or not self.target or not self.target.map then
            return orig_Transition_onEnter(self, chara)
        end

        local door_delay_value = Game.world.door_delay
        if door_delay_value and door_delay_value > TRANSITION_COOLDOWN then
            return
        end

        Game.world.door_delay = TRANSITION_COOLDOWN
        return orig_Transition_onEnter(self, chara)
    end
end

function Mod:init()
    installHooks()

    if Game.world then
        Game.world.door_delay = 0
    end

    print("Loaded " .. self.info.name .. "!")
end
