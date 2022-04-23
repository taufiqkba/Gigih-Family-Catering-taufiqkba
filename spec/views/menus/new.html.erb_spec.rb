require 'rails_helper'

RSpec.describe "menus/new", type: :view do
  before(:each) do
    assign(:menu, Menu.new(
      name: "MyString",
      description: "MyString",
      price: 1.5
    ))
  end

  it "renders new menu form" do
    render

    assert_select "form[action=?][method=?]", menus_path, "post" do

      assert_select "input[name=?]", "menu[name]"

      assert_select "input[name=?]", "menu[description]"

      assert_select "input[name=?]", "menu[price]"
    end
  end
end
