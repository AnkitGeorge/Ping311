class Vote < ActiveRecord::Base
  belongs_to :report
  belongs_to :user

  validates :user_id, :uniqueness => { :scope => :report_id }
  # one vote per user

end
