module DataStructures
  module Drawing
    module BinaryTree
      include Base

      def draw
        @graph = GraphViz.new(:G, :type => :digraph)
        @visited = []
        traverse_node(self, create_nodes_and_edges)
        @graph.output( :png => next_filename )
      end

      def create_nodes_and_edges
        -> (node) {
          root, left, right = nil, nil, nil
          if node.element
            root = @graph.add_nodes(node.element.to_s)
            set_node_color(root, "blue") if @visited.empty?
            @visited << node.element.to_s unless @visited.include?(node.element.to_s)
          end
          if node&.left&.element
            left = @graph.add_nodes(node.left.element.to_s)
            set_node_color(left, "green")
            @visited << node.left.element.to_s unless @visited.include?(node.left.element.to_s)
            @graph.add_edges(root, left)
          end
          if node&.right&.element
            right = @graph.add_nodes(node.right.element.to_s)
            set_node_color(right, "red")
            @visited << node.right.element.to_s unless @visited.include?(node.right.element.to_s)
            @graph.add_edges(root, right)
          end
        }
      end
    end
  end
end