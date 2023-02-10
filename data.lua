--data.lua
require('defines')

data:extend({
  create_sound_prototype("arnold", "hasta_la_vista"),
  create_sound_prototype("arnold", "i_am_back"),
  create_sound_prototype("arnold", "get_to_da_choppa"),
  create_sound_prototype("arnold", "as_satisfying_as"),
  create_sound_prototype("arnold", "cool"),
  create_sound_prototype("arnold", "ill_be_back1"),
  create_sound_prototype("arnold", "you_belong_to_me_there_is_no_bathroom"),
  {
    type = 'sound',
    name = sound_key("arnold", "hahaha"),
    variations = {{filename = sound("arnold", "hahaha0")},{filename = sound("arnold", "hahaha1")},{filename = sound("arnold", "hahaha2")},{filename = sound("arnold", "hahaha3")}},
  },
})