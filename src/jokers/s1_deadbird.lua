SMODS.Joker {
    no_collection = true,
    key = 'summon_deadbird',
    atlas = 'placeholders',
    pos = {
        x = 3,
        y = 1
    },
    config = {
        extra = {
            chips = 2
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
        if context.individual and context.cardarea == G.play then --scoring
            return {
                chips = card.ability.extra.chips
            }
        end
        if context.end_of_round and context.main_eval then --self destruction
            SMODS.destroy_cards(card, true, false, false)
        end
    end,
    in_pool = function(self, args)
        return false
    end
}
