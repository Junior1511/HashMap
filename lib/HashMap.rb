require_relative "linked_list"

class HashMap

  # raise IndexError if index.negative? || index >= @buckets.length

  def initialize
    @load_factor  = 0.75 
    @capacity = 16
    @buckets = []
    @size = 0
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
      @size += 1
      @buckets[(hash(key))] = ll
    else
      if current.contains?(key)
        current.replace_value(key, value)
      else 
        @size += 1
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
    return nil if current.nil?
    @size -= 1
    current.delete_node(key)
  end

  def length
    @size
  end

  def clear
    @buckets = []
    @buckets
  end

  def keys
    arr = []
    @buckets.each do |ll|
      if ll != nil
        arr << ll.get_keys
      end
    end
    arr
  end

  def values
    arr = []
    @buckets.each do |ll|
      if ll != nil
        arr << ll.get_values
      end
    end
    arr
  end

  def entries
    arr = []
    @buckets.each do |ll|
      if ll != nil
        arr << ll.get_entries
      end
    end
    arr
  end

end

