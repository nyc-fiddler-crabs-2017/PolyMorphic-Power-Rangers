# Create Users
20.times do
  User.create(first_name: Faker::Name.first_name , last_name: Faker::GameOfThrones.dragon, email: Faker::Internet.email, username: Faker::Cat.name, password: "password")
end

# Create Posts
20.times do
  Post.create(title: Faker::ChuckNorris.fact.chop + "?", question: Faker::Lorem.sentence, creator_id: rand(1..20))
end

# Create Answers
200.times do
  Answer.create(best_answer: Faker::Boolean.boolean, body: Faker::Lorem.sentence, post_id: rand(1..20), answerer_id: rand(1..20))
end

# Create Comments on Posts
100.times do
  Comment.create(body: Faker::Hacker.say_something_smart, commentable_id: rand(1..20) , commentable_type: "Post", commenter_id: rand(1..20))
end

# Create Comments on Answers
10.times do
  Comment.create(body: Faker::Hacker.say_something_smart, commentable_id: rand(1..20) , commentable_type: "Answer", commenter_id: rand(1..20))
end

# Create Votes on Answers
50.times do
  Vote.create(upvote: Faker::Boolean.boolean, votable_id: rand(1..20), votable_type: "Answer", user_id: rand(1..20))
end

# Create Votes on Posts
1000.times do
  Vote.create(upvote: Faker::Boolean.boolean, votable_id: rand(1..20), votable_type: "Post", user_id: rand(1..20))
end

500.times do
  Vote.create(upvote: true, votable_id: rand(1..20), votable_type: "Post", user_id: rand(1..20))
end

# Create Votes on Comments
50.times do
  Vote.create(upvote: Faker::Boolean.boolean, votable_id: rand(1..10), votable_type: "Comment", user_id: rand(1..20))
end
