# Boards.jl

`Boards.jl` is a package aimed at Julia users in the [University of Toronto
learning group](http://learning.cs.toronto.edu). It provides a simple interface
to reserving boards on the [GPU
servers](http://www.cs.toronto.edu/~pocai/mlcompres.html) maintained by the
group.

## Basic Usage

First make sure `~tang/bin` is on your `PYTHONPATH` by adding
`export PYTHONPATH=~tang/bin:$PYTHONPATH` to your `~/.bashrc`. You can then
reserve a board as follows:

```julia
using Boards
getboard()

# your code here
```

## Usage with other Packages

Some packages, such as [Mocha.jl](https://github.com/pluskid/Mocha.jl), require
you to set environment variables in order to use the correct GPU device. It is
important to get a board *before* importing such libraries, or else the
environment variables will not be set properly. Here is an example of how to
use `Boards.jl` together with `Mocha.jl`:

```julia
using Boards
ENV["MOCHA_GPU_DEVICE"] = getboard()
ENV["MOCHA_USE_CUDA"] = "true"

# now the environment variables are correctly set
using Mocha

# your code here
```
