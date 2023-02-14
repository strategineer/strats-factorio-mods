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
        order = "a - " .. sound,
        hidden = true
    }
end

function setting_sounds(voice, name, sounds)
    return {
        name = config_key(voice, "sounds", name),
        type = 'string-setting',
        default_value = sounds,
        setting_type = 'startup',
        order = "a - " .. name,
        hidden = true
    }
end

function setting_event(voice, event, sound, p)
    probability = 1.0
    if p ~= nil then probability = p end
    return {
        name = config_key(voice, "events", event),
        type = 'string-setting',
        default_value = sound .. "-" .. probability,
        setting_type = 'startup',
        order = "b - " .. event,
        hidden = true
    }
end
