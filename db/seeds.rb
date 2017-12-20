# frozen_string_literal: true
admin = User.create!(
    username: "Admin",
    password: "123456",
    admin: true
)

User.create!(
    username: "MarkZuckerberg",
    password: "facebook",
    admin: false
)

User.create!(
    username: "ElonMusk",
    password: "spacex",
    admin: false
)

User.create!(
    username: "MarissaMayer",
    password: "yahoosearch",
    admin: true
)

User.create!(
    username: "MegWhitman",
    password: "hpcomputers",
    admin: false
)

User.create!(
    username: "SteveJobs",
    password: "appleiscool",
    admin: false
)

User.create!(
    username: "SusanWojcicki",
    password: "youtube",
    admin: false
)

messageboard = Thredded::Messageboard.create!(
    name: 'General',
    slug: 'general',
    description: 'Determine severity of specific situations by polling our community'
)

Thredded::Messageboard.create!(
    name: 'Emergency Situations',
    slug: 'emergency-situations',
    description: 'Post here if you have an emergency situation and need immediate help.'
)

Thredded::Messageboard.create!(
    name: 'Seeking Outside Resources',
    slug: 'seeking-outside-resources',
    description: 'Post here if you would like advice on finding outside resources such as therapy or shelters.'
).save

