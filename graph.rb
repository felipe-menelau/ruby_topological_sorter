class Graph
  require 'set'
  attr_reader :graph

  def initialize
    @graph = {}
  end

  def add(node1, node2)
    return @graph[node1].add(node2) if @graph[node1]
    @graph[node1] = Set.new([node2])
  end

  def size
    @graph.size
  end

  def dfs_topological_sort
    visited = @graph.keys.each_with_object({}) do |key, hash|
      hash[key] = false
    end
    stack = []

    visited.each do |key, value|
      visited, stack = visit(key, visited, stack) if value == false
    end

    print stack
  end

  def visit(key, visited, stack)
    visited[key] = true

    @graph[key].each do |value|
      if visited[value] == false
        visited, stack = visit(value, visited, stack)
      end
    end

    stack.insert(0, key)
    return visited, stack
  end
end
