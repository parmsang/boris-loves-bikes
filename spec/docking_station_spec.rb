require 'docking_station'
require_relative './support/shared_examples_for_bike_container'
describe DockingStation do

  it_behaves_like BikeContainer

  it{ is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock bike
    expect(subject.release_bike).to be bike
    # bike = double :bike, working?: true
    # subject.dock bike
    # expect(subject.release_bike).to be bike
  end

  it 'releases chosen bike' do
    bike = Bike.new
    subject.dock bike
    subject.choose bike
    expect(subject.release_bike).to be bike
  end
    # bike = double :bike, chosen: true
    # subject.dock bike
    # expect(subject.release_bike).to be bike

    # chosen_bike = subject.choose bike
    # subject.release_bike
    # expect(subject.chosen_bikes).not_to eq ""


  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it{ is_expected.to respond_to(:dock).with(1).argument }

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end
  let (:bike) {Bike.new}
  describe '#choose' do
    it 'allows user to select preferred bike' do
      subject.dock bike
      subject.choose(bike)
      expect(bike.chosen).to be true
    end
  end

end
