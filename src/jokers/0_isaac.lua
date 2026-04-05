SMODS.Joker {
    key = 'isaac',
    atlas = 'placeholders',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            chips = 35,
            rerolls = 1,
            rerollFund = 6,
            carryover = 0,
            freeRerollMod = 1
        }
    },
    rarity = 1,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.rerolls,
                card.ability.extra.rerolls == 1 and 'Reroll' or 'Rerolls',
                card.ability.extra.rerollFund,
            }
        }
    end,
    add_to_deck = function(self, card, from_debuff) --initial free reroll
        SMODS.change_free_rerolls(card.ability.extra.freeRerollMod)
    end,
    calculate = function(self, card, context)
        if context.joker_main then --scoring
            return {
                chips = card.ability.extra.chips
            }
        end
        if context.money_altered and context.amount < 0 and not context.blueprint then --reroll stacking
            local rerollFundTemp = card.ability.extra.rerollFund + card.ability.extra.carryover
            local moneySpentTemp = context.amount
            while (moneySpentTemp * -1) > rerollFundTemp do
                card.ability.extra.rerolls = card.ability.extra.rerolls + card.ability.extra.freeRerollMod
                SMODS.change_free_rerolls(card.ability.extra.freeRerollMod)
                moneySpentTemp = moneySpentTemp + rerollFundTemp
            end
            card.ability.extra.carryover = moneySpentTemp
            return {
                message = localize('k_upgrade_ex')
            }
        end
        if context.reroll_shop and not context.blueprint then --reroll counter visual decrease
            card.ability.extra.rerolls = card.ability.extra.rerolls - card.ability.extra.freeRerollMod
        end
    end
}
