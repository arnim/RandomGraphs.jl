using RandomGraphs
using Graphs
using Base.Test

n = 100
p = 0.5

let u_er = erdos_renyi_graph(n, m)
	@test num_vertices(u_er) == n
	@test !is_directed(u_er)
end

let d_er = erdos_renyi_graph(n, m, is_directed=true)
	@test num_vertices(d_er) == n
	@test is_directed(d_er)
end
