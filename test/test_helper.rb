$VERBOSE = nil

require 'rubygems'
require 'minitest/autorun'
require 'graphviz'
require 'rmagick'
require 'asymptotic'
require 'minitest/benchmark'
require_relative "../all"

DataStructures::Drawing::Base.clear_frames!
