--control.lua
require("defines")

script.on_event(defines.events.on_player_died,
  function(event)
    if player_config(event.player_index, 'i-am-arnold-enabled') then
      local player = game.get_player(event.player_index)
      try_play_sound_for(player, "arnold", "hasta_la_vista")
    end
  end
)
script.on_event(defines.events.on_player_respawned,
  function(event)
    if player_config(event.player_index, 'i-am-arnold-enabled') then
      local player = game.get_player(event.player_index)
      try_play_sound_for(player, "arnold", "i_am_back")
    end
  end
)

script.on_event(defines.events.on_player_driving_changed_state,
  function(event)
    if player_config(event.player_index, 'i-am-arnold-enabled') then
      local player = game.get_player(event.player_index)
      if player.character.vehicle then
        try_play_sound_for(player, "arnold", "get_to_da_choppa")
      end
    end
  end
)

script.on_event(defines.events.on_research_finished,
  function(event)
    if config('arnold-announcer-enabled') then
      try_play_sound("arnold", "as_satisfying_as")
    end
  end
)
script.on_event(defines.events.on_research_started,
  function(event)
    if config('arnold-announcer-enabled') then
      try_play_sound("arnold", "cool")
    end
  end
)

script.on_event(defines.events.on_rocket_launch_ordered,
  function(event)
    if player_config(event.player_index, 'i-am-arnold-enabled') then
      if event.player_index then
        local player = game.get_player(event.player_index)
        try_play_sound_for(player, "arnold", "ill_be_back1")
      end
    end
  end
)


script.on_event(defines.events.on_player_joined_game,
  function(event)
    if player_config(event.player_index, 'i-am-arnold-enabled') then
      local player = game.get_player(event.player_index)
      try_play_sound_for(player, "arnold", "you_belong_to_me_there_is_no_bathroom")
    end
  end
)


script.on_event(defines.events.on_entity_died,
  function(event)
      if (event.entity.is_military_target and event.cause) then
        local player = nil
        -- driving car/tank/spider
        if ((event.cause.type == 'car' or event.cause.type == 'spider-vehicle') and event.cause.get_driver() and event.cause.get_driver().player) then
          player = event.cause.get_driver().player
        -- player shooting
        elseif (event.cause.type == 'character' and event.cause.is_player()) then
          player = event.cause.player
        end
        
        if (player and player_config(player.index, 'i-am-arnold-enabled')) then
          if math.random() < player_config(player.index, 'kill-bark-probability') then
            try_play_sound_for(player, "arnold", "hahaha")
          end
        end
    end
  end
)