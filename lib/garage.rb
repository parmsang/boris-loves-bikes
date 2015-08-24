require_relative 'bike'
require_relative 'bike_container'

class Garage
  include BikeContainer


  def release_bike
    fail 'No bikes available' if working_bikes.empty?
    bikes.delete working_bikes.pop
  end

  def dock bike
    add_bike bike
  end

  private

  def working_bikes
    bikes.select { |bike| bike.working? }
  end
end
