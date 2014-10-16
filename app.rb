# As an employee, I want to be able to add food items to a party as they order them... so I can keep track of a party's orders
# As an employee, I want to be able to create a receipt ... so I can print it

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

# GET   /parties/new  Display a form for a new party
get '/parties/new' do
  erb :'parties/new'
end

# POST  /parties  Creates a new party
post '/parties' do
  party = Party.create(params[:party])
  redirect "/parties/#{party.id}"
end

# GET   /parties/:id  Display a single party and options for adding a food item to the party
get '/parties/:id' do
  @party = Party.find(params[:id])
  # @party.foods shows all food items ordered by a party 
  @foods = Food.all
  erb :'/parties/show'
end

# GET   /parties/:id/edit   Display a form for to edit a party's details
get '/parties/:id/edit' do
  @party = Party.find(params[:id])
  erb :'/parties/edit'
end

# PATCH   /parties/:id  Updates a party's details
patch '/parties/:id' do
  party = Party.find(params[:id])
  party.update(params[:party])
  redirect "/parties/#{party.id}"
end

# DELETE  /parties/:id  Delete a party
delete '/parties/:id' do
  party = Party.delete(params[:id])
  redirect "/parties"
end 

# POST  /orders   Creates a new order
post '/orders' do
  foods =  params['food'].keys.map{ |id| Food.find(id) }
  party = Party.find(params[:party][:party_id])
  foods.each do |food|
    party.foods << food
  end
 redirect "/parties/#{party.id}"
end

# PATCH   /orders/:id   Change item to no-charge  
patch 'orders/:id' do
  order = Order.find(params[:id])
  order.update(params[:order])
  redirect "/parties/#{party.id}"
end

# DELETE  /orders   Removes an order
delete '/orders/:id' do
  old_order = Order.destroy(params[:order][:id])
  redirect "/parties/#{old_order.party.id}"
end

# GET   /parties/:id/receipt  Saves the party's receipt data to a file. Displays the content of the receipt. Offer the file for download.
# get '/parties/:id/order' do
#   @orders_made = File.read('orders_made.txt').split("\n")
#   erb :'/index/show'
# end

# post '/parties/:id/receipt' do
#   new_receipt = params[:order]

#   file = File.open('orders_made.txt', 'a')
#   file.write(order + "\n----------------\n")
#   file.close

#   redirect('/')
# end

get '/whats_for_lunch' do
  possible_lunches = File.read('saved_lunches.txt').split("\n")
  @lunch = possible_lunches.sample
  erb(:lunch_spots)
end

# PATCH   /parties/:id/checkout   Marks the party as paid 


get '/console' do
  binding.pry
end