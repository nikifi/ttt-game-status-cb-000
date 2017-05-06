# Helper Method
board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6],[1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)

  counterX = 0
  counterO = 0

  WIN_COMBINATIONS.each do |win|
    counterX = 0
    counterO = 0
   win.each do |position|
      if board[position] == "X"
        counterX += 1
      end
      if board[position] == "O"
        counterO += 1
      end
      if counterX == 3 || counterO == 3
        return win
      end
   end
  end
  return false
end

def full?(board)
  board.each do |position|
   if position != "O" && position != "X"
    return false
   end
  end
  return true
end

def draw?(board)
 if full?(board) && !won?(board)
   return true
 end
end

def over?(board)
 if won?(board) || full?(board) || draw?(board)
   return true
 end
end

def winner(board)
  if won?(board)
     won?(board).each do |pos|
       if board[pos] == "X"
         return "X"   
      end
      if board[pos] == "O"
        return "O"
      end
    end 
  end
end

puts winner(board)
