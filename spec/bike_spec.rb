require 'bike'

describe Bike do
  it{ is_expected.to respond_to :working? }

  it 'can be reported broken' do
    subject.report_broken
    expect(subject).not_to be_working
  end

end
