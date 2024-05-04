defmodule DecentralizedProject.Node do
  def start do
    {:ok, pid} = Agent.start_link(fn -> %{} end)
    {:ok, pid: pid, name: :random.name()}
  end

  def connect({:ok, pid: pid1, name: name1}, nodes) do
    other_nodes = Enum.filter(nodes, fn {:ok, pid: pid2, _name: name2} -> pid1 != pid2 end)
    Enum.each(other_nodes, fn {:ok, pid: other_pid, _name: _} -> Agent.update(pid1, fn state -> Map.put(state, other_pid, nil) end) end)
  end

  def ping({:ok, pid: pid, _name: _}) do
    Process.send_after(pid, :ping, 1000)
    loop(pid)
  end

  defp loop(pid) do
    receive do
      :ping -> IO.puts("Received ping at #{inspect(pid)}")
    end
    ping({:ok, pid: pid, name: _})
  end
end
