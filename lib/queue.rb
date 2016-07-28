class Queue
  def initialize
    @queue = []
  end

  def enqueue(element)
    @queue << element
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue[0]
  end

  def length
    @queue.count
  end
end

def input
  (1..1000).to_a
end

def shuffled_input
  input.shuffle
end

def test
  queue = Queue.new
  input = shuffled_input
  input.each do |element|
    queue.enqueue element
  end
  output = []
  while(el = queue.dequeue)
    output << el
  end
  raise "Fail!" unless input == output
  puts "Success!"
end

test