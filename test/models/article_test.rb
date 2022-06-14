require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "should not save an article without the title" do
    article = Article.new
    assert_not article.save, "Saved the article without a title"
  end

  test "should not save an article without the tenant_id" do
    article = Article.new
    assert_not article.save, "Saved the article without a tenant"
  end
end
