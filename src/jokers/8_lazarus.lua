SMODS.Joker {
    key = 'lazarus',
    atlas = 'placeholders',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            chips = 35,
            mult = 0,
            multGain = 5,
            risenChips = 49,
            heIsRisen = false
        }
    },
    rarity = 2,
    cost = 5,
    attributes = { 'mult', 'chips', 'scaling', 'reset' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                (card.ability.extra.heIsRisen and card.ability.extra.risenChips)
                or card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.multGain
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then                       --scoring
            if card.ability.extra.heIsRisen == true then --Lazarus the Risen
                return {
                    chips = card.ability.extra.risenChips,
                    mult = card.ability.extra.mult
                }
            else
                return {
                    chips = card.ability.extra.chips,
                    mult = card.ability.extra.mult
                }
            end
        end
        if context.joker_type_destroyed then --Lazarus the Risen
            if context.card == card and card.ability.extra.heIsRisen == false then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card.children.center:set_sprite_pos({ x = 3, y = 1 })
                        SMODS.scale_card(card, {
                            ref_table = card.ability.extra,
                            ref_value = "mult",
                            scalar_value = "multGain"
                        })
                        return true
                    end
                }))

                card.ability.extra.heIsRisen = true
                return { no_destroy = true }
            end
        end
        if context.end_of_round and context.main_eval then --reset
            G.E_MANAGER:add_event(Event({
                func = function()
                    card.children.center:set_sprite_pos({ x = 0, y = 0 })
                    return true
                end
            }))
            card.ability.extra.heIsRisen = false
            return {
                message = localize('k_reset')
            }
        end
    end
}
