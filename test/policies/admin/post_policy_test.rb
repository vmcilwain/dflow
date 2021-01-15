require 'test_helper'

class Admin::PostPolicyTest < PolicyAssertions::Test
  setup do
    @post = create :post
    @role = create :admin_role
    @user = create :user
    @policy = [:admin, Post]
  end

  test 'index?' do
    refute_permit nil, @policy, "index?"
    refute_permit @user, @policy, "index?"
    
    add_user_to_role @user, @role
    @user.reload

    assert_permit @user, @policy, "index?"
  end

  test 'new?' do
    refute_permit nil, @policy, "new?"
    refute_permit @user, @policy, "new?"
    
    add_user_to_role @user, @role
    @user.reload

    assert_permit @user, @policy, "new?"
  end

  test 'create?' do
    refute_permit nil, @policy, "create?"
    refute_permit @user, @policy, "create?"
    
    add_user_to_role @user, @role
    @user.reload

    assert_permit @user, @policy, "create?"
  end

  test 'edit?' do
    refute_permit nil, @policy, "edit?"
    refute_permit @user, @policy, "edit?"
    
    add_user_to_role @user, @role
    @user.reload

    assert_permit @user, @policy, "edit?"
  end

  test 'update?' do
    refute_permit nil, @policy, "update?"
    refute_permit @user, @policy, "update?"
    
    add_user_to_role @user, @role
    @user.reload

    assert_permit @user, @policy, "update?"
  end

  test 'destroy?' do
    refute_permit nil, @policy, "destroy?"
    refute_permit @user, @policy, "destroy?"
    
    add_user_to_role @user, @role
    @user.reload

    assert_permit @user, @policy, "destroy?"
  end
end
