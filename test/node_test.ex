defmodule DecentralizedProject.NodeTest do
  use ExUnit.Case

  setup do
    {:ok, pid} = Agent.start_link(fn -> %{} end)
    {:ok, pid: pid, name: :random.name()}
  end

  test "connecting nodes" do
    node1 = Node.start()
    node2 = Node.start()

    nodes = [node1, node2]

    Enum.each(nodes, fn node -> Node.connect(node, nodes) end)

    assert Map.size(Agent.get(node1[:pid], & &1)) == 1
    assert Map.size(Agent.get(node2[:pid], & &1)) == 1
  end
end
