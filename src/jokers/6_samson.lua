SMODS.Joker {
    key = 'samson',
    atlas = 'placeholders',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            chips = 35,
            mult = 0,
            multGain = 1,
            gainsRemaining = 6,
            gainLoss = -1,
            initialGain = 6
        }
    },
    rarity = 1,
    cost = 5,
    attributes = { 'mult', 'chips', 'scaling', 'reset' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.multGain,
                card.ability.extra.gainsRemaining
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then --scoring
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
        if context.individual and context.cardarea == "unscored" then --Bloody Lust
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "mult",
                scalar_value = "multGain",
                message_colour = G.C.MULT
            })
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "gainsRemaining",
                scalar_value = "gainLoss",
                no_message = true
            })
        end
        if context.end_of_round and context.main_eval then --reset
            card.ability.extra.gainsRemaining = card.ability.extra.initialGain
            return {
                message = localize('k_reset')
            }
        end
    end
}
