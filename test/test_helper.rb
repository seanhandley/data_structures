$VERBOSE = nil

require 'rubygems'
require 'minitest/autorun'
require 'graphviz'
require 'rmagick'
require 'asymptotic'
require 'minitest/benchmark'
require_relative "../all"

DataStructures::Drawing::Base.clear_frames!

def perfect_tree(max)
  perfect_tree_step((1..max).to_a) 
end

def perfect_tree_step(numbers)
  return numbers if numbers.count <= 1
  smaller, larger = numbers.each_slice((numbers.count / 2.0).round).to_a
  middle = smaller.pop
  [middle] + [perfect_tree_step(smaller) + perfect_tree_step(larger)].flatten
end
