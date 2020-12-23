class Role < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: true} 

  has_many :permissions
  has_many :users, through: :permissions

  def has_user?(user)
    users.include? user
  end
  
end
