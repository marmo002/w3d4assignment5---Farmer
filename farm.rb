require_relative 'field'

class Farm

  def initialize(name = "Farm 1")
    @name = name
  end

  #READERS & WRITERS
  attr_accessor :name

  # INSTANCE METHODS
  def main_menu

    while true #repeat indefinitely
      show_menu
      user_selection = gets.to_i
      run_option(user_selection)
    end
  end

  def show_menu
    puts "options:"
    puts "[1] Add a new field"
    puts "[2] Harvest your crops"#
    puts "[3] Farm status"
    puts "[4] A lovely fields description"
    puts "[5] Exit"
  end

  def run_option(user_selection)
    case user_selection
      when 1 then add_field
      when 2 then harvest_crops
      when 3 then print_status
      when 4 then run_relax
      when 5 then exit
    end
  end

  def add_field
    puts "What kind of field is it: corn or wheat?"
    field_name = gets.chomp

    puts "How large is the field in hectares"
    field_hectares = gets.to_i

    Field.create(field_name, field_hectares)

    puts "Added a #{field_name.upcase} field of #{field_hectares} hectares!"
  end

  def harvest_crops
    totals = Field.total_food

    Field.all.each do |field|
      food = field.harvest
      puts "Harvesting #{food} food from #{field.hectares} hectares of #{field.type.capitalize} field"
    end

    puts "The farm has #{totals} harvested food so far."
  end

  def print_status
    totals = Field.total_food

    Field.all.each do |field|
      puts "#{field.type.capitalize} field is #{field.hectares} hectares."
    end

    puts "The farm has #{totals} harvested food so far."
  end

  def run_relax
    corn_hectares = Field.total_corn_hectare
    wheat_hectares = Field.total_wheat_hectare

    puts "#{corn_hectares} hectares of tall green stalks rustling in the breeze fill your horizon."
    puts "The sun hangs low, casting an orange glow on a sea of #{wheat_hectares} hectares of wheat."
  end

end
#
farm1 = Farm.new("Martin's farm")
# p farm1
farm1.main_menu
