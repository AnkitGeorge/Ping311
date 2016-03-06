class Report < ActiveRecord::Base
# Mounts the ImageUploader to the Report and the column on report is called image.
mount_uploader :image, ImageUploader
# Association provided by the act_as_votable gem to be applied on the thing you want to vote on.
acts_as_votable
end
