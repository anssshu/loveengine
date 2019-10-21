-- A scene object will contain the collections of game objects which are entities
-- each objects will be added to different layers 
local cam = require "libs.core.camera"
local scene = function()
    local self = {
        bg_entities={},
        entities={},
        fg_entities = {},
        currentId = 0,
        camera = cam,
        is_paused = false,
        
    }
    
    -- add entities
    function self:add(e)
        e:create(self)
        self.currentId = self.currentId + 1
        e.id =  self.currentId
        if e.layer == "bg" then
            if self.bg_entities[e.name] ~= nil then
                e.name = e.name .. e.id
            end
            self.bg_entities[e.name] = e
        elseif e.layer == "fg" then
            if self.fg_entities[e.name] ~= nil then
                e.name = e.name .. e.id
            end
            self.fg_entities[e.name] = e
        else
            if self.entities[e.name] ~= nil then
                e.name = e.name .. e.id
            end
            self.entities[e.name] = e
        end
        

        
    end
    
    
    --remove entities 
    function self:remove(e)
        if self.entities[e.name] ~= nil then
            self.entities[e.name] = nil
        end
        if self.bg_entities[e.name] ~= nil then
            self.bg_entities[e.name] = nil
        end
        if self.fg_entities[e.name] ~= nil then
            self.fg_entities[e.name] = nil
        end
    end


    --draw the scene
    function self:draw()
        --draw the bg layer
        for k,v in pairs(self.bg_entities) do 
            if v.draw ~= nil then 
                v:draw()
            end
        end

        --draw camera target layer 
        if self.camera.active then self.camera:set() end
        for k,v in pairs(self.entities) do 
            if v.draw ~= nil then 
                v:draw()
            end
        end
        if self.camera.active then self.camera:unset() end
        --draw fg layer
        for k,v in pairs(self.fg_entities) do 
            if v.draw ~= nil then 
                v:draw()
            end
        end
    end

    --update the scene
    function self:update(dt)
       
        if self.is_paused == false then
            --update camera
            self.camera:update()
             --update bg layer
            for k,v in pairs(self.bg_entities) do 
                if v.update ~= nil then 
                    v:update(dt)
                end
            end
            --update other layers
            for k,v in pairs(self.entities) do 
                if v.update ~= nil then 
                    v:update(dt)
                end
            end
        end
        --update fg_layer
        for k,v in pairs(self.fg_entities) do 
            if v.update ~= nil then 
                v:update(dt)
            end
        end
    end

    function self:pause()
       self.is_paused = true 
    end

    function self:play()
        self.is_paused = false
        function love.draw()
            self:draw()
        end
        
        function love.update(dt)
            self:update(dt)
        end
    
    
    end
    return self
end

return scene