library("tidyverse")
library("stringi")
library("readxl")
library("foreign")
library("RODBC")



###colnames###

Individual_colnames <- read_xlsx(Col_name_path,sheet = "Individual")




######convert all 85 province to one 85 file###

Individual_RDS_Path_85 <-  RDS_path[str_detect(RDS_path,"fard")]

eighty_five_00 <- readRDS(Individual_RDS_Path_85[1]) 
eighty_five_01 <- readRDS(Individual_RDS_Path_85[2])
eighty_five_02 <- readRDS(Individual_RDS_Path_85[3])
eighty_five_03 <- readRDS(Individual_RDS_Path_85[4])
eighty_five_04 <- readRDS(Individual_RDS_Path_85[5])
eighty_five_05 <- readRDS(Individual_RDS_Path_85[6])
eighty_five_06 <- readRDS(Individual_RDS_Path_85[7])
eighty_five_07 <- readRDS(Individual_RDS_Path_85[8])
eighty_five_08 <- readRDS(Individual_RDS_Path_85[9])
eighty_five_09 <- readRDS(Individual_RDS_Path_85[10])
eighty_five_10 <- readRDS(Individual_RDS_Path_85[11])
eighty_five_11 <- readRDS(Individual_RDS_Path_85[12])
eighty_five_12 <- readRDS(Individual_RDS_Path_85[13])
eighty_five_13 <- readRDS(Individual_RDS_Path_85[14])
eighty_five_14 <- readRDS(Individual_RDS_Path_85[15])
eighty_five_15 <- readRDS(Individual_RDS_Path_85[16])
eighty_five_16 <- readRDS(Individual_RDS_Path_85[17])
eighty_five_17 <- readRDS(Individual_RDS_Path_85[18])
eighty_five_18 <- readRDS(Individual_RDS_Path_85[19])
eighty_five_19 <- readRDS(Individual_RDS_Path_85[20])
eighty_five_20 <- readRDS(Individual_RDS_Path_85[21])
eighty_five_21 <- readRDS(Individual_RDS_Path_85[22])
eighty_five_22 <- readRDS(Individual_RDS_Path_85[23])
eighty_five_23 <- readRDS(Individual_RDS_Path_85[24])
eighty_five_24 <- readRDS(Individual_RDS_Path_85[25])
eighty_five_25 <- readRDS(Individual_RDS_Path_85[26])
eighty_five_26 <- readRDS(Individual_RDS_Path_85[27])
eighty_five_27 <- readRDS(Individual_RDS_Path_85[28])
eighty_five_28 <- readRDS(Individual_RDS_Path_85[29])
eighty_five_29 <- readRDS(Individual_RDS_Path_85[30])
eighty_five_29 <- readRDS(Individual_RDS_Path_85[31])


## united 85 file##
Eighty_Five_Individual <- rbind(eighty_five_01,eighty_five_02,eighty_five_03,eighty_five_04,eighty_five_05,eighty_five_06,
           eighty_five_07,eighty_five_08,eighty_five_09,eighty_five_10,eighty_five_11,eighty_five_12,
           eighty_five_13,eighty_five_14,eighty_five_15,eighty_five_16,eighty_five_17,eighty_five_18,
           eighty_five_19,eighty_five_20,eighty_five_21,eighty_five_22,eighty_five_23,eighty_five_24,
           eighty_five_25,eighty_five_26,eighty_five_27,eighty_five_28,eighty_five_29,eighty_five_29)





## Broking address



Eighty_Five_Individual["Ostan"] <- str_sub(Eighty_Five_Individual$Address,1,2)

Eighty_Five_Individual["Shahrestan"] <- str_sub(Eighty_Five_Individual$Address,3,4)

Eighty_Five_Individual["ur"] <- str_sub(Eighty_Five_Individual$Address,7,7)

Eighty_Five_Individual["KhanevarType"] <- str_sub(Eighty_Five_Individual$Address,30,30)



names(Eighty_Five_Individual)










####build rds path for united 85 file###

Eighty_Five_Individual_path <- "E:NM/Imported_data/85/Eighty_Five_Individual.rds"

saveRDS(Eighty_Five_Individual,Eighty_Five_Individual_path)






### make Individual rds pass for (75, united85,90,95)


Individual_RDS_Path <- RDS_path[str_detect(RDS_path,"Individual")]
Individual_RDS_Path <- c(Individual_RDS_Path,RDS_path[str_detect(RDS_path,"Samplefard2_final")])
Individual_RDS_Path  <- c(Individual_RDS_Path,Eighty_Five_Individual_path)
Individual_RDS_Path <- c(Individual_RDS_Path,RDS_path[str_detect(RDS_path,"person")])
Individual_RDS_Path





###make proccess data path####

Proccessed_RDS_Path_Individual <- str_replace(Individual_RDS_Path,"Imported_data","Processed_data")

Proccessed_RDS_Path_Individual










### rename columns



for(j in 1:length(Individual_colnames$Year)) {
  
  
  Processed_data_Individual <- (readRDS(Individual_RDS_Path[str_detect(Individual_RDS_Path,paste0(Individual_colnames$Year[j]))]))
  
  for(i in 2:length(names(Individual_colnames))) {
    
    names(Processed_data_Individual)[names(Processed_data_Individual) == eval(parse(text =  paste0("Individual_colnames$",names(Individual_colnames[i])))) [j]] <- names(Individual_colnames[i])
  }
  saveRDS(Processed_data_Individual,Proccessed_RDS_Path_Individual[j])
  
}



####rename processed rds files#####




Proccessed_data_new_names_new_path_Individual <- c("E:/NM/Processed_data/95/Individual_95.rds",
                                        "E:/NM/Processed_data/90/Individual_90.rds",
                                        "E:/NM/Processed_data/85/Individual_85.rds",
                                        "E:/NM/Processed_data/75/Individual_75.rds" )

for (i in 1:4){
  file.rename(Proccessed_RDS_Path_Individual[i],Proccessed_data_new_names_new_path_Individual[i])
  
}











 