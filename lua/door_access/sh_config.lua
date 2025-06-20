-- door_access/sh_config.lua

DoorAccess = DoorAccess or {}
-- Default code applied to new keypads
DoorAccess.DefaultCode = "1234"

-- Radius in which the keypad looks for doors to unlock (in units)
DoorAccess.UnlockRadius = 100

-- How far a player can be to use the keypad
DoorAccess.MaxUseDistance = 100

-- Sound paths (optional, used by UI or unlock feedback)
DoorAccess.Sounds = {
    Success = "buttons/button9.wav",
    Failure = "buttons/button10.wav"
}

-- UI settings (colors, fonts, etc)
DoorAccess.Colors = {
    Background = Color(40, 40, 40),
    Text = Color(255, 255, 255),
    Button = Color(70, 130, 180)
}