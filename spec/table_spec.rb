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
end
