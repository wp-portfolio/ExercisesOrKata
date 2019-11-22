class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

# 1 Start Tortoise and Hare at the first node of the List.
# 2 If Hare reaches end of the List, return as there is no loop in the list.
# 3 Else move Hare one step forward.
# 4 If Hare reaches end of the List, return as there is no loop in the list.
# 5 Else move Hare and Tortoise one step forward.
# 6 If Hare and Tortoise pointing to same Node return, we found loop in the List.
# 7 Else start with STEP-2.

def cycleTest(list)
  tortoise = list.next_node
  hare = list.next_node

  until hare.nil?
    hare = hare.next_node         #<-- hare takes a step
    return false if hare.nil?

    hare = hare.next_node         #<-- hare takes another step,
    tortoise = tortoise.next_node #<-- while tortoise has only taken one step
    return true if hare == tortoise #<-- if the hare reached next_node = nil, it will never get here. 
                                    # if the hare has been continuously running until hare.nil? (which it will never satisfy) it will be on the same step as the tortoise
                                 # before the tortoise completes one lap. this "cycle" shows that the list is infinite. 
                                    #the tortoises job here is to make sure only n number of steps are taken, so that you can exit the infiite list
  end

  return false
end

def cycleTest(list)
  tortoise = list.next_node
  hare = list.next_node

  until hare.nil?
    hare = hare.next_node         
    return false if hare.nil?

    hare = hare.next_node        
    tortoise = tortoise.next_node 
    return true if hare == tortoise
  end
  return false
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
node4 = LinkedListNode.new(12, node3)
node5 = LinkedListNode.new(12, node4)
node1.next_node = node5

if cycleTest(node5) == false
  print "passed cycleTest! (not infinite)"
print_values(node5)
else  print "this is an infinite list"
end

# 5 5 <- hare and tortoise start here
# 3 4 <- hare moves 2 while tortoise moves 1
# 1 3 <- hare moves 2 while tortoise moves 1
# 4 2 <- hare moves 2(completing a lap) while tortoise moves 1
# 2 1 <- hare moves 2 while tortoiuse moves 1
# 5 5 <- both complete laps at same time, tortoise = hare! there is a cycle and this list is infinite
