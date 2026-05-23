local actor, super = Class(Actor, "dummy")

function actor:init()
    super.init(self)

    -- Display name
    self.name = "Owner"

    -- Width and height for this actor
    self.width = 27
    self.height = 45

    -- Hitbox in the overworld
    self.hitbox = {0, 25, 19, 14}

    -- Color for outline areas
    self.color = {1, 0, 0}

    -- Horizontal flip direction (nil = no flip)
    self.flip = nil

    -- Path to this actor's sprites
    self.path = "enemies/dummy"
    -- Default sprite/animation
    self.default = "idle"

    -- ---------------------------------------------------------------
    -- Portrait for dialogue boxes
    -- Set portrait_path to the folder that contains portrait PNGs.
    -- Kristal looks for:  assets/sprites/<portrait_path>/<emote>.png
    -- If the file doesn't exist the box simply shows no portrait —
    -- so we can already reference the emotes even before art is ready.
    -- ---------------------------------------------------------------
    self.portrait_path = "actors/dummy"

    -- Sound played while speaking (nil = silent)
    self.voice = nil

    -- Portrait offset (x, y) — adjust once real portrait art arrives
    self.portrait_offset = {0, 0}

    -- Follower blush
    self.can_blush = false

    -- ---------------------------------------------------------------
    -- Talk sprites: {sprite, frame_time}
    -- Each key matches an emote tag used in cutscene:text("…", "emote")
    -- ---------------------------------------------------------------
    self.talk_sprites = {
        -- fallback / neutral (empty string = default)
        [""]        = {"idle",    0.25},
        ["neutral"] = {"idle",    0.25},
        -- emotions — these will animate once portrait PNGs exist
        ["sleepy"]  = {"idle",    0.3},
        ["happy"]   = {"idle",    0.2},
        ["laugh"]   = {"idle",    0.2},
        ["sad"]     = {"idle",    0.3},
    }

    -- ---------------------------------------------------------------
    -- Sprite animations
    -- walk/* directions are used by walkTo() automatically.
    -- cooking / eating are looped during the kitchen scene.
    -- ---------------------------------------------------------------
    self.animations = {
        -- Standing idle
        ["idle"]         = {"idle", 0.3, true},

        -- Walking (all 4 directions — Kristal expects "walk/<dir>")
        -- Until real walk frames exist, these fall back to idle.
        ["walk/down"]    = {"idle", 0.2, true},
        ["walk/up"]      = {"idle", 0.2, true},
        ["walk/left"]    = {"idle", 0.2, true},
        ["walk/right"]   = {"idle", 0.2, true},

        -- Scene-specific loops (swap sprite name when art is ready)
        ["cooking"]      = {"idle", 0.25, true},
        ["eating"]       = {"idle", 0.25, true},
    }

    -- ---------------------------------------------------------------
    -- Sprite offsets (indexed by sprite name)
    -- ---------------------------------------------------------------
    self.offsets = {
        ["idle"]      = {0, 0},
        ["walk/down"]  = {0, 0},
        ["walk/up"]    = {0, 0},
        ["walk/left"]  = {0, 0},
        ["walk/right"] = {0, 0},
        ["cooking"]   = {0, 0},
        ["eating"]    = {0, 0},
    }
end

return actor