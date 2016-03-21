class Report < ActiveRecord::Base
  has_many :comments
  has_many :commenting_users, through: :comments, :source => :user
  has_many :votes
  has_many :voting_users, through: :votes, :source => :user

  has_many :subscriptions
  has_many :subscribing_users, through: :subscriptions, :source => :user
  # Mounts the ImageUploader to the Report and the column on report is called image.
  mount_uploader :image, ImageUploader
  #Point to which column in the db will provide the address to be converted to the GPS coordinates.
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  # after_validation :geocode, if: :address_changed?
  after_update :send_email, :if => :status_changed?

  def send_email
    subscribing_users.each do |user|
    StatusMailer.status_email(user).deliver_later
    end
  end
end
