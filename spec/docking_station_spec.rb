require 'docking_station'

describe DockingStation do
  it{ is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    subject.dock Bike.new
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'is possible to change capacity' do
    subject.capacity = 10
    expect(subject.capacity).to eq 10
  end
  
  it{ is_expected.to respond_to(:dock).with(1).argument }

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock Bike.new}
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end
end
