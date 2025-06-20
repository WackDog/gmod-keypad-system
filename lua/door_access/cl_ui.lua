-- door_access/cl_ui.lua

-- Client-side handler for opening keypad UI
net.Receive("OpenKeypadUI", function()

    -- Read entity + safety check
    local ent = net.ReadEntity()
    if not IsValid(ent) then return end

    -- Create main UI for keypad
    local frame = vgui.Create("DFrame")
    frame:SetSize(200, 150)
    frame:Center()
    frame:SetTitle("Enter Access Code")
    frame:MakePopup()

    -- Create numeric text entry
    local textEntry = vgui.Create("DTextEntry", frame)
    textEntry:SetSize(160, 30)
    textEntry:SetPos(20, 40)
    textEntry:SetNumeric(true)
    textEntry:SetPlaceholderText("Enter Code")
    textEntry:SetUpdateOnType(true)
    textEntry:SetText("")

    -- Create submit button
    local submitBtn = vgui.Create("DButton", frame)
    submitBtn:SetSize(160, 30)
    submitBtn:SetPos(20, 90)
    submitBtn:SetText("Unlock")

    -- On click, send unlock attempt with entered code
    submitBtn.DoClick = function ()
        local code = textEntry:GetValue()
        if code == "" then return end

        net.Start("AttemptUnlock")
        net.WriteEntity(ent)
        net.WriteString(code)
        net.SendToServer()

        -- Close UI
        frame:Close()
        
    end
end)