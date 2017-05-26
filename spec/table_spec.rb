require 'spec_helper'
require 'table'

RSpec.describe Table do
  subject { Table.new }

  it "allows you to place values into cells into any location without needing"\
  "to specify table dimensions (i.e. infinite canvas)" do
    subject.put(0, 0, "Cell value")
    expect(subject.get(0, 0)).to eq("Cell value")

    subject.put(100, 50, "Still works")
    expect(subject.get(100, 50)).to eq("Still works")
  end

  describe "rendering as a string" do
    context "empty table" do
      it "renders a message saying the table is empty" do
        expect(subject.to_s).to eq("++\n++\n[EMPTY]")
      end
    end

    context "table with values in the first column with no empty rows" do
      subject do
        t = Table.new
        t.put(0, 0, "x")
        t.put(0, 1, "y")
        t.put(0, 2, "z")
        t
      end

      it "renders 1 column and 3 rows" do
        expect(subject.to_s).to eq(%q{
                                    +---+
                                    | x |
                                    +---+
                                    | y |
                                    +---+
                                    | z |
                                    +---+
                                   }.strip_between_newlines)
      end
    end

    context "table with values in the first column with empty rows" do
      subject do
        t = Table.new
        t.put(0, 0, "x")
        t.put(0, 1, "y")
        t.put(0, 3, "z")
        t
      end

      it "renders 1 column and 4 rows with empty 3rd row" do
        expect(subject.to_s).to eq(%q{
                                    +---+
                                    | x |
                                    +---+
                                    | y |
                                    +---+
                                    |   |
                                    +---+
                                    | z |
                                    +---+
                                   }.strip_between_newlines)
      end
    end

    context "table with values in the first row with no empty columns" do
      subject do
        t = Table.new
        t.put(0, 0, "x")
        t.put(1, 0, "y")
        t.put(2, 0, "z")
        t
      end

      it "renders 3 columns and 1 row with no empty columns" do
        expect(subject.to_s).to eq(%q{
                                    +---+---+---+
                                    | x | y | z |
                                    +---+---+---+
                                   }.strip_between_newlines)
      end
    end

    context "table with values in the first row and empty columns" do
      subject do
        t = Table.new
        t.put(0, 0, "x")
        t.put(1, 0, "y")
        t.put(3, 0, "z")
        t
      end

      it "renders 3 columns and 1 row with an empty 3rd column" do
        expect(subject.to_s).to eq(%q{
                                    +---+---+---+---+
                                    | x | y |   | z |
                                    +---+---+---+---+
                                   }.strip_between_newlines)
      end
    end

    context "table has values scattered all over the place with lots of empty"\
    "cells" do
      subject do
        t = Table.new
        t.put(0, 0, "x")
        t.put(2, 3, "y")
        t.put(1, 4, "z")
        t
      end

      it "renders the values in the correct places and with the correct"\
      "formatting" do
        expect(subject.to_s).to eq(%q{
                                    +---+---+---+
                                    | x |   |   |
                                    +---+---+---+
                                    |   |   |   |
                                    +---+---+---+
                                    |   |   |   |
                                    +---+---+---+
                                    |   |   | y |
                                    +---+---+---+
                                    |   | z |   |
                                    +---+---+---+
                                   }.strip_between_newlines)
      end
    end
  end
end
