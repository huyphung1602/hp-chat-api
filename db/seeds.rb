# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find_by_name('Huy Phung')
messages = Message.create(
  [
    {
      user: user,
      body: "Do em biet anh dang nghi gi",
    },
    {
      user: user,
      body: "Co dieu gi sao khong noi cung anh?",
    },
    {
      user: user,
      body: "Den bao gio",
    },
    {
      user: user,
      body: "Nuoc mat em lau bang tinh yeu moi",
    }
  ]
)
