SMODS.Joker {
    key = 'azazel',
    atlas = 'placeholders',
    pos = {
        x = 1,
        y = 0
    },
    config = {
        extra = {
            xMult = 5.25
        }
    },
    rarity = 2,
    cost = 6,
    attributes = { 'xmult', 'generation', 'hands', 'tarot' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xMult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.hands_played == 0 then --scoring / Nerfed Brimstone
            return {
                xmult = card.ability.extra.xMult
            }
        end
    end
}
--give him a custom tarot on add (The Fool)
--probably like
--Azazel's <-- in small text above --> The Fool
--Rewind the current Ante to its Small Blind
