class Organization < ApplicationRecord
  validates :name, presence: true
  validates :org_type, presence: true
  validates :inn, presence: true
  validates :ogrn, presence: true

  has_many :user_organizations, dependent: :destroy
  has_many :users, through: :user_organizations
end
