use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

blue-sq = rectangle(40, 40, "solid", "blue")

#tall rectangle
above(blue-sq, blue-sq)

above(rectangle(40, 40, "solid", "blue"), rectangle(40, 40, "solid", "blue"))

rect-2x = above(blue-sq, blue-sq)

orange-triangle = regular-polygon(35, 3, "solid", "orange")
orange-triangle

sq-sidelength = 50
sq-color = "green"
sq-1 = rectangle(sq-sidelength, sq-sidelength, "solid", sq-color)
sq-1

circ-on-rect = above(circle(30, "solid", "yellow"), rectangle(50, 100, "solid", "black"))

yw-circ = circle(30, "solid", "yellow")
bl-rect = rectangle(50, 100, "solid", "black")
above(yw-circ, bl-rect)

above(overlay(overlay(circle(10, "solid", "red"), (circle(30, "solid", "white"))), circle(50, "solid", "red"))), text("target"))

