require_relative "lib/HashMap"

bruh = HashMap.new
bruh.set("yeah buddy", "interesting")
bruh.set("dude", "omg dude")
bruh.string
bruh.set("yeah buddy", "interesting_2")
bruh.string
bruh.get("yeah buddy")
bruh.has("something")
bruh.has("dude")
bruh.has("yeah buddy")
bruh.set('apple', 'red')
bruh.set('banana', 'yellow')
bruh.set('carrot', 'orange')
bruh.set('dog', 'brown')
bruh.set('elephant', 'gray')
bruh.set('frog', 'green')
bruh.set('grape', 'purple')
bruh.set('hat', 'black')
bruh.set('ice cream', 'white')
bruh.set('jacket', 'blue')
bruh.set('kite', 'pink')
bruh.set('lion', 'golden')
pp bruh.string
bruh.delete("lion")
p "After delete"
pp bruh.string



