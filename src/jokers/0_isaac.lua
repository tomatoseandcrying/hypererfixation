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
            freeRerollMod = 1,
            rerollCharge = 0,
        }
    },
    rarity = 1,
    cost = 2, --change to 4 once The D6 effect is unlocked
    attributes = { 'chips', 'scaling', 'economy', 'reroll' },
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
        SMODS.change_free_rerolls(card.ability.extra.rerolls)
    end,
    calculate = function(self, card, context)
        if context.joker_main then --scoring
            return {
                chips = card.ability.extra.chips
            }
        end
        if context.money_altered and context.amount < 0 and not context.blueprint then --The D6
            card.ability.extra.rerollCharge = card.ability.extra.rerollCharge - context.amount
            while card.ability.extra.rerollCharge >= card.ability.extra.rerollFund do
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "rerolls",
                    scalar_value = "freeRerollMod",
                    message_colour = G.C.GREEN
                })
                card.ability.extra.rerollCharge = card.ability.extra.rerollCharge - card.ability.extra.rerollFund
                SMODS.change_free_rerolls(card.ability.extra.freeRerollMod)
            end
        end
        if context.reroll_shop and card.ability.extra.rerolls > 0 and not context.blueprint then --reroll counter visual decrease
            card.ability.extra.rerolls = card.ability.extra.rerolls - card.ability.extra.freeRerollMod
        end
    end
}
-- Yeah I gave him D6 to start with, you'll have to unlock it just like other unlockables in the future
-- But while there's nothing, I didn't want him to just be chips
