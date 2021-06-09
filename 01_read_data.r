#################################################################################
# Author: Michael Burton
#
# Purpose: Convert data on various Ely, MN based outfitters into an R dataframe
#
#################################################################################

library(readr)
library(dplyr)

# read in the raw data
ELY_OUTFITTERS_01 <- read_csv(file = "data/BWCA_OUTFITTER_INFO.csv", progress = T)


# replicate the piragis rows thrice; one for each group size category
#  - Piragis does not have separate rates based on group size
attach(ELY_OUTFITTERS_01)
PIRAGIS <- ELY_OUTFITTERS_01[ OUTFITTER == "Piragis",]
detach(ELY_OUTFITTERS_01)

PEOPLE_CAT <- c(rep("8-9",8),rep("5-7",8),rep("2-4",8))
PIRAGIS_02 <- rbind.data.frame(PIRAGIS,PIRAGIS,PIRAGIS)
PIRAGIS_02[, "PEOPLE_CAT"] <- PEOPLE_CAT

# add the Piragis data back to the orignal data
ELY_OUTFITTERS_02 <- ELY_OUTFITTERS_01[OUTFITTER != "Piragis",]
ELY_OUTFITTERS_03 <- rbind.data.frame(ELY_OUTFITTERS_02, PIRAGIS_02)

# remove intermediary datasets from the workspace
rm(ELY_OUTFITTERS_01,
   ELY_OUTFITTERS_02,
   PIRAGIS,
   PIRAGIS_02,
   PEOPLE_CAT)
