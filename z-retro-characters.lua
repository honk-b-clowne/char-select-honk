if not retroCharAPI then return end

SMB_RED = retroCharAPI.SMB_RED
SMB_WHITE = retroCharAPI.SMB_WHITE
SMB_DEFAULT_SKIN = retroCharAPI.SMB_DEFAULT_SKIN
SMB_PINK = retroCharAPI.SMB_PINK

function setup_retro_sprites()
    retroCharAPI.add_cs_character_sprites(CT_HONK, get_texture_info("honkretro_0"), get_texture_info("honkretro_1"))
  

    retroCharAPI.add_cs_character_palette(CT_HONK, {SKIN, GLOVES, SHIRT}, {SKIN, EMBLEM, SHIRT}, 1, 2)
   
end

hook_event(HOOK_ON_MODS_LOADED, setup_retro_sprites)