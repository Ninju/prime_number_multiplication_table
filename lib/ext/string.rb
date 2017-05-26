class String
  def strip_between_newlines
    strip.split("\n").map(&:strip).join("\n")
  end
end
