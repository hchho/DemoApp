class CreateDemos < ActiveRecord::Migration
  def change
    create_table :demos do |t|
      t.references :user, index: true
      t.references :subject, index: true
      t.string :name
      t.text :content
      t.string :materials
      t.float :rating_average, default: 2.5
      t.timestamps null: false
    end
    add_index :demos, [:user_id, :subject_id, :created_at]
  end
end
