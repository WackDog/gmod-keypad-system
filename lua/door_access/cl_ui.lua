net.Receive("OpenKeypadUI", function()
    local ent = net.ReadEntity()
    if not IsValid(ent) then return end

    local frame = vgui.Create("DFrame")
    frame:SetSize(200, 150)
    frame:Center()
    frame:SetTitle("Enter Access Code")
    frame:MakePopup()

    local textEntry = vgui.Create("DTextEntry", frame)
    textEntry:SetSize(160, 30)
    textEntry:SetPos(20, 40)
    textEntry:SetNumeric(true)
    textEntry:SetPlaceholderText("Enter Code")
    textEntry:SetUpdateOnType(true)
    textEntry:SetText("")

    local submitBtn = vgui.Create("DButton", frame)
    submitBtn:SetSize(160, 30)
    submitBtn:SetPos(20, 90)
    submitBtn:SetText("Unlock")

    submitBtn.DoClick = function ()
        local code = textEntry:GetValue()
        if code == "" then return end

        net.Start("AttemptUnlock")
        net.WriteEntity(ent)
        net.WriteString(code)
        net.SendToServer()

        frame:Close()
        
    end
end)