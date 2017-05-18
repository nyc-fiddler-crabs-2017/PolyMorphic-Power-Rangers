# Create Users
20.times do
  User.create(first_name: Faker::Name.first_name , last_name: Faker::GameOfThrones.dragon, email: Faker::Internet.email, username: Faker::Cat.name, password: "password")
end

# Create Posts
20.times do
  Post.create(title: Faker::ChuckNorris.fact + "?", question: Faker::Lorem.sentence, user_id: rand(1..20))
end

# Create Answers
20.times do
  Answer.create(best_answer: Faker::Boolean.boolean, body: Faker::Lorem.sentence, post_id: rand(1..20), user_id: rand(1..20))
end

# Create Comments on Posts
10.times do
  Comment.create(body: Faker::Hacker.say_something_smart, commentable_id: rand(1..15) , commentable_type: "Post", commenter_id: rand(1..20))
end

# Create Comments on Answers
10.times do
  Comment.create(body: Faker::Hacker.say_something_smart, commentable_id: rand(1..15) , commentable_type: "Answer", commenter_id: rand(1..20))
end

# Create Votes on Answers
15.times do
  Vote.create(upvote: Faker::Boolean.boolean, votable_id: rand(1..15), votable_type: "Answer", user_id: rand(1..20))
end

# Create Votes on Posts
15.times do
  Vote.create(upvote: Faker::Boolean.boolean, votable_id: rand(1..15), votable_type: "Post", user_id: rand(1..20))
end

# Create Votes on Comments
15.times do
  Vote.create(upvote: Faker::Boolean.boolean, votable_id: rand(1..15), votable_type: "Comment", user_id: rand(1..20))
end
