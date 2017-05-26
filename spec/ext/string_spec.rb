require 'spec_helper'

describe String do
  describe "String#strip_between_newlines" do
    it "strips all whitespace between that exists between newlines" do
      str = %q{some text
        is here
            this should be trimmed}

      expect(str.strip_between_newlines).to eq("some text\nis here\nthis should be trimmed")
    end

    it "strips leading blank newlines" do
      str = %q{
          starts with a newline}
          expect(str.strip_between_newlines).to eq("starts with a newline")
    end

    it "strips trailing blank newlines" do
      str = %q{ends with a newline
      }
      expect(str.strip_between_newlines).to eq("ends with a newline")
    end
  end
end
