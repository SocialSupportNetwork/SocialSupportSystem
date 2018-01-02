# frozen_string_literal: true
admin = User.create!(
    username: "Admin",
    password: "123456",
    admin: true
)

messageboard = Thredded::Messageboard.create!(
    name: 'General',
    slug: 'general',
    description: 'Determine severity of specific situations by polling our community'
)

Thredded::Messageboard.create!(
    name: 'Local Resources',
    slug: 'local-resources',
    description: 'Post here to find out about resources available in your area from our community.'
)

Thredded::Messageboard.create!(
    name: 'Second Opinions',
    slug: 'second-opinions',
    description: 'Has something felt different? Are you unsure about something that happned? Post here to just get a second (or third!) opinion from our community.'
).save

