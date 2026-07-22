SMODS.Joker {
    key = 'thelost',
    atlas = 'placeholders',
    pos = {
        x = 2,
        y = 0
    },
    config = {
        extra = {
            chips = 35,
            debuffChips = 17,
            numerator = 1,
            denominator = 4,
            shopRerollFlag = false
        }
    },
    rarity = 3,
    cost = 8,
    attributes = { 'chips', 'destroy_card', 'chance', 'reroll' },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.numerator,
            card.ability.extra.denominator, 'hpfxp_tboi_thelost' .. G.GAME.round_resets.ante)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.debuffChips,
                numerator,
                denominator
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then --scoring
            return {
                chips = card.ability.extra.chips
            }
        end
        if context.before then                              --Spectral tears
            for _, score in ipairs(context.scoring_hand) do --and seven years ago
                if score.debuff then
                    return {
                        chips = card.ability.extra.debuffChips
                    }
                end
            end
        end
        if context.starting_shop then
            card.ability.extra.shopRerollFlag = true
            local eval = function(card) return card.ability.extra.shopRerollFlag == true and not card.REMOVED end
            juice_card_until(card, eval, true)
        end
    end
}

SMODS.Keybind({ --Eternal D6 Keybind
    key_pressed = "space",
    action = function(self)
        local joker = SMODS.find_card("j_hpfxp_thelost")[1]
        local is_in_shop = G.STATE == G.STATES.SHOP
        if not joker then
            return
        elseif not is_in_shop or not joker.ability.extra.shopRerollFlag
        then
            return
        end
        G.FUNCS.hpfxp_lost_reroll_shop()
        joker.ability.extra.shopRerollFlag = false
    end
})

G.FUNCS.hpfxp_lost_reroll_shop = function(e) --Eternal D6 Function
    stop_use()
    G.CONTROLLER.locks.shop_reroll = true
    if G.CONTROLLER:save_cardarea_focus('shop_jokers') then G.CONTROLLER.interrupt.focus = true end
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            G.GAME.current_round.free_rerolls = math.max(G.GAME.current_round.free_rerolls - 1, 0)
            G.GAME.round_scores.times_rerolled.amt = G.GAME.round_scores.times_rerolled.amt + 1
            for i = #G.shop_jokers.cards, 1, -1 do
                local c = G.shop_jokers:remove_card(G.shop_jokers.cards[i])
                c:remove()
                c = nil
            end

            --save_run()

            play_sound('coin2')
            play_sound('other1')

            for i = 1, (Hypererfixation.get_lost_slots() or G.GAME.shop.joker_max - #G.shop_jokers.cards) do
                local new_shop_card = create_card_for_shop(G.shop_jokers)
                G.shop_jokers:emplace(new_shop_card)
                new_shop_card:juice_up()
            end

            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.3,
        func = function()
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.CONTROLLER.interrupt.focus = false
                    G.CONTROLLER.locks.shop_reroll = false
                    G.CONTROLLER:recall_cardarea_focus('shop_jokers')
                    SMODS.calculate_context({ reroll_shop = true, cost = reroll_cost })
                    return true
                end
            }))
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        func = function()
            save_run(); return true
        end
    }))
end
