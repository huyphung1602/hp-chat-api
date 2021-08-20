# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  user = User.create!(
    {
      name: 'Harry',
      email: 'harry@holistics.io',
      password: 'testtest',
    }
  )

  rooms = Room.create!(
    [
      {
        user: user,
        name: 'Hoi game A Chau',
      },
      {
        user: user,
        name: 'Wibu Club',
      },
    ]
  )

  messages = Message.create!(
    [
      {
        user: user,
        room: rooms[0],
        content: "Do em biet anh dang nghi gi",
      },
      {
        user: user,
        room: rooms[0],
        content: "Co dieu gi sao khong noi cung anh?",
      },
      {
        user: user,
        room: rooms[1],
        content: "Den bao gio",
      },
      {
        user: user,
        room: rooms[1],
        content: "Nuoc mat em lau bang tinh yeu moi",
      }
    ]
  )
end
