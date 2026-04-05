SMODS.Joker {
    key = 'maggy',
    atlas = 'placeholders',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            chips = 30,
            rank_up = 1,
            suit = 'Hearts',
        }
    },
    rarity = 1,
    cost = 0,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                localize(card.ability.extra.suit, 'suits_singular'),
                card.ability.extra.rank_up
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then --scoring
            return {
                chips = card.ability.extra.chips
            }
        end
        if context.before and not context.blueprint then --Yum Heart effect
            local percent = 1.15 - (1 - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            for _, scored in ipairs(context.scoring_hand) do
                if scored:is_suit(card.ability.extra.suit) then
                    play_sound('card1', percent)
                    assert(SMODS.modify_rank(scored, card.ability.extra.rank_up, true))
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored:juice_up(0.3, 0.3)
                            scored:set_sprites(nil, scored.config.card)
                            return true
                        end
                    }))
                end
            end
        end
    end
}
