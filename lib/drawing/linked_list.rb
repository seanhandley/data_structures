module DataStructures
  module Drawing
    module LinkedList
      include Base

      def draw
        @graph = GraphViz.new(:G, :type => :digraph)
        @previous = nil
        traverse do |element|
          node = @graph.add_nodes(element.to_s)
          @graph.add_edges(@previous, node) if @previous
          @previous = node
        end
        @graph.output( :png => next_filename )
      end
    end
  end
end