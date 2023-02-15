function config_key(modpack, voice, setting_type, setting_value)
    local s = "strats-voicepacks-pack-" .. modpack .. ":" .. voice .. ":" ..
                  setting_type
    if setting_value ~= nil then s = s .. ":" .. setting_value end
    return s
end

function setting_volume(modpack, voice, volume)
    return {
        name = config_key(modpack, voice, "volume"),
        type = 'double-setting',
        default_value = volume,
        setting_type = 'startup',
        order = "0"
    }
end

function setting_sound(modpack, voice, sound)
    return {
        name = config_key(modpack, voice, "sounds", sound),
        type = 'string-setting',
        default_value = sound .. ".ogg",
        setting_type = 'startup',
        order = "a - " .. sound
    }
end

function setting_sounds(modpack, voice, name, sounds)
    return {
        name = config_key(modpack, voice, "sounds", name),
        type = 'string-setting',
        default_value = sounds,
        setting_type = 'startup',
        order = "a - " .. name
    }
end

function setting_event(modpack, voice, event, sound, p)
    probability = 1.0
    if p ~= nil then probability = p end
    return {
        name = config_key(modpack, voice, "events", event),
        type = 'string-setting',
        default_value = sound .. "-" .. probability,
        setting_type = 'startup',
        order = "b - " .. event
    }
end
