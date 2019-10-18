class USD
  @@currency = 0
  @@datetime = Time.strptime("00:0001.01.1900", "%H:%M%d.%m.%Y")

  @@forced = []

  cattr_accessor :currency

  def self.update(params)
    @@datetime = Time.strptime(params[:time] + params[:date], "%H:%M%d.%m.%Y")
    if params["forced"] == false
      if Time.now > @@datetime
        self.currency = params[:currency]
      end
    else
      self.currency = params[:currency]
      hash = Hash.new
      hash['date'] = params[:date]
      hash['time'] = params[:time]
      hash['currency'] = self.currency
      @@forced << hash
    end
  end

  def self.get_history
    @@forced
  end
end
