## RandomGraphs.jl


[![Build Status](https://travis-ci.org/arnim/RandomGraphs.jl.svg?branch=master)](https://travis-ci.org/arnim/RandomGraphs.jl)

RandomGraphs.jl is a Julia package that provides algorithms for the generation of random graphs. The package builds on [Graphs.jl](http://github.com/JuliaLang/Graphs.jl), yet provides the necessary dependencies (e.g. for sampling) to generate random graphs.

### Installation

```julia
Pkg.clone("git://github.com/arnim/RandomGraphs.jl.git")
```

### Currently implemented models 

#### Barabási–Albert graphs

The [Barabási–Albert model](http://en.wikipedia.org/wiki/Barab%C3%A1si%E2%80%93Albert_model) is an algorithm for generating random scale-free networks using a preferential attachment mechanism.
```julia
g = barabasi_albert_graph(n, m)
```
A graph g of n nodes is created by attaching nodes with m edges that are preferentially attached to existing nodes with high degree.

