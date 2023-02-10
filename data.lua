-- data.lua
require('defines')

for voice, voice_data in pairs(VOICES) do
    for k, v in pairs(voice_data) do
        if k ~= 'sounds' then goto continue end
        for bark_name, extra in pairs(v) do
            p = nil
            log(bark_name)
            if extra and extra["variations"] then
                variations = extra["variations"]
                p = {
                    create_sound_prototype_with_variations(voice, bark_name,
                                                           variations)
                }
            else
                p = {create_sound_prototype(voice, bark_name)}
            end
            if p then data:extend(p) end
        end
        ::continue::
    end
end
