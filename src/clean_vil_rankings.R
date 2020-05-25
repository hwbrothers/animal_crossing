
# Packages ----------------------------------------------------------------

library(tidyverse)
library(janitor)

# Load data ---------------------------------------------------------------

# Villager dataset
vil <- read_csv(here::here("data", "villagers.csv")) %>% 
  clean_names()

# List of villagers sorted by most wished for from nook.market on May 24, 2020
raw <- read_lines(
  here::here("data", "ac_vil_ranking.txt")
) 


# Clean data --------------------------------------------------------------

# Transform into a villager rank lookup table 
rank_lookup <- raw %>% 
  as_tibble() %>% 
  mutate(value = str_squish(value)) %>% 
  filter(value %in% vil$name) %>% 
  distinct(value) %>% 
  mutate(wish_score = rev(1:nrow(.))) %>% 
  rename(name = value) 

# Join rank scores with Kaggle villager data 
vil_ranks <- inner_join(vil, rank_lookup)


# Write to output folder --------------------------------------------------

write_csv(vil_ranks, here::here("output", "vil_ranks.csv"))
