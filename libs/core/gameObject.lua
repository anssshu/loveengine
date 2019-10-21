-- all entities and components will inherit from the gameObject

local gameObject = function()
    local self = {}

    function self:create()
    end

    function self:update(dt)
    end

    function self:draw()
    end

    return self
end

return gameObject