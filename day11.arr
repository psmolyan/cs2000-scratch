use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include csv

voter-data = 
  load-table: VoterID,FirstName,LastName,DOB,Party,Address,City,State,Zip,Phone,Email,LastVoted 
    source: csv-table-file("voter-data.csv", default-options)
  end

filter-with(voter-data, lam(r :: Row) -> Boolean: get-column(r, "Party") == "Republican" end)

## change missing Party values to independent by choice

fun clean-party-column(p :: String) -> String:
  doc: "converts unspecified party affiliation to Independent"
  if p == "":
    "Independent"
  else:
    p
  end
where:
  clean-party-column("") is "Independent"
  clean-party-column("Democrat") is "Democrat"
end

voters-with-independence = transform-column(voter-data, "Party", clean-party-column)


fun clean-state-zip(p :: String) -> String:
  doc: "fixes state and zip columns"
  if p == "":
    "CA"
  else if p == "0213":
    "02108"
  else:
    p
  end
where:
  clean-state-zip("") is "CA"
  clean-state-zip("TX") is "TX"
  clean-state-zip("0213") is "02108"
end

voters-clean-state = transform-column(voters-with-independence, "State", clean-party-column)

voters-clean-zip = transform-column(voters-clean-state, "Zip", clean-state-zip)

fun normalize-phone(p :: String) -> String:
  doc: "normalize phone numbers"
  p == string-repeat("N", string-length(p))
where:
  normalize-phone("5555") is "NNNN"
end

voters-normalized-phones = transform-column(voters-clean-zip, "Phone", normalize-phone)
voters-normalized-phones
