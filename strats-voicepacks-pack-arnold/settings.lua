require("__strats-voicepacks-base__.helpers")

local pack = "arnold"
local vn = "arnold"

data:extend{
    setting_volume(pack, vn, 3.0), setting_sound(pack, vn, "affirmative"),
    setting_sound(pack, vn, "as_satisfying_as"),
    setting_sound(pack, vn, "chill_out"), setting_sound(pack, vn, "cool"),
    setting_sound(pack, vn, "deep_trouble"),
    setting_sound(pack, vn, "get_down"),
    setting_sound(pack, vn, "get_to_da_choppa"),
    setting_sound(pack, vn, "good_guys"),
    setting_sound(pack, vn, "grant_me_revenge_the_hell_with_you"),
    setting_sound(pack, vn, "green_berret_for_breakfast"),
    setting_sound(pack, vn, "hasta_la_vista"), setting_sound(pack, vn, "hi"),
    setting_sound(pack, vn, "how_are_you"),
    setting_sound(pack, vn, "i_am_a_cyber_organism"),
    setting_sound(pack, vn, "i_am_back"),
    setting_sound(pack, vn, "i_am_the_party_poopah"),
    setting_sound(pack, vn, "if_it_bleeds"),
    setting_sound(pack, vn, "to_be_or_not_to_be"),
    setting_sound(pack, vn, "you_belong_to_me_there_is_no_bathroom"),
    setting_sounds(pack, vn, "do_it_now",
                   "do_it_now1,do_it_now2,do_it_now3,do_it_now4,do_it_now5"),
    setting_sounds(pack, vn, "f_you", "f_you1,f_you2,f_you3"),
    setting_sounds(pack, vn, "hahaha", "hahaha0,hahaha1,hahaha2,hahaha3"),
    setting_sounds(pack, vn, "ill_be_back", "ill_be_back1,ill_be_back2"),
    setting_event(pack, vn, "on_player_damaged__hp_critical", "f_you"),
    setting_event(pack, vn, "on_player_damaged__hp_low", "f_you"),
    setting_event(pack, vn, "on_player_damaged__hit", "hahaha", 0.2),
    setting_event(pack, vn, "on_player_died", "hasta_la_vista"),
    setting_event(pack, vn, "on_player_respawned", "i_am_back"),
    setting_event(pack, vn, "on_player_driving_changed_state__enter",
                  "get_to_da_choppa"),
    setting_event(pack, vn, "on_research_finished", "as_satisfying_as"),
    setting_event(pack, vn, "on_research_started", "cool"),
    setting_event(pack, vn, "on_rocket_launch_ordered__riding", "ill_be_back"),
    setting_event(pack, vn, "on_player_joined_game",
                  "you_belong_to_me_there_is_no_bathroom"),
    setting_event(pack, vn, "on_military_target_killed", "hahaha", 0.25)
}
