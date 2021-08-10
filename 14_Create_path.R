library("stringi")
library("tidyverse")
#======================================
#Ind = Individual
#Hh = Household
#=============================================================================
              # creating Path for Individual for year 75-85-90-95
#=============================================================================
  
Ind <- list.files(Raw_data_path  ,pattern = "fard",full.names = TRUE,recursive = TRUE)
Ind <- c(Ind,list.files(Raw_data_path  ,pattern = "Individual",full.names = TRUE,recursive = TRUE))
Ind <- c(Ind,list.files(Raw_data_path  ,pattern = "person",full.names = TRUE,recursive = TRUE))
Ind






#=============================================================================
           # creating Path for Household for year 75-85-90-95
#===========================================================================
Hh <- list.files(Raw_data_path  ,pattern = "kh",full.names = TRUE,recursive = TRUE)
Hh <- c(Hh,list.files(Raw_data_path  ,pattern = "Household",full.names = TRUE,recursive = TRUE))
Hh <- c(Hh,list.files(Raw_data_path  ,pattern = "household",full.names = TRUE,recursive = TRUE))
Hh






#=============================================================================

Raw_path <-  c(Ind,Hh)
RDS_path <- str_replace(Raw_path,".xlsx",".RDS")
RDS_path <- str_replace(RDS_path,".dbf",".RDS")
RDS_path <- str_replace(RDS_path,".MDB",".RDS")
RDS_path <- str_replace(RDS_path,".mdb",".RDS")
RDS_path <- str_replace(RDS_path,"Raw_data","Imported_data") 
RDS_path
Raw_path




