module RandomGraphs
	
	using Graphs
   using Distributions
	
	export
	
		barabasi_albert_graph
		erdos_renyi_graph
		watts_strogatz_graph
		niche_model_graph

		include("barabasi_albert.jl")
		include("erdos_renyi.jl")
		include("watts_strogatz.jl")
		include("niche_model.jl")

end
