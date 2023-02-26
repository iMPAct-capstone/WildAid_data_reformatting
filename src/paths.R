

# path to google drive 
sys_path <- ifelse(Sys.info()["sysname"]=="Windows", "G:/Shared drives/", "~/Google Drive/Shared drives/")
# Path to data folder
data_path <- paste0(sys_path,"iMPAct_drive/data")
