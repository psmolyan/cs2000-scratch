use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv

data BookRecord:
  | book(title :: String, author :: String, pages :: Number)
end

book1 = book("Harry Potter", "JK Rowling", 300)
book2 = book("The Hunger Games", "Suzanne Collins", 400)
book3 = book("Jade Legacy", "Fonda Lee", 700)

# problem 1
fun book-summary(b :: BookRecord) -> String:
  b.title + " by " + b.author +
  " has " + num-to-string(b.pages) + " pages"
end

book-summary(book1)

# problem 2
fun is-long-book(b :: BookRecord) -> Boolean:
  b.pages > 350
end

is-long-book(book1)
is-long-book(book2)

# problem 3
data Podcast : | podcast(title :: String, speaker :: String, duration :: Number)
end

podcast1 = podcast("title", "me", 3)

# problem 4
fun podcast-summary(p :: Podcast) -> String:
  p.title + " spoken by " + p.speaker + " for " + num-to-string(p.duration) + " minutes"
end

podcast-summary(podcast1)

# problem 5
data Recipe : | recipe(title :: String, servings :: Number, prep-time :: Number)
end


recipes-raw = load-table:
  title :: String,
  servings :: String,
  prep-time :: String
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
end
recipes-with-servings = transform-column(recipes-raw, "servings", string-to-number-default(0))
recipes = transform-column(recipes-with-servings, "prep-time", string-to-number-default(0))
recipes

fun row-to-recipe(row :: Row) -> Recipe:
  recipe(
    get-column(row, "title"),
    get-column(row, "servings"),
    get-column(row, "prep-time")
    )
where:
  row-to-recipe(get-row(recipes, 2)) is recipe("Avocado Toast", 2, 10)
end

build-column(recipes, "recipe data", row-to-recipe)