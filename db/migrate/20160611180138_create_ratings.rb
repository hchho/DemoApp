class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.float :rating, default: 2.5
      t.timestamps null: false
    end
  end
end
