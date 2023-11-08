# In this code we remove the redundant columns which we do not use for our analysis.
# These are the columns in which the animal does not look up and the files in which the animal does not eat a single seed.

for (i in 1:5){

  # Import the files
  file_list <-
    list.files(path = paste("C:/Users/flutura/Desktop/Quantitative_vtk/my_data_macaca_sylvanus/raw_data/raw_data_day_",as.character(i),sep = ""),
               pattern = "*.csv",
               full.names = TRUE)
  # create a folder for the new data to be saved in:
  path <- "C:/Users/flutura/Desktop/Quantitative_vtk/report/data_analysis/preprocessing/folder_for_path"
  newfolder <- paste("cleared_discard_deldel_noseed_noup_day_",as.character(i),sep = "")
  dir.create(file.path(dirname(path), newfolder))
  # preprocessed data is saved in the folder we just created
  outp2 <- paste("C:/Users/flutura/Desktop/Quantitative_vtk/report/data_analysis/preprocessing/cleared_discard_deldel_noseed_noup_day_",as.character(i),sep = "")
  
  # the loop that goes through every file and filters out the ones I marked to be deleted, 
  for (e in 1:length(file_list)){
    df<- read.csv(file_list[e])
    df<- df[,c(1,2,3,4,5,9,10)] # discard the columns that are redundant.
    ln1 <- length(which(df$Behavior==" 999.del")) # if I pressed this button 1 time it meant I want to end the trial, If i pressed 2 or more, it meant I want to delete the file.
    ln2 <- length(which(df$Behavior==" 1.se")) # number of seeds eaten
    ln3 <- length(which(df$Behavior==" 4.up")) # number of times it looked up
    if ((ln1 <= 1) & (ln2 >0 ) &(ln3 > 0)) {
      ls <-strsplit(file_list[e],paste("C:/Users/flutura/Desktop/Quantitative_vtk/my_data_macaca_sylvanus/raw_data/raw_data_day_",as.character(i),sep = ""), fixed=T)
      write.csv(df, paste(outp2,ls[[1]][2], sep ="/" ))
      print(e)
    }
  }
  
}
