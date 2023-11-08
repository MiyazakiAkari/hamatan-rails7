class Review < ApplicationRecord
    belongs_to :user
    belongs_to :lecture

    validates :star, :title, :body, presence: true
end