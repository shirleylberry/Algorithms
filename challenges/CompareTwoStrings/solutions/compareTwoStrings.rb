require 'pry'

class LinkedList
  attr_accessor :head

  def initialize(head)
    @head = head
  end

  def print
    next_node = head
    while next_node != nil
      print next_node.data
      next_node = next_node.next
    end
  end

  def self.to_linked_list(str)
    ltrs = str.split("")
    prev_node = Node.new(ltrs.slice!(0), nil)
    linked_str = self.new(prev_node)
    ltrs.each do |ltr|
      ltr_node = Node.new(ltr, nil)
      prev_node.next_node = ltr_node
      prev_node = ltr_node
    end
    linked_str
  end
end

class Node
  attr_accessor :data, :next_node

  def initialize(data, next_node)
    @data = data
    @next_node = next_node
  end

  def print
    print self.data
  end
end

def compare_nodes(node1, node2)
  return -1 if node1 == nil
  return 1 if node2 == nil
  return node1.data <=> node2.data
end


def compare(str1, str2)
  node1 = str1.head
  node2 = str2.head
  result = 0
  while result == 0 && node1 && node2
    result = compare_nodes(node1, node2)
    node1 = node1.next_node
    node2 = node2.next_node
  end
  result
end

s1 = LinkedList.to_linked_list("geeksa")
s2 = LinkedList.to_linked_list("geeksb")

puts compare(s1, s2)


