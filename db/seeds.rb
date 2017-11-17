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
    description: 'Determine severity of specific situations by polling our community'
)



Thredded::TopicForm.new(
    title: 'Group Consensus',
    content: <<-MARKDOWN,
This is a test post
    MARKDOWN
    user: admin,
    messageboard: messageboard
).save

