# class for creating a node in a heap
class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

# class for creating a min heap
class MinHeap
  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time complexity: O(log n)
  # Space complexity: O(log n) because of call stack
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time complexity: O(log n)
  # Space complexity: O(log n) because of call stack
  def remove
    return nil if @store.empty?
   
    swap(0, @store.length - 1)
    result = @store.pop
    heap_down(0) unless @store.empty?
    result.value
  end

  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
    output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    @store.length.zero? ? true : false
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(log n) because of call stack
  def heap_up(index)
    is_min_heap = @store[index].key > @store[parent(index)].key
    return if index.zero? || is_min_heap

    swap(parent(index), index)
    heap_up(parent(index))
  end

  # This helper method takes an index and
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    return if @store[left(index)].nil? || @store[right(index)].nil?

    min_child = [@store[right(index)].key, @store[left(index)].key].min
    is_min_heap = @store[index].key < min_child
    return if is_min_heap

    if @store[right(index)].key <= @store[left(index)].key
      swap(right(index), index)
      heap_down(right(index))
    else
      swap(left(index), index)
      heap_down(left(index))
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end

  def left(index)
    2 * index + 1
  end

  def right(index)
    2 * (index + 1)
  end

  def parent(index)
    (index - 1) / 2
  end
end
