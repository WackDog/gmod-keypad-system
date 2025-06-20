-- ent_keypad/init.lua

AddCSLuaFile()
include("shared.lua")

-- Definitions for when entity spawned 
function ENT:Initialize()
    self:SetModel("models/props_lab/keypad.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    local phys = self:GetPhysicsObject()
    if IsValid(phys) then phys:Wake() end

    self.Code = DoorAccess.DefaultCode
    self.LastUseTime = 0
end

-- Called when player presses 'E' on keypad
function ENT:Use(activator)
    if IsValid(activator) and activator:IsPlayer() then
        local curTime = CurTime()

        -- Prevent spamming 'E': once per second
        if curTime - self.LastUseTime < 1 then return end  -- 1 second cooldown
        self.LastUseTime = curTime

        -- Debug print
        print("[Keypad] Use called by", activator:Nick())
        
        -- Open keypad UI on client
        net.Start("OpenKeypadUI")
        net.WriteEntity(self)
        net.Send(activator)
    end
end

