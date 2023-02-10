--control.lua
require("defines")

script.on_event(defines.events.on_player_died,
  function(event)
    local player = game.get_player(event.player_index)
    try_play_sound_for(player, "arnold", "hasta_la_vista")
  end
)
script.on_event(defines.events.on_player_respawned,
  function(event)
    local player = game.get_player(event.player_index)
    try_play_sound_for(player, "arnold", "i_am_back")
  end
)

script.on_event(defines.events.on_player_driving_changed_state,
  function(event)
    local player = game.get_player(event.player_index)
    if player.character.vehicle then
      try_play_sound_for(player, "arnold", "get_to_da_choppa")
    end
  end
)

script.on_event(defines.events.on_research_finished,
  function(event)
    try_play_sound("arnold", "as_satisfying_as")
  end
)
script.on_event(defines.events.on_research_started,
  function(event)
    try_play_sound("arnold", "cool")
  end
)

script.on_event(defines.events.on_rocket_launch_ordered,
  function(event)
    if event.player_index then
      local player = game.get_player(event.player_index)
      try_play_sound_for(player, "arnold", "ill_be_back1")
    end
  end
)




  -- on_player_joined_game ?