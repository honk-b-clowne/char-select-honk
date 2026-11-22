-- name: [CS] Honk B. Clowne
-- description: who is that... q\n\nMade by: guess\n\n\\#ff7777\\This Pack requires Character Select\nto use as a Library!

local TEXT_MOD_NAME = get_active_mod().name

-- Stops mod from loading if Character Select isn't on, Does not need to be touched
if not _G.charSelectExists then
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
    return 0
end

--[[
    Everything from here down is character data, and is loaded at the end of the file

    Note that most things here are noted out via use of '--', if there is any
    functionality you'd want to use then remove the '--' in front of the functions.

    If needbe, Replace CHAR in the tables with your character's name
    Ex: E_MODEL_CHAR -> E_MODEL_SQUISHY

    Ensure all file naming is unique from other mods.
    Prefixing your files with your character's name should work fine
    Ex: life-icon.png -> squis-icon.png

    API Documentation for Character Select can be found below:
    https://github.com/Squishy6094/character-select-coop/wiki/API-Documentation

    Use this if you're curious on how anything here works >v<
]]

--- Load Models ---
local E_MODEL_HONK = smlua_model_util_get_id("honk_geo")      -- Located in "actors"

--- Load Textures ---
local TEX_HONK_LIFE_ICON = get_texture_info("Honk64-life-icon-32p") -- Located in "textures"

-- All sound files are located in "sound" folder
local VOICETABLE_HONK = {
    [CHAR_SOUND_OKEY_DOKEY] =        'CharStartGame.ogg', -- Starting game
	[CHAR_SOUND_LETS_A_GO] =         'honk_herewego.ogg', -- Starting level
	[CHAR_SOUND_GAME_OVER] =         'honk_gameover.ogg', -- Game Overed
	[CHAR_SOUND_PUNCH_YAH] =         'CharPunch1.ogg', -- Punch 1
	[CHAR_SOUND_PUNCH_WAH] =         'CharPunch2.ogg', -- Punch 2
	[CHAR_SOUND_PUNCH_HOO] =         'CharPunch3.ogg', -- Punch 3
	[CHAR_SOUND_YAH_WAH_HOO] =       {'honk_ay.ogg', 'honk_chu.ogg', 'honk_hoo.ogg'}, -- First Jump Sounds
	[CHAR_SOUND_HOOHOO] =            'CharDoubleJump.ogg', -- Second jump sound
	[CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'CharTripleJump1.ogg', 'CharTripleJump2.ogg'}, -- Triple jump sounds
	[CHAR_SOUND_UH] =                'CharBonk.ogg', -- Soft wall bonk
	[CHAR_SOUND_UH2] =               'honk_jeez.ogg', -- Quick ledge get up
	[CHAR_SOUND_UH2_2] =             'CharLongJumpLand.ogg', -- Landing after long jump
	[CHAR_SOUND_DOH] =               'CharBonk.ogg', -- Hard wall bonk
	[CHAR_SOUND_OOOF] =              'honk_wtf.ogg', -- Attacked in air
	[CHAR_SOUND_OOOF2] =             'honk_myback.ogg', -- Land from hard bonk
	[CHAR_SOUND_HAHA] =              'honk_landing.ogg', -- Landing triple jump
	[CHAR_SOUND_HAHA_2] =            'CharWaterLanding.ogg', -- Landing in water from big fall
	[CHAR_SOUND_YAHOO] =             'CharLongJump.ogg', -- Long jump
	[CHAR_SOUND_DOH] =               'CharBonk.ogg', -- Long jump wall bonk
	[CHAR_SOUND_WHOA] =              'honk_ohmygod.ogg', -- Grabbing ledge
	[CHAR_SOUND_EEUH] =              'CharClimbLedge.ogg', -- Climbing over ledge
	[CHAR_SOUND_WAAAOOOW] =          'Screams_Male_03.ogg', -- Falling a long distance
	[CHAR_SOUND_TWIRL_BOUNCE] =      'CharFlowerBounce.ogg', -- Bouncing off of a flower spring
	[CHAR_SOUND_GROUND_POUND_WAH] =  'CharGroundPound.ogg', -- Ground Pound after startup
	[CHAR_SOUND_WAH2] =              'CharThrow.ogg', -- Throwing something
	[CHAR_SOUND_HRMM] =              'honk_myshoulder.ogg', -- Lifting something
	[CHAR_SOUND_HERE_WE_GO] =        'honk_okay.ogg', -- Star get
	[CHAR_SOUND_SO_LONGA_BOWSER] =   'honk_sorry.ogg', -- Throwing Bowser
--DAMAGE
	[CHAR_SOUND_ATTACKED] =          'CharDamaged.ogg', -- Damaged
	[CHAR_SOUND_PANTING] =           'honk_ow.ogg', -- Low health
	[CHAR_SOUND_PANTING_COLD] =      'honk_phew.ogg', -- Getting cold
	[CHAR_SOUND_ON_FIRE] =           'CharBurned.ogg', -- Burned
--SLEEP SOUNDS
	[CHAR_SOUND_IMA_TIRED] =         'honk_sleepy.ogg', -- Mario feeling tired
	[CHAR_SOUND_YAWNING] =           'CharYawn.ogg', -- Mario yawning before he sits down to sleep
	[CHAR_SOUND_SNORING1] =          'CharSnore.ogg', -- Snore Inhale
	[CHAR_SOUND_SNORING2] =          'CharExhale.ogg', -- Exhale
	[CHAR_SOUND_SNORING3] =          'honk_sleeptalk.ogg', -- Sleep talking / mumbling
--COUGHING (USED IN THE GAS MAZE)
	[CHAR_SOUND_COUGHING1] =         'CharCough1.ogg', -- Cough take 1
	[CHAR_SOUND_COUGHING2] =         'CharCough2.ogg', -- Cough take 2
	[CHAR_SOUND_COUGHING3] =         'CharCough3.ogg', -- Cough take 3
--DEATH
	[CHAR_SOUND_DYING] =             'honk_thathurts.ogg', -- Dying from damage
	[CHAR_SOUND_DROWNING] =          'CharDrowning.ogg', -- Running out of air underwater
	[CHAR_SOUND_MAMA_MIA] =          'honk_morning.ogg' -- Booted out of level
}

_G.charSelect.character_add_voice(E_MODEL_HONK, VOICETABLE_HONK)

-- All Located in "actors" folder
-- (Models do not exist in template)
--[[
local CAPTABLE_CHAR = {
    normal = smlua_model_util_get_id("FILENAME_geo"),
    wing = smlua_model_util_get_id("FILENAME_geo"),
    metal = smlua_model_util_get_id("FILENAME_geo"),
}
]]

local PALETTE_HONK = {
    [PANTS]  = "252525",
    [SHIRT]  = "ffffff",
    [GLOVES] = "ffffff",
    [SHOES]  = "ffffff",
    [HAIR]   = "ffffff",
    [SKIN]   = "fdfd69",
    [CAP]    = "00baff",
	[EMBLEM] = "fd00cc"
}
local PALETTE_HONK_CLASSIC = {
    [PANTS]  = "252525",
    [SHIRT]  = "ffffff",
    [GLOVES] = "ffffff",
    [SHOES]  = "ffffff",
    [HAIR]   = "ffffff",
    [SKIN]   = "fdfd69",
    [CAP]    = "fd00cc",
	[EMBLEM] = "00baff"
}
local PALETTE_HONK_HENGUS = {
    [PANTS]  = "087093",
    [SHIRT]  = "00ffad",
    [GLOVES] = "ffffff",
    [SHOES]  = "ffffff",
    [HAIR]   = "ffffff",
    [SKIN]   = "09baf5",
    [CAP]    = "252525",
	[EMBLEM] = "252525"
}
local PALETTE_HONK_GAMI = {
    [PANTS]  = "c24445",
    [SHIRT]  = "c24445",
    [GLOVES] = "ffffff",
    [SHOES]  = "ffffff",
    [HAIR]   = "ffffff",
    [SKIN]   = "6d4635",
    [CAP]    = "2a2a30",
	[EMBLEM] = "39191a"
}
local PALETTE_HONK_SQUISHY = {
    [PANTS]  = "121331",
    [SHIRT]  = "d5c600",
    [GLOVES] = "ffffff",
    [SHOES]  = "ffffff",
    [HAIR]   = "ffffff",
    [SKIN]   = "3d2121",
    [CAP]    = "2a2a30",
	[EMBLEM] = "0e2502"
}
local PALETTE_HONK_GREEN = {
    [PANTS]  = "062200",
    [SHIRT]  = "38b114",
    [GLOVES] = "ffffff",
    [SHOES]  = "ffffff",
    [HAIR]   = "ffffff",
    [SKIN]   = "68d343",
    [CAP]    = "38b114",
	[EMBLEM] = "38b114"
}

-- All Located in "textures" folder
-- (Textures do not exist in template)
--[[
local HEALTH_METER_CHAR = {
    label = {
        left = get_texture_info("healthleft"),
        right = get_texture_info("healthright"),
    },
    pie = {
        [1] = get_texture_info("Pie1"),
        [2] = get_texture_info("Pie2"),
        [3] = get_texture_info("Pie3"),
        [4] = get_texture_info("Pie4"),
        [5] = get_texture_info("Pie5"),
        [6] = get_texture_info("Pie6"),
        [7] = get_texture_info("Pie7"),
        [8] = get_texture_info("Pie8"),
    }
}
]]

--[[
    Everything from here down where the data is applied

    Note that nothing here other than the 'character_add' function
    is required for a custom character, if you don't have the assets
    then feel free to remove the function from the functions below
]]

local function on_character_select_load()
    -- Adds the custom character to the Character Select Menu
    CT_HONK = _G.charSelect.character_add(
        "Honk B. Clowne", -- Character Name
        "lol", -- Description
        "i did this", -- Credits
        "fdfd69",           -- Menu Color
        E_MODEL_HONK,       -- Character Model
        CT_MARIO,           -- Override Character
        TEX_HONK_LIFE_ICON, -- Life Icon
        1                   -- Camera Scale
    )
    _G.charSelect.character_set_nickname(CT_HONK, "Honk")

    -- Adds cap models to your character
    -- (Models do not exist in template)
    -- _G.charSelect.character_add_caps(E_MODEL_CHAR, CAPTABLE_CHAR)

    -- Adds a celebration star to your character
    -- (Models do not exist in template)
    --_G.charSelect.character_add_celebration_star(E_MODEL_CHAR, E_MODEL_CHAR_STAR, TEX_CHAR_STAR_ICON)

    -- Adds a palette to your character
    _G.charSelect.character_add_palette_preset(E_MODEL_HONK, PALETTE_HONK, "the silly")

    _G.charSelect.character_add_palette_preset(E_MODEL_HONK, PALETTE_HONK_CLASSIC, "old")

    _G.charSelect.character_add_palette_preset(E_MODEL_HONK, PALETTE_HONK_HENGUS, "blue man! ahh!!!")

    _G.charSelect.character_add_palette_preset(E_MODEL_HONK, PALETTE_HONK_GAMI, "funtime")

    _G.charSelect.character_add_palette_preset(E_MODEL_HONK, PALETTE_HONK_SQUISHY, "some kind of... better coin")

    _G.charSelect.character_add_palette_preset(E_MODEL_HONK, PALETTE_HONK_GREEN, "green honk")

    -- Adds a health meter to your character
    -- (Textures do not exist in template)
    -- _G.charSelect.character_add_health_meter(CT_CHAR, HEALTH_METER_CHAR)

    -- Gives your character(s) a category in the menu
    _G.charSelect.character_set_category(CT_CHAR, TEXT_MOD_NAME)

    -- Adds credits to the credits menu
    _G.charSelect.credit_add(TEXT_MOD_NAME, "You", "Pack")
end

-- Waits until the API is fully loaded before adding chars, just to be safe
hook_event(HOOK_ON_MODS_LOADED, on_character_select_load)