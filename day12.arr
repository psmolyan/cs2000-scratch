use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

weather-data =
  table: date, temperature, precipitation
    row: "2025-01-01", 62, 0.1
    row: "2025-01-02", "45", 3
    row: "2025-01-03", 28, 0.2
    row: "2025-01-04", 55, -1
    row: "2025-01-05", 90, 0
  end


#create a test table

test-data =
  table: temperature
    row: 62
    row: "45"
    row: 28
    row: 55
    row: 90
  end

#define cold/mild/hot
#cold < 50, mild 50 to 70, hot > 70

#normalize the temperature column
fun norm-temp(v) -> Number:
  doc: "converts temp to Number if it was a string"
  if is-string(v):
    string-to-number-unsafe(v)
  else:
    v
  end
where:
  norm-temp(70) is 70
  norm-temp("40") is 40
end

test-data-clean = transform-column(test-data, "temperature", norm-temp)

#build column for text based on temperature
fun temp-to-text(t :: Number) -> String:
  doc: "numbers < 40 turn into 'cold', >=40 and < 60 to 'mild' and >=60 to 'hot'"
  if t < 40:
    "cold"
  else if t < 60:
    "mild"
  else:
    "hot"
  end
where:
  temp-to-text(-10) is "cold"
  temp-to-text(0) is "cold"
  temp-to-text(39.9) is "cold"
  temp-to-text(40) is "mild"
  temp-to-text(58) is "mild"
  temp-to-text(60) is "hot"
  temp-to-text(100) is "hot"
end

test-data-message = build-column(test-data-clean, "message", lam(r :: Row) -> String: temp-to-text(get-column(r, "temperature"))end)


#test our table

#create the bar chart

freq-bar-chart(test-data-message, "message")

#class exercise


test-rain-data =
  table: precipitation
    row: 0.1
    row: 3
    row: 0.2
    row: -1
    row: 0
  end

fun rain-to-text(r :: Number) -> String:
  doc: "number of days that were 'dry' (no rain), 'drizzly' (< 1' of rain), and 'wet' (>= 1' of rain)"
  if r >= 1:
    "wet"
  else if (r > 0) and (r < 1):
    "drizzly"
  else:
    "dry"
  end
where:
  rain-to-text(2) is "wet"
  rain-to-text(0.2) is "drizzly"
  rain-to-text(0) is "dry"
  rain-to-text(-0.2) is "dry"
end

employees =
  table: full-name :: String, department :: String
    row: "Jordan Smith", "Sales"
    row: "Alexandra Lee", "Engineering"
    row: "Sam", "Marketing"
    row: "Ng, Alice", "Operations"
  end

