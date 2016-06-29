class AddUserIdToSpark < ActiveRecord::Migration
  def change
    add_column :sparks, :user_id, :integer
  end
end
