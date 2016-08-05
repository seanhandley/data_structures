module DataStructures
  module BinaryTree
    def self.new
      Node.new
    end
    
    class Node
      include DataStructures::Drawing::BinaryTree
      include DataStructures::Complexity::BinaryTree

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

      def exists?(find)
        res = false
        traverse_node self, -> (n) { res = true if n.element == find }
        res
      end

      def size
        count = 0
        traverse_node self, -> (_) { count +=1 }
        count
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
