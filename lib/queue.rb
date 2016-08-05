module DataStructures
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

    def exists?(find)
      @queue.include?(find)
    end
  end
end