#data reorganization
library(readxl)
library(tidyverse)

#this script reads in the untidy lookup table for subcategories and changes it to a tidy format

source(file.path(here::here(),"src/paths.R"))

table <- read_xlsx(file.path(data_path, "tables", "reformat_subcategory.xlsx")) #read in the excel table, this table is stored in the lookup_tables folder on the client's Google Drive

 sub_category_table <- table |> pivot_longer( 
  cols = !c(Final_Category,final_name, indicator_type, reformat_comments, format),
  names_to = c("language", "variable", "year"),
  names_sep = "_",
  values_to = "sub_category") |> 
  filter(variable == 'subcategory', !is.na(sub_category), !sub_category == 'NA') |>
   mutate(
     reformat_key = case_when(
       (format == "split_2019_2020" & year %in% c(2019, 2020))  ~ "split",
       (format == "split_2019_2020_2021" & year %in% c(2019, 2020, 2021))  ~ "split", 
          (format == 'average_2021_1' & year == 2021) ~ "average",
       TRUE ~ "none"
       
       )) |> select(-format)
  
 write_csv(sub_category_table, file.path(data_path, "tables", "reformat_subcategory_tidy"))
 #this file is saved in the lookup tables folder on the client's google drive 
