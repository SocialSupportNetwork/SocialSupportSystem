# frozen_string_literal: true
admin = User.create!(
    display_name: 'Admin',
    username: "Admin",
    password: "123456",
    admin: true
)

messageboard = Thredded::Messageboard.create!(
    name: 'General',
    slug: 'general',
    description: 'A board is not a board without some posts'
)

Thredded::TopicForm.new(
    title: 'My first topic',
    content: <<-MARKDOWN,
This is a test post
    MARKDOWN
    user: admin,
    messageboard: messageboard
).save
