{
  if ($1 == "forward")
    f += $2
  else if ($1 == "down") 
    d += $2
  else
    d -= $2
}

END {
  print f*d
}
