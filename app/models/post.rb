class Post < ApplicationRecord
  validates :subject, :content, presence: true

  belongs_to :creator, class_name: :User, foreign_key: :created_by, optional: true
  belongs_to :updater, class_name: :User, foreign_key: :updated_by, optional: true
end
