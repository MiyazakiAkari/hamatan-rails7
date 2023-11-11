class Like < ApplicationRecord
    belongs_to :user
    belongs_to :lecture
    validates :user_id, presence: true
    validates :lecture_id, presence: true
    validates :user_id, uniqueness: { scope: :lecture_id }
end
