class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :report

  validates :body_text, presence: true
end
