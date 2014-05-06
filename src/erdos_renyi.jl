# Generate a random graph with n vertices where each edge is included with probability m.
function erdos_renyi_graph{GT<:AbstractGraph}(g::GT, n::Integer, m::Real; has_self_loops=false)
   @assert(m > 0 && m <= 1, "m must be in ]0;1], currently $m")
   @assert(n > 1, "n must be larger than 1, currently $n")
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

# Convenience function for G(n,p)
function erdos_renyi_graph(n::Integer, m::Real; is_directed=true, has_self_loops=false)
   @printf "Erdos-Renyi G(n,p) model with %d nodes and p=%f" n m
   g = simple_inclist(n, is_directed=is_directed)
   erdos_renyi_graph(g, n, m, has_self_loops=has_self_loops)
end

# Generate a random graph with n vertices and m edges.
function erdos_renyi_graph{GT<:AbstractGraph}(g::GT, n::Integer, m::Integer; has_self_loops=false)
   @assert(m > 0, "m must be larger than 0")
   @assert(n > 1, "n must be larger than 1, currently $n")
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

# Convenience function for G(n,M)
function erdos_renyi_graph(n::Integer, m::Integer; is_directed=true, has_self_loops=false)
   @printf "Erdos-Renyi G(n,M) model with %d nodes and M=%d" n m
   g = simple_inclist(n, is_directed=is_directed)
   erdos_renyi_graph(g, n, m, has_self_loops=has_self_loops)
end
