-- todo make this extendable and put each voice into its own mod
VOICES = {
    gordon_freeman = {
        sounds = {
            acquired = {},
            activated = {},
            alert = {},
            ammo_depleted = {},
            ammo_pickup = {},
            armor_gone = {},
            beep = {},
            bell = {},
            biohazard_detected = {},
            blip = {},
            boop = {},
            breathe = {variations = {"breathe1", "breathe2"}},
            buzz = {},
            danger = {},
            evacuate_area = {},
            flatline = {},
            fuzz = {},
            guncock = {},
            health_critical = {},
            health_dropping = {
                variations = {"health_dropping", "health_dropping2"}
            },
            heartbeat = {},
            hev_damage = {},
            hev_general_fail = {},
            hiss = {},
            medcharge = {},
            medshot = {},
            near_death = {},
            pain = {variations = {"pain2", "pain4", "pain5", "pain6", "pain7"}},
            radiation_detected = {},
            safe_day = {},
            smallmedkit = {},
            suitcharge = {},
            suitchargeok = {},
            time_is_now = {},
            warning = {},
            weapon_pickup = {}
        },
        events = {
            on_player_armor_inventory_changed__removed = "armor_gone",
            on_player_armor_inventory_changed__equipped = "suitchargeok",
            on_player_ammo_inventory_changed__empty = "ammo_depleted",
            on_player_ammo_inventory_changed__full = "guncock",
            on_player_gun_inventory_changed = "guncock",
            on_player_damaged__hp_critical = "near_death",
            on_player_damaged__hp_low = "hev_damage",
            on_player_damaged__hit = "pain",
            on_player_died = "flatline",
            on_player_respawned = "activated",
            on_player_driving_changed_state = "evacuate_area",
            on_research_finished = "boop",
            on_research_started = "bell",
            on_rocket_launch_ordered = "safe_day",
            on_player_joined_game = "safe_day"
            -- on_military_target_killed = ""
        }
    },
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
            on_player_damaged__hp_critical = "f_you",
            on_player_damaged__hp_low = "f_you",
            on_player_damaged__hit = "hahaha",
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
            on_player_damaged__hp_critical = "uhhhh_im_about_to_game ",
            on_player_damaged__hp_low = "gaming_gaming_gaming ",
            on_player_damaged__hit = "gaming",
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

function try_play_sound(voice, name, position, player)
    local k = sound_prototype_key(voice, name)
    if game.is_valid_sound_path(k) then
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

function try_play_event_voice(voice, event_name, position, player)
    if voice == nil then return end
    voice_data = VOICES[voice]
    if voice_data == nil then return end
    events_data = voice_data["events"]
    if events_data == nil then return end
    sound = events_data[event_name]
    if sound then try_play_sound(voice, sound, position, player) end
end

function try_play_event_voice_announcer(event_name)
    if global_config('announcer') then
        voice = global_config('announcer')
        try_play_event_voice(voice, event_name)
    end
end

function try_play_event_voice_for_player(player, event_name)
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

function config_key(name) return 'strats:voicepacks-' .. name end

function startup_config(name)
    local k = config_key(name)
    return settings.startup[k].value
end

function global_config(name)
    local k = config_key(name)
    return settings.global[k].value
end

function player_config(player_index, name)
    local k = config_key(name)
    return settings.get_player_settings(player_index)[k].value
end

function sound_filepath(voice, name)
    return '__strats-voicepacks__/sound/' .. voice .. '/' .. name .. ".ogg"
end

function sound_prototype_key(voice, name)
    return 'strats:voicepacks:' .. voice .. '.' .. name
end

function create_sound_prototype(voice, name)
    return {
        type = 'sound',
        name = sound_prototype_key(voice, name),
        filename = sound_filepath(voice, name)
    }
end

function create_sound_prototype_with_variations(voice, name, variations)
    variations_data = {}
    for i, v in pairs(variations) do
        table.insert(variations_data, {filename = sound_filepath(voice, v)})
    end
    return {
        type = 'sound',
        name = sound_prototype_key(voice, name),
        variations = variations_data
    }
end
