# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Person.destroy_all
Job.destroy_all

Person.create! [
  { first_name: "George", last_name: "De La Selva", age: 37, login: "GL", pass: "123456" },
  { first_name: "Ghost", last_name: "Buster", age: 28, login: "GB", pass: "asdbjk32" },
  { first_name: "Mirtha", last_name: "Legrand", age: 89, login: "ASnb", pass: "pass" },
  { first_name: "Susana", last_name: "Gimenez", age: 68, login: "Susana", pass: "Hunter2" },
  { first_name: "John", last_name: "Cena", age: 33, login: "cantseemenow", pass: "----" },
  { first_name: "Jesus", last_name: "Christ" , age: 27, login: "Jesus", pass: "H" },
  { first_name: "One", last_name: "Two", age: 12, login: "12", pass: "12" },
  { first_name: "Three", last_name: "Four", age: 34, login: "34", pass: "34" }
]

#And this is another way to associate entities:
Person.first.jobs.create! [
    { title: "Developer", company: "Meli", position_id: "#dv12" },
    { title: "Dad", company: "Home", position_id: "#1Dad" }
]