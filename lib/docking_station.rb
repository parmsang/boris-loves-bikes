require_relative 'bike'
require_relative 'bike_container'

class DockingStation
  include BikeContainer


  def release_bike
    fail 'No bikes available' if working_bikes.empty?
    #if chosen_bikes != nil
      #bikes.delete(chosen_bikes.pop)
    #else
      bikes.delete(working_bikes.pop)
    #end
  end

  def dock bike
    add_bike bike
  end

  def choose bike
    @chosen_bike = bike
    bike.chosen = true
  end

  def chosen_bikes
    bikes.select { |bike| bike.chosen }
  end

  private

  def working_bikes
    bikes.select { |bike| bike.working? }
  end

end
