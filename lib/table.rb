class Table
  def initialize
    @table = []
    @column_widths = {}
  end

  def put(col, row, value)
    @table[row] ||= []
    @table[row][col] = value
    @column_widths[col] = [
      max_value_length_in_column(col),
      value.to_s.length
    ].max
  end

  def get(col, row)
    table.dig(row, col)
  end

  def to_s
    if table.empty?
      "++\n\++\n[EMPTY]"
    else
      row_separator = "+" + width.times.map do |col|
        column_width = max_value_length_in_column(col)
        "--" + "-" * column_width
      end.join("+") + "+"

      table_center = height.times.map do |row|
        "| " + width.times.map do |col|
          column_width = max_value_length_in_column(col)
          value = get(col, row).to_s || " " * column_width
          value.ljust(column_width)
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

  attr_reader :table, :column_widths

  def height
    table.length
  end

  def width
    table.map { |row| row&.length || 0 }.max
  end

  def max_value_length_in_column(col)
    column_widths.fetch(col) { 1 }
  end
end
