
tests = [
    "barabasi_albert" ]


for test in tests
    println("running $(test) ...")
    include("$(test).jl")
end