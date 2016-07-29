module DataStructures
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
end
