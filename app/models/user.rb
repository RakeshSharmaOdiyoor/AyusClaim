class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_roles, :dependent => :destroy
  has_many :roles, :through => :user_roles

  def has_role?(role)
    roles = self.roles.collect(&:name)
    roles.include?(role)
  end 

  def admin?
    self.has_role?('admin') # admin means super admin
  end
end
