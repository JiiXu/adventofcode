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

function str2dec(s)
{
  split(s, chars, "")
  return bin_arr_2_dec(chars)
}

function p(arr)
{
  for (i in arr)
    print arr[i]
}

function cp_arr(arr, out) {
  split("", out)
  for (i in arr)
    out[i] = arr[i]
}

function filter(arr, out, pos, des)
{
  out_i = 1
  split("", out)
  for (i in arr) {
    split(arr[i], chars, "")
    if (chars[pos] == des)
      out[out_i++] = arr[i]
  }
}

function sum(arr, out)
{
  split("", out)
  for (i in arr) {
    split(arr[i], chars, "")
    for (j in chars) {
      out[j] += chars[j]
    }
  }

}

function oxy(arr, sums)
{
  pos = 1
  cp_arr(arr, oxy_result)
  cp_arr(sums, oxy_sums)
  l = length(oxy_result)
  m = l/2
  while (l != 1) {
    if (oxy_sums[pos] >= m) {
      filter(oxy_result, oxy_tmp, pos++, 1)
    }
    else {
      filter(oxy_result, oxy_tmp, pos++, 0)
    }
    cp_arr(oxy_tmp, oxy_result)
    l = length(oxy_result)
    m = l/2
    sum(oxy_result, oxy_sums)
  }

  return str2dec(oxy_result[1])

}

function c02(arr, sums)
{
  pos = 1
  cp_arr(arr, c02_result)
  cp_arr(sums, c02_sums)
  l = length(c02_result)
  m = l/2
  while (l != 1) {
    if (c02_sums[pos] < m) {
      filter(c02_result, c02_tmp, pos++, 1)
    }
    else {
      filter(c02_result, c02_tmp, pos++, 0)
    }
    cp_arr(c02_tmp, c02_result)
    l = length(c02_result)
    m = l/2
    sum(c02_result, c02_sums)
  }

  return str2dec(c02_result[1])

}

{
  rows[NR] = $1
}

END {
  sum(rows, sums)
  oxy_v = oxy(rows, sums)
  c02_v = c02(rows, sums)
  print oxy_v*c02_v
}
