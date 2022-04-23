class CategoriesMenu < ApplicationRecord
  #relation
  belongs_to :category
	belongs_to :menu
end
