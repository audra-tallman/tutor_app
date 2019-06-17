class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

has_many :subjects
has_many :tutors, through: :subjects

# # validates :username, uniqueness: true
# validates :first_name, presence: true
# validates :last_name, presence: true

  def self.from_omniauth(auth)
    binding.pry
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      binding.pry
    user.provider = auth.provider
    user.uid = auth.uid
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    end
  end

end
