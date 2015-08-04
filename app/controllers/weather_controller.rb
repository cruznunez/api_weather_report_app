class WeatherController < ApplicationController
  def get
    zip = params[:zip]
    now = ConditionsSummary.new(zip)
    @location = now.instant
    @conditions = now.conditions
    @suntimes = Astronomy.new(zip).data
    @forecasts = TenDayForecast.new(zip).forecasts
    @alerts = Alerts.new(zip).show
    @hurricanes = Hurricanes.new.show
  end
end
