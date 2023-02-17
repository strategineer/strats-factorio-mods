# Strats Voicepacks Mod

**This mod is in an alpha state and might be unstable, you have been warned.**

This mod gives your normally silent player character a voice, allowing them to verbally react to your actions and whatever is happening to them (being eaten alive by bugs for example).

This mod *should* work in singleplayer and multiplayer although I've done most of my testing so far in singleplayer (I'm hoping to rectify that very soon).

I've created a few voicepacks that you can use and I've made it as easy as possible for you to create your own voicepacks if you'd like to get creative and, possibly, surprise your friends with some funny voices.

Refer to [my Arnold voice pack](https://github.com/strategineer/strats-factorio/tree/main/strats-voicepacks-pack-arnold) as an example you can clone to make your own

## Events 

**on_military_target_killed**: Triggered when the player kills a military target (enemy unit, spawner, etc.) on foot or in a vehicle. 

**on_player_ammo_inventory_changed__empty**: Triggered when the player's equipped gun has no more ammo. 

**on_player_ammo_inventory_changed__full**: Triggered when the player's equipped gun has a full stack of ammo.

**on_player_armor_inventory_changed__equipped**: Triggered when the player puts on armor or changes their armor.

**on_player_armor_inventory_changed__removed**: Triggered when the player takes off their armor or their armor is destroyed.

**on_player_damaged__hit**: Triggered when the player is damaged.
**on_player_damaged__hp_critical**: Triggered when the player reaches critical HP (less than 25%).

**on_player_damaged__hp_low**: Triggered when the player reaches low HP (less than 50%).

**on_player_died**: Triggered when the player dies.

**on_player_driving_changed_state__enter**: Triggered when the player enters a vehicle.

**on_player_driving_changed_state__exit**: Triggered when the player exits a vehicle.

**on_player_gun_inventory_changed__equipped**: Triggered when the player equips a different gun.

**on_player_gun_inventory_changed__none_equipped**: Triggered when the player unequips their equipped gun.

**on_player_gun_inventory_changed**: Triggered when the player's equipped gun changes.

**on_player_joined_game**: Triggered when the player joins the game (only works in multiplayer).

**on_player_respawned**: Triggered when the player respawns.

**on_research_finished**: Triggered when the selected research item completes (plays for all players, think of this like an announcer).

**on_research_started**: Triggered when a research item is started (plays for all players, think of this like an announcer).

**on_rocket_launch_ordered__riding**: Triggered when the player is riding the rocket when it's being launched.


## Limitations
- Factorio (at least as of version 1.1.76) doesn't allow a mod to play a sound and have that sound "follow" a position. So if you're playing a long running voice line, and you're moving around, eventually it won't sound as though your character was saying the line anymore (you'll be hearing the sound from where the character **was** not where they **are**). I can't do anything about that other than ask the Factorio devs to work on this feature that will probably only be useful for this mod :)...
- For simplicity's sake, I've limited the number of voicepacks you can have to one per mod. This is pretty arbitrary though. With a bit of elbow grease, I can fix this.
- For now, this mod only works with .ogg sound files despite Factorio working with .wav and .voc files. Again, this is relatively arbritrary but made things simpler for me when I was putting this mod together. With a little effort I can fix this.   