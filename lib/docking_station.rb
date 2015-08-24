require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike
    bikes.each do |bike|
      if bike.working?
        bikes.delete(bike)
        return bike
      end
    end
    fail 'No bikes available'
  end

  def dock bike
    fail 'Docking station full' if full?
    bikes << bike
  end

  private

  attr_reader :bikes

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

end
