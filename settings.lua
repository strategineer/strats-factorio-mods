require('defines')

local voices = {'gordon_freeman', 'arnold', 'gamer'}

data:extend{
    {
        name = config_key('announcer'),
        type = 'string-setting',
        setting_type = 'runtime-global',
        default_value = 'arnold',
        allowed_values = voices,
        order = 'g - a'
    }, {
        name = config_key('voice'),
        type = 'string-setting',
        setting_type = 'runtime-per-user',
        default_value = 'arnold',
        allowed_values = voices,
        order = 'b'
    }, {
        name = config_key('kill-bark-probability'),
        type = 'double-setting',
        setting_type = 'runtime-per-user',
        default_value = 0.1,
        minimum_value = 0.0,
        maximum_value = 1.0,
        order = 'c'
    }, {
        name = config_key('damaged-bark-probability'),
        type = 'double-setting',
        setting_type = 'runtime-per-user',
        default_value = 0.1,
        minimum_value = 0.0,
        maximum_value = 1.0,
        order = 'c'
    }
}
