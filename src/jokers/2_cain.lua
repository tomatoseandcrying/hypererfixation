SMODS.Joker {
    key = 'cain',
    atlas = 'placeholders',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            chips = 40,
            probabilityIncrease = 10
        }
    },
    rarity = 2,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.probabilityIncrease
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then --scoring
            return {
                chips = card.ability.extra.chips
            }
        end
        if context.mod_probability and not context.blueprint then --probability mod
            return {
                numerator = math.ceil(context.numerator + (1 / card.ability.extra.probabilityIncrease))
            }
        end
    end
}
