require "application_system_test_case"

class AuthorsTest < ApplicationSystemTestCase
  setup do
    @author = authors(:one)
  end

  test "visiting the index" do
    visit authors_url
    assert_selector "h1", text: "Authors"
  end

  test "creating a Author" do
    visit authors_url
    click_on "New Author"

    fill_in "Bio info", with: @author.bio_info
    fill_in "First name", with: @author.first_name
    fill_in "Last name", with: @author.last_name
    fill_in "Slug", with: @author.slug
    click_on "Create Author"

    assert_text "Author was successfully created"
    click_on "Back"
  end

  test "updating a Author" do
    visit authors_url
    click_on "Edit", match: :first

    fill_in "Bio info", with: @author.bio_info
    fill_in "First name", with: @author.first_name
    fill_in "Last name", with: @author.last_name
    fill_in "Slug", with: @author.slug
    click_on "Update Author"

    assert_text "Author was successfully updated"
    click_on "Back"
  end

  test "destroying a Author" do
    visit authors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Author was successfully destroyed"
  end
end