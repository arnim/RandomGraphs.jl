using RandomGraphs
using Graphs
using Base.Test

n = 100
p = 0.5
m = 30

let u_er = erdos_renyi_graph(n, p, is_directed=false)
	@test num_vertices(u_er) == n
	@test !is_directed(u_er)
end

let d_er = erdos_renyi_graph(n, p, is_directed=true)
	@test num_vertices(d_er) == n
	@test is_directed(d_er)
end

let d_erm = erdos_renyi_graph(n, m, is_directed=true)
	@test num_vertices(d_erm) == n
   @printf "Number of edges %d" num_edges(d_erm)
	@test num_edges(d_erm) == m
end
