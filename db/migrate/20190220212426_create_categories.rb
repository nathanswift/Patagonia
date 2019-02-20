class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :jacket
      t.string :shirts
      t.string :pants
      t.string :shoes
      t.belongs_to :department, foreign_key: true

      t.timestamps
    end
  end
end
