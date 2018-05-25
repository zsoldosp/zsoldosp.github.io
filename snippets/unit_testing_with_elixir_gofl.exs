defmodule Gofl.Rules do
    def next_state(_, 3), do: :alive
    def next_state(:alive, 2), do: :alive
    def next_state(_, _), do: :alive
end

ExUnit.start # pre-req for `use ExUnit.Case` in 0.12.5-dev

# start async
defmodule GoflRulesTest do
    use ExUnit.Case, async: true
# end async
    # start test
    test "survival - a living cell with 2 or 3 neighbours survives" do
        assert Gofl.Rules.next_state(:alive, 2) == :alive
        assert Gofl.Rules.next_state(:alive, 3) == :alive
        assert Gofl.Rules.next_state(:dead, 3) == :alive
        assert Gofl.Rules.next_state(:dead, 2) == :dead
    end
    # end test
end
