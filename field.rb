class Field

  @@crops = []

  # One hectare of each produces:
  @@corn = 20 #/hectare
  @@wheat = 30 #/hectare

  #READERS & WRITERS
  attr :type, :hectares

  def self.all
    @@crops
  end

  def initialize(type, hectares)
    @type = type
    @hectares = hectares
  end

  def self.create(type, hectares)
    new_field = Field.new(type, hectares)
    @@crops << new_field
    new_field
  end

  # Instance Methods

  def harvest
    if @type == "corn"
      harvested_food = @@corn * @hectares
    elsif @type == "wheat"
      harvested_food = @@wheat * @hectares
    end
  end

  def self.total_food
    total = 0
    @@crops.each do |crop|
      total += crop.harvest
    end
    total
  end

  def self.total_corn_hectare
    total = 0
    corns = @@crops.select do |field|
      field.type == "corn"
    end
    corns.each do |corn|
      total += corn.hectares
    end
    total
  end

  def self.total_wheat_hectare
    total = 0
    wheats = @@crops.select do |field|
      field.type == "wheat"
    end
    wheats.each do |wheat|
      total += wheat.hectares
    end
    total
  end

end

# corn1 = Field.create("corn", 100)
# corn2 = Field.create("corn", 200)
#
# wheat1 = Field.create("wheat", 100)
# wheat2 = Field.create("wheat", 1000)


# p Field.all
#
# p Field.harvest
#
# class Corn < Field
#   @@corns = []
#
#   def self.create(type, hectares)
#     super(type, hectares)
#     @@corns <<
#   end
# end
#
# class Wheat < Field
#
# end
