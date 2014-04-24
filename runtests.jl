
tests = [
    "barabasi_albert" ]


for t in tests
    tp = joinpath("test", "$(t).jl")
    println("running $(tp) ...")
    include(tp)
end