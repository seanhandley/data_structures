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
        traverse_node(self)
        @traversal
      end

      def insert(e)
        insert_element(self, e)
      end

      private

      def traverse_node(node)
        return unless node
        traverse_node(node.left)
        @traversal << node.element
        traverse_node(node.right)
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
