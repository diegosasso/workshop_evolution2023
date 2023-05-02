
# Workshop: Reconstructing evolutionary dynamics of phenomes using new ontology-informed phylogenetic methods

## Description
This is the main repository for the workshop held at the Evolution 2023 in Albuquerque, NM, USA.

## Overview
Ancestral character state reconstruction drives much of the research in biology by providing insight into the mode and tempo of trait evolution. However, comparative phylogenetics has been largely lacking a method for reconstructing the ancestral phenomes---entities that consist of ensembles of multiple discrete traits, such as entire organismal anatomies or body regions.

In this workshop, we aim to demonstrate how our new R package OntoPhylo can be used to reconstruct the evolutionary dynamics of organismal phenomes using non-homogeneous Poisson processes. Specifically, it is capable of: (1) reconstructing evolutionary rate shifts of phenomes across lineages and time; (2) reconstructing the interactive dynamics of organismal morphospace through time; and (3) assessing rates of evolution at different levels of anatomical hierarchy. These reconstructions are based on the PARAMO pipeline that uses ontology-informed amalgamation of individual character histories through their stochastic maps (Tarasov et al. 2019).

## Date and Location
* June 21 (Wednesday) at the Evolution Meeting 2023 in Albuquerque, NM, USA.
* Building and Room: TBA

## Schedule
Morning.
* 08:30 am - 09:00 am -- Introductions.
* 09:00 am - 10:00 am -- Talk: Intro to ontologies and semantics modeling. (Sergei Tarasov)
* 10:00 am - 10:30 am -- Coffee break (?)
* 10:30 am - 12:15 pm -- Theory Onto-Phylo. (Demo and hands-on activities with PhenoScript and PhenoSpy.)
* 12:15 am - 12:30 pm -- Call for participation. PhenoRepo initiative.

* 12:30 pm - 01:30 pm -- Lunch time

Afternoon.
* 01:30 pm - 02:30 pm -- Talk: Integrating ontologies, phylogenetics and anatomy. (Diego Porto)
* 02:30 pm - 04:30 pm -- Demo and hands-on activities with OntoPhylo and PARAMO.
* 04:30 pm - 05:00 pm -- Coffee break (?)
* 05:00 pm - 05:30 pm -- Closing, feedback and suggestions.


## Pre-workshop preparation
For the hands-on activities of the first part of the workshop, it is necessary to have [PhenoScript](https://github.com/sergeitarasov/PhenoScript) and [PhenoSpy](https://pypi.org/project/phenospy/) installed. Please follow the instructions in the links for the installation process. PhenoScript is a syntax highlighting package for Visual Studio Code. It provides snippets to ontology terms and facilitates writing semantic species descriptions. PhenoSpy is a Python package that allows converting phenoscript files in RDF/XML to OWL/XML format, which can be opened in ontology editors such as Protégé, to be uploaded to PhenoRepo. [PhenoRepo](https://github.com/phenoscape/pheno-repo) is a GitHub repo for receiving semantic species descriptions. It was created as part of an initiative to prompt researchers to publish and share phenotypic data as semantic descriptions thus making the data available for computer reasoning and other applications.

For the hands-on activities of the second part of the workshop, it is necessary to have R/Rstudio installed in your computer and our new package [ontophylo](https://github.com/diegosasso/ontophylo). Please use the link for installation instructions. We strongly recommend all attendees to read at least the PARAMO paper (Tarasov et al. 2019) since much of the ontophylo developments relies on it.


## Additional resources
* [OBO Foundry](https://obofoundry.org/)
* [Protégé](https://protege.stanford.edu/)
* [Phenoscape](https://phenoscape.org/)/[SCATE](https://scate.phenoscape.org/)

## Suggested readings
- PARAMO and ontoFAST - Tarasov et al. ([2019](https://doi.org/10.1093/isd/ixz009), [2021](https://doi.org/10.1111/2041-210X.13753))
- Modeling dependent traits - Tarasov ([2019](https://doi.org/10.1093/sysbio/syz005), [2020](https://doi.org/10.1093/sysbio/syz050), [2023]())
- ontobayes and rphenoscate - Porto et al. ([2022](https://doi.org/10.1093/sysbio/syac022), [2023](https://doi.org/10.1101/2023.02.19.528613v1))
- Overview about ontologies and phenomics - Deans et al. ([2015](https://doi.org/10.1371/journal.pbio.1002033)); Thessen et al. ([2020](https://doi.org/10.1371/journal.pcbi.1008376))
- Semantics modeling and tools - Balhoff et al. ([2010](https://doi.org/10.1371/journal.pone.0010500)); Dahdul et al. ([2010](https://doi.org/10.1371/journal.pone.0010708)); Vogt ([2019](https://doi.org/10.1186/s13326-019-0204-6)); Mabee et al. ([2020](https://doi.org/10.1093/sysbio/syz067))
- Example application of the PARAMO pipeline - Tribble et al. ([2023](https://doi.org/10.1093/sysbio/syac070))
- Example of development of a new ontology for the skeletal anatomy of insects - Girón et al. ([2023](https://doi.org/10.1093/sysbio/syad025/7140370))

## Organizers
[Sergei Tarasov](https://scholar.google.com/citations?user=CqTq-BkAAAAJ) and [Diego S. Porto](https://scholar.google.com/citations?user=hRTdDu4AAAAJ&hl), Finnish Museum of Natural History, Helsinki, Finland


## Funding and Sponsorship
* Academy of Finland (346294 and 339576)
* Society of Systematic Biologists
