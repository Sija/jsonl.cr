require "json"

require "./core_ext/**"
require "./jsonl/**"

module JSONL
  def self.parse(input : String | IO) : Array(JSON::Any)
    ([] of JSON::Any).tap do |arr|
      parse(input) do |line|
        arr << JSON.parse(line)
      end
    end
  end

  def self.parse(input : String | IO, & : String ->) : Nil
    # input.rewind if input.is_a?(IO)
    input.each_line do |line|
      yield line
    end
  end
end
