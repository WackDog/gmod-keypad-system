AddCSLuaFile()
include("shared.lua")

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

function ENT:Use(activator)
    if IsValid(activator) and activator:IsPlayer() then
        local curTime = CurTime()
        if curTime - self.LastUseTime < 1 then return end  -- 1 second cooldown
        self.LastUseTime = curTime
        print("[Keypad] Use called by", activator:Nick())
        
        net.Start("OpenKeypadUI")
        net.WriteEntity(self)
        net.Send(activator)
    end
end

