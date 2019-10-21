local Scene = require "libs.core.scene"
local Wheel = require "src.world1.entities.wheel.wheel"
local Sprite = require "libs.entities.sprite"

local myscene = Scene()
local bg = Sprite(assets.bg)
bg.name = "bg"
--bg.layer = "bg"

myscene:add(bg)

local w= Wheel()
myscene:add(w)

local w2 = Wheel()
w2.y=0
w2.x=0
myscene:add(w2)
--myscene.camera.target = w2
--w2.kill()
return myscene



