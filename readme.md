 ____  _____ ____ _____                           _
|  _ \| ____/ ___|_   _|_ _ _   _ _ __ __ _ _ __ | |_
| |_) |  _| \___ \ | |/ _` | | | | '__/ _` | '_ \| __|
|  _ <| |___ ___) || | (_| | |_| | | | (_| | | | | |_
|_| \_\_____|____/ |_|\__,_|\__,_|_|  \__,_|_| |_|\__|

    It's the future! In the olden days... waitstaff needed to keep track of a party's order by hand!
    A client has requested an application to help!
    Here is what they wrote:

I want an application so our waitstaff can manage our food orders...

Overall... an employee should be able to...
  a: select a party of customers
  b: select food items the customers have ordered
  c: save a receipt

We'll keep thinking about it over the next few days and send more details when they come up.

It's up to you! What does this entail?
Some starting ideas:
Food: An item of food on the menu (aka menu item)

    name?
    cuisine type?
    what is the price?
    any allergens?

Order: Join between Food items and Party
Party: A single group of people

    table number?
    number of guests?
    did they pay yet?

Verb  Route   Action
GET   /   Displays links to navigate the application (including links to each current parties)
GET   /foods  Display a list of food items available
GET   /foods/:id  Display a single food item and a list of all the parties that included it
GET   /foods/new  Display a form for a new food item
POST  /foods  Creates a new food item
GET   /foods/:id/edit   Display a form to edit a food item
PATCH   /foods/:id  Updates a food item
DELETE  /foods/:id  Deletes a food item
GET   /parties  Display a list of all parties
GET   /parties/:id  Display a single party and options for adding a food item to the party
GET   /parties/new  Display a form for a new party
POST  /parties  Creates a new party
GET   /parties/:id/edit   Display a form for to edit a party's details
PATCH   /parties/:id  Updates a party's details
DELETE  /parties/:id  Delete a party
POST  /orders   Creates a new order
PATCH   /orders/:id   Change item to no-charge
DELETE  /orders   Removes an order
GET   /parties/:id/receipt  Saves the party's receipt data to a file. Displays the content of the receipt. Offer the file for download.
PATCH   /parties/:id/checkout   Marks the party as paid
Morning Lecture: Many-to-Many

    As an employee, I want to be able to add new food items... so the menu can change
    As an employee, I want to be able to edit previously added food items... so I can update descriptions
    As an employee, I want to be able to delete previously added food items... so I can remove bad food
    As an employee, I want to be able to add food items to a party as they order them... so I can keep track of a party's orders
    As an employee, I want to be able to create a receipt ... so I can print it
