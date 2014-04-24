
tests = [
    "barabasi_albert" ]


for t in tests
    println("running $(tp) ...")
    include("$(t).jl")
end