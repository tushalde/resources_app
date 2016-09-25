class CreateViewCounts < ActiveRecord::Migration[5.0]
  def change
    create_table :view_counts do |t|
      t.string :view, unique: true
      t.integer :count
      t.timestamps
    end
    add_index(:view_counts, :view)
  end
end
