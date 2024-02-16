# Define a class to represent an item
class Item
  attr_reader :name, :price, :quantity, :imported, :exempt

  def initialize(name, price, quantity, imported, exempt)
    @name = name
    @price = price
    @quantity = quantity
    @imported = imported
    @exempt = exempt
  end

  # Calculate the sales tax for the item
  def sales_tax
    tax_rate = 0.0 if exempt
    tax_rate = 0.10 if not exempt
    tax_rate += 0.05 if imported
    raw_tax = (price * tax_rate).round(2)
    rounded_tax = ((raw_tax / 0.05).ceil * 0.05).round(2)
  end

  # Calculate the total sales tax
  def total_sales_tax
    sales_tax * quantity
  end

  # Calculate the total price including tax
  def total_price
    (price + sales_tax) * quantity
  end
end

# Define a class to represent a shopping basket
class Basket
  attr_reader :items

  def initialize
    @items = []
  end

  # Add an item to the basket
  def add_item(item)
    items << item
  end

  # Calculate the total sales tax for all items in the basket
  def total_sales_tax
    items.sum(&:total_sales_tax)
  end

  # Calculate the total cost of all items in the basket
  def total_cost
    items.sum(&:total_price)
  end
end

# Parse the input lines and create items
def parse_input(input_lines)
  basket = Basket.new
  input_lines.each do |line|
    match = line.match(/(\d+) (.+) at (\d+\.\d+)/)
    next unless match

    quantity = match[1].to_i
    name = match[2]
    price = match[3].to_f
    exempt = name.include?('book') || name.include?('chocolate') || name.include?('chocolates') || name.include?('pills')
    imported = name.include?('imported')

    item = Item.new(name, price, quantity, imported, exempt)
    basket.add_item(item)
  end
  basket
end

# Examples

input_1 = [
  '2 book at 12.49',
  '1 music CD at 14.99',
  '1 chocolate bar at 0.85'
]

# Parse the input and calculate receipt details
basket1 = parse_input(input_1)

# Print the receipt
puts 'Output 1:'
basket1.items.each do |item|
  puts "#{item.quantity} #{item.name}: #{'%.2f' % item.total_price}"
end
puts "Sales Taxes: #{'%.2f' % basket1.total_sales_tax}"
puts "Total: #{'%.2f' % basket1.total_cost}"

input_2 = [
  '1 imported box of chocolates at 10.00',
  '1 imported bottle of perfume at 47.50'
]

# Parse the input and calculate receipt details
basket2 = parse_input(input_2)

# Print the receipt
puts 'Output 2:'
basket2.items.each do |item|
  puts "#{item.quantity} #{item.name}: #{'%.2f' % item.total_price}"
end
puts "Sales Taxes: #{'%.2f' % basket2.total_sales_tax}"
puts "Total: #{'%.2f' % basket2.total_cost}"

input_3 = [
  '1 imported bottle of perfume at 27.99',
  '1 bottle of perfume at 18.99',
  '1 packet of headache pills at 9.75',
  '3 imported box of chocolates at 11.25'
]

# Parse the input and calculate receipt details
basket3 = parse_input(input_3)

# Print the receipt
puts 'Output 3:'
basket3.items.each do |item|
  puts "#{item.quantity} #{item.name}: #{'%.2f' % item.total_price}"
end
puts "Sales Taxes: #{'%.2f' % basket3.total_sales_tax}"
puts "Total: #{'%.2f' % basket3.total_cost}"
