module DataStructures
  module LinkedList
    def self.new
      Element.new
    end
    
    class Element
      include DataStructures::Drawing::LinkedList

      attr_accessor :link, :value

      def append(e)
        (@value = e; return) unless value
        el = self
        el = el.link while(el.link)
        el.link = LinkedList::Element.new
        el.link.value = e
      end

      def remove
        el = self
        el = el.link while(el.link)
        el.value = nil
      end

      def traverse(&blk)
        el = self
        while(el) do
          yield el.value if el.value
          el = el.link
        end
      end

      def exists?(find)
        traverse {|e| return true if e == find }
      end
    end
  end
end
