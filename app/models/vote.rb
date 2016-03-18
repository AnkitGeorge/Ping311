class Vote < ActiveRecord::Base
  belongs_to :report
  belongs_to :user

  validates :user_id, :uniqueness => { :scope => :report_id }
  # one vote per user per report

  def vote_counter(report)
  report.vote_count = report.votes.count
  end

end
