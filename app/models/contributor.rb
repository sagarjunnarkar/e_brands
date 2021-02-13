class Contributor < ApplicationRecord
  belongs_to :company
  belongs_to :user

  validates :user, uniqueness: { scope: :company, message: "already a contributor" }
end
