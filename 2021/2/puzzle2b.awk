{
  arr[$1] += $2
  if ($1 == "forward")
    depth += $2*(arr["down"] - arr["up"])
}

END {
  print arr["forward"]*depth
}
