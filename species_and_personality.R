## ----packages, message=FALSE, echo=FALSE--------------------------------------------
library(tidyverse)
library(here)
library(kableExtra)


## ----load data----------------------------------------------------------------------
villagers <- read_csv(here::here("output", "vil_ranks.csv"))


## -----------------------------------------------------------------------------------
villagers %>% 
  select(name, species, personality, wish_score) %>% 
  arrange(desc(wish_score)) %>% 
  head(n = 10) %>% 
  kable(caption = "Ten Most Wished For Villagers", 
        col.names = c("name", "species", "personality", "wish score")) %>% 
  kable_styling()


## ----personality median-------------------------------------------------------------
villagers %>% 
  group_by(personality) %>% 
  summarize(mean_wish = mean(wish_score), n = n()) %>%  
  ggplot(data = ., 
         aes(x = reorder(personality, mean_wish), y = mean_wish, size = n)) +
  geom_point(color = "#1c7c24", alpha = .75) + 
  labs(title = "Mean wish scores across villager personalities", 
       subtitle = "Villager rankings from Nook Market on May 24, 2020",
       x = "", 
       y = "Wish score", 
       caption = "data: Nook Plaza and Nook Market") +
  coord_flip() 


## ----species median-----------------------------------------------------------------
villagers %>% 
  group_by(species) %>% 
  summarize(mean_wish = mean(wish_score), n = n()) %>%  
  ggplot(data = ., 
         aes(x = reorder(species, mean_wish), y = mean_wish, size = n)) +
  geom_point(color = "#1c7c24", alpha = .75) + 
  labs(title = "Players probably wish for wolves more than they do hippos", 
       subtitle = "Villager rankings from Nook Market on May 24, 2020",
       x = "", 
       y = "Wish score", 
       caption = "data: Nook Plaza and Nook Market") +
  coord_flip() 


## -----------------------------------------------------------------------------------
villagers %>% 
  filter(species %in% c("Cat", "Mouse")) %>% 
  group_by(species) %>% 
  summarize(mean_wish = round(mean(wish_score)), 
            sd = round(sd(wish_score)), 
            count = n()) %>% 
  kable(caption = "Cat vs. Mouse (Cat Wins)", 
        col.names = c("species", "mean wish score", "standard dev", "count")) %>% 
  kable_styling()


## -----------------------------------------------------------------------------------
villagers %>% 
  select(name, species, personality, catchphrase, wish_score) %>% 
  filter(species == "Cat", personality == "Jock") %>% 
  arrange(desc(wish_score)) %>% 
  kable(caption = "Cats With Jock Personalities", 
        col.names = c("name", "species", "personality", "catchphrase", "wish score")) %>% 
  kable_styling()


## ----personality panel--------------------------------------------------------------
ggplot(data = villagers, aes(x = wish_score)) + 
  geom_histogram(fill = "#1c7c24", alpha = .75) + 
  facet_wrap(vars(personality)) + 
  labs(title = "No one villager personality captures the Animal Crossing zeitgeist", 
       subtitle = "Distribution of wish scores based on Nook Market, May 24, 2020",
       x = "Wish score", 
       y = "", 
       caption = "data: Nook Plaza and Nook Market")


## ----rabbit v mouse-----------------------------------------------------------------
villagers %>% 
  filter(species %in% c("Mouse", "Rabbit")) %>% 
  ggplot(data = ., aes(x = wish_score)) + 
  geom_histogram(fill = "#1c7c24", alpha = .75) + 
  facet_wrap(vars(species)) + 
  labs(title = "Players probably prefer rabbits over mice", 
       subtitle = "Distribution of wish scores based on Nook Market, May 24, 2020",
       x = "Wish score", 
       y = "", 
       caption = "data: Nook Plaza and Nook Market")


# models ------------------------------------------------------------------
# Personality as a predictor
summary(
  lm(wish_score ~ personality, data = villagers)
)

# Species as a predictor
summary(
  lm(wish_score ~ species, data = villagers)
)

# Personality and species as predictors
summary(
  lm(wish_score ~ personality + species, data = villagers)
)
