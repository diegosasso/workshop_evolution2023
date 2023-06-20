## Introduction to ontoFAST

`ontoFAST` aids fast annotations of characters with biological
ontologies. `ontoFAST` takes a biomedical ontology in OBO format and a
list of characters as input, and produces a list of mappings from
characters to ontology terms as output. The detail `ontoFAST` tutorial
can be found [here](https://github.com/sergeitarasov/ontoFAST/wiki).

The workflow of `ontoFAST` consists of the following steps:

1.  Read in required ontology and character statements:

    -   Ontology has to be the `.obo` file format or any R file format
        (e.g., `.rmd`, `rda`). The ontology `.obo` files can be
        downloaded from
        [BioPortal](https://bioportal.bioontology.org/ontologies) or
        [OBO foundry](http://obofoundry.org/)
    -   Character statements must be in a table file format. The tables
        can imported in `R` in `.csv` fomat. If you have your character
        matrix in `nexus` or `tnt` format open it in `Mesquite` and copy
        character statements to e.g., `Excel` spreadsheet, then save the
        spreadsheet as a `.csv` file.

2.  Run automatic annotation of characters with ontology terms using
    `ontoFAST` functions. This step is optional and can be skipped if
    not required.

3.  Run `ontoFAST` interactively to make *de novo* character
    annotations, post-process automatic annotations or edit previous
    annotations. The interactive mode visualizes the ontology as a graph
    thus providing a convenient way to navigate through it.

4.  As soon as annotations are done you can:

    -   visualize annotations using the [sunburst
        plots](https://bl.ocks.org/kerryrodden/7090426) to demonstrate
        hierarchical relationships or
        [Cytoscape](http://www.cytoscape.org/?gclid=Cj0KCQjwprbPBRCHARIsAF_7gDYZQVw7nJyt7jJNkQJZtr9AoMCkzPlWF_X5OMrqtPAA4P-yT4m69l0aAiBTEALw_wcB)
        to see the network structure.
    -   query annotations using the in-built `ontoFAST` functions.

5.  Save your results.

## Install and load required packages

``` r
# install.packages("ontoFAST")
# install.packages("igraph")

library("ontoFAST")
```

    ## Loading required package: shiny

    ## Loading required package: ontologyIndex

    ## Loading required package: visNetwork

## Read in ontology and character matrix

We will read in Hymenoptera Anatomy Ontology that is embedded in the
`ontoFAST` package and Hymenoptera character matrix (Sharkey et al.,
2011: Cladistics). Ontology can be parsed directly from `.obo` file
using `get_OBO` function from `ontologyIndex` package.

``` r
hao_obo<-get_OBO(system.file("data_onto", "HAO.obo", package = "ontoFAST"), extract_tags="everything", propagate_relationships = c("BFO:0000050", "is_a"))

# character matrix
data(Sharkey_2011)

# Let's select definitions for 30 characters from the matrix
my.chars <- Sharkey_2011[1:30,1]
print(my.chars)
```

    ##  [1] "Ocellar corona"                                    
    ##  [2] "Supraantennal groove or depression"                
    ##  [3] "Notch on medial margin of eye"                     
    ##  [4] "Position of toruli relative to eyes"               
    ##  [5] "Position of toruli relative to clypeus"            
    ##  [6] "Subantennal shelf"                                 
    ##  [7] "Inner margin of torulus"                           
    ##  [8] "Subantennal groove"                                
    ##  [9] "Clypeus"                                           
    ## [10] "Mandibular foramen"                                
    ## [11] "Occipital sulcus and ridge"                        
    ## [12] "Position  occipital foramen"                       
    ## [13] "Position  posterior tentorial pits"                
    ## [14] "Sclerotization between occipital and oral foramina"
    ## [15] "Ventral sclerotization configuration"              
    ## [16] "Postoccipital bridge"                              
    ## [17] "Longitudinal sulci on ventral head sclerotization" 
    ## [18] "Occipital carina"                                  
    ## [19] "Occipital carina configuration"                    
    ## [20] "Dorsal tentorial arm"                              
    ## [21] "Shape  tentorial bridge"                           
    ## [22] "Corpotendon on tentorial bridge"                   
    ## [23] "Position of labrum"                                
    ## [24] "Shape of labrum"                                   
    ## [25] "Labrum"                                            
    ## [26] "Exposure of labrum"                                
    ## [27] "Distal epipharyngeal wall"                         
    ## [28] "Lateral epipharyngeal brush"                       
    ## [29] "Epipharyngeal lobe"                                
    ## [30] "Epipharyngeal setae"

## Process data and run interactive session

To automatically process the data use `onto_process` function. This
function parses synonyms, character statements, and character IDs into
`hao_obo` object. By default, it also performs automatic annotation of
character statements with ontology terms (`do.annot = TRUE`).

``` r
hao_obo<-onto_process(hao_obo, my.chars, do.annot = TRUE)
```

    ## [1] "Doing automatic annotation of characters with ontology terms..."

First, we to create a new environment to store a variable that will
serve as an input and output for the interactive mode; the new
environment should be called `ontofast` (other names will not work), it
enables global usage of the input variable for the functions operating
during the interactive session. `ontoFAST` will not be working correctly
without creating this new environment; it is recommended to set the
empty enviroment as a parent for the created environment (see
[here](http://adv-r.had.co.nz/Environments.html)). Next, use the
function `make_shiny_in()` to create an object in the `ontofast`
environment, let's call it `shiny_in`. Note, the name of this variable
is taken as an argument `shiny_in="shiny_in"` by the function
`runOntoFast()`to launch the interactive session.

``` r
ontofast <- new.env(parent = emptyenv())
ontofast$shiny_in <- make_shiny_in(hao_obo)
```

### The interactive session

Executing the `runOntoFast()` line strat the interactive session. It may
take a few seconds until all characters are loaded. Annotate your
character in the interactive session.

``` r
runOntoFast(is_a = c("is_a"), part_of = c("BFO:0000050"), shiny_in="shiny_in", file2save = "OntoFAST_shiny_in.RData")
```

    ## Warning in runOntoFast(is_a = c("is_a"), part_of = c("BFO:0000050"), shiny_in =
    ## "shiny_in", : Run R interactively!

## Save annotations for downstream analyses

``` r
out <- list2edges(ontofast$shiny_in$terms_selected_id)
out <- cbind(out, get_onto_name(out[,2], hao_obo))
print(out)
```

    ##      out

``` r
write.csv(out, "annotations.csv")
```
