library(readr)
library(dplyr)
library(ggplot2)

# load in necessary files
var_layout_df <- read_csv('variable_layout.csv')
brfss_2017_df <- read_fwf('LLCP2017ASC/LLCP2017.ASC',
                          fwf_positions(#widths=var_layout_df$`Field Length`,
                                     col_names=var_layout_df$`Variable Name`,
                                     start=var_layout_df$`Starting Column`,
                                     end=var_layout_df$`Starting Column` + var_layout_df$`Field Length` - 1),
                          guess_max=450000)

# Interesting variables:
# _STATE: Code for each state
# CADULT: Are you 18 years of age or older?
# CHCOCNCR: (Ever told) you had other types of cancer [other than skin]?
# CHCCOPD1: (Ever told) you have chronic obstructive pulmonary disease, C.O.P.D., emphysema or chronic bronchitis?
# SEX: Indicate sex of respondent.
# EDUCA: Code for highest grade or year of school you completed?
# EMPLOY1: Employment status
# INCOME2: Income level
# SMOKE100: Have you smoked at least 100 cigarettes in your entire life?
# SMOKDAY2: Do you now smoke cigarettes every day, some days, or not at all?
# STOPSMK2: During the past 12 months, have you stopped smoking for one day or longer because you were trying to quit smoking?
# LASTSMK2: How long has it been since you last smoked a cigarette, even one or two puffs?
# USENOW3: Do you currently use chewing tobacco, snuff, or snus every day, some days, or not at all?
# ECIGARET: Have you ever used an e-cigarette or other electronic vaping product, even just one time, in your entire life?
# ECIGNOW: Do you now use e-cigarettes or other electronic vaping products every day, some days, or not at all?
# COPDSMOK: Over your lifetime, how many years have you smoked tobacco products?
# CNCRDIFF: How many different types of cancer have you had?
# CNCRTYP1: What type of cancer was it?
# LCSFIRST: How old were you when you first started to smoke cigarettes regularly
# LCSLAST: How old were you when you last smoked cigarettes regularly?
# LCSNUMCG: On average, when you smoke/smoked regularly, about how many cigarettes do/did you usually smoke each day?
# _IMPRACE: Imputed race/ethnicity value

# create relevant dataframe
brfss_cln <- brfss_2017_df %>%
  select(`_STATE`, CADULT, CHCOCNCR, CHCCOPD1, SEX, EDUCA, EMPLOY1, INCOME2,
         SMOKE100, SMOKDAY2, STOPSMK2, LASTSMK2, USENOW3, ECIGARET, ECIGNOW,
         COPDSMOK, CNCRDIFF, CNCRTYP1, LCSFIRST, LCSLAST, LCSNUMCG, `_IMPRACE`)

# save as .csv
write_csv(brfss_cln, 'BRFSS_2017_tobacco.csv')

# TODO create exploratory analysis based on the data above.  Think I'm going to
# to PowerBI for this one...OR instead may just do this all in R using shiny...
# could reserve use of visualization tool for the final viz...

# TODO download additional years for trend analyses

# TODO convert this script to an Rmd doc or jupyter notebook