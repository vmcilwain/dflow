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
    assert_template :index
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

  test "can update about" do
    about = create :about

    sign_in

    get "/abouts/#{about.id}/edit"
    assert_response :success

    put "/abouts/#{about.id}",
      params: {
        about: { body: Faker::Lorem.paragraphs(number: 3).join("\s") }
      }

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert flash[:success].present?
    assert_template :index
  end

  test "prompted with error on failed about edit" do
    about = create :about
    sign_in

    put "/abouts/#{about.id}",
      params: {
        about: { body: nil }
      }
    assert_response :ok
    assert_template :edit
    assert flash[:error].present?
  end
end
