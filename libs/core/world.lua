local world = function(s)
    local self = {
        scenes ={},
        currentScene = s,
        phyWorld={},
        colWorld={},
        

    }
    --load all the resources from the imageLibrary and audioLibrary
    function self:loadResource()

    end
    function self:create()
        --load resources
        for k,v in pairs(self.scenes) do 
            if v.create ~= nil then
                v:create()
            end
        end
        --go to start scene
    end

    --update the scene 
    function self:update(dt)
        self.currentScene:update(dt)
    end

    --draw the scene
    function self:draw()
        self.currentScene:draw()
    end

    function self:stop()
        love.event.quit()
    end

    function self:pause()
        self.currentScene:pause()
    end

    function self:play()
        self.currentScene:play()
    end

    function self:gotoScene(name)
        if self.scenes[name] then 
            self.currentScene = self.scene[name]
        end
    end
    
    return self
end



return world