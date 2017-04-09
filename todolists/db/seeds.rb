# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Profile.destroy_all
TodoItem.destroy_all
TodoList.destroy_all
User.destroy_all


gender_female_string = 'female'
gender_male_string = 'male'

User.create! [
                 { username: 'Fiorina', password_digest: 'password' },
                 { username: 'Trump', password_digest: 'password' },
                 { username: 'Carson', password_digest: 'password' },
                 { username: 'Clinton', password_digest: 'password' },
             ]


Profile.create! [
                    { first_name: 'Carly', last_name: 'Fiorina', birth_year: 1954, gender: gender_female_string },
                    { first_name: 'Donald', last_name: 'Trump', birth_year: 1946, gender: gender_male_string },
                    { first_name: 'Ben', last_name: 'Carson', birth_year: 1951, gender: gender_male_string },
                    { first_name: 'Hillary', last_name: 'Clinton', birth_year: 1947, gender: gender_female_string }
                ]

User.all.each{
    |user|

  Profile.find_by(last_name: user.username).user = user
  default_date = Date.today + 1.year
  user.todo_lists.create! [
                              { list_due_date: default_date }
                          ]

  5.times {
    random_title = ('a'..'z').to_a.shuffle[0,8].join
    random_description = ('a'..'z').to_a.shuffle[0,8].join
    user.todo_lists.first.todo_items.create! [
                                                 { due_date: default_date, title: random_title, description: random_description }
                                             ]
  }

}