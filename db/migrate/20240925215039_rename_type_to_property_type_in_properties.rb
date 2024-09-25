class RenameTypeToPropertyTypeInProperties < ActiveRecord::Migration[7.2]
  def change
    rename_column :properties, :type, :property_type
  end
end
