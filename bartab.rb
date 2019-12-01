class BarTab

  attr_reader :entry_fee, :till

  def initialize(entry_fee, till = 0)
    @entry_fee = entry_fee
    @till = till
  end

  def add_to_till
    @till += @entry_fee
  end

end
