require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", helf_path
    assert_select "a[href=?]", about_path, count:2
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path
  end
  test "layout title" do
    get root_path
    assert_select "title", full_title
    
    get contact_path
    assert_select "title", full_title("Contact")
    
    get helf_path
    assert_select "title", full_title("Help")
    
    get about_path
    assert_select "title", full_title("About")

    get signup_path
    assert_select "title", full_title("Sign up")
    
  end
end
