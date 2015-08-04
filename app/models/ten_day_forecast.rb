class TenDayForecast
  attr_reader :zip, :data

  def initialize(zip)
    @zip = zip
    @data = get_data
  end

  private def get_data
    HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/forecast10day/q/#{@zip}.json")
  end

  def title(period)
    @data["forecast"]["txt_forecast"]["forecastday"][period]["title"]
  end

  def forecast(period)
    @data["forecast"]["txt_forecast"]["forecastday"][period]["fcttext"]
  end

  def forecasts
    forecasts = []
    # Forecasts for 10 days, daytime only
    0.step(by: 2, to: 18) do |period|
      forecasts << "#{title(period).upcase}: #{forecast(period)}"
    end

    # # Forecast for 10 including nighttime periods
    # (0..19).each do |period|
    #   forecasts << "#{title(period).upcase}: #{forecasts(period)}"
    # end

    forecasts
  end

end
