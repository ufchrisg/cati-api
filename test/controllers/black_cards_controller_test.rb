require 'test_helper'

class BlackCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @black_card = black_cards(:one)
  end

  test "should get index" do
    get black_cards_url, as: :json
    assert_response :success
  end

  test "should create black_card" do
    assert_difference('BlackCard.count') do
      post black_cards_url, params: { black_card: { phrase: @black_card.phrase } }, as: :json
    end

    assert_response 201
  end

  test "should show black_card" do
    get black_card_url(@black_card), as: :json
    assert_response :success
  end

  test "should update black_card" do
    patch black_card_url(@black_card), params: { black_card: { phrase: @black_card.phrase } }, as: :json
    assert_response 200
  end

  test "should destroy black_card" do
    assert_difference('BlackCard.count', -1) do
      delete black_card_url(@black_card), as: :json
    end

    assert_response 204
  end
end
