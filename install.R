#Check if pacman is installed. If not installed, install it. Pacman is a library for package management. 
if (!require("pacman")) install.packages("pacman")

#loads here package for relative paths
pacman::p_load(here)

#Pacman checks if packages are installed, if not, it installs them and loads them. 
pacman::p_load(rgdal, dplyr, adehabitatLT,tidyverse, ggplot2)


