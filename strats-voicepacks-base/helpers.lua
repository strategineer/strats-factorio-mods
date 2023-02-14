function config_key(voice, setting_type, setting_value)
    return "strats-voicepacks-pack-" .. voice .. ":" .. setting_type .. ":" ..
               setting_value
end

function setting_sound(voice, sound)
    return {
        name = config_key(voice, "sounds", sound),
        type = 'string-setting',
        default_value = sound .. ".ogg",
        setting_type = 'startup',
        order = "a - " .. sound
    }
end

function setting_sounds(voice, name, sounds)
    return {
        name = config_key(voice, "sounds", name),
        type = 'string-setting',
        default_value = sounds,
        setting_type = 'startup',
        order = "a - " .. name
    }
end

function setting_event(voice, event, sound)
    return {
        name = config_key(voice, "events", event),
        type = 'string-setting',
        default_value = sound,
        setting_type = 'startup',
        order = "b - " .. event
    }
end