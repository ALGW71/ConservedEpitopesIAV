### CD4+ T cells Recognise Conserved Influenza-A Epitopes through Shared Patterns of V-gene Usage and Complementary Biochemical Features

#### Greenshields-Watson et al. 2020

https://doi.org/10.1016/j.celrep.2020.107885

https://www.sciencedirect.com/science/article/pii/S2211124720308664

The R Markdown files in this repository were created to analyse data and generate figures used in the publication. To run this code you will need to install the various tools from the command line. Links are included in each section. The raw TCR seq data is available from: vdjdb.net. Various raw data files (conservation analysis and in vivo data xlsx files ) are included in the input folder.



## Basic TCR sequence analysis (R)
- VJ gene usage bar graphs (Figure 3).
- Circos plots.
- Shannon entropy graphs.
- KL divergence graphs.
- Visualisation of CDR3 sequences as ggseqlogo plots.
- Alakazam analysis of middle six CDR3 amino acids.

## GLAM2, MEME, MUSCLE and Phylogenetics (bash and R)
- Sequence motif analysis.

## OLGA analysis (bash and R)
- pGen calculations for all CDR3 sequences.

## Conservation Analysis Heatmaps and Graphs (R)
- Raw data.
- Bar graphs and heatmaps detailing the number of mutations in strains of influenza (human, avian, swine).

## In vivo Challenge analysis (R)
- Raw data
- Bar graphs

## Crystallographic PyMOL scripts (Python/PyMOL-syntax)
- Relevant PDB accession numbers:
F11-DR1-PKY Complex	PDB: 6R0E
DR1-SGP	PDB: 6QZC
DR1-QAR	PDB: 6QZD
DR1-GMF	PDB: 6QZA
- PML scripts to recreate the crystallographic figures
