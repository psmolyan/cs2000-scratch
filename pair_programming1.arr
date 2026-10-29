use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


fun needs-water(n :: Number) -> Boolean:
  doc: "determines if plant needs watering"
  n >= 3
where:
  needs-water(3) is true
  needs-water(5) is true
  needs-water(2) is false
  needs-water(0) is false
end

fun pot() -> Image:
  doc: "designs the pot"
  rectangle(40, 60, "solid", "brown")
end
pot()

fun plant(stage :: String) -> Image:
  doc: "makes a plant image based on stage"
  if stage == "sprout":
    circle(20, "solid", "green")
  else if stage == "young":
    triangle(40, "solid", "green")
  else:
    above(circle(20, "solid", "green") , triangle(70, "solid", "green"))
  end
end

plant("sprout")
plant("young")
plant("full")

fun plant-display(stage :: String, n :: Number) -> Image:
  doc: "puts plant in the pot, adds water if plant needs"
  full-plant = above(plant(stage), pot())
  if needs-water(n):
    above(circle(5, "solid", "blue") ,full-plant)
  else:
    full-plant
  end
end

plant-display("sprout", 5)
plant-display("young", 2)
plant-display("full", 8)

fun named-plant(name :: String, stage :: String, n :: Number) -> Image:
  doc: "returns full plant with name"
  above(plant-display(stage, n), text(name, 30, "white"))
end

named-plant("hi", "sprout", 6)
named-plant("hello", "full", 2)
