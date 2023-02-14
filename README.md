# Strat's Factorio Mods

## Strats Voicepacks Mod

**This mod is in an alpha state and might be unstable, you have been warned.**

This mod gives your normally silent player character a voice, allowing them to verbally react to your actions and whatever is happening to them (being eaten alive by bugs for example).

This mod *should* work in singleplayer and multiplayer although I've done most of my testing so far in singleplayer (I'm hoping to rectify that very soon).

I've created a few voicepacks that you can use and I've made it as easy as possible for you to create your own voicepacks if you'd like to get creative and, possibly, surprise your friends with some funny voices.

Refer to [my Arnold voice pack](https://github.com/strategineer/strats-factorio/tree/main/strats-voicepacks-pack-arnold) as an example you can clone to make your own

### Events 

on_military_target_killed
: FILL THIS IN

on_player_ammo_inventory_changed__empty
on_player_ammo_inventory_changed__full
on_player_armor_inventory_changed__equipped
on_player_armor_inventory_changed__removed
on_player_damaged__hit
on_player_damaged__hp_critical
on_player_damaged__hp_low
on_player_died
on_player_driving_changed_state__enter
on_player_driving_changed_state__exit
on_player_gun_inventory_changed__equipped
on_player_joined_game
on_player_respawned
on_research_finished
on_research_started
on_rocket_launch_ordered


### Limitations
- Factorio (at least as of version 1.1.76) doesn't allow a mod to play a sound and have that sound "follow" a position. So if you're playing a long running voice line, and you're moving around, eventually it won't sound as though your character was saying the line anymore (you'll be hearing the sound from where the character **was** not where they **are**). I can't do anything about that other than ask the Factorio devs to work on this feature that will probably only be useful for this mod :)...
- For simplicity's sake, I've limited the number of voicepacks you can have to one per mod. This is pretty arbitrary though. With a bit of elbow grease, I can fix this.
- For now, this mod only works with .ogg sound files despite Factorio working with .wav and .voc files. Again, this is relatively arbritrary but made things simpler for me when I was putting this mod together. With a little effort I can fix this.   