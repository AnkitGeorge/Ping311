class Report < ActiveRecord::Base
mount_uploader :image, ImageUploader
end
