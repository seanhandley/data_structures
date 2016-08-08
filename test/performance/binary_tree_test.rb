require 'test_helper'

class TestBinaryTree < Minitest::Benchmark

  def self.bench_range
    [128, 256, 512, 1024, 2048, 4096, 8192]
  end

  def setup
    @perfect_trees  = Hash.new
    @worst_trees    = Hash.new
    TestBinaryTree.bench_range.each do |n|
      @perfect_trees[n]   = new_tree(perfect_tree(n))
      @worst_trees[n]     = new_tree((1..n).to_a)
    end
  end

  def bench_tree_exists_best_case
    assert_performance_logarithmic 0.7 do |n|
      @perfect_trees[n].exists?(n)
    end
  end

  def bench_tree_exists_worst_case
    assert_performance_linear 0.9 do |n|
      @worst_trees[n].exists?(n)
    end
  end

  def bench_tree_insert_best_case
    assert_performance_constant 0.9 do |n|
      @perfect_trees[n].insert(n+1)
    end
  end

  def bench_tree_insert_worst_case
    assert_performance_linear 0.9 do |n|
      @worst_trees[n].insert(n+1)
    end
  end

  private

  def new_tree(inputs)
    tree = DataStructures::BinaryTree.new
    inputs.each {|n| tree.insert n}
    tree
  end
end