use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

import statistics as S
import math as M

cafe-data =
  table: day :: String, drinks-sold :: Number
    row: "Mon", 45
    row: "Tue", 30
    row: "Wed", 55
    row: "Thu", 40
    row: "Fri", 60
  end

drinks = get-column(cafe-data, "drinks-sold")

# total number of drinks sold

# average number of drinks sold in a day
S.mean(drinks)



# problem 1
M.min(get-column(cafe-data, "day"))

# problem 2
quiz-scores =
  table: student :: String, quiz1 :: Number, quiz2 :: Number, quiz3 :: Number
    row: "Alice", 85, 92, 78
    row: "Bob", 90, 88, 95
    row: "Charlie", 78, 85, 82
    row: "Diana", 95, 90, 88
    end

S.mean(get-column(quiz-scores, "quiz1"))
S.mean(get-column(quiz-scores, "quiz2"))
S.mean(get-column(quiz-scores, "quiz3"))
#quiz1 had the highest average score

# problem 3
my_list = [list: 12, 8, 15, 22, 5, 18]
M.min(my_list)
M.max(my_list)
M.sum(my_list)
my_list_range = M.max(my_list) - M.min(my_list)
my_list_range

# #problem 4
# employees = load-table:
#   id :: Number,
#   name :: String,
#   dep_name :: String,
#   title :: String,
#   regular :: Number,
#   retro :: String,
#   other :: Number,
#   overtime :: Number,
#   injured :: String,
#   detail :: Number,
#   quinn_education :: Number,
#   total_gross :: Number,
#   postal :: Number
#   source: ""