SMODS.Joker {
    key = 'eve',
    atlas = 'placeholders',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            chips = 26,
            babylonChips = 35,
            handThreshold = 0,
        }
    },
    rarity = 1,
    cost = 5,
    attributes = {},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_hpfxp_summon_deadbird
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.babylonChips,
                card.ability.extra.handThreshold
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then                                                      --scoring
            if G.GAME.current_round.hands_left == card.ability.extra.handThreshold then --Whore of Babylon
                return {
                    chips = card.ability.extra.babylonChips
                }
            else
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
        if context.final_scoring_step then --Dead Bird
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card({
                        set = 'Joker',
                        area = G.jokers,
                        skip_materialize = true,
                        key = 'j_hpfxp_summon_deadbird',
                        key_append = 'sf_poop',
                        no_edition = true
                    })
                    return true
                end
            }))
        end
    end
}
