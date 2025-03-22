# EcoTRACE - Stage 1 Registered Report Supplementary Information and Code Repository

## System Requirements

All software dependencies and the operating system used to run the code in this repository are documented in each script under the section **"Expand for Session Info"**. The code has been tested on the R version and package versions specified in these sections. No non-standard hardware is required to run the code.

## Installation Guide

The code execution requires a standard installation of **R version 4.4.0 or higher**. All necessary packages are indicated in the code chunks labeled **"setup"** within each script as well as under the section **Expand for Session Info**. Running the "setup" code chunk will automatically download and install all required packages. The typical installation time is less than 5 minutes.

## Demo

The code is written in **Quarto (.qmd) files**, as this file format allows to seamlessly integrate R code, instructions, and output within a single document. To facilitate easy access to the expected output and detailed explanations, we rendered the Quarto files as a **website**, which can be navigated interactively. The website is hosted via GitHub Pages and can be accessed at the following link:

[EcoTRACE Website](https://eguizarrosales.github.io/EcoTRACE_RRNatClimChange/)

The code is designed to run efficiently on a standard desktop computer or laptop. All scripts were tested on a laptop without encountering unexpected delays. However, certain code chunks involving **power simulations** may require several hours of computation. These chunks are clearly marked, and users are advised about the expected runtime. To circumvent lengthy computations, we provide **prerun results as .RDS files**, which can be loaded directly as instructed in the corresponding Quarto files.

## Instructions for Use

As outlined above, all code is embedded within Quarto files, accompanied by comprehensive instructions on how to execute the scripts. Since this project represents a **Stage 1 Registered Report**, no data have been collected at this stage. 

The project relies on either openly available data (e.g., extreme weather event data, with sources cited in the relevant Quarto file) or generated data from power simulations. All functions used for power simulations are provided and documented, allowing users to customize assumptions and generate their own simulated data. 

To reproduce the outputs reported in this project, users can **fork this repository**, follow the **system requirements** instructions, and execute the provided code. 

## License

This project is released under the terms of the **MIT License** ((https://opensource.org/license/mit)[https://opensource.org/license/mit]).

## Contact

For any questions or issues, feel free to open an **issue on GitHub** or contact the repository owner directly:

[Emmanuel Guizar Rosales](mailto:emmanuel.guizarrosales@unibe.ch?subject=NCC%20Stage%201%20Registered%20Report)
