local entity = require "libs.core.entity"
local spriteComponent = require "libs.components.sprite"
local sprite = function(image)
    local self = entity()
    self:addComponent(spriteComponent(image,self))
    return self
end

return sprite