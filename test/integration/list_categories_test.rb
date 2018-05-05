require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "Ruby")
    @category2 = Category.create(name: "Programming")
    @categories = Category.all
  end

  test 'should show categories listing' do
    get categories_path
    assert_template 'categories/index'
    assert_match 'Ruby', response.body
    assert_match 'Programming', response.body
    assert_select "a[href=?]", category_path(@category.id), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end
end