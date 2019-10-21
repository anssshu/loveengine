
function love.load()
    wheel = love.graphics.newImage("res/wheel.png") 
    x=200
  end
  
  
  function love.update(dt)
   if x < 500 then x = x+2
   else x=200
   end
  end
  
  
  function love.draw()
      love.graphics.draw(wheel,x,600,4,4)
  end