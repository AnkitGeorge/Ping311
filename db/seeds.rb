# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Report.create!(
  :address  => "220 King Street West, Toronto",
  :description => "Right beside Bitmaker Labs.",
  :status    => 1
)

Report.create!(
  :address  => "240 King Street West, Toronto",
  :description => "King Street is a mess today",
  :status    => 1
)

Report.create!(
  :address  => "280 Queen Street West, Toronto",
  :description => "Near the Hosu Asian fusion restaurant",
  :status    => 2
)
