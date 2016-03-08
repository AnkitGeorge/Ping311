class Report < ActiveRecord::Base
  has_many :comments
# Mounts the ImageUploader to the Report and the column on report is called image.
mount_uploader :image, ImageUploader
# Association provided by the act_as_votable gem to be applied on the thing you want to vote on.
acts_as_votable
#Point to which column in the db will provide the address to be converted to the GPS coordinates.
geocoded_by :address
after_validation :geocode, if: :address_changed?


end
