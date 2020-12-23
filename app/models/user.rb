class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :validatable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :confirmable, :trackable

  validates :first_name, :last_name, presence: true
  
end
