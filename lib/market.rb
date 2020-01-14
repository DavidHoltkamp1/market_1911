class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item_name)
    vendors_that_sell = []
    @vendors.map do |vendor|
      vendor.check_inventory.find_all do |item|
        if item.name == item_name
          vendors_that_sell << vendor
        end
      end
    end
    vendors_that_sell
  end
end
