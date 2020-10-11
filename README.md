

# SA-TTA track @ SAC 2021

This repository contains the artifacts related to our paper submitted to the SA-TTA track @ SAC 2021. This repository is intended to (i) consult more largely the elements outlined in the paper and (ii) reproduce the experimentation results presented in the paper. 

> **Warning**: some files in the Ocarina source code may disclose names of people / institutions participating in the Ocarina project.
 
## Usage

You can see the models/source code simply by exploring the repository in your web navigator, alternatively you can download the project as a ZIP file or clone it (required for experimentation):

`git clone https://github.com/artxy/sac2021.git`

## Content

This repository contains two main directories:
* `./models` that includes the AADL models mentioned in the paper 
* `./ocarina`, an anonymized fork of the free [Ocarina](http://www.openaadl.org/ocarina.html) transformation tool for AADL that we extended with contracts to verify transformation to Cheddar ADL intended for scheduling analysis using [Cheddar](http://beru.univ-brest.fr/~singhoff/cheddar/) 

## AADL models

For reading AADL models (text files with the extension .aadl) you simply need to open them from their respective folders (online or locally with your favorite text editor):
* `./models/preliminaries` for AADL models in the preliminary section  
* `./models/case_study` for AADL models in the case study section

To enjoy syntax coloring and more advanced features, you may install the AADL Development Environment [OSATE](http://osate.org).

## Ocarina (Implementation Elements)

The implementation elements mentioned in the paper can be found within the following directories/files:  
* `./ocarina/src/core/tree`contains all the data structures and routines related to the AADL AST
* `./ocarina/src/backends/ast_xml`includes all the data structures and routines related to the XML AST  
* `./ocarina/src/backends/cheddar`  implements the cheddar backend with:
	* `ocarina-backends-cheddar.ad*` is the entry point that implements the main procedure
	* `ocarina-backends-cheddar-main.ad*` implements the set of visitors
	* `ocarina-backends-cheddar-mapping.ad*` implements mapping functions with rules and contracts in them

Please refer to the dedicated [document](./implem.md) for more details about the implementation.

## Experimentation 

Experimentation will require to download/clone the repository, compile/install Ocarina and finally run it. Whenever possible, we provide scripts to automate this process.  

### Environment and prerequisites

The material provided here is intended to **Unix-like** systems and has been tested in a GNU/Linux environment (Ubuntu 18.04). For the experiment, you will only need to use a **terminal**. In addition, to execute successfully the next steps, you will need the following tools to be installed:
* `git` to clone this repository
* an Ada compiler (e.g. `gnat`)
* additional compilation tools: `autoconf`, `automake`, `gprbuild`, `make`

### Downloading/cloning the repository 

You can simply clone the repository, e.g. in your home directory (`cd ~`), with: 

`git clone https://github.com/artxy/sac2021.git`

Move to the root of the cloned repository to run the following steps:

`cd sac2021` 

### Compiling and installing Ocarina 

At the root of the repository, we provide a  script `install.sh` to compile Ocarina and install it in a local directory:

* to install it in the repository folder (within `.../sac2021/ocarina_install`) simply type: 

`./install.sh`

* or you can specify the directory where to install Ocarina, e.g. in `~/sac2021/ocarina_install`: 

`./install.sh ~/sac2021/ocarina_install `

### Running the case study

To run the case study, you will first need to set the `PATH` environment variable to locate the `bin` directory in the installation directory, e.g.: 

`export PATH=~/sac2021/ocarina_install/bin:$PATH` 

You will then be able to run the case study using our script that set up and run the correct ocarina command: 
  
* to transform the initial AADL model in the case study simply use:

`./run.sh initial`

* to transform the corrected model in the case study type: 

`./run.sh correct`

### Interpreting the results

From the Ocarina log, you may see a number of errors and warnings: 
* when launching `./run.sh initial`an  exceptions is raised as a precondition fails during the transformation execution 

> +========================== OCARINA BUG DETECTED =========================+
> | Detected exception: SYSTEM.ASSERTIONS.ASSERT_FAILURE                    |
> | Error: failed precondition from ocarina-backends-cheddar-mapping.ads:102 |
> | Please refer to the User's Guide for more details.                      |
> +=========================================================================+

* when running  `./run.sh correct` the transformation executes with no error and the output file is created in ` ./ocarina_out`  

### Further experimentation of the models

Feel free to modify the AADL models and to perform additional transformations from them. For this, you may prefer to use directly the `ocarina` command instead of our script. The basic usage of ocarina is:

`ocarina -aadlv2 -g cheddar -o ./ocarina_out/ -r <root_system> <aadl_files>`

* <aad_files> is the list of input aadl files (i.e. the aadl model and its dependencies)
* <root_system> is the root system in <aad_files> to be transformed

For more information on Ocarina usage, refer to the ocarina man page (`man ocarina`) or to the [documentation](https://ocarina.readthedocs.io/en/latest/)

