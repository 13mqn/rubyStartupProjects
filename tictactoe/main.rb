board = [
  ["1", "2", "3"],
  ["4", "5", "6"],
  ["7", "8", "9"]
]

SYMBOLS = { player: "X", computer: "O" }

def draw_board(board)
  board.each do |row|
    puts row.join(" ")
  end
end

def make_move(board, position, symbol)
  case position
  when 1
    board[0][0] = symbol
  when 2
    board[0][1] = symbol
  when 3
    board[0][2] = symbol
  when 4
    board[1][0] = symbol
  when 5
    board[1][1] = symbol
  when 6
    board[1][2] = symbol
  when 7
    board[2][0] = symbol
  when 8
    board[2][1] = symbol
  when 9
    board[2][2] = symbol
  end
end

def winner?(board, symbol)
  board.each do |row|
    return true if row.all? { |s| s == symbol }
  end

  board.transpose.each do |col|
    return true if col.all? { |s| s == symbol }
  end

  diagonals = [[board[0][0], board[1][1], board[2][2]], [board[0][2], board[1][1], board[2][0]]]
  diagonals.each do |diagonal|
    return true if diagonal.all? { |s| s == symbol }
  end

  return false
end

def start_game(board)
  draw_board(board)

  puts "Karakterinizi seçin : (X veya O)"
  player_symbol = gets.chomp.upcase
  computer_symbol = SYMBOLS[:computer] if player_symbol == SYMBOLS[:player]
  computer_symbol = SYMBOLS[:player] if player_symbol == SYMBOLS[:computer]

  current_player = SYMBOLS[:player]
  until winner?(board, SYMBOLS[:player]) || winner?(board, SYMBOLS[:computer])
    system("clear")
    draw_board(board)
    puts "#{current_player} sırası"
    if current_player == SYMBOLS[:player]
      print "Hamlenizi seçin (1-9): "
      move = gets.chomp.to_i
      make_move(board, move, SYMBOLS[:player])
      current_player = SYMBOLS[:computer]
    else
      computer_move = rand(1..9)
      make_move(board, computer_move, SYMBOLS[:computer])
      current_player = SYMBOLS[:player]
    end
  end

  system("clear")
  draw_board(board)
  if winner?(board, SYMBOLS[:player])
    puts "Kazandınız"
  else 
    puts "Kaybettin"
  end
end
start_game(board)
