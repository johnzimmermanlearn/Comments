require "test_helper"

class PostsTest < AcceptanceTest
  def setup
    sign_in users(:poster)
  end

  test "posts index" do
    visit "/posts"

    assert page.has_content?("Interesting Post")
  end

  test "view post" do
    visit "/posts"
    click_on "View"

    refute page.has_content?("Posts")
    assert page.has_content?("Interesting Post")
  end

  test "edit post" do
    visit "/posts"
    click_on "Edit"
    fill_in "Headline", with: "WOW! You won't believe this!"
    click_on "Update Post"

    assert page.has_content?("WOW! You won't believe this!")
  end

  test "delete post" do
    visit "/posts"
    click_on "Delete"

    refute page.has_content?("Interesting Post")
  end
end
