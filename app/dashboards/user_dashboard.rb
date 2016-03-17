require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    comments: Field::HasMany,
    votes: Field::HasMany,
    voted_reports: Field::HasMany.with_options(class_name: "Report"),
    subscriptions: Field::HasMany,
    subscribed_reports: Field::HasMany.with_options(class_name: "Report"),
    id: Field::Number,
    email: Field::String,
    crypted_password: Field::String,
    salt: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    username: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :username,
    :comments,
    :votes,
    :subscriptions,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :email,
    :created_at,
    :updated_at,
    :username,
    :comments,
    :votes,
    :subscriptions,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :username,
    :email,
    :comments,
    :votes,
    :subscriptions,
  ]

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user)
    "#{user.username}"
  end
end
