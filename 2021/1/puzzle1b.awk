BEGIN {
  win = 3
  count = 0
}

{
  mod = NR % win
  diff = $1-arr[mod]
  if(NR > 3 && diff > 0) {
      count++
    }
  arr[mod] = $1
}

END {print count}
