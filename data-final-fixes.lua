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
                        sound = create_sound_prototype(voice, variation)
                    })
                end
                p = {
                    create_sound_prototype_with_variations(voice, bark_name,
                                                           variations)
                }
                data:extend(p)
            else
                p = {create_sound_prototype(voice, bark_name)}
                table.insert(notes, {name = bark_name, sound = p})
                data:extend(p)
            end
        end
        speaker.instruments[#speaker.instruments + 1] = {
            name = voice,
            notes = notes
        }
        ::continue::
    end
end
