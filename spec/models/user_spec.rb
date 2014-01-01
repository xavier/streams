require 'spec_helper'

describe User do

  describe ".register!" do

    it "creates a new user" do
      expect(User.register!("new@example.com", "topsecret")).to be_persisted
    end

    it "raises an exception if arguments are invalid" do
      expect { User.register!("bogus", "2short") }.to raise_error(ActiveRecord::RecordInvalid)
    end

  end

end
