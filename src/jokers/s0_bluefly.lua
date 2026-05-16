SMODS.Joker {
    key = 'summon_bluefly',
    atlas = 'placeholders',
    pos = {
        x = 3,
        y = 1
    },
    config = {
        extra = {
            chips = 0
        }
    },
    rarity = 'hpfxp_summon',
    cost = 0,
    attributes = { 'chips', 'summon' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then --scoring
            return {
                chips = card.ability.extra.chips
            }
        end
        if context.after then --self destruction
            SMODS.destroy_cards(card, true, false, false)
        end
    end,
    in_pool = function(self, args)
        return false
    end
}
