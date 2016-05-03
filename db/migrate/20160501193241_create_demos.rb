class CreateDemos < ActiveRecord::Migration
  def change
    create_table :demos do |t|
      t.text :content
      t.string :materials
      t.timestamps null: false
    end
  end
end
