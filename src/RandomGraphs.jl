module RandomGraphs
	
	using Graphs
	
	export
	
		barabasi_albert_graph
		erdos_renyi_graph
		watts_strogatz_graph
		niche_model_graph

		include("barabasi_albert.jl")
		include("erdos_renyi.jd")
		include("watts_strogatz.jd")
		include("niche_model.jd")

end # module
