#### Preamble ####
# Purpose: Comparison of ethno-cultural composition scores to other dimension in the The Canadian Index of Multiple Deprivation
# Author: Tiago Martins
# Date: April 2021
# Contact: martins.tiago@mail.utoronto.ca
# License: WTFPL
# Pre-requisites: None known. When prompted, R packages are to be installed.

# Acquire data
install.packages("RCurl")
install.packages("dplyr")
library("RCurl")
library("dplyr")

on_scores_quintiles_EN.csv <- getURL("https://www150.statcan.gc.ca/pub/45-20-0001/2019001/csv/on_scores_quintiles-eng.zip")

data=read.csv('on_scores_quintiles_EN.csv')

# Clean data
rename(
    "Residential.instability.Scores" = "Residential Instability Scores",
    "Economic.dependency.Scores" = "Economic Dependency Scores",
    "Ethno.cultural.composition.Scores" = "Ethno-Cultural Composition Scores",
    "Situational.vulnerability.Scores" = "Situational Vulnerability Scores"
  )

# Plot data: Overview
barplot(table(data$Ethno.cultural.composition.Scores))


# Plot data: Greatest Variation
with(data, plot(Economic.dependency.Scores, Residential.instability.Scores, type = "h"))

# Plot data: Middle
with(data, plot(Economic.dependency.Scores, Economic.dependency.Scores, type = "h"))

# Plot data: Least Variation
with(data, plot(Economic.dependency.Scores, Economic.dependency.Scores, type = "h"))



