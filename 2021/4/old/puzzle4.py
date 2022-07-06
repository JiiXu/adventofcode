import sys

filename = sys.argv[1]
with open(filename, 'r') as f:
  lines = f.readlines()
  lines = [line.rstrip() for line in lines if line != '\n']

  # Numbers to be drawn get their own list
  draws = list(map(int, lines[0].split(',')))

# Transform all following rows into lists of integers
  boards_list = [list(map(int, line.split())) for line in lines[1:]]
  # Split the remaining list into chunks of 5 (a board each)
  def chunks(lst, n):
      for i in range(0, len(lst), n):
          yield lst[i:i + n]

  # For each board, generate "potential winning objects"; that is rows and columns.
  # (Rows we already have).

  boards = []
  for b in chunks(boards_list, 5):
    cols = []
    for i in range(5):
      c = [r[i] for r in b]
      cols.append(c)
    boards.append(b + cols)

  # We now have a collection of boards where a board is defined as a list of 10 "winning
  # objects". For each winning object, we can pick out a "draw length", the amount of
  # draws before that object wins. The shortest subset of the draw that the board can
  # generate is that board's winning draw. The board with the shortest of these is the
  # best board, the board with the longest the worst board.
  smallest_winning_draw_len = len(draws)
  longest_winning_draw_len = 0
  for board in boards:
    smallest_draw_len = len(draws)
    smallest_draw = []
    for wo in board:
      # The draw where each number in the wo is ticket
      places_in_draw = [draws.index(num) for num in wo]

      if -1 in places_in_draw:
        # Object does not win (this never happens in the puzzle)
        break

      if max(places_in_draw)+1 < smallest_draw_len:
        smallest_draw_len = max(places_in_draw)+1
        smallest_draw = draws[0:max(places_in_draw)+1]
    if smallest_draw_len < smallest_winning_draw_len:
      smallest_winning_draw_len = smallest_draw_len
      best_board = board[0:5]
      best_draw = smallest_draw
    if smallest_draw_len > longest_winning_draw_len:
      longest_winning_draw_len = smallest_draw_len
      worst_board = board[0:5]
      worst_draw = smallest_draw

  # Calculate the score.
  def score_board(b, draw):
    score = 0
    for row in b:
      for num in row:
        if num not in draw:
          score += num
    score *= draw[-1]
    return score
  print(score_board(worst_board, worst_draw))
  print(score_board(best_board, best_draw))

  # For puzzle b, we need to do the same for the last board to win; the code above has been
  # modified to also calculate that board and its score is calculated below.

  
