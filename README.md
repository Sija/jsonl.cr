# JSONL

[![CI](https://github.com/Sija/jsonl.cr/actions/workflows/ci.yml/badge.svg)](https://github.com/Sija/jsonl.cr/actions/workflows/ci.yml) [![Releases](https://img.shields.io/github/release/Sija/jsonl.cr.svg)](https://github.com/Sija/jsonl.cr/releases) [![License](https://img.shields.io/github/license/Sija/jsonl.cr.svg)](https://github.com/Sija/jsonl.cr/blob/master/LICENSE)

JSONL is a module for handling [JSONL](http://jsonlines.org) (JSON Lines) parsing.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     jsonl:
       github: Sija/jsonl.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "jsonl"
```

```crystal
arr = JSONL.parse <<-JSONL
  {"foo": "bar"}
  [1, 2, 3]
  "foo"
  JSONL

arr.class # => Array(JSON::Any)
```

```crystal
class User
  include JSON::Serializable

  property id : Int32
  property first_name : String
  property last_name : String
end

input = <<-JSONL
  {"id": 1, "first_name": "John", "last_name": "Doe"}
  {"id": 2, "first_name": "Mary", "last_name": "Poppins"}
  {"id": 3, "first_name": "Jack", "last_name": "Black"}
  JSONL

users = User.from_jsonl(input)
users.class # => Array(User)

# no array allocation here
User.from_jsonl(input) do |user|
  user.class # => User
end
```

## Contributing

1. Fork it (<https://github.com/Sija/jsonl.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Sijawusz Pur Rahnama](https://github.com/Sija) - creator and maintainer
