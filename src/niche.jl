# Generate a graph using Williams & Martinez "Niche" model of food web
# See paper: http://www.nature.com/nature/journal/v404/n6774/abs/404180a0.html
# The niche model generates realistic food webs / trophic networks
# Each vertex is a species, with three traits
#   n: a "niche" trait (equivalent to body size)
#   c: the centroid of a species niche, i.e. the average size of its preys
#   r: the range of a species, i.e. the breadth of preys it can eat
# The arguments needed are
#   S: the number of species
#   C: the expected connectance (/density)

function niche_model_graph{GT<:AbstractGraph}(g::GT, S::Integer, C::Real)
   @assert(S>1, "The number of nodes must be higher than 1, currently $S")
   @assert(C > 0 && C <= 1, "Connectance must be in ]0;1], currently $C")
   n = Array(T, S)
   r = Array(T, S)
   c = Array(T, S)
   # Loop 1 to get the species traits
   for i in 1:S
      n[i] = rand(Uniform())
      r[i] = n[i] * rand(Beta(1, 1/(2*C)+1))
      c[i] = rand(Uniform(r[i]/2, n[i]))
   end
   # Loop through all vertices to add arcs
   for i in 1:S
      for j in i:S
         # i -> j ?
         if ((n[j] < c[i]+r[i]) && (n[j] > c[i]-r[i]))
            add_edge!(g, i, j)
         end
         # j -> i ?
         if ((n[i] < c[j]+r[j]) && (n[i] > c[j]-r[j]))
            add_edge!(g, j, i)
         end
      end
   end
   return g
end

# Convenience function with a default graph type
function niche_model_graph(S::Integer, C::Real)
   g = simple_inclist(S, is_directed=true)
   niche_model_graph(g, S, C)
end

