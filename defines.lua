VOICES = {
    arnold = {
        sounds = {
            affirmative = {},
            as_satisfying_as = {},
            chill_out = {},
            cool = {},
            deep_trouble = {},
            do_it_now = {
                variations = {
                    "do_it_now1", "do_it_now2", "do_it_now3", "do_it_now4",
                    "do_it_now5"
                }
            },
            f_you = {variations = {"f_you1", "f_you2", "f_you3"}},
            get_down = {},
            get_to_da_choppa = {},
            good_guys = {},
            grant_me_revenge_the_hell_with_you = {},
            green_berret_for_breakfast = {},
            hahaha = {variations = {"hahaha0", "hahaha1", "hahaha2", "hahaha3"}},
            hasta_la_vista = {},
            hi = {},
            how_are_you = {},
            i_am_a_cyber_organism = {},
            i_am_back = {},
            i_am_the_party_poopah = {},
            if_it_bleeds = {},
            ill_be_back = {variations = {"ill_be_back1", "ill_be_back2"}},
            to_be_or_not_to_be = {},
            you_belong_to_me_there_is_no_bathroom = {}
        },
        events = {
            on_player_died = "hasta_la_vista",
            on_player_respawned = "i_am_back",
            on_player_driving_changed_state = "get_to_da_choppa",
            on_research_finished = "as_satisfying_as",
            on_research_started = "cool",
            on_rocket_launch_ordered = "ill_be_back",
            on_player_joined_game = "you_belong_to_me_there_is_no_bathroom",
            on_military_target_killed = "hahaha"
        }
    },
    gamer = {
        sounds = {
            do_girls_game = {},
            fast_gaming = {},
            gaming = {},
            gaming_gaming_gaming = {},
            honey_im_gaming = {},
            ive_got_an_overwhelming_sense_of_pride_and_accomplishment_from_gaming = {},
            mom_im_playing_video_games = {},
            roses_are_red_violets_are_gaming = {},
            uhhhh_im_about_to_game = {}
        },
        events = {
            on_player_died = "gaming",
            on_player_respawned = "do_girls_game",
            on_player_driving_changed_state = "gaming_gaming_gaming",
            on_research_finished = "uhhhh_im_about_to_game",
            on_research_started = "fast_gaming",
            on_rocket_launch_ordered = "honey_im_gaming",
            on_player_joined_game = "mom_im_playing_video_games",
            on_military_target_killed = "gaming"
        }
    }
}
function try_play_event_voice(voice, event_name, position)
    if voice == nil then return end
    voice_data = VOICES[voice]
    if voice_data == nil then return end
    events_data = voice_data["events"]
    if events_data == nil then return end
    sound = events_data[event_name]
    if sound then try_play_sound(voice, sound, position) end
end

function try_play_event_voice_for_player(player, event_name)
    if player == nil then return end
    voice = player_config(player.index, 'voice')
    try_play_event_voice(voice, event_name, player.position)
end

function config_key(name) return 'strats:sounds-' .. name end

function config(name) return settings.startup[config_key(name)].value end

function player_config(player_index, name)
    return settings.get_player_settings(player_index)[config_key(name)].value
end

function sound(category, name)
    return '__strats-sounds__/sound/' .. category .. '/' .. name .. ".ogg"
end

function sound_key(category, name)
    return 'strats:sounds-' .. category .. '.' .. name
end

function create_sound_prototype(category, name)
    return {
        type = 'sound',
        name = sound_key(category, name),
        filename = sound(category, name)
    }
end

function create_sound_prototype_with_variations(category, name, variations)
    variations_data = {}
    for i, v in pairs(variations) do
        table.insert(variations_data, {filename = sound(category, v)})
    end
    return {
        type = 'sound',
        name = sound_key(category, name),
        variations = variations_data
    }
end

function try_play_sound_for(player, category, name)
    try_play_sound(category, name, player.position)
end

function try_play_sound(category, name, position)
    local k = sound_key(category, name)
    if game.is_valid_sound_path(k) then
        game.play_sound({path = k, position = position})
    else
        game.print("failed to play sound [" .. category .. "/" .. name ..
                       "]. Please let strategineer know about this.")
    end
end
