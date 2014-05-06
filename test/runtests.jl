tests = [
    "barabasi_albert",
    "erdos_renyi"]


for test in tests
    println("running $(test) ...")
    include("$(test).jl")
end
