class AddAssociationToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer
    add_column :comments, :report_id, :integer
  end
end
