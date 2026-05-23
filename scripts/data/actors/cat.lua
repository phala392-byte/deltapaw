local actor, super = Class(Actor, "cat")

function actor:init()
    super.init(self)
    
    self.name = "Cat"
    self.width = 19
    self.height = 37
    self.soul_offset = {10, 24}
    self.color = {0, 1, 0}
    
    self.path = "cat"
    self.default = "walk"
    
    self.walk_speed = 1
    self.run_speed = 1.1

        self.hitbox = {3, 19, 12, 11}
    

    self.animations = {
        ["idle"] = {"idle", 0.2, true},
    }
    
    self.offsets = {
        ["walk/down"] = {0, 0},
        ["walk/up"] = {0, 0},
        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["idle"] = {0, 0},
    }

    self.hitbox = {7, 21, 18, 10}


    function actor:onWorldUpdate(chara)
    if chara.is_player then
        local sprite = chara.sprite
        local run_timer = chara.run_timer or 0
        local walking = sprite.walking
        
        if walking then
            if run_timer > 0 then
                if sprite.sprite ~= "run" then
                    sprite:setSprite("run")
                end
            else
                if sprite.sprite ~= "walk" then
                    sprite:setSprite("walk")
                end
            end
        else
            if sprite.sprite == "walk" or sprite.sprite == "run" then
                if not sprite.playing then
                    sprite:setAnimation("idle")
                end
            end
        end
    end
end


end

return actor