
# Generate a 'scale-free' random graph based on the Barabási–Albert (BA) model.
# The resulting graph has n vertices,
# Number of edges to attach from a new node to existing nodes: m.
function barabasi_albert_graph{GT<:AbstractGraph}(g::GT, n::Integer, m::Integer)

	@assert(m >= 1 && m < n, "Barabási-Albert network must have m>=1 and m<n, m=$m,n=$n")

	# sample _m distinct values .> 0  proportional to their frequency in arr
	function sample_modes(arr::Array{Integer,1}, _m::Integer)
		selected_nodes = zeros(Integer,_m)
		n_selected_nodes  = 0
		while n_selected_nodes < _m
			candidate_node = arr[rand(1:length(arr))]
			if !(candidate_node in selected_nodes)
				selected_nodes[n_selected_nodes += 1] = candidate_node
			end
		end
		selected_nodes
	end

	# the first two nodes are linked by default
	linked_nodes_yet = [1 2 zeros(Integer, 2m*n)'] 
	num_links_yet = 2
	add_edge!(g, 2, 1)

	for source = 3:n, target = sample_modes(linked_nodes_yet[1:num_links_yet], min(source-1,m))
		add_edge!(g, source, target)
		linked_nodes_yet[num_links_yet += 1] = source
		linked_nodes_yet[num_links_yet += 1] = target
	end
	 g
end


# Convenience function with a default graph type.
function barabasi_albert_graph(n::Integer, m::Integer)
	g = simple_inclist(n, is_directed=false)
	barabasi_albert_graph(g,n,m)
end

