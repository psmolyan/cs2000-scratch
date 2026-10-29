use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun every-third-element(lst :: List) -> List block:
  doc: "returns a new list with first element and every subsequent third element"
  var cnt = 0
  var output = [list: ]
  for each(elt from lst) block:
    when num-modulo(cnt, 3) == 0:
      output := output + [list: elt]
    end
    cnt := cnt + 1
  end
  output
where:
  every-third-element([list: ]) is [list: ]
  every-third-element([list: 1, 3, 5]) is [list: 1]
  every-third-element([list: 1,3,5,7,11]) is [list: 1, 7]
end

var score = 10

fun bonus-points(amt :: Number) -> Number block:
  score := score + amt
  penalty-check()
end
fun penalty-check() -> Number block:
  when score > 15:
    score := score - 3
  end
  score
end

bonus-points(2)
bonus-points(4) 
bonus-points(1)
