class TicTacToe
  def initialize(board)
    @board = board
  end

  def winner
    length = @board.first.length - 1

    # row checks

    @board.each do |row|
      return row.uniq.first if row.uniq.count == 1 && ["o", "x"].include?(row.uniq.first)
    end

    # column checks
    (0..length).each do |index|
      col = @board.map{|element| element[index]}
      return col.uniq.first if col.uniq.count == 1 && ["o", "x"].include?(col.uniq.first)
    end

    # diagonal checks

    digonal = []
    (0..length).each do |i|
      digonal << @board[i][length - i]
    end
    return digonal.uniq.first if digonal.uniq.count == 1 && ["o", "x"].include?(digonal.uniq.first)

    digonal = []
    (0..length).each do |i| 
      digonal << @board[i][i]
    end
    return digonal.uniq.first if digonal.uniq.count == 1 && ["o", "x"].include?(digonal.uniq.first)


    return "unfinished" if unfinished?(@board)    
    return "draw"
  end

  def unfinished?(board)
    board.flatten.any?{|element| return false if (element.to_s.empty? || element.to_s.nil?)}
  end
end
