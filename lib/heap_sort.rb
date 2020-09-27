require_relative './min_heap'

# This method uses a heap to sort an array.
# Time Complexity:  O(2n) -> O(n)
# Space Complexity: O(2n) -> O(n)
def heapsort(list)
  minheap = MinHeap.new
  list.each { |num| minheap.add(num) }
  sorted = []
  list.length.times { sorted << minheap.remove }
  sorted 
end
