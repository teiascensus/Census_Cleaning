pkglist <- c("tidyverse","readxl",
             "foreign","writexl",
             "RODBC","data.table",
             "stringi","plyr","rio")


for (package in pkglist){
  if ((eval(parse(text = paste0("require(",package,")")))==FALSE)) {
    install.packages(package)
  }
}

