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



fun sub-20(n :: Number) -> Number:
  doc: "subtracts 20"
  n - 20
where:
  sub-20(0) is -20
  sub-20(15) is -5
end

transform-column(items, "x-coordinate", sub-20)

check:
  test-table = table: x-coordinate :: Number
    row: -65
    row: 58
    row: 31
  end
  expected-table = table: x-coordinate :: Number
    row: -65
    row: 58
    row: 31
  end
  transform-column(items, "x-coordinate",lam(n :: Number) -> Number: n - 20 end)

end

#lambda version
transform-column(items, "x-coordinate", lam(n :: Number) -> Number: n - 20 end)

prices = table: price
      row: 50
      row: 120
      row: 80
      row: 40
      row: 50
      row: 80
      row: 80
    end
freq-bar-chart(prices, "price")

fun add-tax:
  build-column(prices, "tax", r["price"] * 0.0625)
end

add-tax