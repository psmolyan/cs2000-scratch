use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

#three-layer cake task
fun welcome(name :: String) -> String:
  doc: "Returns a greeting addressed to the given person"
  "Welcome to class, " + name
end

fun three-layer-cake(top :: String, middle :: String, bottom :: String) -> Image:
  doc: "Make a cake"
  frame(
    above(rectangle(120, 30, "solid", top),
      above(rectangle(120, 30, "solid", middle),
        rectangle(120, 30, "solid", bottom))))
end

three-layer-cake("hot-pink", "purple", "salmon")

#tshirt-cost task
fun tshirt-cost(num-tshirts :: Number, message :: String) -> Number:
  doc: "total cost for tshirts is 5 dollars per tshirt and an additional 10 cents per letter printed"
  (num-tshirts * (5 + (string-length(message) * 0.1)))
  
end

tshirt-cost(4, "Go Team!")
tshirt-cost(7, "Hello World")


  