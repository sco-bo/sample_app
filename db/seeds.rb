# Users
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

# Microposts
users = User.order(:created_at).take(6)
50.times do 
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each {|followed| user.follow(followed)}
followers.each {|follower| follower.follow(user)}