-- control.lua
require("defines")

script.on_event(defines.events.on_player_died, function(event)
    local player = game.get_player(event.player_index)
    try_play_event_voice_for_player(player, "on_player_died")
end)

script.on_event(defines.events.on_player_respawned, function(event)
    local player = game.get_player(event.player_index)
    try_play_event_voice_for_player(player, "on_player_respawned")
end)

script.on_event(defines.events.on_player_driving_changed_state, function(event)
    local player = game.get_player(event.player_index)
    if player.character.vehicle then
        try_play_event_voice_for_player(player,
                                        "on_player_driving_changed_state")
    end
end)

script.on_event(defines.events.on_research_finished, function(event)
    try_play_event_voice_announcer("on_research_finished")
end)
script.on_event(defines.events.on_research_started, function(event)
    try_play_event_voice_announcer("on_research_started")
end)

script.on_event(defines.events.on_research_started, function(event)
    -- is player riding the rocket? 
    if event.player_index then
        local player = game.get_player(event.player_index)
        try_play_event_voice_for_player(player, "on_research_started")
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
        try_play_event_voice_for_player(player, 'on_player_hp_critical')
    elseif post_health_ratio < 0.5 and pre_health_ratio >= 0.5 then
        try_play_event_voice_for_player(player, 'on_player_hp_low')
    end
    if math.random() < player_config(player.index, 'damaged-bark-probability') then
        try_play_event_voice_for_player(player, 'on_player_damaged')
    end
end, {{filter = "type", type = "character"}})

script.on_event(defines.events.on_entity_died, function(event)
    if (event.entity.is_military_target and event.cause) then
        local player = nil
        if ((event.cause.type == 'car' or event.cause.type == 'spider-vehicle') and
            event.cause.get_driver() and event.cause.get_driver().player) then
            -- driving car/tank/spider
            player = event.cause.get_driver().player
        elseif (event.cause.type == 'character' and event.cause.is_player()) then
            -- player shooting
            player = event.cause.player
        end

        if player then
            if math.random() <
                player_config(player.index, 'kill-bark-probability') then
                try_play_event_voice_for_player(player,
                                                'on_military_target_killed')
            end
        end
    end
end, {
    {filter = "type", type = "unit"}, {filter = "type", type = "unit-spawner"},
    {filter = "type", type = "turret"}
})
