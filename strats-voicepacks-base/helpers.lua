function config_key(voice, setting_type, setting_value)
    local s = "strats-voicepacks-pack-" .. voice .. ":" .. setting_type
    if setting_value ~= nil then s = s .. ":" .. setting_value end
    return s
end

function setting_volume(voice, volume)
    return {
        name = config_key(voice, "volume"),
        type = 'double-setting',
        default_value = volume,
        setting_type = 'startup',
        order = "0"
    }
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

function setting_event(voice, event, sound, p)
    probability = 1.0
    if p ~= nil then probability = p end
    return {
        name = config_key(voice, "events", event),
        type = 'string-setting',
        default_value = sound .. "-" .. probability,
        setting_type = 'startup',
        order = "b - " .. event
    }
end
