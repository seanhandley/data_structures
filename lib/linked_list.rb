module LinkedList
  class Element
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

    def traverse(action)
      el = self
      while(el) do
        action.call(el.value) if el.value
        el = el.link
      end
    end

    def exists?(find)
      res = false
      traverse -> (e) { res = true if e == find }
      res
    end
  end
end

list = LinkedList::Element.new
[2, 4, 6, 8, 10].each do |i|
  list.append(i)
end

list.traverse -> (e) { p e }


p list.exists?(10)
list.remove

list.traverse -> (e) { p e }

p list.exists?(10)