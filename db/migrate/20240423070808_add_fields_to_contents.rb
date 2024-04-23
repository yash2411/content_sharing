class AddFieldsToContents < ActiveRecord::Migration[7.0]
  def change
    add_column :contents, :caption, :string
    add_column :contents, :description, :string
  end
end
