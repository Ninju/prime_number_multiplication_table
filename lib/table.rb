class Table
  def initialize
    @table = []
  end

  def put(col, row, value)
    @table[row] ||= []
    @table[row][col] = value
  end

  def get(col, row)
    table.dig(row, col)
  end

  def to_s
    if table.empty?
      "++\n\++\n[EMPTY]"
    else
      row_separator = "+---" * width + "+"

      table_center = height.times.map do |row|
        "| " + width.times.map do |col|
          get(col, row) || " "
        end.join(" | ") + " |"
      end.join("\n#{row_separator}\n")

      %Q(
        #{row_separator}
        #{table_center}
        #{row_separator}
      ).strip_between_newlines
    end
  end

  private

  attr_reader :table

  def height
    table.length
  end

  def width
    table.map { |row| row&.length || 0 }.max
  end
end
