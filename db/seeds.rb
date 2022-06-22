# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email:"pranavdodiya72@gmail.com",password:"123456",username:"pranav123",name:"pranav dodiya",contact_number:"1234567890",role:"Restaurant Owner")
User.create(email:"rajdpanchal2810@gmail.com",password:"123456",username:"raj123",name:"raj panchal",contact_number:"1234567890",role:"Custmore")
User.create(email:"purvrajdodia@gmail.com",password:"123456",username:"purvraj123",name:"purvraj dodia",contact_number:"1234567890",role:"Delivery Man")

Restaurant.create(restaurant_name:"jay bhavani",restaurant_address:"chandkheda",restaurant_city:"bhavnagar",restaurant_contact_number:"1234567890",restaurant_description:"it's good",restaurant_email:"jaybhavani@gmail.com",secure_url:"hhsjkjkjaSDS",user_id:1)