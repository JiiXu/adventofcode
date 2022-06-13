{
  mod = NR % 3
  diff = $1-arr[mod]
  if(NR > 3 && diff > 0)
      count++
  arr[mod] = $1
}

END {
  print count
}
