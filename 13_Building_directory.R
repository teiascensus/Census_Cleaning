library("stringi")
library("tidyverse")
#==============================================================================#
if (file.exists(Path)){
  if(file.exists(Raw_data_path)){
    print("you have Raw_data folder in your PC, make sure this folder was not empty")
  }else{
    print("you have no raw data")
  }
}else{
  dir.create(path)
}
#===============================================================================
#creating imported data folder and subfolder :
#the code bleow copy you raw data folder without it's data
#===============================================================================
RDFP <- list.dirs(Raw_data_path) #raw data folders path
IDFP <- str_replace(RDFP,Raw_data,Imported_data) #imported data folder path
IDFP
for (i in 1:length(IDFP)) {
  if (file.exists(IDFP[i])) {
    NULL
  }else{
    dir.create(IDFP[i])
  }
}
#===============================================================================
#                       creating processed_data folder 
#===============================================================================
if(file.exists(Processd_data_Path)){
  for (year in Years ){
    if(file.exists(paste0(Processd_data_Path,"/",year))){
      NULL
    }else{
      dir.create(paste0(Processd_data_Path,"/",year))
    }
  }
}else{
  dir.create(Processd_data_Path)
  for (year in Years ) {
    dir.create(paste0(Processd_data_Path,"/",year))
  }
}

