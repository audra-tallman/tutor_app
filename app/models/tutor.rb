class Tutor < ApplicationRecord

has_many :subjects
has_many :users, through: :subjects

end
