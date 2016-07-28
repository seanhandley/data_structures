module DataStructures
  class Array
    def initialize
      @array = ""
    end

    def push(e)
      @array << "[#{e}]"
    end

    def delete(i)
      @array.slice!(*element_position_and_length(i))
    end

    def [](i)
      start, length = element_position_and_length(i)
      @array[start+1, length-2]
    end

    def []=(i,e)
      start, _ = element_position_and_length(i)
      delete(i)
      @array.insert(start, "[#{e}]")
    end

    def count
      @array.scan(/\[/).count
    end

    private

    def element_position_and_length(i)
      start  = position(/\[/, i)
      finish = position(/\]/, i)
      [start, finish-start+1]
    end

    def position(r, i)
      res = []
      @array.scan(r) do |c|
        res << $~.offset(0)[0]
      end
      res[i]
    end

    def inspect
      output = "["
      count.times do |i|
        output << "\"#{self[i]}\", "
      end
      output.slice!(output.length-2, 2) if count > 0
      output << "]"
      output
    end
  end
end

# array = DataStructures::Array.new
# array.push("banana")
# array.push("apple")
# array.push("plum")
# array.push("pear")

# p array.count

# p array

# array[1] = "strawberry"

# p array

# array.delete(1)

# p array

# p array[1]