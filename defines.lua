function config(name)
    return settings.startup['strats:sounds-'..name].value
    end
    
function sound(category, name)
  return '__strats-sounds__/sound/'..category..'/'..name..'.ogg'
  end

function sound_key(category, name)
  return 'strats:sounds-'..category..'.'..name
  end
