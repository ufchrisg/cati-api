require 'test_helper'

class WhiteCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @white_card = white_cards(:one)
  end

  test "should get index" do
    get white_cards_url, as: :json
    assert_response :success
  end

  test "should create white_card" do
    assert_difference('WhiteCard.count') do
      post white_cards_url, params: { white_card: { answer: @white_card.answer } }, as: :json
    end

    assert_response 201
  end

  test "should show white_card" do
    get white_card_url(@white_card), as: :json
    assert_response :success
  end

  test "should update white_card" do
    patch white_card_url(@white_card), params: { white_card: { answer: @white_card.answer } }, as: :json
    assert_response 200
  end

  test "should destroy white_card" do
    assert_difference('WhiteCard.count', -1) do
      delete white_card_url(@white_card), as: :json
    end

    assert_response 204
  end
end
