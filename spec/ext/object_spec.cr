require "../spec_helper"

class User
  include JSON::Serializable

  property id : Int32
  property first_name : String
  property last_name : String

  def_equals @id, @first_name, @last_name
end

describe Object do
  jsonl = <<-JSONL
    {"id": 1, "first_name": "John", "last_name": "Doe"}
    {"id": 2, "first_name": "Mary", "last_name": "Poppins"}
    {"id": 3, "first_name": "Jack", "last_name": "Black"}
    JSONL

  it ".from_jsonl" do
    users = User.from_jsonl(jsonl)
    users.should be_a(Array(User))
    users.should eq(
      jsonl.lines.map(&->User.from_json(String))
    )
    users.size.should eq(3)
  end
end
