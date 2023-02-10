require("defines")

local speaker = data.raw["programmable-speaker"]["programmable-speaker"]

-- TODO use the VOICES in defines.lua to set this up

speaker.instruments[#speaker.instruments + 1] = {
    name = "Gamer",
    notes = {
        {
            name = "Do Girls Game",
            sound = {filename = sound("gamer", "do_girls_game")}
        }, {
            name = "Sense of Pride",
            sound = {
                filename = sound("gamer",
                                 "ive_got_an_overwhelming_sense_of_pride_and_accomplishment_from_gaming")
            }
        },
        {
            name = "Fast gamer",
            sound = {filename = sound("gamer", "fast_gaming")}
        }, {
            name = "Mom I am Playing Video Games",
            sound = {filename = sound("gamer", "mom_im_playing_video_games")}
        }, {name = "Gaming", sound = {filename = sound("gamer", "gaming")}}, {
            name = "Violets are Gaming",
            sound = {
                filename = sound("gamer", "roses_are_red_violets_are_gaming")
            }
        }, {
            name = "Gaming 3x",
            sound = {filename = sound("gamer", "gaming_gaming_gaming")}
        }, {
            name = "About To Game",
            sound = {filename = sound("gamer", "uhhhh_im_about_to_game")}
        }, {
            name = "Honey Im Gaming",
            sound = {filename = sound("gamer", "honey_im_gaming")}
        }
    }
}

speaker.instruments[#speaker.instruments + 1] = {
    name = "Arnold",
    notes = {
        {
            name = "Affirmative",
            sound = {filename = sound("arnold", "affirmative")}
        }, {
            name = "As Satisfying As",
            sound = {filename = sound("arnold", "as_satisfying_as")}
        },
        {name = "Chill Out", sound = {filename = sound("arnold", "chill_out")}},
        {name = "Cool", sound = {filename = sound("arnold", "cool")}},
        {
            name = "Deep Trouble",
            sound = {filename = sound("arnold", "deep_trouble")}
        },
        {
            name = "Do It Now 1",
            sound = {filename = sound("arnold", "do_it_now1")}
        },
        {
            name = "Do It Now 2",
            sound = {filename = sound("arnold", "do_it_now2")}
        },
        {
            name = "Do It Now 3",
            sound = {filename = sound("arnold", "do_it_now3")}
        },
        {
            name = "Do It Now 4",
            sound = {filename = sound("arnold", "do_it_now4")}
        },
        {
            name = "Do It Now 5",
            sound = {filename = sound("arnold", "do_it_now5")}
        }, {name = "FU 1", sound = {filename = sound("arnold", "f_you1")}},
        {name = "FU 2", sound = {filename = sound("arnold", "f_you2")}},
        {name = "FU 3", sound = {filename = sound("arnold", "f_you3")}},
        {name = "Get Down", sound = {filename = sound("arnold", "get_down")}},
        {
            name = "Get To Da Choppa",
            sound = {filename = sound("arnold", "get_to_da_choppa")}
        },
        {name = "Good Guys", sound = {filename = sound("arnold", "good_guys")}},
        {
            name = "Grant Me Revenge",
            sound = {
                filename = sound("arnold", "grant_me_revenge_the_hell_with_you")
            }
        }, {
            name = "Breakfast",
            sound = {filename = sound("arnold", "green_berret_for_breakfast")}
        }, {name = "Hahaha 0", sound = {filename = sound("arnold", "hahaha0")}},
        {name = "Hahaha 1", sound = {filename = sound("arnold", "hahaha1")}},
        {name = "Hahaha 2", sound = {filename = sound("arnold", "hahaha2")}},
        {name = "Hahaha 3", sound = {filename = sound("arnold", "hahaha3")}}, {
            name = "Hasta La Vista",
            sound = {filename = sound("arnold", "hasta_la_vista")}
        }, {name = "Hi", sound = {filename = sound("arnold", "hi")}},
        {
            name = "How Are You",
            sound = {filename = sound("arnold", "how_are_you")}
        }, {
            name = "I Am a Cyber Organism",
            sound = {filename = sound("arnold", "i_am_a_cyber_organism")}
        },
        {name = "I Am Back", sound = {filename = sound("arnold", "i_am_back")}},
        {
            name = "I Am the Party Poopah",
            sound = {filename = sound("arnold", "i_am_the_party_poopah")}
        },
        {
            name = "If It Bleeds",
            sound = {filename = sound("arnold", "if_it_bleeds")}
        },
        {
            name = "Ill Be Back 1",
            sound = {filename = sound("arnold", "ill_be_back1")}
        },
        {
            name = "Ill Be Back 2",
            sound = {filename = sound("arnold", "ill_be_back2")}
        }, {
            name = "To Be Or Not To Be",
            sound = {filename = sound("arnold", "to_be_or_not_to_be")}
        }, {
            name = "You Belong to Me",
            sound = {
                filename = sound("arnold",
                                 "you_belong_to_me_there_is_no_bathroom")
            }
        }
    }
}
