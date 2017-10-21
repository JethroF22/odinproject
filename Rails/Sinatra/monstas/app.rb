require "sinatra"
require "rerun"
require "erb"
require_relative "name_validator"

enable :sessions

get "/" do
  "OMG, hello Ruby Monstas"
end

get "/monstas" do
  @message = session.delete(:message)
  @name = params["name"]
  @names = read_names
  erb :monstas
end

post "/monstas" do
  @name = params["name"]
  @names = read_names
  validator = NameValidator.new(@name, @names)

  if validator.valid?
    store_name("names.txt", @name)
    session[:message] = "Successfully stored the name #{@name}"
    redirect "/monstas?name=#{@name}"
  else
    @message = validator.message
    erb :monstas
  end

end

def store_name(filename, string)
  File.open(filename, "a+") do |file|
    file.puts(string)
  end
end

def read_names
  return [] unless File.exist?("names.txt")
  File.read("names.txt").split("\n")
end
