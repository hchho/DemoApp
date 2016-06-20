class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.float :rating, default: 2.5
      t.belongs_to :reviewed, polymorphic: true, index: true
      t.belongs_to :reviewer, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
