# Gmod Keypad System

A secure keypad entity that allows players to input numeric codes to unlock doors or trigger logic. Originally developed for use in an SCP-RP server to simulate classified access to restricted areas like containment chambers and secure labs. 
Has since been modified for general use. It is designed to work with door entities, logic triggers, or any custom event system.

# Files:
## lua/entities/ent_keypad/
* cl_init.lua -- Handles client-side UI triggers
* init.lua -- Server-side validation and net handling
* shared.lua -- Basic entity setup

## lua/door_access/
* cl_ui.lua -- Keypad interface
* sv_logic.lua -- Server-side logic
* sh_config -- Shared config table

## lua/autorun
* door_access_loader.lua -- Auto load file.
