module Support
  module PolicyAssertions
    def policy(_user = @user, record = record_class)
      policy = class_name.sub('Test', '').constantize
      policy.new(@user, record)
    end

    def record_class
      class_name.sub('PolicyTest', '').sub('Admin::', '').constantize
    end
  end
end
