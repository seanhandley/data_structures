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

    def values
      @keys.map{|k| self[k]}
    end

    private

    def hash_location(k)
      Digest::SHA1.hexdigest(k).to_i(16) % @size
    end
  end
end

hash = DataStructures::Hash.new
hash["foo"] = "bar"
hash["bar"] = "baz"
p hash["foo"]

p hash.keys
p hash.values