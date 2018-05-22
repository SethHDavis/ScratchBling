class CreateScratchers < ActiveRecord::Migration[5.1]
  def change
    create_table :scratchers do |t|
      t.string :name
      t.string :description
      t.string :size
      t.float :price

      t.timestamps
    end
  end
end
