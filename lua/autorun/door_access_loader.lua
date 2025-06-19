if SERVER then
    AddCSLuaFile("door_access/cl_ui.lua")
    AddCSLuaFile("door_access/sh_config.lua")

    include("door_access/sh_config.lua")
    include("door_access/sv_logic.lua")

else
    include("door_access/cl_ui.lua")
    include("door_access/sh_config.lua")
end

util.AddNetworkString("OpenKeypadUI")
util.AddNetworkString("AttemptUnlock")