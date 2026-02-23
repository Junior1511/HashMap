require_relative "linked_list"

class HashMap

  # raise IndexError if index.negative? || index >= @buckets.length

  def initialize
    @load_factor  = 0.75 
    @capacity = 16
    @buckets = []
  end

  def set_bucket
    while @buckets.length < @capacity
      @buckets << nil
    end
  end

  def hash(value)
    hash_code = 0
    prime_number = 31
        
    value.each_char { |char| hash_code = prime_number * hash_code + char.ord }
        
    hash_code % @capacity
  end

  def set(key, value)
    current = @buckets[hash(key)]
    # if the index is empty make it a Link list
    if current.nil?
      ll = Linked_list.new
      ll.prepend(key, value)
      @buckets[(hash(key))] = ll
    else
      if current.contains?(key)
        current.replace_value(key, value)
      else 
        current.prepend(key, value)
      end
    end
  end

  def string() #Dont need this, I made it to debug
    @buckets
  end

  def get(key)
    current = @buckets[hash(key)]
    if current.contains?(key)
      current.return_value(key)
    else 
      nil
    end
  end

  def has(key)
    current = @buckets[hash(key)]
    return false if current == nil
    current.contains?(key)
  end

  def delete(key)
    current = @buckets[hash(key)]
    if current.contains?(key)
      deleted_value = current.return_value(key)
      index_of_key = current.index(key)
      previous_node = current.at(index_of_key - 1)
      current = current.at(index_of_key)
      previous_node.next_node = current.next_node
      deleted_value
    else
      return nil
    end
    # okay im definetly gonna end it here for the night but I need to add a condition where
    # if the thing I am trying to delete is in the first node then I have to work from there
    # because the first node doesnt have a previous node, but this should be easy actually
  end

end

