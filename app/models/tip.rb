class Tip < ActiveRecord::Base
    
    belongs_to :topic
    belongs_to :subtopic
    
    validates :title,
    presence: true,
    length: {maximum: 50},
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
   
    validates :subtopic_id,
    presence: true,
    on: :create,
    allow_nil: false 
   
    def self.search(term)
        if term
            where('title LIKE ?', "%#{term}%").or(where('body LIKE ?', "%#{term}%")) #.order('id DESC')
        else
            all
        end
    end
   
end
