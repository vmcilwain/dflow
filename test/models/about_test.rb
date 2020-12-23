require "test_helper"

class AboutTest < ActiveSupport::TestCase
  context "db columns" do
    should have_db_column(:title).of_type(:string)
  end

  context "validations" do
    should validate_presence_of :body
  end
end
