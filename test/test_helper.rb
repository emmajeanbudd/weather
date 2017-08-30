require "minitest/autorun"

  def configure_weather
    Weather.configure do |config|
      config.endpoint = 'http://api.openweathermap.org/data/2.5/weather'
      config.apikey = '77be077adaf520bc9a83d9f5cd33c5fe'
    end
  end

  def fixture_path
    File.expand_path('../test_data', __FILE__)
  end

  def fixture(file)
    File.new(File.join(fixture_path, file))
  end
