class CreateRibs < ActiveRecord::Migration
  def change
    create_table :ribs do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
