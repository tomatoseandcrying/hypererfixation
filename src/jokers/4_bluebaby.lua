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
            storedChips = 0,
            storedChipsGain = 10
        }
    },
    rarity = 1,
    cost = 0,
    attributes = { 'chips', 'scaling', 'reset', 'generation' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_hpfxp_summon_bluefly
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.storedChips,
                card.ability.extra.storedChipsGain

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
                ref_value = "storedChips",
                scalar_value = "storedChipsGain"
            })
        end
    end,
}

SMODS.Keybind({
    key_pressed = "space",
    action = function(self)
        local joker = SMODS.find_card("j_hpfxp_threequestionmarks")[1]
        if not joker then
            return
        elseif joker.ability.extra.storedChips == 0 then
            return
        end
        local bfly =
            SMODS.add_card({
                set = 'Joker',
                area = G.jokers,
                skip_materialize = true,
                key = 'j_hpfxp_summon_bluefly',
                key_append = 'sf_poop',
                no_edition = true
            })
        bfly.ability.extra.chips = joker.ability.extra.storedChips
        joker.ability.extra.storedChips = 0
    end
})
