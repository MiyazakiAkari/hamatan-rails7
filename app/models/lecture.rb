class Lecture < ApplicationRecord
    belongs_to :user
    has_many :reviews, dependent: :destroy

    
    validates :semester, :day, :time, :course, :title, :faculty, :teacher, :classroom, :year, presence: true
end
