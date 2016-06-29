class AddLongformToSparks < ActiveRecord::Migration
  def change
    add_column :sparks, :longform, :string
  end
end
