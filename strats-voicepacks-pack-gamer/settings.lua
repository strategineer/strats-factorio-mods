require("__strats-voicepacks-base__.helpers")

local vn = "gamer"

data:extend{
    setting_sound(vn, "do_girls_game"), setting_sound(vn, "fast_gaming"),
    setting_sound(vn, "gaming"), setting_sound(vn, "gaming_gaming_gaming"),
    setting_sound(vn, "honey_im_gaming"), setting_sound(vn,
                                                        "ive_got_an_overwhelming_sense_of_pride_and_accomplishment_from_gaming"),
    setting_sound(vn, "mom_im_playing_video_games"),
    setting_sound(vn, "roses_are_red_violets_are_gaming"),
    setting_sound(vn, "uhhhh_im_about_to_game"),
    setting_event(vn, "on_player_damaged__hp_critical", "uhhhh_im_about_to_game"),
    setting_event(vn, "on_player_damaged__hp_low", "gaming_gaming_gaming"),
    setting_event(vn, "on_player_damaged__hit", "gaming"),
    setting_event(vn, "on_player_died", "gaming"),
    setting_event(vn, "on_player_respawned", "do_girls_game"),
    setting_event(vn, "on_player_driving_changed_state__enter",
                  "gaming_gaming_gaming"),
    setting_event(vn, "on_research_finished", "uhhhh_im_about_to_game"),
    setting_event(vn, "on_research_started", "fast_gaming"),
    setting_event(vn, "on_rocket_launch_ordered", "honey_im_gaming"),
    setting_event(vn, "on_player_joined_game", "mom_im_playing_video_games"),
    setting_event(vn, "on_military_target_killed", "gaming")
}
