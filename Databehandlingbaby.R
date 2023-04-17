# Install from CRAN
install.packages("tidyverse")
library(tidyverse)

# Indlæser pakker og sætter wd

setwd("C:/Users/Frede/Desktop/BFTP/Datasæt Husk Hz-DB i navn")

# Laver liste af alle .txt filer i wd

list_of_files <- list.files(path = ".", recursive = TRUE,
                            pattern = "\\.txt$", 
                            full.names = TRUE)
data8kHz = data.frame(matrix(nrow = 531,ncol=0))


# Måske?? 
  
df <- list_of_files %>% map_df(read.csv, sep = ",", .id = "FileName"
                               
# Men ellers??
  
data8kHz <- list_of_files %>%
  purrr::set_names(.) %>%
  map_df(read_table, .id = "FileName", col_names = FALSE)
  

# Lav en liste af tidspunkter
tidspunkter <- seq(0, 111, length.out = 532)


  
fix_df <- data8kHz %>%
  pivot_wider(names_from = FileName, values_from = X1) %>% # Funktion der omformer dataframen til at have søjler med fil-navn som titel, og dataen som lister i første række.
  unnest() %>%  #tager dataen ud af lister, og giver hvert datapunkt en række i dataframen
  mutate(Tid_i_ms = tidspunkter)
  

ggplot 




x <- read_table("2kHz5ms10dBgain_1p00ADVpk_111ms_3_24_2023_2_28_07PM.txt", )

# Oprydning

remove(data8kHz)
remove(list_of_files)

