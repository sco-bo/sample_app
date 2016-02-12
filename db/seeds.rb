User.create!(
  name: "The Dude",
  email: "thedude@iabide.org",
  password: "foobar",
  password_confirmation: "foobar",
  admin: true
)

99.times do |n|
  name = Faker::Name.name
  email = "thedude-#{n+1}@iabide.org"
  password = "password"
  User.create!(
    name: name, 
    email: email,
    password: password,
    password_confirmation: password
    )
end