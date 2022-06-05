function sumFish(arr) {
  for (i=0; i<=8; i++)
    sum += arr[i]
  return sum
}

BEGIN {
  FS=","
}

{
  for (i=1; i<=NF; i++)
    fish[$i]++
}

END {
  while (it != 0) {
    it--
    fish[9]+=fish[0]
    fish[7]+=fish[0]
    fish[0]=0

    for (i=1; i<=9; i++) {
      fish[i-1]+=fish[i]
      fish[i]=0
    }

  }
  print sumFish(fish)

}

