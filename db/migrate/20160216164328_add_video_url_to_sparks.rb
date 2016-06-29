class AddVideoUrlToSparks < ActiveRecord::Migration
  def change
    add_column :sparks, :video_url, :string
  end
end
