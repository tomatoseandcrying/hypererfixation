SMODS.Joker {
    key = 'judas',
    atlas = 'placeholders',
    pos = {
        x = 1,
        y = 0
    },
    config = {
        extra = {
            chips = 47,
            mult = 0,
            multGain = 2,
            belialFund = 3,
            carryover = 0
        }
    },
    rarity = 2,
    cost = 0,
    attributes = { 'mult', 'chips', 'scaling', 'reset', 'economy' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.multGain,
                card.ability.extra.belialFund
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
        if context.money_altered and context.amount < 0 and not context.blueprint then --mult stacking
            local belialFundTemp = card.ability.extra.belialFund + card.ability.extra.carryover
            local moneySpentTemp = context.amount
            while (moneySpentTemp * -1) > belialFundTemp do
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "mult",
                    scalar_value = "multGain"
                })
                moneySpentTemp = moneySpentTemp + belialFundTemp
            end
            card.ability.extra.carryover = moneySpentTemp
            return {
                message = localize('k_upgrade_ex')
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then --mult reset
            if context.beat_boss and card.ability.extra.mult > 0 then
                card.ability.extra.mult = 0
                return {
                    message = localize('k_reset'),
                    colour = G.C.RED
                }
            end
        end
    end
}
