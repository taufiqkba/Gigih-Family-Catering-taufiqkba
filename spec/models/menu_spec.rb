require 'rails_helper'

RSpec.describe Menu, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:menu)).to be_valid
  end

  it 'is valid with a name and description' do
    menu = FactoryBot.build(
      :menu,
    )
    expect(menu).to be_valid
  end

  it 'is invalid with duplicate name' do
    menu = FactoryBot.create(
      :menu, 
      name: "Nasi Goreng"
    )
    menu2 = FactoryBot.build(
      :menu,
      name: "Nasi Goreng"
    )
    menu2.valid?
    expect(menu2.errors[:name]).to include('has already been taken')
  end

  it 'is invalid with non numerical type price' do
    menu = FactoryBot.build(
      :menu,
      price: "Lima Ribu"
    )
    menu.valid?
    expect(menu.errors[:price]).to include('is not a number')
  end

  it 'is invalid with a price less than 0.01' do

    menu = FactoryBot.build(
      :menu,
      price: 0.008
    )
    menu.valid?
    expect(menu.errors[:price]).to include('must be greater than or equal to 0.01')
  end

  it 'is invalid with description more than 150 character' do

    menu = FactoryBot.build(
      :menu,
      description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis pff"
    )
    menu.valid?
    expect(menu.errors[:description]).to include('150 characters is the maximum allowed')
  end
end
