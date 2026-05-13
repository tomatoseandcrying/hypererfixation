return {
    descriptions = {
        Joker = {
            j_hpfxp_isaac = {
                name = "{f:hpfxp_IsaacGame}Isaac",
                text = {
                    {
                        '{C:chips}+#1#{} Chips'
                    },
                    { --only render if effect is unlocked (The D6)
                        'This Joker gains',
                        '{C:attention}1{} free shop {C:green}Reroll{}',
                        'for every {C:money}$#4#{} you spend',
                        '{C:inactive}(Currently #2# #3#){}'
                    }
                }
            },
            j_hpfxp_maggy = {
                name = "{f:hpfxp_IsaacGame}Magdalene",
                text = {
                    {
                        '{C:chips}+#1#{} Chips'
                        --make her also give 10 Mult once unlocked (Full Health pill)
                    },
                    { --Yum Heart
                        'Ranks of played cards',
                        'with {C:hearts}#2#{} suit are',
                        'increased by {C:attention}#3#{}',
                        '{s:0.85,C:inactive}(Aces become 2s){}'
                    }

                }
            },
            j_hpfxp_cain = {
                name = "{f:hpfxp_IsaacGame}Cain",
                text = {
                    {
                        '{C:chips}+#1#{} Chips'
                    },
                    { --Lucky Foot
                        'Increases all {C:attention}listed{}',
                        '{C:green}probabilities{} by {C:green}#2#%{}',
                        '{C:inactive}(Rounded up){}'
                    }
                    --make him also make booster packs 50/50 free once unlocked (Paper Clip)
                }
            },
            j_hpfxp_judas = {
                name = "{f:hpfxp_IsaacGame}Judas",
                text = {
                    {
                        '{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult'
                    },
                    { --Book of Belial
                        'This Joker gains {C:mult}+#3#{} Mult for',
                        'every {C:money}$#4#{} you spend, resets',
                        'when {C:attention}Boss Blind{} is defeated'
                    }
                }
            },
            j_hpfxp_threequestionmarks = {
                name = {
                    "{f:hpfxp_IsaacGame}???",
                    "{s:0.6,f:hpfxp_IsaacGame}\"Blue Baby\"{}"
                },
                text = {
                    {
                        '{C:chips}+#1#{} Chips',
                        '{C:chips}+#2#{} Chips for the next {C:blue}Blue Fly'
                    },
                    { --The Poop
                        'This Joker stores {C:chips}+#3#{} Chips',
                        'when blind is defeated'
                    },
                    { --Also The Poop
                        'Hit the {C:attention}spacebar{} to summon a {C:chips}Blue Fly{},',
                        'and give it all of the stored chips'
                    }
                }
            },
            j_hpfxp_eve = {
                name = "{f:hpfxp_IsaacGame}Eve",
                text = {
                    {
                        '{C:chips}+#1#{} Chips'
                    },
                    { --Whore of Babylon
                        '{C:chips}+#2#{} Chips when {C:attention}#3#{}',
                        'hands remaining'
                    },
                    { --Dead Bird
                        'Summons a {C:attention}Dead Bird{} after',
                        'hand is played'

                    }
                }
            },
            j_hpfxp_summon_bluefly = {
                name = "{f:hpfxp_IsaacGame}Blue Fly",
                text = {
                    {
                        '{C:chips}+#1#{} Chips'
                    },
                    {
                        '{C:red,E:2}Destroys{} itself',
                        'after scoring'
                    }
                }
            },
            j_hpfxp_summon_deadbird = {
                name = "{f:hpfxp_IsaacGame}Dead Bird",
                text = {
                    {
                        '{C:chips}+#1#{} Chips when a',
                        'playing card is scored',
                    },
                    {
                        '{C:red,E:2}Destroys{} itself at',
                        'end of round'
                    }
                }
            }
        }
    },
    misc = {
        labels = {
            k_hpfxp_summon = 'Summoned'
        },
        dictionary = {
            k_hpfxp_summon = 'Summoned'
        },
        quips = {
            hpfxp_tboi_isaac = {
                '{f:hpfxp_IsaacGame}Try rerolling your',
                '{f:hpfxp_IsaacGame,C:attention}HANDS {f:hpfxp_IsaacGame}next time...'
            },
            hpfxp_tboi_maggy = {
                '{f:hpfxp_IsaacGame}Come on! Have a',
                '{f:hpfxp_IsaacGame}little {f:hpfxp_IsaacGame,C:red}Heart{f:hpfxp_IsaacGame}?'
            },
            hpfxp_tboi_cain = {
                '{f:hpfxp_IsaacGame}Ouch. Bad {C:green,f:hpfxp_IsaacGame}luck{f:hpfxp_IsaacGame}!',
            },
            hpfxp_tboi_judas = {
                '{f:hpfxp_IsaacGame}Dunno about {f:hpfxp_IsaacGame,C:money}gold{f:hpfxp_IsaacGame}, but i DO',
                '{f:hpfxp_IsaacGame}know a guy that can hook you',
                '{f:hpfxp_IsaacGame}up with some {f:hpfxp_IsaacGame,C:inactive}silver{f:hpfxp_IsaacGame}...',
            },
            hpfxp_tboi_threequestionmarks = {
                '{f:hpfxp_IsaacGame,C:inactive}I should\'ve stayed',
                '{f:hpfxp_IsaacGame,C:inactive}in the chest...'
            },
            hpfxp_tboi_eve = {
                '{f:hpfxp_IsaacGame}Just a glimpse into my',
                '{f:hpfxp_IsaacGame}dark, twisted mind...'
            },
            hpfxp_tboi_summon_bluefly = {
                '{f:hpfxp_IsaacGame}Buzz. {f:hpfxp_IsaacGame,C:inactive}(How????)'
            },
            hpfxp_tboi_summon_deadbird = {
                '{f:hpfxp_IsaacGame}Twe-tweet. {f:hpfxp_IsaacGame,C:inactive}(Sorry :( )'
            }
        }
    }
}
