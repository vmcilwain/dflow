module Support
  module SystemHelpers
    def new_session(user=create(:user))
      visit new_user_session_path

      fill_in :user_email, with: user.email
      fill_in :user_password, with: 'somepassword'

      click_on 'Log in'
    end

    def delete_session(user)
      click_on user.first_name
      click_on 'Logout'
    end

    def assert_success_alert
      assert find('.alert.alert-success').text.present?
    end

    def assert_error_alert
      assert find('.alert.alert-danger').text.present?
    end
    
    def assert_info_alert
       assert find('.alert.alert-info').text.present?
    end

    def click_ok
      page.accept_alert
    end
    
    # def assert_unauthorized_user
    #   assert_current_path root_path
    #   assert_info_alert
    # end

    # def click_submit(action=:create, object=nil)
    #   click_button "#{action.to_s.humanize} #{object.class_name}"
    # end
    
  end
end