module PrimeNumberMultiplicationTable
  class MultiplicationTable
    def initialize
      @table = Table.new
    end

    def populate(factors)
      factors.each_with_index do |factor, idx|
        table.put(idx + 1, 0, factor)
        table.put(0, idx + 1, factor)

        square_product = factor * factor
        table.put(idx + 1, idx + 1, square_product)

        factors[(idx + 1)..-1].each_with_index do |factor2, offset_idx2|
          idx2 = offset_idx2 + idx + 1
          product = factor * factor2
          table.put(idx + 1, idx2 + 1, product)
          table.put(idx2 + 1, idx + 1, product)
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
end
