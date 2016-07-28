module LinkedList
  class Element
    attr_accessor :link, :value
    def append(e)
      (@value = e; return) unless value
      el = self
      el = el.link while(el.link)
      el.link = LinkedList::Element.new
      el.value = e
    end

    def traverse(action)
      el = self
      while(el) do
        action.call el.value
        el = el.link
      end
    end
  end
end

list = LinkedList::Element.new
[2, 4, 6, 8, 10].each do |i|
  list.append(i)
end

list.traverse -> (e) { p e }