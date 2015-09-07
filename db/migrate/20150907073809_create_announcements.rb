class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :title
      t.string :description
      t.string :entity
      t.date :bidding_expired_date
      t.float :budget_source
      t.string :attachment
      t.string :bidding_attachment
      t.references :procurement_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
