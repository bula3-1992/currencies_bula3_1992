class USD
  @@currency

  def initialize
    @@currency ||= 0
  end

  def self.update(currency)
    @@currency = currency
  end

  def get
    return @@currency
  end
end