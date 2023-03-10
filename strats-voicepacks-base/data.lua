require("defines")

local speaker = data.raw["programmable-speaker"]["programmable-speaker"]

for voice, voice_data in pairs(VOICES) do
    for k, v in pairs(voice_data) do
        if k ~= 'sounds' then goto continue end
        volume = voice_data["volume"] or 1.0
        pack = voice_data["pack"]
        debug_log("... volume: " .. volume)
        notes = {}
        for bark_name, extra in pairs(v) do
            log("Setting up voices: " .. voice .. ":" .. bark_name)
            if extra and extra["variations"] then
                variations = extra["variations"]
                for i, variation in ipairs(variations) do
                    table.insert(notes, {
                        name = variation,
                        sound = {
                            filename = sound_filepath(pack, voice, variation)
                        }
                    })
                end
                data:extend({
                    create_sound_prototype_with_variations(pack, voice,
                                                           bark_name,
                                                           variations, volume)
                })
            else
                table.insert(notes, {
                    name = bark_name,
                    sound = {filename = sound_filepath(pack, voice, bark_name)}
                })
                data:extend({
                    create_sound_prototype(pack, voice, bark_name, volume)
                })
            end
        end
        speaker.instruments[#speaker.instruments + 1] = {
            name = voice,
            notes = notes
        }
        ::continue::
    end
end
