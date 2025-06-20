-- door_access/sv_logic.lua

-- Server handler for unlock attempt
net.Receive("AttemptUnlock", function(len, ply)
    local keypad = net.ReadEntity()
    local inputCode = net.ReadString()

    -- Ensure keypad is valid and has a code + distance check
    if not IsValid(keypad) or not keypad.Code then return end
    if keypad:GetPos():Distance(ply:GetPos()) > DoorAccess.MaxUseDistance then return end

    -- If code is correct, check for door within radius and unlock
    if inputCode == keypad.Code then
        local nearby = ents.FindInSphere(keypad:GetPos(), DoorAccess.UnlockRadius)
        for _, ent in ipairs(nearby) do
            if IsValid(ent) and ent:isDoor() then
                ent:Fire("Unlock")
                ent:Fire("Open")
            end
        end

        -- Log success to console
        print("[Door System] " .. ply:Nick() .. " unlocked a door with code: " .. inputCode)
    else
        -- Notify player has failed
        ply:ChatPrint("Incorrect code.")
    end
end)

-- Utility function to identify doors
local meta = FindMetaTable("Entity")
function meta:isDoor()
    local class = self:GetClass()
    return class == "func_door" or class == "func_door_rotating" or class == "prop_door_rotating"
end