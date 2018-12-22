require_relative 'graph'

def main
  graph = Graph.new

  # Nós no grafo são adcionados ao adicionar arestas
  graph.add(1, 2)
  graph.add(2, 6)
  graph.add(6, 7)
  graph.add(4, 6)
  graph.add(5, 6)
  graph.add(5, 7)
  graph.add(3, 5)
  graph.add(0, 3)

  # Nós sem arestas devem apontar para nil
  graph.add(7, nil)

  graph.dfs_topological_sort
end

main
