require 'rails_helper'

RSpec.describe "menus/edit", type: :view do
  before(:each) do
    @menu = assign(:menu, Menu.create!(
      name: "MyString",
      description: "MyString",
      price: 1.5
    ))
  end

  it "renders the edit menu form" do
    render

    assert_select "form[action=?][method=?]", menu_path(@menu), "post" do

      assert_select "input[name=?]", "menu[name]"

      assert_select "input[name=?]", "menu[description]"

      assert_select "input[name=?]", "menu[price]"
    end
  end
end
