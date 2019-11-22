#LinkedListNode Definition
class LinkedListNode
  attr_accessor :value, :next_node
#Linked list node defined as having a value and a next node (or nil if no next)
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :data

  #init data as nil as if there is no next_node, next_node should = nil
  def initialize
      @data = nil
  end

  # Push a value onto the stack (LIFO)
  def push(value)
      @data = LinkedListNode.new(value, @data)
  end

  # Pop an item off the top of the stack.
  def pop
      #if you are at the bottom of the stack, @data is defined being = to nil, so return nil
      return nil if @data.nil?
      #use LLN class definition
      #this gives Value of current position and the next linked node 
      dataReturn = @data.value
      @data = @data.next_node
      dataReturn
  end
end

def reverse_list(list) 
  #like in blog - push top plate to bottom of new plate stack example (list being passed here is node3)
  newStack = Stack.new
  while list
    #stepping through this loop
    #1. while list? yes list = node3
    #push(Node3.value) -> LLN definition says a node is defined as (value, next_node=nil), @data in stack class initialized to nil
    #push a value, return @data as a new linkedlistnode with value as value and @data as next_node
    #push(12) returns -> @data = LLN.new(12, @data) <--new node at top of stack
    #2. while list? yes list = node2
    #push(99) returns -> @data = LLN.new(99,@data) <-- new top at top of stack
    #3. while list? yes list = node1
    #push(37) returns -> @data = LLNnew(37,@data) <-- new top at top of stack
    # while list? no list = nil/doesnt exist
    newStack.push(list.value)
    list = list.next_node
  end
# new stack with fake node names and expanded versions for helping me figure this out
# @data=nil
# newStack item1= (12, nil)   (12, @data) (12, next_node = nil)
# newStack item2= (99, item1) (99, @data) (99, next_node = (12, nil))
# newStack item3= (37, item2) (37, @data) (37, next_node = (99, next_node = (12, next_node = nil)))
LinkedListNode.new(newStack.pop, newStack.data)
#how we get the newStack item3 
#LLN.new(value = newStack.pop, next_node = newStack.data)
#newStack.pop gives 37 in dataReturn and sets @data to item2 (99,item1)
#newStack.data gives the current value of @data which is now (item2) -> this is to set item2 in my list to "next_node"
end

#print a list node
def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end


#test code, bottom of list is 12 linked with node 2 which is 99 linked with node 1 which is 37 linked with nil(as defined in LLN class when only value is passed)
node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
#print node3, print_values will print each node linked to node 3 and down until there is no next_value, ending with nil
print_values(node3)
puts "-------"

#pseudo-> create a stack by pushing top of node3 stack to new stack until no nodes left, then popping off the top giving revlist=(37,item2)
revlist = reverse_list(node3)
#pseudo-> print_Values(item3)
print_values(revlist)
#pseudo-> print_values(item3)
#item3.value = 37
#print_values(item2)
#item2.value = 99
#print_values(item1)
#item1.value = 12
#print_values(nil)
#print nil

