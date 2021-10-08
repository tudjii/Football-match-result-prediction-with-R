library(dplyr)
install.packages("rvest")
library(rvest)
allPL <- read.csv("http://www.football-data.co.uk/mmz4281/2021/E0.csv")
PL20_21 <- allPL %>% 
  select(HomeTeam,AwayTeam,FTHG,FTAG,FTR,HTHG,HTAG,HTR,HS,AS,HST,AST,HF,AF,HC,AC,HY,AY,HR,AR,AvgH,AvgD,AvgA,Avg.2.5,Avg.2.5.1,)

total_home_goal <- sum(PL20_21$FTHG)
total_away_goal <- sum(PL20_21$FTAG)

PL20_21 <- PL20_21 %>% 
  mutate("Home_attack_strength" = (all$teams_home / all$teams_home_match_count) / average_home,
         "Home_defence_strength" = (all$teams_home_conceded / all$teams_home_match_count) / average_away,
         "Away_attack_strength" = (all$teams_away / all$teams_away_match_count) / average_away,
         "Away_defence_strength" = (all$teams_away_conceded / all$teams_away_match_count) / average_home,
         "Home_goal_expectancy" = all$Home_attack_strength * all$Away_defence_strength * average_home,
         "Away_goal_expectancy" = all$Home_defence_strength * all$Away_attack_strength * average_away)

poissonPL <- function(team1,team2){
  for(i in (0:5)) {
    qq <- dpois(i, all$Home_goal_expectancy[teams == t1])
    a[i+1] <- j 
    
    k <- dpois(i, all$Away_goal_expectancy[teams == t2])
    b[i+1] <- k
    b = t(b)
  }
  final <-  1/(a %*% b)
  rownames(final) <- c(0,1,2,3,4,5)
  colnames(final) <- c(0,1,2,3,4,5)
  return(final)
}