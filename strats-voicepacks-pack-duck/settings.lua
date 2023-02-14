require("__strats-voicepacks__.helpers")

local vn = "duck"

data:extend{
    setting_sounds(vn, "quack",
                   "quack1,quack2,quack3,quack4,quack5,quack6,quack7"),
    setting_sounds(vn, "call", "call1,call2,call3,call4,call5,call6,call7"),
    setting_event(vn, "on_player_armor_inventory_changed__removed", "quack"),
    setting_event(vn, "on_player_armor_inventory_changed__equipped", "quack"),
    setting_event(vn, "on_player_ammo_inventory_changed__empty", "quack"),
    setting_event(vn, "on_player_ammo_inventory_changed__full", "quack"),
    setting_event(vn, "on_player_gun_inventory_changed__equipped", "quack"),
    setting_event(vn, "on_player_damaged__hp_critical", "quack"),
    setting_event(vn, "on_player_damaged__hp_low", "quack"),
    setting_event(vn, "on_player_damaged__hit", "quack"),
    setting_event(vn, "on_player_died", "quack"),
    setting_event(vn, "on_player_respawned", "quack"),
    setting_event(vn, "on_player_driving_changed_state", "quack"),
    setting_event(vn, "on_research_finished", "call"),
    setting_event(vn, "on_research_started", "call"),
    setting_event(vn, "on_rocket_launch_ordered", "call"),
    setting_event(vn, "on_player_joined_game", "call"),
    setting_event(vn, "on_military_target_killed", "quack")
}
