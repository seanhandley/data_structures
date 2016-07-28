module BinaryTree
  class Node
    attr_reader :element
    attr_accessor :left, :right

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
      n = node.element > e ? node.left : node.right
      n ? insert_element(node.left, e) : node.left = BinaryTree::Node.new(e)
    end
  end
end

# def input
#   sorted_input.shuffle
# end

# def sorted_input
#   (1..1000).to_a
# end

# def tree
#   input = input.shuffle

#   tree = BinaryTree::Node.new

#   input.each do |i|
#     tree.insert(i)
#   end

#   tree.traverse
# end

# def test
#   s = Time.now
#   iterations = 20_000
#   iterations.times { raise "Fail!" unless tree = sorted_input }
#   d = Time.now - s
#   average = "%8f" % (d / iterations.to_f)
#   puts "Binary tree has correctly ordered elements #{iterations} times in #{d} seconds. Average time per sort: #{average} seconds."
# end

# test
