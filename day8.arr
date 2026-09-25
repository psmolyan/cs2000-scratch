use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end

high-value-orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "10:15", 8.00
end

fun is-high-value(r :: Row) -> Boolean:
  doc: "returns whether the amount column is >= 5"
  get-column(r, "amount") >= 5.0
where:
  is-high-value(get-row(orders, 2)) is true
  is-high-value(get-row(orders, 3)) is false
end

fun is-morning(r :: Row) -> Boolean:
  doc: "checks if time represents a morning"
  get-column(r, "time") < "12:00"
end

is-morning(get-row(orders, 0))

latest-to-earliest = order-by(orders, "time", false)
lastest-to-earliest