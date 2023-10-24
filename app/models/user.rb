class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  has_many :user_organizations, dependent: :destroy
  has_many :organizations, through: :user_organizations

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :fullname, presence: true, length: { minimum: 5 }
  validates :phone, presence: true, numericality: { only_integer: true }, uniqueness: { case_sensitive: false }
end
