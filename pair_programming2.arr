import lists as L

fun puzzle-points(guesses :: Number) -> Number block:
  var points = 7
  if (guesses == 0):
    points := 0
  else:
    points := points - guesses
  end
  points
end

fun solved-days(puzzlelog :: List<Number>) -> List<Number> block:
  fun check-if-0(g :: Number) -> Boolean:
    g > 0
  end
  puzzlelog.filter(check-if-0)
end

fun total-score(puzzlelog :: List<Number>) -> Number block:
  var score = 0
  var c = 0
  for each(p from puzzlelog) block:
    puzzle = puzzle-points(p)
    if puzzle <> 0 block:
      score := score + puzzle + c
      c := c + 1
    else:
      c := 0
    end
  end
  score
end

week = table: date :: String, guesses :: Number
  row: "Oct 5", 3
  row: "Oct 6", 5
  row: "Oct 7", 0
  row: "Oct 8", 1
  row: "Oct 9", 2
  row: "Oct 10", 4
  row: "Oct 11", 0
end

fun puzzle-report(t :: Table) -> String block:
  guesses = t.get-column("guesses")
  "solved " + num-to-string(L.length(solved-days(guesses))) + " of " + num-to-string(L.length(guesses)) + " puzzles, score " + num-to-string(total-score(guesses))
end
  