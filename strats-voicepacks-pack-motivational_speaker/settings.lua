require("__strats-voicepacks-base__.helpers")

local pack = "motivational_speaker"
local vn = "motivational_speaker"

data:extend{
    setting_volume(pack, vn, 3.0), setting_sound(pack, vn, "about_to_die"),
    setting_sound(pack, vn, "ammo_wont_help"),
    setting_sound(pack, vn, "bugs_arent_going_to"),
    setting_sound(pack, vn, "correct_ratio_of_steam_engines"),
    setting_sounds(pack, vn, "die", "die,please_die,kill_these_bugs_please"),
    setting_sound(pack, vn, "guncock"),
    setting_sound(pack, vn, "lets_roll_out"),
    setting_sound(pack, vn, "make_better_choices"),
    setting_sound(pack, vn, "no_ammo_in_gun"),
    setting_sound(pack, vn, "not_like_this"),
    setting_sounds(pack, vn, "pain", "ouch,ow"),
    setting_sound(pack, vn, "priorities"),
    setting_sound(pack, vn, "protect_you_from_bugs"),
    setting_sound(pack, vn, "put_your_clothes_back_on"),
    setting_sound(pack, vn, "thank_god"),
    setting_sound(pack, vn, "try_a_little_harder"),
    setting_sound(pack, vn, "trying_to_launch_one_rocket"),
    setting_sound(pack, vn, "wake_up"),

    setting_event(pack, vn, "on_player_armor_inventory_changed__removed",
                  "put_your_clothes_back_on"),
    setting_event(pack, vn, "on_player_armor_inventory_changed__equipped",
                  "protect_you_from_bugs"),
    setting_event(pack, vn, "on_player_ammo_inventory_changed__empty",
                  "no_ammo_in_gun"),
    setting_event(pack, vn, "on_player_ammo_inventory_changed__full",
                  "ammo_wont_help"),
    setting_event(pack, vn, "on_player_gun_inventory_changed__equipped",
                  "guncock"),
    setting_event(pack, vn, "on_player_damaged__hp_critical", "about_to_die"),
    setting_event(pack, vn, "on_player_damaged__hp_low", "not_like_this"),
    setting_event(pack, vn, "on_player_damaged__hit", "pain", 0.3),
    setting_event(pack, vn, "on_player_died", "try_a_little_harder"),
    setting_event(pack, vn, "on_player_respawned", "wake_up"),
    setting_event(pack, vn, "on_player_driving_changed_state__enter",
                  "lets_roll_out"),
    setting_event(pack, vn, "on_research_finished", "thank_god"),
    setting_event(pack, vn, "on_research_started", "make_better_choices"),
    setting_event(pack, vn, "on_player_joined_game", "priorities"),
    setting_event(pack, vn, "on_military_target_killed", "die", 0.4)
}

