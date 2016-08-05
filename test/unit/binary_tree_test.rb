require 'test_helper'

class BinaryTreeTest < Minitest::Test
  def setup
    @tree = DataStructures::BinaryTree.new
    @items = (1..100).to_a.shuffle
  end

  def test_empty
    assert_equal [nil], @tree.traverse
  end

  def test_insert
    @tree.insert 5
    assert_equal [5], @tree.traverse
    @tree.insert 6
    assert_equal [5, 6], @tree.traverse
  end

  def test_traverse_in_order
    @items.each {|i| @tree.insert(i)}
    assert_equal @tree.traverse, @items.sort
  end

  def test_draw
    @items = [5, 8, 6, 10, 3, 9, 7, 2, 1, 4]
    @items.each {|i| @tree.insert(i)}
    @tree.draw
  end

  # def test_animate
  #   @items.each {|i| @tree.insert(i); @tree.draw}
  #   @tree.animate("./tree.gif")
  # end
end