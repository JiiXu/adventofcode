# adventofcode
My submissions for advent of code. I only solve them sporadically, and tend to try to make things interesting if I can!

## 2021

### Day 1
For day 1, it's two solutions in `awk`. I'd never used `awk` before so I think it turned out pretty ok. For puzzle 1b, I used an old trick from embedded systems; it's often possible to evaluate a sliding window by doing calculations only on the first value of the window and the first value "behind" the window. That is to say, on the values that enter and exit the window.

### Day 2
The solution for puzzle 1a is a bit of silly dynamic programming; the shell script adds rows to itself to calculate and print the answer and then deletes those rows from itself thus restoring its original state. For puzzle 2b I went back to `awk`.

### Day 3
~~One in awk, one in haskell.~~ I decided awk, sed and shell are too much fun so I'm redoing the old ones.

### Day 4
~~This puzzle felt grindy and I couldn't really come up with anything really creative or clever. So I solved in in Python.~~ Do-over here as well!

### Day 5
Again a quite grindy puzzle, but my interest in awk is really piqued!

## 2021 do-over!
I've decided that `awk`, `sed` and shell script are too much fun so I'm challenging myself to solve the entire advent of code 2021 in those.
