require 'yaml'

@content = YAML.load_file("users.yaml")
@names = @content.keys

puts @names