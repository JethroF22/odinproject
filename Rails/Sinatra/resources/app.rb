require "sinatra"
require "rerun"
require "erb"
require_relative "name_validator"

enable :sessions

# index route
get "/members" do
  @members = read_members
  erb :index
end

# new route
get "/members/new" do
  erb :new
end

# create route
post "/members/new" do
  @name = params["name"]
  @members = read_members
  validator = NameValidator.new(@name, @members)

  if validator.valid?
    store_name("members.txt", @name)
    session[:message] = "Successfully stored the name #{@name}"
    redirect "/members/#{@name}"
  else
    @message = validator.message
    erb :new
  end
end

# edit route
get "/members/:name/edit" do
  erb :edit
end

# update route
put "/members/:name/edit" do
  @name = params["name"]
  @members = read_members
  validator = NameValidator.new(@name, @members)

  if validator.valid?
    session[:message] = "Successfully updated the name #{@name}"
    redirect "/members/#{@name}"
  else
    @message = validator.message
    erb :edit
  end
end

# delete route (not the Rails way)
get "/members/:name/delete" do
  @name = params["name"]
  erb :delete
end

# destroy route (also not the Rails way)
delete "/members/:name/delete" do
  name = params["name"]
  delete_name(name)
  redirect "/members"
end

# show route
get "/members/:name" do
  @message = session.delete(:message)
  @member = params['name']
  erb :show
end

def store_name(filename, string)
  File.open(filename, "a+") do |file|
    file.puts(string)
  end
end

def delete_name(name)
  names = File.readlines('members.txt')
  names.reject! { |item| item.chomp == name }
  File.open('members.txt', "w") do |f|
    names.each do |item|
      f.write item
    end
  end


end

def read_members
  return [] unless File.exist?("members.txt")
  File.read("members.txt").split("\n")
end
