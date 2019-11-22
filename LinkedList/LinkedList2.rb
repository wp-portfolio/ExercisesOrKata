#LinkedListNode Definition
class LinkedListNode
  attr_accessor :value, :next_node
#Linked list node defined as having a value and a next node (or nil if no next)
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end


#task:
#set each node head to the previous node until you reach node1
#while doing this set each next_node to point at the previous node (2 should point to 3 instead of 1)
#find a way to get node 3 to point to nil instead of node2
def reverse_list(list, previous=nil)
  #Pass1 list = node3| listHead = node3.next_node = (node2)
  #Pass2 list = node2| listHead = node2.next_node = (node1)
  #Pass3 list = node1| listHead = node1.next_node = (nil) <-- I will exit on this pass
  listHead = list.next_node

  #Pass1 node3.next_node = previous (previous=nil, meaning node3.next_node = nil)                     (changed node3.next_node -> node2 to node3.next_node -> nil)
  #Pass2 node2.next_node = previous (node3 was passed as previous on pass1)(node2.next_node = node3)  (changed node2.next_node -> node1 to node2.next_node -> node3)
  #Pass3 node1.next_node = previous (node2 was passed as previous on pass2)(node1.next_node = node2)  (changed node1.next_node -> nil to node1.next_node -> node2)
  list.next_node = previous

  #Pass1 if listHead? (true, listHead = node2)
  #Pass2 if listHead? (true, listHead = node1)
  #Pass3 if listHead? (false, listhead = nil)
  if listHead 
    #Pass1 (node2, node3) ^ send that back
    #Pass2 (node1, node2) ^ send that back
    reverse_list(listHead, list)
  else
    #Pass3(return list=node1)
    list
  end

end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
print_values(node3)
revlist = reverse_list(node3)
print_values(revlist)
