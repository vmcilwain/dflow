module Support
  module PolicyAssertions
    def policy(user=@user, record=record_class)
      policy = self.class_name.sub("Test", "").constantize
      policy.new(@user, record)
    end
  
    def record_class
      self.class_name.sub("PolicyTest", "").sub("Admin::", "").constantize
    end
  end
end