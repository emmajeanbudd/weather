require 'httparty'
require 'json'
# my github comment

class Weather
  location = ''

  def ask_location
    puts "Where are you?"
    location = gets
    call_openweather(location)
  end

  def call_openweather(location)
    response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?q="+location+"&APPID=77be077adaf520bc9a83d9f5cd33c5fe&units=imperial")
    json = JSON.parse(response.body)
    puts "The temperature in " + location + " is " + (json['main']['temp']).to_s + "\xC2\xB0" + "F"
  end
end

Weather.new.ask_location
