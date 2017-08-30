require 'minitest/autorun'
require './test/test_helper'
require 'json'

class TestWeather < Minitest::Test

  # def setup
  #   json = JSON.parse(fixture('weather.json').read)
  #   @weather = Weather.new(json)
  # end

  def test_accurate_city
    configure_weather
    stub_request(:get, "http://api.openweathermap.org/data/2.5/weather?q=London&APPID=77be077adaf520bc9a83d9f5cd33c5fe")
    response = Openweather2.get_weather(city:'london')
  end

  def test_get_weather_from_json
    # assert_equal "Mike", user['name']

    assert_equal @weather.city, "London"
    assert_equal @weather.temperature, 280.32
  end

end
