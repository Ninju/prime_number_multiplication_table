class Application
  def run
    m = MultiplicationTable.new
    m.populate([2,3,5,7,11,13,17,19,23,29])
    puts m
  end
end
