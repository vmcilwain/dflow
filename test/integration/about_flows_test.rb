require "test_helper"

class AboutFlowsTest < ActionDispatch::IntegrationTest
  test "can view about" do
    get "/abouts"
    assert_response :success
  end

  test "can create about" do
    sign_in

    get "/abouts/new"
    assert_response :success

    post "/abouts",
      params: {
        about: { body: Faker::Lorem.paragraphs(number: 3).join("\s") }
      }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert flash[:success].present?
  end

  test "prompted with error on failed about creation" do
    sign_in

    post "/abouts",
      params: {
        about: { body: nil }
      }
    assert_response :ok
    assert_template :new
    assert flash[:error].present?
  end
end
