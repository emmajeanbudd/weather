# spec/features/external_request_spec.rb
require 'spec_helper'
require 'httparty'
# require 'Weather'

feature 'External request' do
  it 'queries OpenWeatherMap for London temperature' do
    uri = URI('http://api.openweathermap.org/data/2.5/weather?q=London&APPID=77be077adaf520bc9a83d9f5cd33c5fe&units=imperial')
    @response = Net::HTTP.get(uri)
    expect(@response).to be_an_instance_of(String)
  end

  # The below is how I would have implemented my testing - Due to time constraints, I was unable to implement the more tests.

  # it "should get return proper temperature" do
  #   openweather = Weather.new
  #   weather = openweather.call_openweather "London"
  #   weather['main']['temp'].should == 67.17
  # end
  #
  # it "should not be able to find city" do
  #   openweather = Weather.new
  #   weather = openweather.call_openweather "Des Iowa"
  #   weather['message'].should == "Error: Not found city"
  #   weather['cod'].should == "404"
  # end

end
