class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :trackable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :fullname, presence: true, length: { minimum: 5 }
  validates :phone, presence: true, numericality: { only_integer: true }, uniqueness: { case_sensitive: false }
end
