-- todo add to each speaker seperately
VOLUME = 3
-- todo make this extendable and put each voice into its own mod
--   how? use startup settings to set up everything then use that data in data/control stage of our mod
--   CON: can only save string/double/bool values... Maybe not a problem
--   PRO: make it so that players can easily swap sounds in and out to customize their voicepack to their liking from the available options
--   being able to split strings might be useful? 

VOICES = {
    motivational_speaker = {
        sounds = {
            about_to_die = {},
            ammo_wont_help = {},
            bugs_arent_going_to = {},
            correct_ratio_of_steam_engines = {},
            die = {variations = {"die", "please_die", "kill_these_bugs_please"}},
            guncock = {},
            lets_roll_out = {},
            make_better_choices = {},
            no_ammo_in_gun = {},
            not_like_this = {},
            pain = {variations = {"ouch", "ow"}},
            priorities = {},
            protect_you_from_bugs = {},
            put_your_clothes_back_on = {},
            thank_god = {},
            try_a_little_harder = {},
            trying_to_launch_one_rocket = {},
            wake_up = {}
        },
        events = {
            on_player_armor_inventory_changed__removed = "put_your_clothes_back_on",
            on_player_armor_inventory_changed__equipped = "protect_you_from_bugs",
            on_player_ammo_inventory_changed__empty = "no_ammo_in_gun",
            on_player_ammo_inventory_changed__full = "ammo_wont_help",
            on_player_gun_inventory_changed__equipped = "guncock",
            on_player_damaged__hp_critical = "about_to_die",
            on_player_damaged__hp_low = "not_like_this",
            on_player_damaged__hit = "pain",
            on_player_died = "try_a_little_harder",
            on_player_respawned = "wake_up",
            on_player_driving_changed_state = "lets_roll_out",
            on_research_finished = "thank_god",
            on_research_started = "make_better_choices",
            -- on_rocket_launch_ordered = "",
            on_player_joined_game = "priorities",
            on_military_target_killed = "die"
        }
    },
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
            on_player_gun_inventory_changed__equipped = "guncock",
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
        filename = sound_filepath(voice, name),
        category = "gui-effect",
        volume = VOLUME
    }
end

function create_sound_prototype_with_variations(voice, name, variations)
    variations_data = {}
    for i, v in pairs(variations) do
        table.insert(variations_data,
                     {volume = VOLUME, filename = sound_filepath(voice, v)})
    end
    return {
        type = 'sound',
        name = sound_prototype_key(voice, name),
        variations = variations_data,
        category = "gui-effect"
    }
end
