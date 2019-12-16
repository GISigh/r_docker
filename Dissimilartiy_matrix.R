#Convert traj files to dataframes
Cilla_df <- ld(Cilla)
Mvubu_df <- ld(Mvubu)

Cilla_df <- Cilla_df %>% dplyr::select(x:date)
Mvubu_df <- Mvubu_df %>% dplyr::select(x:date)

x<- stats::dist(Cilla_df, method = "euclidean", diag = TRUE, upper = FALSE, p = 2)

hc <- hclust(t, "ave")
p = as.data.frame(as.matrix(x))

t = full[1:2,]
plot(hc, hang = -1)
m <- as.matrix(dist(Cilla_df))
m<- as.data.frame(m)
methods(dist)
range(Cilla_df$x)
for(i in 2){
  row_i <- Cilla_df[i,]
  temp_df <- rbind(row_i, Mvubu_df)
  x <- as.data.frame(as.matrix(stats::dist(temp_df, 
          method = "euclidean", diag = FALSE, upper = FALSE, p = 2)))
  if(i > 1){
    temp_x1 <- x[1,]
    names(temp_x1) <- names(full)
    full <- rbind(full,temp_x1)
  }else{
    full <- x[1,]
  }
}
