
using Test
using Alioune

@testset "Alioune.jl" begin
    f(x) = 2x
    fp = Alioune.Engine.prime(f)
    @test isapprox(fp(3.0), 6.0; atol=1e-6)
end


