require("defines")

local speaker = data.raw["programmable-speaker"]["programmable-speaker"]

for voice, voice_data in pairs(VOICES) do
    for k, v in pairs(voice_data) do
        if k ~= 'sounds' then goto continue end
        notes = {}
        for bark_name, extra in pairs(v) do
            if extra and extra["variations"] then
                variations = extra["variations"]
                for i, variation in ipairs(variations) do
                    table.insert(notes, {
                        name = variation,
                        sound = {filename = sound_filepath(voice, variation)}
                    })
                end
                data:extend({
                    create_sound_prototype_with_variations(voice, bark_name,
                                                           variations)
                })
            else
                table.insert(notes, {
                    name = bark_name,
                    sound = {filename = sound_filepath(voice, bark_name)}
                })
                data:extend({create_sound_prototype(voice, bark_name)})
            end
        end
        speaker.instruments[#speaker.instruments + 1] = {
            name = voice,
            notes = notes
        }
        ::continue::
    end
end
