require "sinatra"
require "rerun"
require "erb"

get "/" do
  "OMG, hello Ruby Monstas"
end

get "/signup" do
  "Here you can sign up for the NEXT beginners course."
end

post "/signin" do
  # do something to sign in the user
end

get "/monstas/:name" do
  @name = params["name"]
  erb :monstas
end
