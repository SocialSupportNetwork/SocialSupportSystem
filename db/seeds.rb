# frozen_string_literal: true
require 'csv'

puts "Importing tip topics..."
CSV.foreach(Rails.root.join("topic.csv"), headers: true) do |row|
  Topic.create! do |topic|
    topic.name = row[0]
    topic.id = row[1]
    end
end

puts "Importing tip subtopics..."
CSV.foreach(Rails.root.join("subtopic.csv"), headers: true) do |row|
  Subtopic.create! do |subtopic|
    subtopic.topic_id = row[0]
    subtopic.name = row[1]
  end
end

halo = User.create!(
    username: "Halo",
    password: "123456",
    admin: true,
    minimum_age: true,
    terms_of_service: true,
    screening: "bark!"
)

admin = User.create!(
    username: "Admin",
    password: "123456",
    admin: true,
    minimum_age: true,
    terms_of_service: true,
    screening: "Administrator Account"
)

general = Thredded::Messageboard.create!(
    name: 'General',
    slug: 'general',
    description: 'Determine the severity of specific situations by polling our community.'
)

local_resources = Thredded::Messageboard.create!(
    name: 'Local Resources',
    slug: 'local-resources',
    description: 'Post here to find out about resources available in your area from our community.'
)

second_opinions = Thredded::Messageboard.create!(
    name: 'Second Opinions',
    slug: 'second-opinions',
    description: 'Has something felt different? Are you unsure about something that happened? Post here to just get a second (or third!) opinion from our community.'
)

interesting_articles = Thredded::Messageboard.create!(
    name: 'Interesting Articles',
    slug: 'interesting-articles',
    description: "Have you come across any interesting articles that you'd like to share with the community? Post them here!"
)

Thredded::TopicForm.new(
    title: 'Check out our forum rules before you post',
    content: <<-MARKDOWN,
We take moderation very seriously so make sure you're familiar with the rules before you post to make sure your posts don't get removed!
[Our Rules](Extinguish.io/rules)
    MARKDOWN
    user: admin,
    messageboard: general,
    locked: true,
    sticky: true
).save

Thredded::TopicForm.new(
    title: 'Check out our forum rules before you post',
    content: <<-MARKDOWN,
We take moderation very seriously so make sure you're familiar with the rules before you post to make sure your posts don't get removed!
[Our Rules](Extinguish.io/rules)
    MARKDOWN
    user: admin,
    messageboard: local_resources,
    locked: true,
    sticky: true
).save

Thredded::TopicForm.new(
    title: 'Check out our forum rules before you post',
    content: <<-MARKDOWN,
We take moderation very seriously so make sure you're familiar with the rules before you post to make sure your posts don't get removed!
[Our Rules](Extinguish.io/rules)
    MARKDOWN
    user: admin,
    messageboard: second_opinions,
    locked: true,
    sticky: true
).save

Thredded::TopicForm.new(
    title: 'Check out our forum rules before you post',
    content: <<-MARKDOWN,
We take moderation very seriously so make sure you're familiar with the rules before you post to make sure your posts don't get removed!
[Our Rules](Extinguish.io/rules)
    MARKDOWN
    user: admin,
    messageboard: interesting_articles,
    locked: true,
    sticky: true
).save

Thredded::TopicForm.new(
    title: 'The general forums',
    content: <<-MARKDOWN,
Welcome to the Extinguish forums! If you have something to say but don't think the other borads are a good fit post it here. 
    MARKDOWN
    user: admin,
    messageboard: general
).save

Thredded::TopicForm.new(
    title: 'Local resources can also be found on the tips page',
    content: <<-MARKDOWN,
Local resources that have been recommended by our community can also be found on "Rick's Tip's"!
    MARKDOWN
    user: admin,
    messageboard: local_resources
).save