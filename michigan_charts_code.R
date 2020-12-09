#reading in the data
library(readxl)
michigan_industry <- read_excel("G:/Shared/Disaster_RECOVERY_Assistance/COVID-19/Ryan's Working Files/michigan_industry.xlsx")
wisconsin_industry <- read_excel("G:/Shared/Disaster_RECOVERY_Assistance/COVID-19/Ryan's Working Files/wisconsin_industry.xlsx")
minnesota_industry <- read_excel("G:/Shared/Disaster_RECOVERY_Assistance/COVID-19/Ryan's Working Files/minnesota_industry.xlsx")

#loading relevant libraries
library(ggplot2)
library(tidyr)
library(dplyr)

#michigan chart
df <- michigan_industry %>%
  select(date, mining, mfg, ttu, inf, fin, prof, ed) %>%
  gather(key = "Industry", value = "value", -date)
head(df, 8)

michigan <- ggplot(df, aes(x = date, y = value)) + 
  geom_line(aes(color = Industry), size = 1) +
  scale_color_brewer(palette="Paired", labels = c("Education and Health Services", "Financial Activities", "Information", "Manufacturing", "Mining, Logging, and Construction", "Professional and Business Services", "Trade, Transportation, and Utilities")) +
  theme_minimal()
  
michigan + ggtitle("Detroit Metro Employment, Annual Percentage Change by Industry") +
  xlab("Date") + 
  ylab("Annual Percent Change")

#minnesota chart
df2 <- minnesota_industry %>%
  select(date, mining, mfg, ttu, inf, fin, prof, ed) %>%
  gather(key = "Industry", value = "value", -date)
head(df2, 8)

minnesota <- ggplot(df2, aes(x = date, y = value)) + 
  geom_line(aes(color = Industry), size = 1) +
  scale_color_brewer(palette="Paired", labels = c("Education and Health Services", "Financial Activities", "Information", "Manufacturing", "Mining, Logging, and Construction", "Professional and Business Services", "Trade, Transportation, and Utilities")) +
  theme_minimal()

minnesota + ggtitle("Minneapolis Metro Employment, Annual Percentage Change by Industry") +
  xlab("Date") + 
  ylab("Annual Percent Change")

#wisconsin chart
df3 <- wisconsin_industry %>%
  select(date, mining, mfg, ttu, inf, fin, prof, ed) %>%
  gather(key = "Industry", value = "value", -date)
head(df3, 8)

wisconsin <- ggplot(df3, aes(x = date, y = value)) + 
  geom_line(aes(color = Industry), size = 1) +
  scale_color_brewer(palette="Paired", labels = c("Education and Health Services", "Financial Activities", "Information", "Manufacturing", "Mining, Logging, and Construction", "Professional and Business Services", "Trade, Transportation, and Utilities")) +
  theme_minimal()

wisconsin + ggtitle("Milwaukee Metro Employment, Annual Percentage Change by Industry") +
  xlab("Date") + 
  ylab("Annual Percent Change")

