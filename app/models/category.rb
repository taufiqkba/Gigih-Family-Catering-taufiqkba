class Category < ApplicationRecord
  #relation
  has_many :categories_menus
	has_many :menus, through: :categories_menus

  #validation
  validates :name, presence: true, uniqueness: true
end
