require 'bundler'
Bundler.require(:default)
require './connection'

ROOT_PATH = Dir.pwd
Dir[ROOT_PATH+"/models/*.rb"].each { |file| require file }

# GET   /   Displays links to navigate the application (including links to each current parties)
get '/' do
  erb :'/home'
end

# GET   /foods  Display a list of food items available
get '/foods' do
  @foods = Food.all
  erb :'foods/index'
end

# GET   /foods/new  Display a form for a new food item
get '/foods/new' do
  erb :'foods/new'
end

# POST  /foods  Creates a new food item
post '/foods' do
  food = Food.create(params[:food])
  redirect "/foods/#{food.id}"
end

# GET   /foods/:id  Display a single food item and a list of all the parties that included it
get '/foods/:id' do
  @food = Food.find(params[:id])
  erb :'/foods/show'    
end

# GET   /foods/:id/edit   Display a form to edit a food item
get '/foods/:id/edit' do
  @food = Food.find(params[:id])
  erb :'/foods/edit'
end

# PATCH   /foods/:id  Updates a food item
patch '/foods/:id' do
  food = Food.find(params[:id])
  food.update(params[:food])
  redirect "/foods/#{food.id}"
end

# DELETE  /foods/:id  Deletes a food item
delete '/foods/:id' do
  food = Food.destroy(params[:id])
  redirect "/foods"
end

# GET   /parties  Display a list of all parties
get '/parties' do
  @parties = Party.all
  erb :'/parties/index'
end

# GET   /parties/:id  Display a single party and options for adding a food item to the party
# GET   /parties/new  Display a form for a new party
# POST  /parties  Creates a new party
# GET   /parties/:id/edit   Display a form for to edit a party's details
# PATCH   /parties/:id  Updates a party's details
# DELETE  /parties/:id  Delete a party
# POST  /orders   Creates a new order
# PATCH   /orders/:id   Change item to no-charge
# DELETE  /orders   Removes an order
# GET   /parties/:id/receipt  Saves the party's receipt data to a file. Displays the content of the receipt. Offer the file for download.
# PATCH   /parties/:id/checkout   Marks the party as paid 