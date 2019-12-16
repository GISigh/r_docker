#Setwd using here::here
setwd(here::here("HC-interaction"))

#Read in shapefile 
shape <- rgdal::readOGR(dsn = "data", layer = "points")

#Convert shapefile to DF
df <- as.data.frame(shape)

#Read in csv of buffalo data with landcover
df_env <- as.data.frame(read.csv(file="data/buffalo.csv", header=TRUE, sep=","))

#remove non-distinct bursts
df_t <- df %>% dplyr::distinct(ind_ident, timestamp, .keep_all = TRUE)

#set up xy coords
df.xy = df_t[c("utm_east", "utm_north")]
xy <- coordinates(df.xy)
df_t$timestamp <- as.POSIXct(strptime(df_t$timestamp, "%Y-%m-%d %H:%M:%S"),tz = "GMT")

#create trajectories
traj = adehabitatLT::as.ltraj(xy, id = df_t$ind_ident, date = df_t$timestamp,proj4string = CRS("+init=epsg:32735"))

#Create invidual buffalo trajectories ########################################################
Cilla = traj[1]
Gabs = traj[2]
Mvubu = traj[3]
Pepper = traj[4]
Queen = traj[5]
Toni = traj[6]
