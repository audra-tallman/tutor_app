class Tutor < ApplicationRecord
  scope :subject, -> (name) { where(name: name) }

has_many :subjects
has_many :users, through: :subjects

validates :name, presence: true
validates :email, uniqueness: true
validates :bio, length: { maximum: 250 }

  def self.subject(name)
    where(subject: name)
  end

end
