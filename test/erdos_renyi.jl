using RandomGraphs
using Graphs
using Base.Test

n = 100
p = 0.5

let u_er = erdos_renyi_graph(n, p, is_directed=false)
	@test num_vertices(u_er) == n
	@test !is_directed(u_er)
end

let d_er = erdos_renyi_graph(n, p, is_directed=true)
	@test num_vertices(d_er) == n
	@test is_directed(d_er)
end

n2 = 50
m = 60

let d_erm = erdos_renyi_graph(n2, m, is_directed=true)
   @printf "Number of edges %d \n" num_edges(d_erm)
   @printf "Number of nodes %d \n" num_vertices(d_erm)
	@test num_vertices(d_erm) == n2
	@test num_edges(d_erm) == m
end
