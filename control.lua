--control.lua
require("defines")

script.on_event(defines.events.on_player_died,
  function(event)
    if config('deathcry-enabled') then
      local player = game.get_player(event.player_index)
      player.play_sound({path=sound_key("arnold","hasta_la_vista")})
    end 
  end
)

