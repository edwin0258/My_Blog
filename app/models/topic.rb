class Topic < ActiveRecord::Base
    has_many :posts,dependent: :destroy
    belongs_to :topic
    has_many :topics,dependent: :destroy
    
    scope :nested, ->{ where(topic_id: NIL)}
end
