class KoboApiSerializer < ActiveModel::Serializer
  # attributes :lemurs_quantity, :month_and_year, :_geolocation, :lemur_category, :location_admin1, :location_admin2
  attributes :lemurs_quantity, :month_and_year, :lemur_category, :location_admin1, :location_admin2
end
