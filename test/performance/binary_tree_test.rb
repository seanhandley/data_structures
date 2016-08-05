require 'test_helper'

class TestBinaryTree < Minitest::Benchmark
  def setup
    @trees = (1..100).map do |n|
      tree = DataStructures::BinaryTree::Node.new
      (1..n).to_a.shuffle.each do |n|
        tree.insert n
      end
      tree
    end
  end

  def bench_tree_exists
    assert_performance_logarithmic 0.99 do |n| @trees[n]&.exists?(1) end
  end
end