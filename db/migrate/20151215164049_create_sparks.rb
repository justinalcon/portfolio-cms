class CreateSparks < ActiveRecord::Migration
  def change
    create_table :sparks do |t|
      t.string :title
      t.text :summary
      t.text :dev_notes
      t.string :direct_link
      t.text :canned_video
      t.timestamps
    end
  end
end
