require 'test_helper'

class ChampionControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get champion_show_url
    assert_response :success
  end

end
