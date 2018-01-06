class Topic < ApplicationRecord
    has_many :subtopics
    has_many :tips
end
