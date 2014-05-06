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

# Convenience function for G(n,M)
function erdos_renyi_graph(n::Integer, m::Integer; is_directed=true, has_self_loops=false)
   @printf "Erdos-Renyi G(n,M) model with %d nodes and M=%d" n m
   g = simple_inclist(n, is_directed=is_directed)
   erdos_renyi_graph(g, n, m, has_self_loops=has_self_loops)
end
