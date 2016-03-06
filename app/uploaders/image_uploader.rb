# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fit => [200,300]
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :index do
  #   process :mogrify => [{:resolution => "300x400"}]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def content_type_whitelist
  #   /image\//
  # end
  #
  # def filename
  #   "#{model.nicely_formatted_filename}.png"
  # end

  # def extension_white_list
  #   %w(jpg jpeg gif png bmp tif tiff)
  # end
  #
 #  private
 #  def mogrify(options = {})
 #   manipulate! do |img|
 #     img.format("png") do |c|
 #       c.fuzz        "3%"
 #       c.trim
 #       c.rotate      "#{options[:rotate]}" if options.has_key?(:rotate)
 #       c.resize      "#{options[:resolution]}>" if options.has_key?(:resolution)
 #       c.resize      "#{options[:resolution]}<" if options.has_key?(:resolution)
 #       c.push        '+profile'
 #       c.+           "!xmp,*"
 #       c.profile     "#{Rails.root}/lib/color_profiles/sRGB_v4_ICC_preference_displayclass.icc"
 #       c.colorspace  "sRGB"
 #     end
 #     img
 #   end
 # end
 end
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
