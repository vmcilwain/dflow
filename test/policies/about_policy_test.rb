require 'test_helper'

class AboutPolicyTest < ActiveSupport::TestCase
  setup do
    @about = create :about
    @role = create :admin_role
    @user = create :user
  end

  test 'new?' do
    assert_not policy(nil).new?

    assert_not policy(@user).new?

    add_user_to_role @user, @role

    @user.reload

    assert policy(@user).new?
  end

  test 'create?' do
    assert_not policy(nil).create?

    assert_not policy(@user).create?

    add_user_to_role @user, @role

    @user.reload

    assert policy(@user).create?
  end

  test 'edit?' do
    assert_not policy(nil).edit?

    assert_not policy(@user).edit?

    add_user_to_role @user, @role

    @user.reload

    assert policy(@user).edit?
  end

  test 'update?' do
    assert_not policy(nil).update?

    assert_not policy(@user).update?

    add_user_to_role @user, @role

    @user.reload

    assert policy(@user).update?
  end
end
