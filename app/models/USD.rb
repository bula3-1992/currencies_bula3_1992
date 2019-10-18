class USD
  @@currency = 0
  @@datetime = Time.strptime("00:0001.01.1900", "%H:%M%d.%m.%Y")

  @@forced = []

  cattr_accessor :currency

  def self.update(params)
    if params[:forced] == true
      @@datetime = Time.strptime(params[:time] + params[:date], "%H:%M%d.%m.%Y")
      self.currency = params[:currency]
      hash = Hash.new
      hash['date'] = params[:date]
      hash['time'] = params[:time]
      hash['currency'] = self.currency
      @@forced << hash
    else
      if Time.strptime(params[:time] + params[:date], "%H:%M%d.%m.%Y") > @@datetime
        self.currency = params[:currency]
      end
    end
  end

  def self.get_history
    @@forced
  end
end
