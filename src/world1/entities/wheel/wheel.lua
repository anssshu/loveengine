
local Sprite = require "libs.entities.sprite"

local wheel = function()

local self= Sprite(assets.wheel)

self.y = love.graphics.getHeight()/2
self.x = love.graphics.getWidth()/2


function self:update(dt)
    --self.x = self.x+1.0
    self.rot = self.rot +0.1
    
end
    
return self

end

return wheel