require('defines')

local voicepack_names = {''}
local default_voice_pack = ''

for k, v in pairs(VOICES) do
    log("voice_pack name: " .. k)
    table.insert(voicepack_names, k)
    default_voice_pack = k
end

data:extend{
    {
        name = config_key('announcer'),
        type = 'string-setting',
        setting_type = 'runtime-global',
        default_value = default_voice_pack,
        allow_blank = true,
        allowed_values = voicepack_names,
        order = 'g - a'
    }, {
        name = config_key('voice'),
        type = 'string-setting',
        setting_type = 'runtime-per-user',
        default_value = default_voice_pack,
        allow_blank = true,
        allowed_values = voicepack_names,
        order = 'b'
    }
}
