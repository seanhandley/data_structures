module DataStructures
  module BinaryTree
    def self.new
      Node.new
    end
    
    class Node
      attr_accessor :element, :left, :right

      def initialize(e=nil)
        @element = e
      end

      def traverse
        @traversal = []
        action = -> (node) {
          @traversal << node.element
        }
        traverse_node(self, action)
        @traversal
      end

      def insert(e)
        insert_element(self, e)
      end

      def draw
        @graph = GraphViz.new(:G, :type => :digraph)
        @visited = []
        action = -> (node) {
          root, left, right = nil, nil, nil
          if node.element
            root = @graph.add_nodes(node.element.to_s)
            @visited << node.element.to_s unless @visited.include?(node.element.to_s)
          end
          if node&.left&.element
            left = @graph.add_nodes(node.left.element.to_s)
            left.set{|n| n.color = "green"}
            @visited << node.left.element.to_s unless @visited.include?(node.left.element.to_s)
            @graph.add_edges(root, left)
          end
          if node&.right&.element
            right = @graph.add_nodes(node.right.element.to_s)
            right.set{|n| n.color = "red"}
            @visited << node.right.element.to_s unless @visited.include?(node.right.element.to_s)
            @graph.add_edges(root, right)
          end
        }
        traverse_node(self, action)
        @graph.output( :png => "binary_tree.png" )
      end

      private

      def traverse_node(node, action)
        return unless node
        traverse_node(node.left, action)
        action.call node
        traverse_node(node.right, action)
      end

      def insert_element(node, e)
        (node.element = e and return) unless node.element

        if node.element > e
          if node.left
            insert_element(node.left, e)
          else
            node.left = BinaryTree::Node.new(e)
          end
        else
          if node.right
            insert_element(node.right, e)
          else
            node.right = BinaryTree::Node.new(e)
          end
        end
      end
    end
  end
end
