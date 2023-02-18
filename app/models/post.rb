class Post < ApplicationRecord
    validates :title, presence: true, length: { in: 1..25 }
    validates :body, presence: true, length: { in: 1..250 }

    belongs_to :user
end
