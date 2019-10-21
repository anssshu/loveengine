--this is a component
local sprite = function(image,e) --image is love 2d Image and e in entity
    self = {
        name = "sprite",
        img = love.graphics.newImage(image),
       
    }

    function self:create()
       
    end

    function self:update(dt)
    end

    function self:draw(e)
        love.graphics.draw(self.img,e.x+e.ox,e.y+e.oy,e.rot,e.sx*e.scale,e.sy*e.scale,e.ax*self.img:getWidth(),e.ay*self.img:getHeight())
    end

    return self

end



return sprite