--this is a world object


local world = require "libs.core.world"
local mainscene = require "src.world1.scenes.mainscene"

local w = world(mainscene)

return w
