class Table
  def initialize
    @table = []
  end

  def put(col, row, value)
    @table[row] ||= []
    @table[row][col] = value
  end

  def get(col, row)
    @table.dig(row, col)
  end
end
