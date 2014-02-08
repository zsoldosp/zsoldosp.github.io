defmodule MethodOverloadingArity do

    def join(a, b) do
        join(a, b, " ")
    end

    def join(a, b, sep) do
        a <> sep <> b  # string concatenation
    end

end
# enddefmodule
foo = MethodOverloadingArity.join
foo.("a", "b")
foo.("a", "b", " - ")
