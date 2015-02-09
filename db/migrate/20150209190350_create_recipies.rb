class CreateRecipies < ActiveRecord::Migration
  def change
    create_table :recipies do |t|
      t.text :recipe_name
      t.text :ingrediants
      t.text :instructions

      t.timestamps null: false
    end
  end
end
