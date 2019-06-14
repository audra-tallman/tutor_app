class Tutor < ApplicationRecord

has_many :subjects
has_many :users, through: :subjects

validates :name, presence: true
validates :email, uniqueness: true
validates :bio, length: { maximum: 250 }
end
