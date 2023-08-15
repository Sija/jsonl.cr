require "./spec_helper"

describe JSONL do
  jsonl = <<-JSONL
    {"foo": "bar"}
    [1, 2, 3]
    "foo"
    JSONL

  context ".parse" do
    it "String" do
      arr = JSONL.parse(jsonl)
      arr.should eq(
        jsonl.lines.map(&->JSON.parse(String))
      )
      arr.size.should eq(3)
    end

    it "IO" do
      memory_io = IO::Memory.new(jsonl)

      arr = JSONL.parse(memory_io)
      arr.should eq(
        jsonl.lines.map(&->JSON.parse(String))
      )
      arr.size.should eq(3)
    end
  end
end
