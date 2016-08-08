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

  def test_exists
    refute @tree.exists?(5)
    @items.each {|i| @tree.insert(i)}
    assert @tree.exists?(5)
    refute @tree.exists?(533)
  end

  def test_draw
    @items = perfect_tree(100)
    @items.each {|i| @tree.insert(i)}
    @tree.draw
  end

end