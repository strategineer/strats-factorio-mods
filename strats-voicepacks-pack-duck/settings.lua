require("__strats-voicepacks-base__.helpers")

local pack = "duck"
local vn = "duck"

data:extend{
    setting_volume(pack, vn, 2), setting_sounds(pack, vn, "quack",
                                                "quack1,quack2,quack3,quack4,quack5,quack6,quack7"),
    setting_sounds(pack, vn, "call", "call1,call2,call3,call4,call5,call6,call7"),
    setting_event(pack, vn, "on_player_armor_inventory_changed__removed",
                  "quack"),
    setting_event(pack, vn, "on_player_armor_inventory_changed__equipped",
                  "quack"),
    setting_event(pack, vn, "on_player_ammo_inventory_changed__empty", "quack"),
    setting_event(pack, vn, "on_player_ammo_inventory_changed__full", "quack"),
    setting_event(pack, vn, "on_player_gun_inventory_changed__equipped", "quack"),
    setting_event(pack, vn, "on_player_damaged__hp_critical", "quack"),
    setting_event(pack, vn, "on_player_damaged__hp_low", "quack"),
    setting_event(pack, vn, "on_player_damaged__hit", "quack", 0.2),
    setting_event(pack, vn, "on_player_died", "quack"),
    setting_event(pack, vn, "on_player_respawned", "quack"),
    setting_event(pack, vn, "on_player_driving_changed_state__enter", "quack"),
    setting_event(pack, vn, "on_research_finished", "call"),
    setting_event(pack, vn, "on_research_started", "call"),
    setting_event(pack, vn, "on_rocket_launch_ordered__riding", "call"),
    setting_event(pack, vn, "on_player_joined_game", "call"),
    setting_event(pack, vn, "on_military_target_killed", "quack", 0.4),
    setting_event(pack, vn, "on_built_entity", "quack", 0.25),
    setting_event(pack, vn, "on_player_mined_entity", "quack"),
    setting_event(pack, vn, "on_player_mined_item", "quack", 0.25),
    setting_event(pack, vn, "on_player_placed_equipment", "quack"),
    setting_event(pack, vn, "on_player_removed_equipment", "quack"),
    setting_event(pack, vn, "on_player_repaired_entity", "quack")
}
