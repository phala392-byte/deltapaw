local character, super = Class(PartyMember, "cat")

function character:init()
    super.init(self)
    self:setActor("cat")
    self.name = "Cat"
end

return character