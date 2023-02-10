function config_key(name)
    return 'strats:sounds-'..name
    end

function config(name)
    return settings.startup[config_key(name)].value
    end

    
function player_config(player_index, name)
    return settings.get_player_settings(player_index)[config_key(name)].value
    end

function sound(category, name)
    return '__strats-sounds__/sound/'..category..'/'..name..'.ogg'
    end

function sound_key(category, name)
    return 'strats:sounds-'..category..'.'..name
    end

function create_sound_prototype(category, name)
    return {
        type = 'sound',
        name = sound_key(category, name),
        filename = sound(category, name)
      }
    end

function try_play_sound_for(player, category, name)
    local k = sound_key(category, name)
    if game.is_valid_sound_path(k) then
        player.play_sound({path=k})
    else
        game.print("failed to play sound ["..category..'/'..name.."]. Please let strategineer know about this.")
    end
end
  
function try_play_sound(category, name)
    local k = sound_key(category, name)
    if game.is_valid_sound_path(k) then
        game.play_sound({path=k})
    else
        game.print("failed to play sound ["..category..'/'..name.."]. Please let strategineer know about this.")
    end
end