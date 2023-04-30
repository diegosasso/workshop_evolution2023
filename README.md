
# Workshop: Reconstructing evolutionary dynamics of phenomes using new ontology-informed phylogenetic methods

## Description
This is the main repository for the workshop held at the Evolution 2023 in Albuquerque, NM, USA.

## Overview
Ancestral character state reconstruction drives much of the research in biology by providing insight into the mode and tempo of trait evolution. However, comparative phylogenetics has been largely lacking a method for reconstructing the ancestral phenomes---entities that consist of ensembles of multiple discrete traits, such as entire organismal anatomies or body regions.

In this workshop, we aim to demonstrate how our new R package OntoPhylo can be used to reconstruct the evolutionary dynamics of organismal phenomes using non-homogeneous Poisson processes. Specifically, it is capable of: (1) reconstructing evolutionary rate shifts of phenomes across lineages and time; (2) reconstructing the interactive dynamics of organismal morphospace through time; and (3) assessing rates of evolution at different levels of anatomical hierarchy. These reconstructions are based on the PARAMO pipeline that uses ontology-informed amalgamation of individual character histories through their stochastic maps (Tarasov et al. 2019).

## Date and Location
June 21 (Wednesday) at the Evolution Meeting 2023 in Albuquerque, NM, USA.
Building and Room: TBA

## Schedule
Morning.
08:30 am - 09:00 am -- Introductions.
09:00 am - 10:00 am -- Talk: Intro to ontologies and semantics modeling. [Sergei Tarasov]
10:00 am - 10:30 am -- Coffee break (?)
10:30 am - 12:15 pm -- Demo and hands-on activities with PhenoScript and PhenoSpy.
12:15 am - 12:30 pm -- Call for participation. PhenoRepo initiative.

12:30 pm - 01:30 pm -- Lunch time

Afternoon.
01:30 pm - 02:30 pm -- Talk: Integrating ontologies, phylogenetics and anatomy. [Diego Porto]
02:30 pm - 04:30 pm -- Demo and hands-on activities with OntoPhylo and PARAMO.
04:30 pm - 05:00 pm -- Coffee break (?)
05:00 pm - 05:30 pm -- Closing, feedback and suggestions.


## Pre-workshop preparation
For the hands-on activities of the first part of the workshop, it is necessary to have [PhenoScript](XXX) and [PhenoSpy](XXX) installed. Please follow the instructions in the links for the installation process. PhenoScript is a syntax highlighting package for Visual Studio Code. It provides snippets to ontology terms and facilitates writing semantic species descriptions. PhenoSpy is a Python package that allows converting phenoscript files in RDF/XML to OWL/XML format, which can be opened in ontology editors such as Protégé, to be uploaded to PhenoRepo. PhenoRepo is a GitHub repo for receiving semantic species descriptions. It was created as part of an initiative 

For the hands-on activities of the second part of the workshop, it is necessary to have R/Rstudio installed in your computer and our new package[ontophylo](XXX). Please use the link for installation instructions. We strongly recommend all attendees to read at least the PARAMO paper (Tarasov et al. 2019) since much of the ontophylo developments relies on it.


## Additional resources
- OBOFoundry
- Protégé
- Phenoscape/SCATE

## Suggested readings
- Tarasov et al. (2019, 2021)
- Tarasov (2019, 2020, 2023)
- Porto (2022, 2023)
- Ontologies (Thessen?)
- Semantics Modeling (Balhoff, Dahdul, Deans, Mabee, Vogt)
- Example: AISM (Giron), Tribble

## Organizers
Sergei Tarasov and Diego S. Porto, Finnish Museum of Natural History, Helsinki, Finland


## Funding and Sponsorship
Academy of Finland (346294 and 339576)
Society of Systematic Biologists
