class RenameCategoryColumnToCategories < ActiveRecord::Migration[5.2]
  def change
    rename_column :categories, :category, :type
  end
end
