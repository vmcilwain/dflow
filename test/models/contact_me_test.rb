require 'test_helper'

class ContactMeTest < ActiveSupport::TestCase
  context 'db columns' do
    should have_db_column(:name).of_type(:string)
                                .with_options(null: false, default: '')
    should have_db_column(:email).of_type(:string)
                                 .with_options(null: false, default: '')
    should have_db_column(:message).of_type(:text)
  end

  context 'validations' do
    should validate_presence_of :name
    should validate_presence_of :message
  end
end
