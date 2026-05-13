SMODS.Joker {
    key = 'summon_bluefly',
    atlas = 'placeholders',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            chips = 0
        }
    },
    rarity = 'hpfxp_summon',
    cost = 0,
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

local can_sell = Card.can_sell_card
function Card:can_sell_card(context)
    local ret = can_sell(self, context)
    if self.config.center.key == "j_hpfxp_summon_bluefly" then return false end
    return ret
end