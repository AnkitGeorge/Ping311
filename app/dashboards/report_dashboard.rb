require "administrate/base_dashboard"

class ReportDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    comments: Field::HasMany,
    commenting_users: Field::HasMany.with_options(class_name: "User"),
    votes: Field::HasMany,
    voting_users: Field::HasMany.with_options(class_name: "User"),
    id: Field::Number,
    address: Field::String,
    description: Field::Text,
    status: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    image: Field::Image,
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :address,
    :description,
    :comments,
    :votes,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :image,
    :id,
    :address,
    :description,
    :status,
    :latitude,
    :longitude,
    :created_at,
    :updated_at,
    :comments,
    :votes,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :comments,
    :votes,
    :address,
    :description,
    :status,
    :image,
    :latitude,
    :longitude,
  ]

  # Overwrite this method to customize how reports are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(report)
    "#{report.address}"
  end
end
