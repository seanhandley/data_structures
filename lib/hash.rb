require 'digest'

module DataStructures
  class Hash
    attr_reader :keys
    def initialize
      @keys   = []
      @values = []
      @size = 1000
    end

    def [](k)
      @values[hash_location(k)]
    end

    def []=(k,v)
      @keys << k
      @values[hash_location(k)] = v
    end

    def delete(k)
      return false unless @keys.include?(k)
      @values[hash_location(k)] = nil
      @keys.delete(k)
    end

    def values
      @keys.map{|k| self[k]}
    end

    def inspect
      res = "{"
      keys.each do |key|
        res << "\"#{key}\" => \"#{self[key]}\", "
      end
      res.slice!(res.length-2, 2) if keys.count > 0
      res << "}"
      res
    end

    def to_s
      inspect
    end

    private

    def hash_location(k)
      Digest::SHA1.hexdigest(k).to_i(16) % @size
    end
  end
end
