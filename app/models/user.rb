class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :trackable

  validates :email, uniqueness: { case_sensitive: false }

  def staff?
    type == 'Staff'
  end
end
