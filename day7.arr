use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

# include csv
# recipes = load-table:
#   title :: String,
#   servings :: Number,
#   prep-time :: Number
#   source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
# end

# row = get-row(recipes, 3)


CO2-emissions = load-table:
  borough :: String,
  LEGGI_Year :: Number,
  Sector :: String,
  Fuel :: String,
  Data_Year :: Number,
  KtCO2e :: Number
  source: csv-table-url("https://data.london.gov.uk/download/2ko63/fcf8a0a3-2051-484a-ba9a-5c8bc2268a3e/co2-emissions-borough-leggi.csv", default-options)
end

row1 = get-row(CO2-emissions, 3)
column1 = get-column(CO2-emissions, 4)
table-length1 = table-length(CO2-emissions)


