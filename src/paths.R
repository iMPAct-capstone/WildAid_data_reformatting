

# path to google drive 
sys_path <- ifelse(Sys.info()["sysname"]=="Windows", "G:/Shared drives/", "~/Google Drive/Shared drives/")
# Path to data folder containing the raw mps data
#these files are stored in the data/raw folder on the client's Google Drive
data_path <- paste0(sys_path,"iMPAct_drive/data")
