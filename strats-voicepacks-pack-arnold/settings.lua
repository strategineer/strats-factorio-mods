require("__strats-voicepacks__.helpers")

local vn = "arnold"

data:extend{
    setting_sound(vn, "affirmative"), setting_sound(vn, "as_satisfying_as"),
    setting_sound(vn, "chill_out"), setting_sound(vn, "cool"),
    setting_sound(vn, "deep_trouble"), setting_sound(vn, "get_down"),
    setting_sound(vn, "get_to_da_choppa"), setting_sound(vn, "good_guys"),
    setting_sound(vn, "grant_me_revenge_the_hell_with_you"),
    setting_sound(vn, "green_berret_for_breakfast"),
    setting_sound(vn, "hasta_la_vista"), setting_sound(vn, "hi"),
    setting_sound(vn, "how_are_you"),
    setting_sound(vn, "i_am_a_cyber_organism"), setting_sound(vn, "i_am_back"),
    setting_sound(vn, "i_am_the_party_poopah"),
    setting_sound(vn, "if_it_bleeds"), setting_sound(vn, "to_be_or_not_to_be"),
    setting_sound(vn, "you_belong_to_me_there_is_no_bathroom"),
    setting_sounds(vn, "do_it_now",
                   "do_it_now1,do_it_now2,do_it_now3,do_it_now4,do_it_now5"),
    setting_sounds(vn, "f_you", "f_you1,f_you2,f_you3"),
    setting_sounds(vn, "hahaha", "hahaha0,hahaha1,hahaha2,hahaha3"),
    setting_sounds(vn, "ill_be_back", "ill_be_back1,ill_be_back2"),
    setting_event(vn, "on_player_damaged__hp_critical", "f_you"),
    setting_event(vn, "on_player_damaged__hp_low", "f_you"),
    setting_event(vn, "on_player_damaged__hit", "hahaha"),
    setting_event(vn, "on_player_died", "hasta_la_vista"),
    setting_event(vn, "on_player_respawned", "i_am_back"),
    setting_event(vn, "on_player_driving_changed_state", "get_to_da_choppa"),
    setting_event(vn, "on_research_finished", "as_satisfying_as"),
    setting_event(vn, "on_research_started", "cool"),
    setting_event(vn, "on_rocket_launch_ordered", "ill_be_back"),
    setting_event(vn, "on_player_joined_game",
                  "you_belong_to_me_there_is_no_bathroom"),
    setting_event(vn, "on_military_target_killed", "hahaha")
}
