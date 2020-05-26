# Animal Crossing

This repository has cleaning scripts and analysis using data from *Animal Crossing: New Horizons*. 

## Raw data 

**ac_vil_ranking.txt**: I copied and pasted the text from [nook.market](https://nook.market/categories/257-villagers?sort=num_wishers-desc
) on May 24, 2020 into this file. It's raw data of every villager, ordered by the most wished for at the top to the least wished for at the bottom as of May 25, 2020. 

**villagers.csv**: This data was collected by [Nook Plaza](https://nookplaza.net). It's also hosted and documented [by Kaggle](https://www.kaggle.com/jessicali9530/animal-crossing-new-horizons-nookplaza-dataset). Each row in this dataset is a unique villager from *Animal Crossing: New Horizons*. 

## Cleaning scripts

**clean_vil_rankings.R**: This script prepares the villager data for analysis and writes the dataset to a .csv in the "output" folder. You don't need to run this everytime. It's just here for documentation. 

## Processed data 

**vil_ranks.csv**: Each row in this dataset is a unique villager in *Animal Crossing: New Horizons*. There are 391 villagers total. The dataset has all the variables documented on [Kaggle](https://www.kaggle.com/jessicali9530/animal-crossing-new-horizons-nookplaza-dataset), plus a new variabled called `wish_score`. Each villager has a unique `wish_score` that ranges from 1 to 391. The higher the `wish_score`, the more the villager is wished for on [the Nook Market website](https://nook.market/categories/257-villagers?sort=num_wishers-desc
). For example, [Raymond](https://animalcrossing.fandom.com/wiki/Raymond), the most wished for villager as of May 24, 2020, has the highest possible wish score at 391. 
