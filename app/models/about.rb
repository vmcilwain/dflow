class About < ApplicationRecord
  validates :body, presence: true

  has_rich_text :body
end
