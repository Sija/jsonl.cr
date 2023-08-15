require "json"

require "./jsonl/**"
require "./ext/**"

module JSONL
  def self.parse(input : String | IO) : Array(JSON::Any)
    ([] of JSON::Any).tap do |arr|
      parse(input) do |line|
        arr << JSON.parse(line)
      end
    end
  end

  def self.parse(input : String, &) : Nil
    io = IO::Memory.new(input)
    parse(io) do |line|
      yield line
    end
  end

  def self.parse(input : IO, &) : Nil
    # input.rewind
    input.each_line do |line|
      yield line
    end
  end
end
