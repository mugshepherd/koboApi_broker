class KoboApiSerializer < ActiveModel::Serializer
  # attributes :lemurs_quantity, :month_and_year, :_geolocation, :lemur_category, :location_admin1, :location_admin2
  attributes :lemurs_quantity, :year, :month, :lemur_category, :location_admin1, :location_admin2

  def lemurs_quantity
  	if object.lemurs_quantity
  		object.lemurs_quantity
  	else
  		"no_answer"
  	end
  end

  def year
  	if object.sighting_year
  		object.sighting_year
  	elsif object.month_and_year
  		object.month_and_year.strftime('%Y')
  	else
  		"no_response"
  	end
  end

  def month
  	if object.sighting_month
  		object.sighting_month
  	elsif object.month_and_year
  		object.month_and_year.strftime('%B').downcase
  	else
  		"no_response"
  	end
  end

  def lemur_category
  	if object.lemur_category
  		object.lemur_category
  	else
  		"no_response"
  	end
  end

  def location_admin1
  	if object.location_admin1
  		object.location_admin1
  	else
  		"no_response"
  	end
  end

  def location_admin2
  	if object.location_admin2
  		object.location_admin2
  	else
  		"no_response"
  	end
  end

end
