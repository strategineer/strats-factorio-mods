require("__strats-voicepacks__.helpers")

local vn = "motivational_speaker"

data:extend{
    setting_sound(vn, "about_to_die"), setting_sound(vn, "ammo_wont_help"),
    setting_sound(vn, "bugs_arent_going_to"),
    setting_sound(vn, "correct_ratio_of_steam_engines"),
    setting_sounds(vn, "die", "die,please_die,kill_these_bugs_please"),
    setting_sound(vn, "guncock"), setting_sound(vn, "lets_roll_out"),
    setting_sound(vn, "make_better_choices"),
    setting_sound(vn, "no_ammo_in_gun"), setting_sound(vn, "not_like_this"),
    setting_sounds(vn, "pain", "ouch,ow"), setting_sound(vn, "priorities"),
    setting_sound(vn, "protect_you_from_bugs"),
    setting_sound(vn, "put_your_clothes_back_on"),
    setting_sound(vn, "thank_god"), setting_sound(vn, "try_a_little_harder"),
    setting_sound(vn, "trying_to_launch_one_rocket"),
    setting_sound(vn, "wake_up"),

    setting_event(vn, "on_player_armor_inventory_changed__removed",
                  "put_your_clothes_back_on"),
    setting_event(vn, "on_player_armor_inventory_changed__equipped",
                  "protect_you_from_bugs"),
    setting_event(vn, "on_player_ammo_inventory_changed__empty",
                  "no_ammo_in_gun"),
    setting_event(vn, "on_player_ammo_inventory_changed__full", "ammo_wont_help"),
    setting_event(vn, "on_player_gun_inventory_changed__equipped", "guncock"),
    setting_event(vn, "on_player_damaged__hp_critical", "about_to_die"),
    setting_event(vn, "on_player_damaged__hp_low", "not_like_this"),
    setting_event(vn, "on_player_damaged__hit", "pain"),
    setting_event(vn, "on_player_died", "try_a_little_harder"),
    setting_event(vn, "on_player_respawned", "wake_up"),
    setting_event(vn, "on_player_driving_changed_state", "lets_roll_out"),
    setting_event(vn, "on_research_finished", "thank_god"),
    setting_event(vn, "on_research_started", "make_better_choices"),
    setting_event(vn, "on_player_joined_game", "priorities"),
    setting_event(vn, "on_military_target_killed", "die")
}

