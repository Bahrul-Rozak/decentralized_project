defmodule DecentralizedProject.Decentralized do
  def start(nodes \\ 3) do
    nodes = Enum.map(1..nodes, fn _ -> Node.start() end)
    Enum.each(nodes, fn node -> Node.connect(node, nodes) end)
    Enum.each(nodes, fn node -> Node.ping(node) end)
    nodes
  end
end
