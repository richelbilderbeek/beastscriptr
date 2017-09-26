# beastscriptr

Branch|[![Travis CI logo](TravisCI.png)](https://travis-ci.org)|[![Codecov logo](Codecov.png)](https://www.codecov.io)
---|---|---
master|[![Build Status](https://travis-ci.org/richelbilderbeek/beastscriptr.svg?branch=master)](https://travis-ci.org/richelbilderbeek/beastscriptr)|[![codecov.io](https://codecov.io/github/richelbilderbeek/beastscriptr/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/beastscriptr/branch/master)
develop|[![Build Status](https://travis-ci.org/richelbilderbeek/beastscriptr.svg?branch=develop)](https://travis-ci.org/richelbilderbeek/beastscriptr)|[![codecov.io](https://codecov.io/github/richelbilderbeek/beastscriptr/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/beastscriptr/branch/develop)

`beastscriptr` is `BEAUti` from R.

The purpose of `beastscriptr` is to create 
[a valid BEAST2 XML input file](inst/extdata/birth_death_0_20151005.xml)
from its function arguments. In this way, a scientific pipeline using 
`BEAST2` can be fully scripted, instead of using `BEAUti` its GUI.

## Example #1: birth-death model tree prior  

```
# Simulate a random alignment and save it to a FASTA file
beastscriptr::create_random_fasta(
  n_taxa = 5,
  sequence_length = 10,
  filename = "my_fasta.fas"
)

# Create the BEAST2 XML input file
beastscriptr::beast_scriptr(
  input_fasta_filename = "my_fasta.fas",
  mcmc_chainlength = 10000,
  tree_prior = "birth_death",
  output_xml_filename = "my_beast.xml"
)
```

## Example #2: birth-death model tree prior with fixed crown age

```
# Simulate a random alignment and save it to a FASTA file
testthat::expect_false(file.exists(input_fasta_filename))
beastscriptr::create_random_fasta(
  n_taxa = 5,
  sequence_length = 10,
  filename = "my_fasta.fas"
)


# Create the BEAST2 XML input file
beastscriptr::beast_scriptr(
  input_fasta_filename = "my_fasta.fas",
  mcmc_chainlength = 10000,
  tree_prior = "birth_death",
  output_xml_filename = "my_beast.xml",
  fixed_crown_age = TRUE,
  initial_phylogeny = beastscriptr::fasta_to_phylo(
    fasta_filename = "my_fasta.fas",
    crown_age = 15)
)
```

## Installation

If you use the `devtools` R package, this is easy:

```
devtools::install_github("richelbilderbeek/beastscriptr")
```

## Demonstration

The core function is called `beast_scriptr`:

```
beast_scriptr(
  input_fasta_filename = fasta_filename,
  mcmc_chainlength = mcmc_chainlength,
  tree_prior = tree_prior,
  output_xml_filename = output_xml_filename
)
```

It is demonstrated in the vignette, you can see its PDF [here](demo.pdf).

## Current limitations

`BEAUti2` contains multiple tree priors. This package currently
only supports:

 * These tree priors:
    * the constant-rate birth-death model
    * the contant-population coalescent model
 * DNA data

## I want to collaborate

Great! These are your options:

 * Add an Issue
 * Submit a Pull Request

Pull Requests should
 * try to follow the [R-CodingStandard](https://github.com/richelbilderbeek/R-CodingStandard) guidelines
 * keep the package to be built without warnings and/or notes
 * not trigger any warning by `lintr`

## I think I have found a bug

Awesome! These are your options:

 * Add an Issue, with the test that fails
 * Submit a Pull Request, where the test is added to the `tests/testthat` folder

Pull Requests should
 * try to follow the [R-CodingStandard](https://github.com/richelbilderbeek/R-CodingStandard) guidelines
 * keep the package to be built without warnings and/or notes
 * not trigger any warning by `lintr`

## There's something else I want to say

Sure, just add an Issue. Or send an email.
