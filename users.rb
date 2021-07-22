require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require 'yaml'

before do
  @content = YAML.load_file("users.yaml")
  @names = @content.keys
end

get "/" do
  erb :index
end

get '/:name' do
  @name = params[:name]
  erb :name
end

helpers do
  def count_interests(content)
    total = 0
    content.each do |name, info|
      total += content[params[:name].to_sym][:interests].count 
    end
    total
  end
end