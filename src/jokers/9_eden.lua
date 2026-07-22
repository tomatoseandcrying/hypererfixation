SMODS.Joker {
    key = 'eden',
    atlas = 'placeholders',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            chips = 0,
            mult = 0,
            min = 1,
            max = 99,
        }
    },
    rarity = 2,
    cost = DONTFORGETTHECOSTEITHER,
    attributes = { 'DONT FORGET TO DO THESE' },
    loc_vars = function(self, info_queue, card)
        if card.added_to_deck then
            return {
                key = 'j_hpfxp_eden_nobuy',
                vars = {
                    card.ability.extra.chips,
                    card.ability.extra.mult,
                    thingthatletsmecopyarandomisaacjokereffectonaddtodeck
                }
            }
        else
            local r_mults = {}
            for i = card.ability.extra.min, card.ability.extra.max do
                r_mults[#r_mults + 1] = tostring(i)
            end
            local loc_chips = ' ' .. (localize('k_chip')) .. ' '
            local loc_mult = ' ' .. (localize('k_mult')) .. ' '
            local main_start = {
                --Chips
                { n = G.UIT.T, config = { text = '  +', colour = G.C.CHIPS, scale = 0.32 } },
                { n = G.UIT.O, config = { object = DynaText({ string = r_mults, colours = { G.C.CHIPS }, pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.5, scale = 0.32, min_cycle_time = 0 }) } },
                {
                    n = G.UIT.O,
                    config = {
                        object = DynaText({
                            string = {
                                { string = 'CCChips', colour = G.C.GREY },
                                loc_chips, loc_chips, loc_chips, loc_chips,
                                { string = 'cHippps', colour = G.C.GREY },
                                loc_chips, loc_chips, loc_chips, loc_chips,
                                { string = 'chiiPs',   colour = G.C.GREY },
                                loc_chips, loc_chips, loc_chips, loc_chips,
                                { string = 'chhhhipS', colour = G.C.GREY }, },
                            colours = { G.C.UI.TEXT_DARK },
                            pop_in_rate = 9999999,
                            silent = true,
                            random_element = true,
                            pop_delay = 0.2011,
                            scale = 0.32,
                            min_cycle_time = 0
                        })
                    }
                },
                { n = G.UIT.T, config = { text = '  and ', colour = G.C.BLACK, scale = 0.32 } },
                --Mult
                { n = G.UIT.T, config = { text = '  +', colour = G.C.MULT, scale = 0.32 } },
                { n = G.UIT.O, config = { object = DynaText({ string = r_mults, colours = { G.C.MULT }, pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.5, scale = 0.32, min_cycle_time = 0 }) } },
                {
                    n = G.UIT.O,
                    config = {
                        object = DynaText({
                            string = {
                                { string = 'MUltttttt',     colour = G.C.GREY },
                                loc_mult, loc_mult, loc_mult, loc_mult,
                                { string = 'muuuuulllTTTT', colour = G.C.GREY },
                                loc_mult, loc_mult, loc_mult, loc_mult,
                                { string = 'MUULLT', colour = G.C.GREY },
                                loc_mult, loc_mult, loc_mult, loc_mult,
                                { string = 'multt',  colour = G.C.GREY }, },
                            colours = { G.C.UI.TEXT_DARK },
                            pop_in_rate = 9999999,
                            silent = true,
                            random_element = true,
                            pop_delay = 0.2011,
                            scale = 0.32,
                            min_cycle_time = 0
                        })
                    }
                },
            }
            local second_box = {
                --Isaac Jokers
                {
                    n = G.UIT.O,
                    config = {
                        object = DynaText({
                            string = {
                                --Column 1
                                { string = '+35_This1for(Currently',             colour = G.C.RED },
                                { string = '+35_Rankswithincreased(Aces',        colour = G.C.RED },
                                { string = '+42_Increasesprobabilities(Rounded', colour = G.C.RED },
                                { string = '+47_Thiseverywhen',                  colour = G.C.RED },
                                { string = '+36+0_Thiswhen_Hitand',              colour = G.C.RED },
                                { string = '+26_+35hands_Summonshand',           colour = G.C.RED },
                                { string = '+35_Gainscard(6',                    colour = G.C.RED },
                                { string = 'x5.25hand',                          colour = G.C.RED },
                                { string = '+35_Thedestroyed,(Resets',           colour = G.C.RED },
                                --Column 2
                                { string = 'Chips_Jokerfreeevery1',              colour = G.C.ORANGE },
                                { string = 'Chips_ofHeartbybecome',              colour = G.C.ORANGE },
                                { string = 'Chips_allbyup)',                     colour = G.C.ORANGE },
                                { string = 'Chips_Joker$3Boss',                  colour = G.C.ORANGE },
                                { string = 'ChipsChips_Jokerblind_thegive',      colour = G.C.ORANGE },
                                { string = 'Chips_Chipsremaining_ais',           colour = G.C.ORANGE },
                                { string = 'Chips_+1istimes',                    colour = G.C.ORANGE },
                                { string = 'Multof',                             colour = G.C.ORANGE },
                                { string = 'Chips_firstitat',                    colour = G.C.ORANGE },
                                --Column 3
                                { string = 'and_gainsyouBlind',                  colour = G.C.PURPLE },
                                { string = 'and_Multnotremaining)',              colour = G.C.PURPLE },
                                { string = 'onround',                            colour = G.C.PURPLE },
                                { string = 'and_timeinsteadend',                 colour = G.C.PURPLE },
                                --Column 4
                                { string = '+0_+2spend,is',                      colour = G.C.GREEN },
                                { string = '+0_thisgainsof',                     colour = G.C.GREEN },
                                --Column 5
                                { string = 'Mult_Multresetsdefeated',            colour = G.C.BLUE },
                                { string = 'Mult_Joker+5round)',                 colour = G.C.BLUE },
                            },
                            colours = { G.C.UI.TEXT_DARK },
                            pop_in_rate = 9999999,
                            silent = true,
                            random_element = true,
                            pop_delay = 0.2011,
                            scale = 0.32,
                            min_cycle_time = 0
                        })
                    }
                },
            }
            return {
                main_start = main_start,
                box_starts = { second_box }
            }
        end
    end,
    calculate = function(self, card, context)
        if context.joker_main then --scoring
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
    end
}
