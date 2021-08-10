library("tidyverse")
library("stringi")
library("readxl")
library("foreign")
library("RODBC")

Household_colnames <- read_xlsx(Col_name_path,sheet = "Household")
Household_colnames

Household_RDS_Path <- RDS_path[str_detect(RDS_path,"kh")]
Household_RDS_Path <- c(Household_RDS_Path,RDS_path[str_detect(RDS_path,"Household")|str_detect(RDS_path,"household")])

Household_RDS_Path


######convert all 85 province to one 85 file###

Household_RDS_Path_85 <-  Household_RDS_Path[str_detect(Household_RDS_Path,"85")]

eighty_five_00 <- readRDS(Household_RDS_Path_85[1]) 
eighty_five_01 <- readRDS(Household_RDS_Path_85[2])
eighty_five_02 <- readRDS(Household_RDS_Path_85[3])
eighty_five_03 <- readRDS(Household_RDS_Path_85[4])
eighty_five_04 <- readRDS(Household_RDS_Path_85[5])
eighty_five_05 <- readRDS(Household_RDS_Path_85[6])
eighty_five_06 <- readRDS(Household_RDS_Path_85[7])
eighty_five_07 <- readRDS(Household_RDS_Path_85[8])
eighty_five_08 <- readRDS(Household_RDS_Path_85[9])
eighty_five_09 <- readRDS(Household_RDS_Path_85[10])
eighty_five_10 <- readRDS(Household_RDS_Path_85[11])
eighty_five_11 <- readRDS(Household_RDS_Path_85[12])
eighty_five_12 <- readRDS(Household_RDS_Path_85[13])
eighty_five_13 <- readRDS(Household_RDS_Path_85[14])
eighty_five_14 <- readRDS(Household_RDS_Path_85[15])
eighty_five_15 <- readRDS(Household_RDS_Path_85[16])
eighty_five_16 <- readRDS(Household_RDS_Path_85[17])
eighty_five_17 <- readRDS(Household_RDS_Path_85[18])
eighty_five_18 <- readRDS(Household_RDS_Path_85[19])
eighty_five_19 <- readRDS(Household_RDS_Path_85[20])
eighty_five_20 <- readRDS(Household_RDS_Path_85[21])
eighty_five_21 <- readRDS(Household_RDS_Path_85[22])
eighty_five_22 <- readRDS(Household_RDS_Path_85[23])
eighty_five_23 <- readRDS(Household_RDS_Path_85[24])
eighty_five_24 <- readRDS(Household_RDS_Path_85[25])
eighty_five_25 <- readRDS(Household_RDS_Path_85[26])
eighty_five_26 <- readRDS(Household_RDS_Path_85[27])
eighty_five_27 <- readRDS(Household_RDS_Path_85[28])
eighty_five_28 <- readRDS(Household_RDS_Path_85[29])
eighty_five_28 <- readRDS(Household_RDS_Path_85[29])
eighty_five_29 <- readRDS(Household_RDS_Path_85[30])
eighty_five_29 <- readRDS(Household_RDS_Path_85[31])


## united 85 file##
Eighty_Five_Household <- rbind(eighty_five_01,eighty_five_02,eighty_five_03,eighty_five_04,eighty_five_05,eighty_five_06,
                                eighty_five_07,eighty_five_08,eighty_five_09,eighty_five_10,eighty_five_11,eighty_five_12,
                                eighty_five_13,eighty_five_14,eighty_five_15,eighty_five_16,eighty_five_17,eighty_five_18,
                                eighty_five_19,eighty_five_20,eighty_five_21,eighty_five_22,eighty_five_23,eighty_five_24,
                                eighty_five_25,eighty_five_26,eighty_five_27,eighty_five_28,eighty_five_29,eighty_five_29)









## Broking address



Eighty_Five_Household["Ostan"] <- str_sub(Eighty_Five_Household$Address,1,2)

Eighty_Five_Household["Shahrestan"] <- str_sub(Eighty_Five_Household$Address,3,4)

Eighty_Five_Household["ur"] <- str_sub(Eighty_Five_Household$Address,7,7)

Eighty_Five_Household["KhanevarType"] <- str_sub(Eighty_Five_Household$Address,30,30)




names(Eighty_Five_Household)




####build rds path for united 85 file###

Eighty_Five_Household_path <- "E:NM/Imported_data/85/Eighty_Five_Household.rds"

saveRDS(Eighty_Five_Household,Eighty_Five_Household_path)




### make Individual rds pass for (75, united85,90,95)


Household_RDS_Path <- RDS_path[str_detect(RDS_path,"CN95_2Percent_Household")]
Household_RDS_Path <- c(Household_RDS_Path,RDS_path[str_detect(RDS_path,"samplekhanevarmaskan2_final")])
Household_RDS_Path  <- c(Household_RDS_Path,Eighty_Five_Household_path)
Household_RDS_Path <- c(Household_RDS_Path,RDS_path[str_detect(RDS_path,"sample_household_CN75")])
Household_RDS_Path





###make proccess data path####

Proccessed_RDS_Path_Household <- str_replace(Household_RDS_Path,"Imported_data","Processed_data")

Proccessed_RDS_Path_Household







### rename columns



for(j in 1:length(Household_colnames$Year)) {
  
  
  Processed_data_Household <- (readRDS(Household_RDS_Path[str_detect(Household_RDS_Path,paste0(Household_colnames$Year[j]))]))
  
  for(i in 2:length(names(Household_colnames))) {
    
    names(Processed_data_Household)[names(Processed_data_Household) == eval(parse(text =  paste0("Household_colnames$",names(Household_colnames[i])))) [j]] <- names(Household_colnames[i])
  }
  saveRDS(Processed_data_Household,Proccessed_RDS_Path_Household[j])
  
}

####rename processed rds files#####


Proccessed_data_new_names_new_path_household <- c("E:/NM/Processed_data/95/Household_95.rds",
                                                  "E:/NM/Processed_data/90/Household_90.rds",
                                                  "E:/NM/Processed_data/85/Household_85.rds",
                                                  "E:/NM/Processed_data/75/Household_75.rds" )

for (i in 1:4){
  file.rename(Proccessed_RDS_Path_Household[i],Proccessed_data_new_names_new_path_household[i])
}

