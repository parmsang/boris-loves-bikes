require_relative 'bike'
require_relative 'bike_container'

class Van
  include BikeContainer


  def release_bike
    fail 'No bikes available' if working_bikes.empty?
    bikes.delete working_bikes.pop
  end

  def unload
    raise "#{self.class.name} empty" if empty?
    bikes.pop
  end

  def dock bike
    load bike
  end

  def load(bike)
    raise "#{self.class.name} full" if full?
    bikes << bike
  end
  private

  def working_bikes
    bikes.select { |bike| bike.working? }
  end
end
