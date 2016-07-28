class Stack
  def initialize
    @stack = []
  end

  def push(element)
    @stack.unshift element
  end

  def pop
    @stack.shift
  end

  def peek
    @stack[0]
  end

  def height
    @stack.count
  end
end

def input
  (1..1000).to_a
end

def reversed_input
  input.reverse
end

def test
  stack = Stack.new
  input.each do |element|
    stack.push element
  end
  output = []
  while(el = stack.pop)
    output << el
  end
  raise "Fail!" unless reversed_input == output
  puts "Success!"
end

test