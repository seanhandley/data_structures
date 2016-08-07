require 'test_helper'

class TestBinaryTree < Minitest::Benchmark
  def setup
    @trees = Hash.new
    Minitest::Benchmark.bench_range.each do |n|
      @trees[n]   = new_tree(n)
    end
    @odds  = (1..200).select{|n| n.odd?}
    @evens = (1..200).select{|n| n.even?}
  end

  def bench_tree_exists_best_case
    assert_performance_logarithmic 0.7 do |n|
      @evens.each {|x| @trees[n].exists?(x) }
    end
  end

  def bench_tree_exists_worst_case
    @trees = Hash.new
    Minitest::Benchmark.bench_range.each do |n|
      @trees[n]   = new_tree(n, false)
    end
    assert_performance_linear 0.99 do |n|
      @trees[n].exists?(1000000000000)
    end
  end

  def bench_tree_insert
    assert_performance_logarithmic 0.7 do |n|
      @odds.each {|x| @trees[n].insert(x) }
    end
  end

  private

  def new_tree(size, shuffle=true)
    tree = DataStructures::BinaryTree.new
    inputs = (1..size*2).to_a
    inputs.select! {|n| n.even?}
    inputs.shuffle! if shuffle
    inputs.each do |n|
      tree.insert n
    end
    tree
  end
end