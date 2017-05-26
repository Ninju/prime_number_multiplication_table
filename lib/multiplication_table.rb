class MultiplicationTable
  def initialize
    @table = Table.new
  end

  def populate(factors)
    factors.each_with_index do |factor, idx|
      table.put(idx + 1, 0, factor)
      table.put(0, idx + 1, factor)

      factors.each_with_index do |factor2, idx2|
        product = factor * factor2
        table.put(idx + 1, idx2 + 1, product)
      end
    end
  end

  def get(col, row)
    table.get(col + 1, row + 1)
  end

  def to_s
    table.to_s
  end

  private

  attr_reader :table
end
