class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :mens
      t.string :womens
      t.string :kids
      t.string :cats

      t.timestamps
    end
  end
end
