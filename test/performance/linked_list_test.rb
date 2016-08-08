require 'test_helper'

class TestLinkedList < Minitest::Benchmark
  def setup
    @lists = Hash.new
    Minitest::Benchmark.bench_range.each do |n|
      list = DataStructures::LinkedList.new
      (1..n).to_a.shuffle.each do |n|
        list.append n
      end
      @lists[n] = list
    end
  end

  def bench_linked_list_exists
    assert_performance_linear 0.95 do |n|
      (1..100).each {|x| @lists[n].exists?(x)}
    end
  end

  def bench_linked_list_append
    assert_performance_constant 0.99 do |n|
      @lists[n].append(100000)
    end   
  end
end