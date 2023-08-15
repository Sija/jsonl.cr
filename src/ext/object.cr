class Object
  def self.from_jsonl(input : String | IO, &) : Nil
    JSONL.parse(input) do |line|
      yield from_json(line)
    end
  end

  def self.from_jsonl(input : String | IO) : Array(self)
    ([] of self).tap do |arr|
      from_jsonl(input) do |obj|
        arr << obj
      end
    end
  end
end
