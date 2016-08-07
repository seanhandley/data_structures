$VERBOSE = nil

require 'rubygems'
require 'minitest/autorun'
require 'graphviz'
require 'rmagick'
require 'asymptotic'
require 'minitest/benchmark'
require_relative "../all"

DataStructures::Drawing::Base.clear_frames!
Minitest::Benchmark.bench_linear(100, 1_000_000_000)
