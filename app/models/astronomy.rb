class Astronomy
  attr_reader :zip, :data
  def initialize(zip)
    @zip = zip
    @data = get_data
  end

  private def get_data
    HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/astronomy/q/#{@zip}.json")
  end

  def up
    hour = @data["sun_phase"]["sunrise"]["hour"]
    min = @data["sun_phase"]["sunrise"]["minute"]
    "SUNRISE: #{hour}:#{min}"
  end

  def down
    hour = @data["sun_phase"]["sunset"]["hour"]
    min = @data["sun_phase"]["sunset"]["minute"]
    "SUNSET: #{hour}:#{min}"
  end

  def data
    { up: up,
      down: down
    }
  end
end
