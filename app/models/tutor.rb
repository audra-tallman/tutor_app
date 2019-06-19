class Tutor < ApplicationRecord

has_many :subjects
has_many :users, -> { distinct }, through: :subjects

scope :male, -> { where(gender: "male") }
scope :female, -> { where(gender: "female") }

validates :name, presence: true
validates :email, presence: true, uniqueness: true
validates :bio, presence: true, length: { maximum: 250 }
validates :subject, presence: true
validates :gender, inclusion: { in: %w(male female), :message => "must enter male or female" }

  def self.subject(name)
    where(subject: name)
  end

  def self.send_chain(methods)
    methods.inject(self, :send)
  end

end
