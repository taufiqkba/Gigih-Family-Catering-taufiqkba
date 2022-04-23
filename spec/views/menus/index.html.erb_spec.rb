require 'rails_helper'

RSpec.describe "menus/index", type: :view do
  before(:each) do
    assign(:menus, [
      Menu.create!(
        name: "Name",
        description: "Description",
        price: 2.5
      ),
      Menu.create!(
        name: "Name",
        description: "Description",
        price: 2.5
      )
    ])
  end

  it "renders a list of menus" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
  end
end
