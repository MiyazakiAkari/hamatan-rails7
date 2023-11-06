class Review < ApplicationRecord
    belongs_to :user
    belongs_to :lecture

    validates :star, presence: true
    validates :title, presence: true
    validates :body, presence: true
end