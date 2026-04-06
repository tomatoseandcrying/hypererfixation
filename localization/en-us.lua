return {
    descriptions = {
        Joker = {
            j_hpfxp_isaac = {
                name = "Isaac",
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
                name = "Magdalene",
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
                name = "Cain",
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
                name = "Judas",
                text = {
                    {
                        '{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult'
                    },
                    {
                        'This Joker gains {C:mult}+#3#{} Mult for',
                        'every {C:money}$#4#{} you spend, resets',
                        'when {C:attention}Boss Blind{} is defeated'
                    }
                }
            }
        }
    }
}
