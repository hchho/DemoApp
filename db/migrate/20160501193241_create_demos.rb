class CreateDemos < ActiveRecord::Migration
  def change
    create_table :demos do |t|
      t.belongs_to :user, index: true
      t.text :content
      t.string :materials
      t.timestamps null: false
    end
  end
end
