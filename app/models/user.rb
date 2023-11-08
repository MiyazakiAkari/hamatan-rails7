class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lectures
  has_many :reviews

  validates :email, presence: true, format: { with: /\A[\w+\-.]+@shizuoka\.ac\.jp\z/i, message: "は大学のメールアドレスである必要があります" }
end
