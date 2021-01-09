require "test_helper"

class ContactMeFlowsTest < ActionDispatch::IntegrationTest
  setup { clear_mailbox }
  
  test "as a visitor, I can create a contact me" do
    get "/contact_mes/new"
    assert_response :success

    post "/contact_mes",
      params: {
        contact_me: attributes_for(:contact_me)
      }
    
    assert_response :redirect
    assert_redirected_to root_path
    follow_redirect!
    assert_response :success
    assert flash[:success].present?
    assert_template :index
    assert_equal 1, mailbox.size
  end

  test "as a visitor, I can see errors on why a contact me was not sent" do
    post "/contact_mes",
      params: {
        contact_me: attributes_for(:contact_me, message: nil)
      }
    assert_response :ok
    assert_template :new
    assert flash[:error].present?
  end
end
