#################################################################################
# Author: Michael Burton
# 
# Purpose: Get basic summaries of different outfitting packages
#          + Overall average cost by group size and number of days
#          + Average cost by outfitter, group size, and number of days
#
# Notes: Add additional summary statistics (min, q1, median, mq3, max)
#        Visualize information, boxplots, average cost over days plot
#################################################################################

# Overall average cost by group size and number of days
AVG_COST <- ELY_OUTFITTERS_03 %>% 
               group_by(PEOPLE_CAT, DAYS)  %>% 
               summarise(avg = mean(COST)) %>%
               mutate(avg = round(avg,digits=0))

OVERALL_AVG_COST_TABLE <- xtabs(avg~PEOPLE_CAT+DAYS, data = AVG_COST)
ftable(OVERALL_AVG_COST_TABLE)

# Avg cost by outfitter

AVG_COST_BY_OUTFITTER <- ELY_OUTFITTERS_03 %>% 
                            group_by(OUTFITTER,PEOPLE_CAT, DAYS) %>%
                            summarise(avg = mean(COST)) %>%
                            mutate(avg = round(avg,digits=0))

OUTFITTER_AVG_COST_TABLE <- xtabs(avg~OUTFITTER+PEOPLE_CAT+DAYS, data = AVG_COST_BY_OUTFITTER)
ftable(OUTFITTER_AVG_COST_TABLE)

