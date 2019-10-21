
local entity =function ()
    local self = {
        name = '',
        x=0.0,
        y=0.0,
        rot = 0.0,
        scale = 1.0,
        sx=1,--sacle x
        sy=1,--scale y
        ax=0.5,--x anchor
        ay=0.5,--y anchor
        ox=0.0,
        oy=0.0,
        --layers can be bg(independent of camera) , fg(independent of camera) , game
        layer = "game",
        components = {},
        scene = {} -- required for removing it at the time of destroying the object
    }

    function self:addComponent(c)
        self.components[c.name] = c
    end

    function self:removeComponent(c)
        if self.components[c.name] then
            self.components[c.name] = nil
        end
    end

    --create the entity as per each component
    function self:create(s)
        self.scene = s
        for k,v in pairs(self.components) do 
            if v.create ~= nil then 
                v:create()
            end
        end
    end
    --update
    function self:update(dt)
        --for each component update the update function 
        for k,v in pairs(self.components) do 
            if v.update ~= nil then 
                v:update()
            end
        end
    end
    --draw
    function self:draw()
        --for each component update the draw function 
        for k,v in pairs(self.components) do 
            if v.draw ~= nil then 
                v:draw(self)
            end
        end
    end
    function self:kill()
        self.scene:remove(self)
        self = nill
    end
    return self
end


return entity
