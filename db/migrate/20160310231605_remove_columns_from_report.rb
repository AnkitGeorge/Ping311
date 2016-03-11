class RemoveColumnsFromReport < ActiveRecord::Migration
  def self.up
      remove_column :reports, :cached_votes_total, :integer, :default => 0
      remove_column :reports, :cached_votes_score, :integer, :default => 0
      remove_column :reports, :cached_votes_up, :integer, :default => 0
      remove_column :reports, :cached_weighted_score, :integer, :default => 0
      remove_column :reports, :cached_weighted_total, :integer, :default => 0
      remove_column :reports, :cached_weighted_average, :float, :default => 0.0
    end
end
