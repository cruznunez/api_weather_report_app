class Hurricanes
  attr_reader :zip, :data

  def initialize
    @data = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/currenthurricane/view.json")
  end


  def name(num)
    @data["currenthurricane"][num]["stormInfo"]["stormName_Nice"]
  end

  def category(num)
    @data["currenthurricane"][num]["Current"]["SaffirSimpsonCategory"].to_s
  end

  def wind(num)
    @data["currenthurricane"][num]["Current"]["WindSpeed"]["Mph"].to_s

  end

  def show
    hurricanes = []
    num = 0
    @data["currenthurricane"].each do |alert|
      hurricanes << "#{name(num).upcase} (Category #{category(num)}, #{wind(num)} mph)"
      num += 1
    end
    hurricanes
  end

end
