50.times do
  user = User.create!(first_name: Faker::DragonBall.character, last_name: Faker::GameOfThrones.dragon, email: username: Faker::Cat.name, password: "password")
end

50.times do
  post = Post.create!(title: Faker::ChuckNorris.fact, question: Faker::Matz.quote)
end

50.times do
  answer = user.post.answer.create!(best_answer: Faker::Boolean.boolean, body: Faker::Matz.quote)
end

5.times do
  comment = answer.comment.create!(body: Faker::RickAndMorty.quote)
end

5.times do



50.times do
  vote = 
end
