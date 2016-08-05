module DataStructures
  module Drawing
    module LinkedList
      include Base

      def draw
        @graph = GraphViz.new(:G, :type => :digraph)
        @previous = nil
        traverse(create_nodes_and_edges)
        @graph.output( :png => next_filename )
      end

      def create_nodes_and_edges
        -> (element) {
          node = @graph.add_nodes(element.to_s)
          @graph.add_edges(@previous, node) if @previous
          @previous = node
        }
      end
    end
  end
end