use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
    row: "Sword of Dawn",           23,  -87
    row: "Healing Potion",         -45,   12
    row: "Dragon Shield",           78,  -56
    row: "Magic Staff",             -9,   64
    row: "Elixir of Strength",      51,  -33
    row: "Cloak of Invisibility",  -66,    5
    row: "Ring of Fire",            38,  -92
    row: "Boots of Swiftness",     -17,   49
    row: "Amulet of Protection",    82,  -74
  row: "Orb of Wisdom",          3,  4
end

fun distance(r :: Row) -> Number:
  doc: "computes distance using coordinates in the row"
  # need x and y
  x = get-column(r, "x-coordinate")
  y = get-column(r, "y-coordinate")
  num-sqrt(num-sqr(x) + num-sqr(y))
where:
  distance(get-row(items, 0)) is-roughly num-sqrt(num-sqr(23) + num-sqr(-87))
    distance(get-row(items, 9)) is 5
end

items-with-dist = build-column(items, "distance", distance)

fun sub-20(n :: Number) -> Number:
  doc: "subtracts 20"
  n - 20
where:
  sub-20(0) is -20
  sub-20(15) is -5
end

moved-items = transform-column(items, "x-coordinate", sub-20)

