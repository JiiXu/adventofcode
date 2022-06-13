{
  if (NR > 1 && $1 - prev > 0)
    count++

  prev = $1
}

END {
  print count
}
