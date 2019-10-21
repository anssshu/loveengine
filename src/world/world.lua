
local World = require "libs.core.world"
local Scene = require "libs.core.scene"
local Sprite = require "libs.entities.sprite"

--create a scene
local s = Scene()

--add a background
local bg = Sprite(assets.bg)
bg.x = love.graphics.getWidth()/2
bg.y = love.graphics.getHeight()/2
--bg.layer = "bg" -- this will be always infront of the camear
bg.scale = 0.7
s:add(bg)

--create an object to which camera will track

local chick =  Sprite("res/world/chick.png")

chick.scale =.6

function chick:update()
    local speed = 10
    self.x = self.x+1*speed
    self.rot = self.rot + 0.1
end
s:add(chick)

s.camera.target = chick
--ceate a world
local w= World(s)


--export the world
--so the it will be imported and attached the game object
return w