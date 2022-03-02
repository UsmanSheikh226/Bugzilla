class User < ApplicationRecord

  has_many :project

  enum role: [:manager, :developer, :qa, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :admin
  end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
