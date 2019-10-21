
-- main purpuse of this game object is to changing between different levels
local game= function(w)

    local self = {
        --class variables
        worlds = {},
        world=w,
        level = 1,


    }

    function self:create()
        self.world:create()
    end

    function self:start()
        self:create()
        self:play()   
    end

    function self:stop()
        self.world:stop()
    end

    function self:pause()
        self.world:pause()
    end

    function self:play()
        self.world:play()
    end

    return self

end

return game