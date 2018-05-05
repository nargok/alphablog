require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "Ruby")
    @category2 = Category.create(name: "Programming")
  end

  # TODO なぜかテストが通らない。原因を調査する
  test 'should show categories listing' do
    get categories_path
    assert_template 'categories/index'
    assert_select "a[hfer=?]", category_path(@category), text: @category.name
    assert_select "a[hfer=?]", category_path(@category2), text: @category2.name
  end
end