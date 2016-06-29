class AddPublishedToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :published, :boolean
  end
end
