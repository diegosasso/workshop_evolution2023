
# Load packages.
library(grImport)
library(tidyverse)

# Process postscript vector image.
PostScriptTrace(file = "data/hym.eps", outfilename = "data/hym.xml")

# Import XML file.
hym_img <- readPicture("data/hym.xml")

# Check full image.
grid.picture(hym_img)
dev.off()

# Check picture paths.
picturePaths(hym_img)
dev.off()

# OBS. Check the numbers.

# Load csv table with information on vector image layers.
hym_graph <- read_csv("data/hym_graph.csv")
hym_graph

# OBS. Check also the hym_graph.csv file.
