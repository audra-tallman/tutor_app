class Tutor < ApplicationRecord

has_many :subjects
has_many :users, through: :subjects

validates :name, presence: true
validates :email, presence: true, uniqueness: true
validates :bio, presence: true, length: { maximum: 250 }
validates :subject, presence: true

  def self.subject(name)
    where(subject: name)
  end

end
