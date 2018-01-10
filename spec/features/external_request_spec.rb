# spec/features/external_request_spec.rb
require 'spec_helper'
require 'httparty'
# require 'Weather'

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, /api.openweathermap.org/).
      with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: "stubbed response", headers: {})
  end
end

feature 'External request' do

  it 'queries OpenWeatherMap for London temperature' do
    uri = URI('http://api.openweathermap.org/data/2.5/weather?q=London&APPID=77be077adaf520bc9a83d9f5cd33c5fe&units=imperial')
    @response = Net::HTTP.get(uri)
    expect(@response).to be_an_instance_of(String)
  end

  # it "should get return proper temperature" do
  #   openweather = Weather.new
  #   weather = openweather.call_openweather "London"
  #   weather['main']['temp'].should == 67.17
  # end
  #
  # it "should not be able to invalid find city" do
  #   openweather = Weather.new
  #   weather = openweather.call_openweather "Des Iowa"
  #   weather['message'].should == "Error: Not found city"
  #   weather['cod'].should == "404"
  # end

end
