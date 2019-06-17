class Subject < ApplicationRecord

  belongs_to :user
  belongs_to :tutor

# validates :name, presence: true

  def request_tutoring
    "Thanks for requesting tutoring with #{self.tutor.name}! Expect to receive an email from #{self.tutor.email} soon."
  end

end
