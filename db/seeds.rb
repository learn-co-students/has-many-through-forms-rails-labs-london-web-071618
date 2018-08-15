# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


post1 = Post.create(title: "Post number 1", content: "Content for post 1 about stuff.")

bob = User.create(username: "Bob", email: "bob@mail.com")

comments = Comment.create(content:"Some comment about post1", user: bob, post: post1)

random = Category.create(name: "random")

pc = PostCategory.create(post: post1, category: random)
