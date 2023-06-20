install.packages("ontoFAST")
install.packages("igraph")
library("ontoFAST")


hao_obo<-get_OBO(system.file("data_onto", "HAO.obo", package = "ontoFAST"), extract_tags="everything", propagate_relationships = c("BFO:0000050", "is_a"))
data(Sharkey_2011)

hao_obo<-onto_process(hao_obo, Sharkey_2011[,1], do.annot = F)
ontofast <- new.env(parent = emptyenv())
ontofast$shiny_in <- make_shiny_in(hao_obo)
runOntoFast(is_a = c("is_a"), part_of = c("BFO:0000050"), shiny_in="shiny_in", file2save = "OntoFAST_shiny_in.RData")

out <- list2edges(ontofast$shiny_in$terms_selected_id)
get_onto_name(out[,2], onto)
write.csv(out, "annotations.csv")


# ----------------

library(ontophylo)
library(ontoFAST)
library(ontologyIndex)
library(tidyverse)

# Import character matrix.
hym_mat <- readRDS("data/hym_matrix.RDS")


# Import HAO.
onto <- get_OBO("data/HAO.obo", extract_tags = "everything", 
                propagate_relationships = c("BFO:0000050", "is_a"))

# Define query terms for anatomical regions.
query_anat <- c("head", "mesosoma", "metasoma")

# Set a table of matches between characters and ontology terms.
char_info <- hym_annot %>% select(char_id, onto_id)

a <- hym_annot
# Group characters by anatomical regions.
HYM_ANAT <- RAC_query(char_info, onto, query_anat)


hym_annot %>% slice(1:8)


# Pre-organize the ontology object.
onto$parsed_synonyms <- syn_extract(onto)
onto$id_characters <- hym_annot$char_id
onto$name_characters <- setNames(hym_annot$char,hym_annot$char_id)

# Run ontoFAST.
auto_annot <- annot_all_chars(onto)


cand_annot <- setNames(auto_annot[6:8], hym_annot$char[6:8])
lapply(cand_annot, function(x) onto$name[names(onto$name) %in% x] )

# Get a sample of characters from each anatomical region.
set.seed(42)
HYM_ANAT <- lapply(HYM_ANAT, function(x) sample(x, 10))
HYM_ANAT

# Create a folder to store RData files.
dir.create("RData")

# Save workspace.
save.image("RData/step1_annot.RData")

