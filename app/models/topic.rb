class Topic < ActiveRecord::Base
    has_many :posts
    belongs_to :topic
    has_many :topics
    
    scope :nested, ->{ where(topic_id: NIL)}
end
