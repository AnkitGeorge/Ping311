class AddColumntoReportsModel < ActiveRecord::Migration
  def change
    add_column :reports, :subscription_count, :integer
  end
end
