use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


# fun choose-hat(temp :: Number) -> String:
#   doc: "returns a message with temp-appropriate headgear"
#   if temp > 32:
#     "no hat"
#   else:
#     "winter hat"
#   end
# where:
#   choose-hat(70) is "no hat"
#   choose-hat(32.1) is "no hat"
#   choose-hat(32) is "winter hat"
# end

fun choose-hat(temp :: Number) -> String:
  doc: "determines appropriate head gear"
  condition1 = temp > 32
  if (temp > 32) and (temp <= 80):
    "no hat"
  else if temp > 80:
    "sun hat"
  else:
    "winter hat"
  end
where:
  choose-hat(20) is "winter hat"
  choose-hat(85) is "sun hat"
  choose-hat(50) is "no hat"
end

fun add-glasses(outfit :: String) -> String:
  doc: " function add-glasses that takes an outfit (as a string) and always adds and glasses to what you will wear"
  outfit + " and glasses"
end

fun choose-outfit(temp :: Number) -> String:
  doc: "takes input of temp in F, and uses add-glasses and choose-hat to compute final outfit"
  add-glasses(
    choose-hat(temp))
end

choose-outfit(50)

