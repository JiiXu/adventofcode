function bin_arr_2_dec(array)
{
  end = length(array)
  result = 0
  pos = 1

  for (i = end; i > 0; i--) {
    result += array[i] * pos
    pos *= 2
  }

  return result
}

{
  split($0, chars, "")
  for (i in chars)
    sums[i] += chars[i]

}

END {
  for (i in sums) {
    gamma[i] = (sums[i] > NR/2)
    eps[i] = (sums[i] < NR/2)
  }

  g_dec = bin_arr_2_dec(gamma)
  eps_dec = bin_arr_2_dec(eps)

  print g_dec * eps_dec
}
