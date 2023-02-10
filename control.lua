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

  -- on_player_joined_game ?