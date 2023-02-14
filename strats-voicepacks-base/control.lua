-- control.lua
require("defines")

global.player_index_who_died = 0
global.tick_died_on = 0
global.player_index_who_respawned = 0
global.tick_respawned_on = 0

local function try_play_sound(voice, name, position, player)
    local k = sound_prototype_key(voice, name)
    debug_print("trying to play sound: " .. k)
    if game.is_valid_sound_path(k) then
        debug_print("playing sound: " .. k)
        if player then
            player.play_sound({path = k, position = position})
        else
            game.play_sound({path = k, position = position})
        end
    else
        game.print("failed to play sound [" .. voice .. "/" .. name ..
                       "]. Please let strategineer know about this.")
    end
end

local function try_play_event_voice(voice, event_name, position, player)
    debug_print("Trying to play sound for voice: " .. voice .. " for event " ..
                    event_name)
    if voice == nil then
        debug_print("... nil voice")
        return
    end
    voice_data = VOICES[voice]
    if voice_data == nil then
        debug_print("... nil voice_data")
        return
    end
    events_data = voice_data["events"]
    if events_data == nil then
        debug_print("... nil events data")
        return
    end
    sound_data = events_data[event_name]
    if sound_data == nil then
        debug_print("... nil sound_data")
        return
    end
    debug_print(serpent.block(sound_data))
    sound = sound_data["sound"]
    probability = sound_data["probability"]
    if probability == nil or math.random() <= probability then
        try_play_sound(voice, sound, position, player)
    end
end

local function try_play_event_voice_announcer(event_name)
    voice = global_config('announcer')
    if voice then try_play_event_voice(voice, event_name) end
end

local function try_play_event_voice_for_player(player, event_name)
    if player == nil then return end
    voice = player_config(player.index, 'voice')
    for i, other_p in pairs(game.players) do
        if other_p == player then
            try_play_event_voice(voice, event_name, nil, player)
        else
            try_play_event_voice(voice, event_name, player.position, other_p)
        end
    end
end

script.on_event(defines.events.on_tick, function(event)
    global.player_index_who_died = global.player_index_who_died or 0
    global.tick_died_on = global.tick_died_on or 0
    if global.player_index_who_died > 0 and global.tick_died_on <=
        game.ticks_played then
        local player = game.get_player(global.player_index_who_died)
        try_play_event_voice_for_player(player, "on_player_died")
        global.player_index_who_died = 0
        global.tick_died_on = 0
    end
    -- HACK need a delay here otherwise the sound doesn't play where it's supposed to
    global.player_index_who_respawned = global.player_index_who_respawned or 0
    global.tick_respawned_on = global.tick_respawned_on or 0
    if global.player_index_who_respawned > 0 and global.tick_respawned_on + 24 <=
        game.ticks_played then
        local player = game.get_player(global.player_index_who_respawned)
        try_play_event_voice_for_player(player, "on_player_respawned")
        global.player_index_who_respawned = 0
        global.tick_respawned_on = 0
    end
end)

script.on_event(defines.events.on_player_died, function(event)
    global.player_index_who_died = event.player_index
    global.tick_died_on = event.tick
end)

script.on_event(defines.events.on_player_respawned, function(event)
    global.player_index_who_respawned = event.player_index
    global.tick_respawned_on = event.tick
end)

script.on_event(defines.events.on_player_driving_changed_state, function(event)
    local player = game.get_player(event.player_index)
    if player.character.vehicle then
        try_play_event_voice_for_player(player,
                                        "on_player_driving_changed_state__enter")
    else

        try_play_event_voice_for_player(player,
                                        "on_player_driving_changed_state__exit")
    end
end)

script.on_event(defines.events.on_research_finished, function(event)
    try_play_event_voice_announcer("on_research_finished")
end)
script.on_event(defines.events.on_research_started, function(event)
    try_play_event_voice_announcer("on_research_started")
end)

script.on_event(defines.events.on_rocket_launch_ordered, function(event)
    -- is player riding the rocket? 
    if event.player_index then
        local player = game.get_player(event.player_index)
        -- todo add an event here for the spectators watching the guy ride
        try_play_event_voice_for_player(player,
                                        "on_rocket_launch_ordered__riding")
    end
end)

script.on_event(defines.events.on_player_joined_game, function(event)
    local player = game.get_player(event.player_index)
    try_play_event_voice_for_player(player, "on_player_joined_game")
end)

script.on_event(defines.events.on_entity_damaged, function(event)
    local player = game.get_player(event.entity.player.index)
    local max_health = event.entity.prototype.max_health
    local post_health_ratio = event.final_health / max_health
    local pre_health_ratio = (event.final_health + event.final_damage_amount) /
                                 max_health
    if post_health_ratio < 0.25 and pre_health_ratio >= 0.25 then
        try_play_event_voice_for_player(player, 'on_player_damaged__hp_critical')
    elseif post_health_ratio < 0.5 and pre_health_ratio >= 0.5 then
        try_play_event_voice_for_player(player, 'on_player_damaged__hp_low')
    end
    try_play_event_voice_for_player(player, 'on_player_damaged__hit')
end, {{filter = "type", type = "character"}})

script.on_event(defines.events.on_entity_died, function(event)
    if (event.entity.is_military_target and event.cause) then
        local player = nil
        if ((event.cause.type == 'car' or event.cause.type == 'spider-vehicle') and
            event.cause.get_driver() and event.cause.get_driver().player) then
            -- driving car/tank/spider
            player = event.cause.get_driver().player
        elseif (event.cause.type == 'character') then
            -- player shooting
            player = event.cause.player
        end

        if player then
            try_play_event_voice_for_player(player, 'on_military_target_killed')
        end
    end
end, {
    {filter = "type", type = "unit"}, {filter = "type", type = "unit-spawner"},
    {filter = "type", type = "turret"}
})

script.on_event(defines.events.on_player_gun_inventory_changed, function(event)
    local player = game.get_player(event.player_index)
    local gun_inventory = player.character.get_inventory(defines.inventory
                                                             .character_guns)

    local gun_stack = gun_inventory[player.character.selected_gun_index]
    if gun_stack.count > 0 then
        try_play_event_voice_for_player(player,
                                        "on_player_gun_inventory_changed__equipped")
    else
        try_play_event_voice_for_player(player,
                                        "on_player_gun_inventory_changed__none_equipped")
    end
    try_play_event_voice_for_player(player, "on_player_gun_inventory_changed")
end)

script.on_event(defines.events.on_player_ammo_inventory_changed, function(event)
    local player = game.get_player(event.player_index)
    ammo_inventory = player.character.get_inventory(defines.inventory
                                                        .character_ammo)

    ammo_stack_for_equipped_weapon = ammo_inventory[player.character
                                         .selected_gun_index]
    if ammo_stack_for_equipped_weapon.count == 0 then
        try_play_event_voice_for_player(player,
                                        "on_player_ammo_inventory_changed__empty")
        return
    end
    if ammo_stack_for_equipped_weapon.count ==
        ammo_stack_for_equipped_weapon.prototype.stack_size then
        try_play_event_voice_for_player(player,
                                        "on_player_ammo_inventory_changed__full")
    end
    -- todo how can I make this only play once?
    -- local ratio = ammo_stack_for_equipped_weapon.count /
    --                  ammo_stack_for_equipped_weapon.prototype.stack_size
    -- if ratio < 0.10 then
    --    try_play_event_voice_for_player(player, "on_ammo_for_equipped_gun_low")
    -- end
end)

script.on_event(defines.events.on_player_armor_inventory_changed,
                function(event)
    local player = game.get_player(event.player_index)
    armor_inventory = player.character.get_inventory(defines.inventory
                                                         .character_armor)
    if armor_inventory.is_empty() then
        try_play_event_voice_for_player(player,
                                        "on_player_armor_inventory_changed__removed")
    else
        try_play_event_voice_for_player(player,
                                        "on_player_armor_inventory_changed__equipped")
    end
end)

