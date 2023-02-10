require('defines')

data:extend{
    { 
        name          = config_key('arnold-announcer-enabled'),
        type          = 'bool-setting',
        setting_type  = 'startup',
        default_value = true,
        order         = 'a',
    },
    {
        name          = config_key('i-am-arnold-enabled'),
        type          = 'bool-setting',
        setting_type  = 'runtime-per-user',
        default_value = true,
        order         = 'b',
    },
    { 
        name          = config_key('kill-bark-probability'),
        type          = 'double-setting',
        setting_type  = 'runtime-per-user',
        default_value = 0.1,
        minimum_value = 0.0,
        maximum_value = 1.0,
        order         = 'c',
    },
}