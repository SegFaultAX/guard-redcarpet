require 'spec_helper'

describe Guard::Redcarpet do
  subject { Guard::Redcarpet.new }

  describe "run all" do
    it "should re-compile all files being watched" do
      Guard::Redcarpet.stub(:run_on_change).with([]).and_return([])
      Guard.stub(:guards).and_return([subject])
      subject.run_all
    end
  end
end
