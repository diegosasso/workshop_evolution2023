# Character Annotation using ontoFAST

Authors: *Diego S. Porto and Sergei Tarasov*

# Overview on character annotation.

Each phylogenetic character is a statement about a particular phenotype
observed in one or more organisms. In its simplest form, a character
statement is an affirmation about the absence/presence or quality of an
anatomical entity. More complex statements may relate two or more
anatomical entities (e.g. entity A connected to entity B) or include
relative measurements (e.g. entity A wider than long).

Character statements are usually represented as strings of text in
natural language (=written for humans). In such format, they cannot be
easily parsed or reasoned by computers. A simple alternative to make
them computer-parsable is to convert character statements to semantic
statements by using a structured data model and standardized syntax.

The Entity-Quality (EQ) syntax represents character statements as pairs
of ontology terms, one from an anatomy ontology and another from a
quality ontology. For example, the character statement "Mandible shape:
curved" describing the phenotype of a hymenopteran insect can be
represented as `Mandible`
([HAO_0000506](http://purl.obolibrary.org/obo/HAO_0000506)): `curved`
([PATO_0000406](http://purl.obolibrary.org/obo/PATO_0000406)) by linking
an anatomy term from the Hymenoptera Anatomy Ontology (HAO) (Yoder et
al. [2010](https://doi.org/10.1371/journal.pone.0015991)) to a quality
term from the Phenotype and Trait Ontology (PATO) (Gkoutos et
al. [2005](https://doi.org/10.1186/gb-2004-6-1-r8)).

For the purposes of the PARAMO pipeline (Tarasov et
al. [2019](https://doi.org/10.1093/sysbio/syz005)), only the anatomy
term is necessary to guide character amalgamation. We just need to link
each character statement (i.e. a column in a character matrix) to a
specific term from an anatomy ontology that better defines the
morphological structure under consideration. This procedure is called
'annotation'. Annotation can be facilitated by using semi-automatic
methods such as those implemented in *ontoFAST* (Tarasov et
al. [2022](https://doi.org/10.1111/2041-210X.13753)) but usually still
requires expert-based input to make the final decision. In this
tutorial, we will show how to employ pre-annotated characters or
semi-automatic annotations to query the ontology.

# STEP 0. Install and load packages.

Before starting this tutorial, please verify if you already have
ontophylo, ontoFAST and igraph packages installed. If not, then you can
install it by running the code below:

``` r
remotes::install_github("diegosasso/ontophylo")
install.packages("ontoFAST")
install.packages("igraph")
```

Now, let's load the package.

``` r
library(ontophylo)
library(ontoFAST)
```

Let's also load some other packages that will be useful in this
tutorial. If you have not them installed, please do so by running
`install.packages()`.

``` r
library(ontologyIndex)
library(tidyverse)
```

# STEP 1. Annotating characters using ontoFAST

`ontoFAST` aids fast annotations of characters with biological
ontologies. `ontoFAST` takes a biomedical ontology in OBO format and a
list of characters as input, and produces a list of mappings from
characters to ontology terms as output. An overview of `ontoFAST` is
provided below; the detailed tutorial can be found
[here](https://github.com/sergeitarasov/ontoFAST/wiki).

The workflow of `ontoFAST` consists of the following steps:

1.  Read in required ontology and character statements:

    -   Ontology has to be the `.obo` file format or any R file format
        (e.g., `.rmd`, `rda`). The ontology `.obo` files can be
        downloaded from
        [BioPortal](https://bioportal.bioontology.org/ontologies) or
        [OBO foundry](http://obofoundry.org/).
    -   Character statements must be in a table file format. The tables
        can imported in `R` in `.csv` fomat. If you have your character
        matrix in `nexus` or `tnt` format, open it in `Mesquite` and
        copy character statements to e.g., `Excel` spreadsheet, then
        save the spreadsheet as a `.csv` file.

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

## Read in ontology and character matrix

For this tutorial and the following ones, we will use a modified data
set from Sharkey et
al. ([2012](https://doi.org/10.1111/j.1096-0031.2011.00366.x)). The
modified data set contains 239 morphological characters for 87 species
of Hymenoptera.

``` r
# Import character matrix.
hym_mat <- readRDS("data/hym_matrix.RDS")
print(hym_mat)
```

We will read in Hymenoptera Anatomy Ontology that is embedded in the
`ontoFAST` package and character statements for the character matrix.
Ontology can be parsed directly from `.obo` file using `get_OBO`
function from the package *ontologyIndex* (Greene et
al. [2017](https://doi.org/10.1093/bioinformatics/btw763)).

``` r
# get ontology
hao_obo<-get_OBO(system.file("data_onto", "HAO.obo", package = "ontoFAST"), extract_tags="everything", propagate_relationships = c("BFO:0000050", "is_a"))

# get character statements
data(Sharkey_2011)

# Let's select 30 characters from the statement list for the downstream annotation
my.chars <- Sharkey_2011[1:30,1]
print(my.chars)
```

## Process data and run interactive session

To automatically process the data use `onto_process` function. This
function parses synonyms, character statements, and character IDs into
`hao_obo` object. By default, it also performs automatic annotation of
character statements with ontology terms (`do.annot = TRUE`).

``` r
hao_obo<-onto_process(hao_obo, my.chars, do.annot = TRUE)
```

First, we have to create a new environment to store a variable that will
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

## Save annotations for downstream analyses

``` r
out <- list2edges(ontofast$shiny_in$terms_selected_id)
out <- cbind(out, get_onto_name(out[,2], hao_obo))
print(out)
write.csv(out, "my_annotations.csv")
```

# STEP 2. PARAMO: Querying the ontology with pre-annotated characters.

We will assume that the annotations for our Hymenoptera data set have
been completed. We can now query the annotated characters using
Hymenoptera ontology, which is necessary for character amalgamation in
PARAMO pipline.

First, import the csv table with pre-cooked ontology annotations running
the code below:

``` r
# Import annotations.
hym_annot <- readRDS ("data/hym_annot.RDS")
print(hym_annot)
```

To guide the character amalgamations in the PARAMO pipeline, we need
first to cluster characters based on their ontology annotations. In the
following chunk of code, we will import the HAO ontology in OBO format
again. Then we will make a query to retrieve all characters located on
three anatomical regions of the Hymenoptera anatomy: head, mesosoma and
metasoma. The annotated characters are associated with these regions via
*part_of* or *is_a* relationships form the ontology.

``` r
# Import HAO.
onto <- get_OBO("data/HAO.obo", extract_tags = "everything", 
                propagate_relationships = c("BFO:0000050", "is_a"))

# Define query terms for anatomical regions.
query_anat <- c("head", "mesosoma", "metasoma")

# Set a table of matches between characters and ontology terms.
char_info <- hym_annot %>% select(char_id, onto_id)

# Group characters by anatomical regions.
HYM_ANAT <- RAC_query(char_info, onto, query_anat)
```

Finally, we will sample 10 characters from each anatomical region for
further analyses in the following tutorials and save the results.

``` r
# Get a sample of characters from each anatomical region.
set.seed(42)
HYM_ANAT <- lapply(HYM_ANAT, function(x) sample(x, 10))
HYM_ANAT

# Create a folder to store RData files.
dir.create("RData")

# Save workspace.
save.image("RData/step1_annot.RData")
```
