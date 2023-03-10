require("__strats-voicepacks-base__.helpers")

local pack = "gaming"
local vn_gamer = "gamer"
local vn_gordon = "gordon_freeman"

data:extend{
    setting_volume(pack, vn_gamer, 3.0),
    setting_sound(pack, vn_gamer, "do_girls_game"),
    setting_sound(pack, vn_gamer, "fast_gaming"),
    setting_sound(pack, vn_gamer, "gaming"),
    setting_sound(pack, vn_gamer, "gaming_gaming_gaming"),
    setting_sound(pack, vn_gamer, "honey_im_gaming"),
    setting_sound(pack, vn_gamer,
                  "ive_got_an_overwhelming_sense_of_pride_and_accomplishment_from_gaming"),
    setting_sound(pack, vn_gamer, "mom_im_playing_video_games"),
    setting_sound(pack, vn_gamer, "roses_are_red_violets_are_gaming"),
    setting_sound(pack, vn_gamer, "uhhhh_im_about_to_game"),
    setting_event(pack, vn_gamer, "on_player_damaged__hp_critical",
                  "uhhhh_im_about_to_game"),
    setting_event(pack, vn_gamer, "on_player_damaged__hp_low",
                  "gaming_gaming_gaming"),
    setting_event(pack, vn_gamer, "on_player_damaged__hit", "gaming", 0.1),
    setting_event(pack, vn_gamer, "on_player_died", "gaming"),
    setting_event(pack, vn_gamer, "on_player_respawned", "do_girls_game"),
    setting_event(pack, vn_gamer, "on_player_driving_changed_state__enter",
                  "gaming_gaming_gaming"),
    setting_event(pack, vn_gamer, "on_research_finished",
                  "uhhhh_im_about_to_game"),
    setting_event(pack, vn_gamer, "on_research_started", "fast_gaming"),
    setting_event(pack, vn_gamer, "on_rocket_launch_ordered__riding",
                  "honey_im_gaming"),
    setting_event(pack, vn_gamer, "on_player_joined_game",
                  "mom_im_playing_video_games"),
    setting_event(pack, vn_gamer, "on_military_target_killed", "gaming", 0.1)
}

data:extend{
    setting_volume(pack, vn_gordon, 3.0),
    setting_sound(pack, vn_gordon, "acquired"),
    setting_sound(pack, vn_gordon, "activated"),
    setting_sound(pack, vn_gordon, "alert"),
    setting_sound(pack, vn_gordon, "ammo_depleted"),
    setting_sound(pack, vn_gordon, "ammo_pickup"),
    setting_sound(pack, vn_gordon, "armor_gone"),
    setting_sound(pack, vn_gordon, "beep"),
    setting_sound(pack, vn_gordon, "bell"),
    setting_sound(pack, vn_gordon, "biohazard_detected"),
    setting_sound(pack, vn_gordon, "blip"),
    setting_sound(pack, vn_gordon, "boop"),
    setting_sounds(pack, vn_gordon, "breathe", "breathe1,breathe2"),
    setting_sound(pack, vn_gordon, "buzz"),
    setting_sound(pack, vn_gordon, "danger"),
    setting_sound(pack, vn_gordon, "evacuate_area"),
    setting_sound(pack, vn_gordon, "flatline"),
    setting_sound(pack, vn_gordon, "fuzz"),
    setting_sound(pack, vn_gordon, "guncock"),
    setting_sound(pack, vn_gordon, "health_critical"),
    setting_sounds(pack, vn_gordon, "health_dropping",
                   "health_dropping,health_dropping2"),
    setting_sound(pack, vn_gordon, "heartbeat"),
    setting_sound(pack, vn_gordon, "hev_damage"),
    setting_sound(pack, vn_gordon, "hev_general_fail"),
    setting_sound(pack, vn_gordon, "hiss"),
    setting_sound(pack, vn_gordon, "medcharge"),
    setting_sound(pack, vn_gordon, "medshot"),
    setting_sound(pack, vn_gordon, "near_death"),
    setting_sounds(pack, vn_gordon, "pain", "pain2,pain4,pain5,pain6,pain7"),
    setting_sound(pack, vn_gordon, "radiation_detected"),
    setting_sound(pack, vn_gordon, "safe_day"),
    setting_sound(pack, vn_gordon, "smallmedkit"),
    setting_sound(pack, vn_gordon, "suitcharge"),
    setting_sound(pack, vn_gordon, "suitchargeok"),
    setting_sound(pack, vn_gordon, "time_is_now"),
    setting_sound(pack, vn_gordon, "warning"),
    setting_sound(pack, vn_gordon, "weapon_pickup"),
    setting_event(pack, vn_gordon, "on_player_armor_inventory_changed__removed",
                  "armor_gone"),
    setting_event(pack, vn_gordon,
                  "on_player_armor_inventory_changed__equipped", "suitchargeok"),
    setting_event(pack, vn_gordon, "on_player_ammo_inventory_changed__empty",
                  "ammo_depleted"),
    setting_event(pack, vn_gordon, "on_player_ammo_inventory_changed__full",
                  "guncock"),
    setting_event(pack, vn_gordon, "on_player_gun_inventory_changed__equipped",
                  "guncock"),
    setting_event(pack, vn_gordon, "on_player_damaged__hp_critical",
                  "near_death"),
    setting_event(pack, vn_gordon, "on_player_damaged__hp_low", "hev_damage"),
    setting_event(pack, vn_gordon, "on_player_damaged__hit", "pain"),
    setting_event(pack, vn_gordon, "on_player_died", "flatline"),
    setting_event(pack, vn_gordon, "on_player_respawned", "activated"),
    setting_event(pack, vn_gordon, "on_player_driving_changed_state__enter",
                  "evacuate_area"),
    setting_event(pack, vn_gordon, "on_research_finished", "boop"),
    setting_event(pack, vn_gordon, "on_research_started", "bell"),
    setting_event(pack, vn_gordon, "on_rocket_launch_ordered__riding",
                  "safe_day"),
    setting_event(pack, vn_gordon, "on_player_joined_game", "safe_day")
}
