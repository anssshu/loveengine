--declare the global parameters here

assets = require "src.world.assets"

data = {
    health = 100,
    world = 1,
    score = 0,
}

--end of global values declaration




--------MAIN GAME OBJECT CREATION------------------


--create an empty  game object
local Game = require "libs.core.game"

-- load a world or level into your game object
local world = require "src.world.world"

-- create the final  game object
local mygame = Game(world)
return mygame


