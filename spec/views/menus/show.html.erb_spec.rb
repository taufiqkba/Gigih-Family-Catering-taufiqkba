require 'rails_helper'

RSpec.describe "menus/show", type: :view do
  before(:each) do
    @menu = assign(:menu, Menu.create!(
      name: "Name",
      description: "Description",
      price: 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2.5/)
  end
end
