class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.string :type
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
