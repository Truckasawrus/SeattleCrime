library(plyr)
library(dplyr)
library(maps)
library(ggmap)
library(devtools)

devtools::install_github("dkahle/ggmap")


##SET MAP PARAMETERS
seattle<-get_map(location = "Seattle", zoom = 12)


##LOAD SPD CRIME NUMBERS
SeattleCrimes<-read.csv("Seattle_Police_Department_Police_Report_Incident.csv")

###SUBSET VIOLENT CRIMES
SeattleCrimeMap<-subset(SeattleCrimes, Summarized.Offense.Description %in% c("ASSAULT",
                                                            "HOMICIDE",
                                                            "DISPUTE",
                                                            "BURGLARY",
                                                            "WEAPON",
                                                            "BURGLARY-SECURE PARKING-",
                                                            "NARCOTICS",
                                                            "PROSTITUTION",
                                                            "ROBBERY"))
###PLOT SPD NUMBERS ONTO MAP
ggmap(seattle)+
  geom_point(data = SeattleCrimeMap, 
             aes(x=Longitude, y=Latitude, colour = Summarized.Offense.Description))
