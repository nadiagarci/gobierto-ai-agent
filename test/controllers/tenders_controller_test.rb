require "test_helper"

class TendersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tender = tenders(:one)
  end

  test "should get index" do
    get tenders_url
    assert_response :success
  end

  test "should get new" do
    get new_tender_url
    assert_response :success
  end

  test "should create tender" do
    assert_difference("Tender.count") do
      post tenders_url, params: { tender: { description: @tender.description, title: @tender.title } }
    end

    assert_redirected_to tender_url(Tender.last)
  end

  test "should show tender" do
    get tender_url(@tender)
    assert_response :success
  end

  test "should get edit" do
    get edit_tender_url(@tender)
    assert_response :success
  end

  test "should update tender" do
    patch tender_url(@tender), params: { tender: { description: @tender.description, title: @tender.title } }
    assert_redirected_to tender_url(@tender)
  end

  test "should destroy tender" do
    assert_difference("Tender.count", -1) do
      delete tender_url(@tender)
    end

    assert_redirected_to tenders_url
  end
end
