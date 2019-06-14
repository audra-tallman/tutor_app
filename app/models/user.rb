class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :subjects
has_many :tutors, through: :subjects

validates :username, uniqueness: true
validates :student_name, presence: true
validates :student_grade, presence: true

end
