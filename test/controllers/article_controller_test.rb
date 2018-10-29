require 'test_helper'

class ArticleControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get article_top_url
    assert_response :success
  end

end
