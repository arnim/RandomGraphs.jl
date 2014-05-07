# Generate a random graph with n vertices where each edge is included with probability m.
function er_proba_graph{GT<:AbstractGraph}(g::GT, n::Integer, m::Real; has_self_loops=false)
   for i=1:n
      start_ind = is_directed(g) ? 1 : i
      for j=start_ind:n
         if(rand() <= m && (i != j || has_self_loops))
            add_edge!(g, i, j)
         end
      end
   end
   return g
end

# Generate a random graph with n vertices and m edges.
function er_fixed_graph{GT<:AbstractGraph}(g::GT, n::Integer, m::Integer; has_self_loops=false)
   nodepairs = Array((Integer, Integer), 0)
   # TODO This is kinda lazy, we can compute the maximal number of edges
   for i=1:n
      start_ind = is_directed(g)? 1 : i
      for j=start_ind:n
         if (i != j || has_self_loops)
            push!(nodepairs, (i, j))
         end
      end
   end
   shuffle!(nodepairs)
   if m > length(nodepairs)
      warn("You have picked a value of m larger than the maximal number of possible edges")
      # TODO This should be done when calculating the maximal numbe of edges
      m = length(nodepairs)
   end
   nodepairs = nodepairs[1:m]
   for k in 1:m
      add_edge!(g, nodepairs[k][1], nodepairs[k][2])
   end
   return g
end

# Convenience function for G(n,p)
function erdos_renyi_graph(n::Integer, m::Number; is_directed=true, has_self_loops=false)
   @assert(n >= 1, "There must be at least one vertex (curently $n) in the graph")
   g = simple_inclist(n, is_directed=is_directed)
   er_model = er_proba_graph
   @assert(m > 0, "m must be larger than 0")
   if m > 1
      if m > integer(m)
         warn("You gave a non integer number of edges")
         m = integer(m)
      end
      er_model = er_fixed_graph
   end
   er_model(g, n, m, has_self_loops=has_self_loops)
end
