require 'docking_station'
require_relative './support/shared_examples_for_bike_container'
describe DockingStation do
# let(:bike) {double :bike}
  it_behaves_like BikeContainer

  it{ is_expected.to respond_to :release_bike }

  it 'releases working bikes' do

    subject.dock bike
    expect(subject.release_bike).to be_working
  end

  it 'releases chosen bike' do
    subject.dock bike
    subject.choose bike
    expect(subject.release_bike).to be_chosen
  end


  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it{ is_expected.to respond_to(:dock).with(1).argument }

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end
  let (:bike) {double :bike, report_chosen: true, working?: true, chosen?: true}
  describe '#choose' do
    it 'allows user to select preferred bike' do
      subject.dock bike
      subject.choose(bike)
      expect(bike).to be_chosen
    end
  end

end
