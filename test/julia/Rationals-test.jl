function test_elem(R::AbstractAlgebra.Rationals{BigInt})
   n = big(2)^rand(1:100)
   return rand(QQ, -n:n)
end

@testset "Julia.Rationals.conformance_tests" begin
   test_Field_interface_recursive(QQ)
end

@testset "Julia.Rationals.constructors" begin
   R = qq
   S = QQ

   @test R == FractionField(zz)
   @test S == FractionField(ZZ)

   a = R(11)
   b = S(11)

   @test isa(R(a), Rational{Int})
   @test isa(S(b), Rational{BigInt})
end

@testset "Julia.Rationals.rand" begin
   test_rand(QQ, 1:9) do f
      @test 1 <= numerator(f) <= 9
      @test 1 <= denominator(f) <= 9
   end
end

@testset "Julia.Rationals.manipulation" begin
   R = qq
   S = QQ

   @test isunit(R(3))
   @test isunit(S(3))
end

@testset "Julia.Rationals.exact_division" begin
   R = qq
   S = QQ

   for iter = 1:1000
      a1 = rand(R, -100:100)
      a2 = rand(R, -100:100)
      b1 = rand(S, -100:100)
      b2 = rand(S, -100:100)
      c1 = rand(zz, -100:100)
      c2 = rand(ZZ, -100:100)

      @test a2 == 0 || divexact(a1, a2)*a2 == a1
      @test b2 == 0 || divexact(b1, b2)*b2 == b1

      if a1 != 0
         flagR, qR = divides(a2, a1)

         @test flagR
         @test qR*a1 == a2
      end

      if b1 != 0
         flagS, qS = divides(b2, b1)

         @test flagS
         @test qS*b1 == b2
      end

      @test c1 == 0 || divexact(a1, c1)*c1 == a1
      @test c2 == 0 || divexact(b1, c2)*c2 == b1

      @test a1 == 0 || divexact(c1, a1)*a1 == c1
      @test b1 == 0 || divexact(c2, b1)*b1 == c2
   end
end

@testset "Julia.Rationals.gcd" begin
   R = qq
   S = QQ

   for iter = 1:1000
      r1 = rand(R, -100:100)
      r2 = rand(R, -100:100)
      r3 = rand(R, -100:100)
      s1 = rand(S, -100:100)
      s2 = rand(S, -100:100)
      s3 = rand(S, -100:100)

      @test gcd(r1, gcd(r2, r3)) == gcd(gcd(r1, r2), r3)
      @test gcd(s1, gcd(s2, s3)) == gcd(gcd(s1, s2), s3)
   end
end

@testset "Julia.Rationals.square_root" begin
   R = qq
   S = QQ

   for iter = 1:1000
      r = rand(R, -100:100)
      s = rand(R, -100:100)

      f = r^2
      g = s^2

      @test AbstractAlgebra.sqrt(f)^2 == f
      @test AbstractAlgebra.sqrt(g)^2 == g
      @test issquare(f)
      @test issquare(g)
   end
end

@testset "Julia.Rationals.exp" begin
   @test AbstractAlgebra.exp(0//1) == 1
   @test_throws DomainError AbstractAlgebra.exp(1//1)
   @test_throws DomainError AbstractAlgebra.exp(rand(2:1000)//rand(1:1000))
   @test_throws DomainError AbstractAlgebra.exp(-rand(1:1000//rand(1:1000)))
end

@testset "Julia.Rationals.divrem" begin
   R = qq
   S = QQ

   for iter = 1:1000
      r = rand(R, -100:100)
      s = zero(R)
      while iszero(s)
         s = rand(R, -100:100)
      end

      @test AbstractAlgebra.divrem(r,s) == (r/s,0)
   end
end
