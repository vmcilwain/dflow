class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :validatable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :confirmable, :trackable

  validates :first_name, :last_name, presence: true
  
  has_many :permissions
  has_many :roles, through: :permissions

  def has_role?(name)
    roles.map(&:name).include?(name.to_s)
  end
  
end
