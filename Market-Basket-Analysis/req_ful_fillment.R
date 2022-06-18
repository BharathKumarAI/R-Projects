# Different way to download and load the required packages in R

# Note: for curl dependencies into few linux libraries using command: sudo apt-get install libcurl4-openssl-dev
PACKAGES_REQUIRED <- c("arules", "curl", "plotly", "arulesViz", "config", "logging","dplyr",
                       "data.table", "tidyr", "qdap", "openxlsx","RColorBrewer")

# About config package: https://cran.r-project.org/web/packages/config/vignettes/introduction.html

## Check if any packages were not installed in the system
NEW.PACKAGES <- PACKAGES_REQUIRED[!(PACKAGES_REQUIRED %in% installed.packages()[,"Package"])]

### If any packages are not installed then install the packages
if(length(NEW.PACKAGES)) install.packages(NEW.PACKAGES)

### Load all the required packages into the script
lapply(PACKAGES_REQUIRED, require, character.only = T)
rm(PACKAGES_REQUIRED)