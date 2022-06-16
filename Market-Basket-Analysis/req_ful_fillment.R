# Different way to download and load the required packages in R
PACKAGES_REQUIRED <- c("arules","arulesViz","tm","purr",
                       "data.table", "tidyr", "qdap", "openxlsx","wordnet")

## Check if any packages were not installed in the system
NEW.PACKAGES <- PACKAGES_REQUIRED[!(PACKAGES_REQUIRED %in% installed.packages()[,"Package"])]

### If any packages are not installed then install the packages
if(length(NEW.PACKAGES)) install.packages(NEW.PACKAGES)

### Load all the required packages into the script
lapply(PACKAGES_REQUIRED, require, character.only = T)
rm(PACKAGES_REQUIRED)