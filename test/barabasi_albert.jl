using RandomGraphs
using Graphs
using Base.Test

# Barabási–Albert scale-free graphs
 
n = 100
m = 2
let g = barabasi_albert_graph(n, m)
	@test num_vertices(g) == n
	@test num_edges(g) == n*m - sum(1:m)
	@test !is_directed(g)
end

