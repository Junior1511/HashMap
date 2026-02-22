require_relative "lib/HashMap"

bruh = HashMap.new
bruh.set("yeah buddy", "interesting")
bruh.set("dude", "omg dude")
bruh.string
bruh.set("yeah buddy", "interesting_2")
bruh.string
bruh.get("yeah buddy")
p bruh.has("something")
p bruh.has("dude")
p bruh.has("yeah buddy")



