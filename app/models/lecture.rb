class Lecture < ApplicationRecord
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :likes
    
    validates :semester, :day, :time, :course, :title, :faculty, :teacher, :classroom, :year, presence: true

    def liked_by(user)
        Like.find_by(user_id: user.id, lecture_id: id)
    end
end
