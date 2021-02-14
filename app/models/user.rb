class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :invitable

  after_invitation_accepted :set_role
  has_many :contributors
  has_many :companies, through: :contributors

  def set_role
    if self.invited_by.has_role?(:super_admin)
      self.add_role(:admin)
    elsif self.invited_by.has_role?(:admin)
      self.add_role(:contributor)
    end
  end
  
  def generate_jwt
    JWT.encode({ id: id, exp: 60.days.from_now.to_i },
                Rails.application.secrets.secret_key_base)
  end
end
