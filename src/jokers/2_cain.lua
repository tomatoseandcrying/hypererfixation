SMODS.Joker {
    key = 'cain',
    atlas = 'placeholders',
    pos = {
        x = 1,
        y = 0
    },
    config = {
        extra = {
            chips = 42,
            probabilityIncrease = 10
        }
    },
    rarity = 2,
    cost = 0,
    attributes = { 'chips', 'mod_chance', 'passive' },
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
        if context.mod_probability and not context.blueprint then --Lucky Foot
            return {
                numerator = math.ceil(context.numerator + (1 / card.ability.extra.probabilityIncrease))
            }
        end
    end
}

--make him also make booster packs 50/50 free once unlocked (Paper Clip)
