function min(x1, x2) {
  if (x1>=x2)
    return x2
  return x1
}

function max(x1, x2) {
  if (x1>=x2)
    return x1
  return x2
}

function solve(g, max_x, max_y) {
  out = 0
  for (i = 0; i <= max_x; i++) {
    for (j = 0; j <= max_y; j++) {
      if (grid[j, i] > 1)
        out += 1
    }
  }
  return out
}

{
  if ($1 == $3) {
    start = min($2, $4)
    end = max($2, $4)
    for (i = start; i <= end; i++) {
      grid[$1, i]++
    }
  }
  else if ($2 == $4) {
    start = min($1, $3)
    end = max($1, $3)
    for (i = start; i <= end; i++) {
      grid[i, $2]++
    }
  }
  else {
    # put a diagonal line in place

    like_frontslash = (($1 < $3 && $2 > $4) || ($1 > $3 && $2 < $4))

    start_x = min($1, $3)
    steps = max($1, $3) - min($1, $3)

    if (like_frontslash) {
      start_y = max($2, $4)
      for (i = 0; i <= steps; i++) {
        grid[start_x+i, start_y-i]++
      }
    }
    else {
      start_y = min($2, $4)
      for (i = 0; i <= steps; i++) {
        grid[start_x+i, start_y+i]++
      }
    }
  }

  if (max($1, $3) > max_x)
    max_x = max($1, $3)

  if (max($2, $4) > max_y)
    max_y = max($1, $3)

}

END {
  print solve(grid, max_x, max_y)
}

