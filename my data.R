

# Packages -----------------------------------------------------------------------------------------

knitr::opts_chunk$set(echo = TRUE)
library(datasets)
options(digits = 2)

library(data.table)
library(psych)
library(car)
library(ggplot2)
library(JWileymisc)
library(extraoperators)

# Import Dataset -----------------------------------------------------------------------------------------

d <- fread('/Users/weiynn/Desktop/PSY3062 R/PSY3062 dataset.csv')

# Organising variables -----------------------------------------------------------------------------------------

VarXY.raw <- d[, .(Sex, Optimism_1, Optimism_2, Optimism_3, Optimism_4, Optimism_5, Optimism_6, Rumination_1, Rumination_2, Rumination_3, Rumination_4, Rumination_5, Rumination_6)]
VarXY <- VarXY.raw[complete.cases(VarXY.raw)]
VarXY[ , Optimism_2r := 6 - Optimism_2]
VarXY[ , Optimism_4r := 6 - Optimism_4]
VarXY[ , Optimism_5r := 6 - Optimism_5]
VarXY[ , Optimism_total := rowMeans(.SD, na.rm = TRUE) * 5, # *the number of items
       .SDcols = c("Optimism_1", "Optimism_2r", "Optimism_3", "Optimism_4r", "Optimism_5r")]
VarXY[ , Rumination_total := rowMeans(.SD, na.rm = TRUE) * 6,
       .SDcols = c('Rumination_1', 'Rumination_2', 'Rumination_3', 'Rumination_4', 'Rumination_5', 'Rumination_6')]
# xx -----------------------------------------------------------------------------------------

# xx -----------------------------------------------------------------------------------------


