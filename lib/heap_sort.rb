require_relative './min_heap'

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  print "list = "
  p list 
  puts "*****"

  minheap = MinHeap.new
  list.each do |num|
    minheap.add(num)
  end
  print "minheap = "
  p minheap 
  puts "*****"

  sorted = []
  list.length.times do 
    sorted << minheap.remove
  end
  sorted 
end
