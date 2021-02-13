class Company < ApplicationRecord
  belongs_to :user
  has_many :contributors
  has_many :users, through: :contributors
end
