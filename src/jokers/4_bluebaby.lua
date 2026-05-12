SMODS.Joker {
    key = 'threequestionmarks',
    atlas = 'placeholders',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            chips = 40,
            stored_chips = 0,
            s_chip_gain = 10
        }
    },
    rarity = 1,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.stored_chips,
                card.ability.extra.s_chip_gain

            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then --scoring
            return {
                chips = card.ability.extra.chips
            }
        end
        if context.end_of_round and context.main_eval then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "stored_chips",
                scalar_value = "s_chip_gain"
            })
        end
    end,
}

SMODS.Keybind({
    key_pressed = "space",
    action = function(self)
        local joker = SMODS.find_card("j_hpfxp_threequestionmarks")[1]
        if not joker then return end
        local bfly =
            SMODS.add_card({
                set = 'Joker',
                area = G.jokers,
                skip_materialize = true,
                key = 'j_hpfxp_summon_bluefly',
                key_append = 'sf_poop',
                no_edition = true
            })
        bfly.ability.extra.chips = joker.ability.extra.stored_chips
        joker.ability.extra.stored_chips = 0
    end
})


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
