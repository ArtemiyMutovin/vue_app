class Staff < ApplicationRecord
  devise :database_authenticatable,
         :trackable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable


end
