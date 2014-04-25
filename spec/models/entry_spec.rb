require 'spec_helper'

describe Entry do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @entry = Entry.new(weight: 201.1, user_id: user.id)
  end

  subject { @entry }

  it { should respond_to(:weight) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @entry.user_id = nil }
    it { should_not be_valid }
  end
end