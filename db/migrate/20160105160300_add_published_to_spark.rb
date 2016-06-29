class AddPublishedToSpark < ActiveRecord::Migration
  def change
    add_column :sparks, :published, :boolean
  end
end
