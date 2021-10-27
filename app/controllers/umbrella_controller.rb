class UmbrellaController < ApplicationController
  def geocode_results
    # params looks like
    # Parameters: {"user_input"=>"Harper Center"}

    @street_address = params.fetch("user_input")

    gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@street_address}&key=#{ENV.fetch("GMAPS_TOKEN")}"

    @raw_data = open(gmaps_url).read

    @parsed_data = JSON.parse(@raw_data)

    @results = @parsed_data.fetch("results")

    @first_result = @results.at(0)

    @geo = @first_result.fetch("geometry")

    @loc = @geo.fetch("location")

    @latitude = @loc.fetch("lat")
    @longitude = @loc.fetch("lng")


    render({ :template => "umbrella_templates/geo_results.html.erb" })
  end

  def geocode_form

    render({ :template => "umbrella_templates/geo_form.html.erb" })
  end
end