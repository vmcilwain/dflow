require 'test_helper'

class AboutPolicyTest < PolicyAssertions::Test
  setup do
    @about = create :about
    @role = create :admin_role
    @user = create :user
    @policy = About
  end

  test 'new?' do
    refute_permit nil, @policy, 'new?'
    refute_permit @user, @policy, 'new?'
    
    add_user_to_role @user, @role
    @user.reload

    assert_permit @user, @policy, 'new?'
  end

  test 'create?' do
    refute_permit nil, @policy, 'create?'
    refute_permit @user, @policy, 'create?'
    
    add_user_to_role @user, @role
    @user.reload

    assert_permit @user, @policy, 'create?'
  end

  test 'edit?' do
    refute_permit nil, @policy, 'edit?'
    refute_permit @user, @policy, 'edit?'
    
    add_user_to_role @user, @role
    @user.reload

    assert_permit @user, @policy, 'edit?'
  end

  test 'update?' do
    refute_permit nil, @policy, 'update?'
    refute_permit @user, @policy, 'update?'
    
    add_user_to_role @user, @role
    @user.reload

    assert_permit @user, @policy, 'update?'
  end
end
