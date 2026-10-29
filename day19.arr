use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

data PaymentMethod:
  | cash
  | credit(card-number :: String, expiry :: String)
  | checking(bank-account :: String, routing :: String, check-number :: Number)
end


payment-1 = cash
payment-2 = credit("1111-2222-3333-4444", "09/26")
payment-3 = checking("987654321", "111", 55)


fun display-payment(p :: PaymentMethod) -> String:
  cases (PaymentMethod) p:
    | cash => "Paid in cash"
    | credit(cn, exp) => "Paid by credit card expiring on " + exp
    | checking(acc, rout, num) => "Paid by check from account " + acc
  end
end

#Define a Vehicle data type with three variants: bike (no fields), car (with make and year fields), and truck (with make, year, and capacity fields). Create one example of each variant.
data Vehicle:
  | bike
  | car(make :: String, year :: Number)
  | truck(make :: String, year :: Number, capacity :: Number)
end

v1 = bike
v2 = car("Honda", 2022)
v3 = truck("Tesla", 2021, 4)

# Write a function vehicle-age that takes a Vehicle and the current year, and returns the age in years. For bikes, return 0.
fun vehicle-age(v :: Vehicle, current-year :: Number) -> Number:
  current-year - v.year
end
vehicle-age(v2, 2026)

# Define a Grade data type with variants: letter (with a string field for A/B/C/D/F), percent (with a number field), and pass-fail (with a boolean field). Create examples of each.
data Grade:
  | letter(letter :: String)
  | percent(percent :: Number)
  | pass-fail(pf :: Boolean)
end

g1 = letter("A")
g2 = percent(91.2)
g3 = pass-fail(true)

#Write a function grade-to-gpa that converts any Grade to a 4.0 scale number. Use: A=4.0, B=3.0, C=2.0, D=1.0, F=0.0; percentages: 90+=4.0, 80-89=3.0, 70-79=2.0, 60-69=1.0, <60=0.0; pass-fail: pass=4.0, fail=0.0.
fun grade-to-gpa(g :: Grade) -> Number:
  let gpa = 0.0
    if ((g.letter == "A") or (g.percent >= 90)):
      gpa = 4.0
    else if ((g.letter == "B") or ((g.percent >= 80) and (g.percent <= 89))):
      gpa = 3.0
    else if ((g.letter == "C") or ((g.percent >= 70) and (g.percent <= 79))):
      gpa = 2.0
    else if ((g.letter == "D") or ((g.percent >= 60) and (g.percent <= 69))):
      gpa = 1.0
    else if (g.pass-fail == true):
    gpa = 4.0
  else:
     gpa = 0.0
  end
  gpa
end
      

