class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_roles, :dependent => :destroy
  has_many :roles, :through => :user_roles
  has_one :profile
  accepts_nested_attributes_for :profile, :allow_destroy => :true
  
  def has_role?(role)
    roles = self.roles.collect(&:name)
    roles.include?(role)
  end 

  def admin_user?
    user_type == "admin"
  end

  def admin?
    self.has_role?('admin') # admin means super admin
  end
end
