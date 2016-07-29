module DataStructures
  class Array
    def initialize
      @array = ""
    end

    def push(e)
      @array << "[#{e}]"
    end

    def delete(i)
      return false unless count-1 >= i
      @array.slice!(*element_position_and_length(i))
    end

    def [](i)
      return nil unless count-1 >= i
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

    def inspect
      output = "["
      count.times do |i|
        output << "\"#{self[i]}\", "
      end
      output.slice!(output.length-2, 2) if count > 0
      output << "]"
      output
    end

    def to_s
      inspect
    end

    private

    def element_position_and_length(i)
      start  = position(/\[/, i)
      finish = position(/\]/, i)
      return [@array.length,0] if [start,finish].any?{|e| e.nil?}
      [start, finish-start+1]
    end

    def position(r, i)
      res = []
      @array.scan(r) do |c|
        res << $~.offset(0)[0]
      end
      res[i]
    end
  end
end
