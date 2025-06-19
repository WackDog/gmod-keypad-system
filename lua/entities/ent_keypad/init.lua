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
end

function ENT:Use(activator)
    if IsValid(activator) and activator:IsPlayer() then
        net.Start("OpenKeypadUI")
        net.WriteEntity(self)
        net.Send(activator)
    end
end

