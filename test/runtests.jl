
tests = [
    "barabasi_albert" ]


for t in tests
    println("running $(t) ...")
    include("$(t).jl")
end