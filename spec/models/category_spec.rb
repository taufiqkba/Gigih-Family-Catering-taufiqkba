require 'rails_helper'

RSpec.describe Category, type: :model do
  
  it "has a valid factory" do
    expect(FactoryBot.build(:category)).to be_valid
  end

  it 'is valid with a name' do
    category = FactoryBot.build(
      :category,
    )
    expect(category).to be_valid
  end

  it 'is invalid without a name' do
    category = FactoryBot.build(
      :category, 
      name: nil
    )
    category.valid?
    expect(category.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a duplicate name' do
    FactoryBot.create(:category, name: 'Seafood')
    category = FactoryBot.build(:category, name: 'Seafood')
    category.valid?
    expect(category.errors[:name]).to include('has already been taken')
  end
end
