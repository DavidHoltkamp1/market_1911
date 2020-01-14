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
      vendor.check_inventory.each do |item|
        if item.name == item_name
          vendors_that_sell << vendor
        end
      end
    end
    vendors_that_sell
  end

  def sorted_item_list
    all_items = @vendors.flat_map do |vendor|
      vendor.check_inventory
    end
    names = all_items.map do |item|
      item.name
    end
    names.uniq.sort
  end

  def total_inventory
    all_inventory = @vendors.map do |vendor|
      vendor.inventory
    end
    all_inventory.reduce(Hash.new(0)) do |total_inventory, items|
      items.each do |item, inventory|
        total_inventory[item] += inventory
      end
      total_inventory
    end
  end
end
