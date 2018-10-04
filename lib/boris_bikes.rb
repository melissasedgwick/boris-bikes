class DockingStation
  MAXSIZE= 20
  attr_accessor :size_of_station
  def initialize (max = MAXSIZE)
    @size_of_station = max
    @bike = Bike.new
    @bikes_in_station = [@bike]
  end

  def release_bike
    #raise "No bike available" unless @bikes_in_station.length > 0
    raise "No bike available" if empty?
    @bikes_in_station.pop
    return @bike
  end

  def dock(bike)
    #raise "Unable to dock bike" unless @bikes_in_station.length < @max_size
    raise "Station full: Unable to dock bike" if full?
    @bikes_in_station << bike
    return "Bike docked"
  end

  def dock_defective_bike(bike)
    raise "Station full: Unable to dock bike" if full?
    bike.condition_to_defective
    @bikes_in_station << bike
    return "Defective bike docked"
  end

  def full?
    @bikes_in_station.length == @size_of_station
  end

  def empty?
    if @bikes_in_station.length == 0
      return true
    else
      @bikes_in_station.each do |bike|
        if bike.working?
          return false
        end
      end
    end
    return true
  end

  private :full?, :empty?

end


class Bike

  def initialize
    @bike_condition = true
  end

  def working?
    return @bike_condition
  end

  def condition_to_defective
    @bike_condition = false
  end
end

class Van
  def fetch_broken_bikes(dockingstation)
    1
  end
end

class Garage
end
