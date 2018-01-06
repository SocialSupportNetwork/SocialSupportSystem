class Tip < ActiveRecord::Base
    
    belongs_to :topic
    belongs_to :subtopic
    
    validates :title,
    presence: true,
    length: {maximum: 100},
    on: :create,
    allow_nil: false
    
    validates :body,
    presence: true,
    length: {maximum: 500},
    on: :create,
    allow_nil: false
    
    validates :topic_id,
    presence: true,
    on: :create,
    allow_nil: false
    
end
