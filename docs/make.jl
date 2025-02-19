using Documenter, AbstractAlgebra

makedocs(
         format = Documenter.HTML(),
         sitename = "AbstractAlgebra.jl",
         modules = [AbstractAlgebra],
         clean = true,
         doctest = true,
         strict = true,
         checkdocs = :none,
         pages    = [
             "index.md",
             "Fundamental interface of AbstractAlgebra.jl" => [
                 "types.md",
                 "visualizing_types.md",
                 "extending_abstractalgebra.md",
             ],
             "constructors.md",
             "Rings" => [
                 "ring_introduction.md",
                 "ring.md",
                 "integer.md",
                 "polynomial.md",
                 "ncpolynomial.md",
                 "mpolynomial.md",
                 "laurent_polynomial.md",
                 "series.md",
                 "puiseux.md",
                 "mseries.md",
                 "residue.md",
             ],
             "Fields" => [
                 "field_introduction.md",
                 "field.md",
                 "fraction.md",
                 "rational.md",
                 "function_field.md",
                 "finfield.md",
                 "real.md",
                 "numberfield.md",
             ],
             "Groups" => [
                 "perm.md",
                 "ytabs.md",
             ],
             "Modules" => [
                 "module_introduction.md",
                 "module.md",
                 "free_module.md",
                 "submodule.md",
                 "quotient_module.md",
                 "direct_sum.md",
                 "module_homomorphism.md",
             ],
             "Matrices" => [
                 "matrix_introduction.md",
                 "matrix.md",
                 "matrix_algebras.md",
             ],
             "Maps" => [
                 "map_introduction.md",
                 "map.md",
                 "functional_map.md",
                 "map_cache.md",
                 "map_with_inverse.md",
             ],
             "Miscellaneous" => [
                 "misc.md",
             ],
             "Interfaces" => [
                 "interface_introduction.md",
                 "ring_interface.md",
                 "euclidean_interface.md",
                 "poly_interface.md",
                 "mpoly_interface.md",
                 "series_interface.md",
                 "residue_interface.md",
                 "field_interface.md",
                 "fraction_interface.md",
                 "module_interface.md",
                 "matrix_interface.md",
                 "map_interface.md",
                 "rand.md",
             ],
         ]
)

deploydocs(
   repo   = "github.com/Nemocas/AbstractAlgebra.jl.git",
   target = "build",
)
