class Tip < ApplicationRecord
    
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
    
end
