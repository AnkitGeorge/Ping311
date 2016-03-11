class AddColumntoReports < ActiveRecord::Migration
  def change
    add_column :reports, :vote_count, :integer
  end
end
