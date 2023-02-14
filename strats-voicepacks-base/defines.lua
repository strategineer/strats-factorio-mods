local DEBUG = false

local ESCAPED_STRATS_VOICEPACKS_PACK_SETTING_PREFIX =
    "strats%-voicepacks%-pack%-"
local STRATS_VOICEPACKS_PACK_SETTING_PREFIX = "strats-voicepacks-pack-"
local STRATS_VOICEPACKS_MOD_NAME = "strats-voicepacks-base"
-- todo make code much more robust
-- todo allow non ogg formats
-- todo allow each mod to set their own volume
local VOLUME = 3

function debug_log(s) if DEBUG then log(s) end end
function debug_print(s)
    if DEBUG then
        if game ~= nil then game.print(s) end
        log(s)
    end
end

local function split(inputstr, sep)
    if sep == nil then sep = "%s" end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

function build_voices()
    local voices = {}
    local our_settings = nil
    if data ~= nil and data.raw ~= nil and data.raw["string-setting"] ~= nil then
        debug_log("using data.raw")
        our_settings = data.raw["string-setting"]
    else
        debug_log("using settings.startup")
        our_settings = settings.startup
    end
    for k, v in pairs(our_settings) do
        -- todo how to allow more than one voice pack per mod
        i, j = string.find(k, ESCAPED_STRATS_VOICEPACKS_PACK_SETTING_PREFIX)
        if j ~= nil then
            log("handling setting: " .. k)
            local tail = string.sub(k, j + 1)
            log("tail is: " .. tail)
            local parts = split(tail, ":")
            local voice_name = parts[1]
            -- todo expect sounds or events, log if wrong
            local setting_type = parts[2]
            -- name of sound or name of event
            local setting_value = parts[3]
            -- todo v should contain the path to a soundfile or a comma seperated list of soundfiles
            debug_log("voice_name: " .. voice_name)
            debug_log("setting_type: " .. setting_type)
            debug_log("setting_value: " .. setting_value)
            local v_to_set = v.default_value or v.value
            local prob = nil
            if setting_type == "events" then
                -- todo log if event is wrong
                debug_log("... handling event: " .. v_to_set)
                if string.find(v_to_set, "-") then
                    debug_log("... event with probability found")
                    params = split(v_to_set, "-")
                    v_to_set = params[1]
                    prob = tonumber(params[2])
                    debug_log("... found probability: " .. prob)
                end
                debug_log("... setting: " .. v_to_set)
            else
                if setting_type == "sounds" then
                    if string.find(v_to_set, ",") then
                        debug_log("... setting variations: " .. v_to_set)
                        local sounds = split(v_to_set, ",")
                        v_to_set = {variations = sounds}
                    else
                        debug_log("... setting: " .. v_to_set)
                    end
                else
                    log("UNEXPECTED ERROR")
                    goto continue_setup
                end
            end
            if prob ~= nil then
                debug_log("... probability: " .. prob)
            end
            if v_to_set ~= nil then
                if voices[voice_name] == nil then
                    voices[voice_name] = {}
                end
                if voices[voice_name][setting_type] == nil then
                    voices[voice_name][setting_type] = {}
                end
                if setting_type ~= "events" then
                    voices[voice_name][setting_type][setting_value] = v_to_set
                else
                    local d = {sound = v_to_set, probability = prob}
                    debug_print("... DEBUG" .. serpent.block(d))
                    voices[voice_name][setting_type][setting_value] = d
                end
            end
            ::continue_setup::
        end
    end
    return voices
end

function config_key(name) return STRATS_VOICEPACKS_MOD_NAME .. '-' .. name end

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
    return
        '__' .. STRATS_VOICEPACKS_PACK_SETTING_PREFIX .. voice .. '__/sound/' ..
            voice .. '/' .. name .. ".ogg"
end

function sound_prototype_key(voice, name)
    return STRATS_VOICEPACKS_PACK_SETTING_PREFIX .. voice .. '.' .. name
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

VOICES = build_voices()
