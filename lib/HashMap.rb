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
    if @buckets[hash(key)].nil?
      ll = Linked_list.new
      ll.prepend(key, value)
      @buckets[(hash(key))] = ll
    elsif current.contains?(key)
        current.replace_value(key, value)
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

end

