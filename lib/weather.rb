require 'httparty'
require 'json'

class Weather
  location = ''

  def ask_location
    puts "Where are you?"
    # store user's answer into 'location'
    location = gets
    # call 'return_temp' with the user's location
    call_openweather(location)
  end

  def call_openweather(location)
    # store response given from openweathermap using api key. Converts returned temperature to imperial degrees
    response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?q="+location+"&APPID=77be077adaf520bc9a83d9f5cd33c5fe&units=imperial")
    json = JSON.parse(response.body)
    # return the temperature in a formatted string. Finds accurate weather information and only returns the temperature
    puts "The temperature in " + location + " is " + (json['main']['temp']).to_s + "\xC2\xB0" + "F"
  end
end

Weather.new.ask_location
