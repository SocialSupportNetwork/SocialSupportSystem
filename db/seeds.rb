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

queue = User.create!(
    username: "Queue",
    password: "123456",
    admin: true,
    minimum_age: true,
    terms_of_service: true,
    screening: "Yip!")

halo = User.create!(
    username: "Halo",
    password: "123456",
    admin: false,
    minimum_age: true,
    terms_of_service: true,
    screening: "bark!"
)

chai = User.create!(
    username: "Chai",
    password: "123456",
    admin: true,
    minimum_age: true,
    terms_of_service: true,
    screening: "woof!"
    )

admin = User.create!(
    username: "Admin",
    password: "123456",
    admin: true,
    minimum_age: true,
    terms_of_service: true,
    screening: "Administrator Account"
)

messageboard = Thredded::Messageboard.create!(
    name: 'General',
    slug: 'general',
    description: 'Determine the severity of specific situations by polling our community.'
)

Thredded::Messageboard.create!(
    name: 'Local Resources',
    slug: 'local-resources',
    description: 'Post here to find out about resources available in your area from our community.'
)

Thredded::Messageboard.create!(
    name: 'Second Opinions',
    slug: 'second-opinions',
    description: 'Has something felt different? Are you unsure about something that happened? Post here to just get a second (or third!) opinion from our community.'
)

Thredded::Messageboard.create!(
    name: 'Interesting Articles',
    slug: 'interesting-articles',
    description: "Have you come across any interesting articles that you'd like to share with the community? Post them here!"
).save