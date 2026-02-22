class Linked_list
  attr_accessor :head

  def initialize
    @head = nil
  end

  class Node
    attr_accessor :key, :value, :next_node

    def initialize(key = nil, value = nil, next_node = nil)
      @key = key
      @value = value
      @next_node = next_node
    end
  end

  
  def append(key, value)
    if @head.nil?
      @head = Node.new(key, value, nil)
    else 
      current = @head
      while current.next_node != nil
        current = current.next_node
      end
      current.next_node = Node.new(key, value, nil)
    end
    
  end

  def prepend(key, value)
    @head = Node.new(key, value, @head)  
  end

  def to_string
    storage = ""
    current = @head

    while current != nil
      storage += "(#{current.key}, #{current.value} ) -> "
      current = current.next_node
    end
    storage += "nil"
    return storage
  end

  def pop_head
    value_of_head = @head.each_value
    if @head != nil
      @head = @head.next_node
    end
    return value_of_head
  end

  def size
    current = @head
    size = 0
    while current != nil
      size += 1
      current = current.next_node
    end
    return size
  end

  def head
    return nil if @head.nil?
    @head.value
  end

  def tail
    return nil if @head.nil?
    current = @head
    while current.next_node != nil
      current = current.next_node
    end
    return current.value
  end

  def at(index)
    return nil if @head.nil?
    num_of_iterations = index
    current = @head
    num_of_iterations.times {
      return nil if current.next_node.nil?
      current = current.next_node
    }
    return current.value
  end

  def index(value)
    return nil if @head.nil?
    index = 0
    current = @head
    while current != nil
      return index if current.value == value
      current = current.next_node
      index += 1
    end
  end

  def contains?(key)
    current = @head
    while current != nil
      return true if current.key == key
      current = current.next_node
    end
    return false
  end

  def replace_value(key, value)
    current = @head
    while current.key != key
      current = current.next_node
    end
    current.value = value
  end

  def return_value(key)
    current = @head
    while current.key != key
      current = current.next_node
    end
    current.value
  end
end
