require_relative '06a_graph'

# Runs in O(|E|) time.
def graph_bfs(source)
  last_edges = {
    source => nil
  }

  queue = [source]
  until queue.empty?
    vertex = queue.shift

    vertex.out_edges.each do |e|
      to_vertex = e.to_vertex

      next if last_edges.has_key?(to_vertex)

      last_edges[to_vertex] = e
      queue << to_vertex
    end
  end

  last_edges
end

# TODO: Test me in RSpec!

vertices = []
vertices << (v1 = Vertex.new("A"))
vertices << (v2 = Vertex.new("B"))
vertices << (v3 = Vertex.new("C"))
vertices << (v4 = Vertex.new("D"))
vertices << (v5 = Vertex.new("E"))

e1 = Edge.new(v1, v2)
e2 = Edge.new(v2, v3)
e3 = Edge.new(v2, v4)
e4 = Edge.new(v4, v5)

fail unless graph_bfs(v1) == {
  v1 => nil,
  v2 => e1,
  v3 => e2,
  v4 => e3,
  v5 => e4
}
