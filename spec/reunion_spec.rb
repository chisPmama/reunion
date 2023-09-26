require 'spec_helper'
RSpec.describe Reunion do
  before(:each) do
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@reunion.name).to eq("1406 BE")
      expect(@reunion.activities).to eq([])
    end

    it 'can add activities' do 
      @reunion.add_activity(@activity_1)
      expect(@reunion.activities).to eq([@activity_1])
      expect(@reunion.activities.class).to be Array
    end
  end

  describe '#breakout' do
    before(:each) do
      @reunion = Reunion.new("1406 BE")
      @activity_1 = Activity.new("Brunch")
      @activity_1.add_participant("Maria", 20)
      @activity_1.add_participant("Luther", 40)
      @reunion.add_activity(@activity_1)
      @activity_2 = Activity.new("Drinks")
      @activity_2.add_participant("Maria", 60)
      @activity_2.add_participant("Luther", 60)
      @activity_2.add_participant("Louis", 0)
    end

    it 'checks total cost is added' do
      expect(@reunion.total_cost).to eq(60)
    end

    it 'updates new cost with new activity and participants' do 
      @reunion.add_activity(@activity_2)
      expect(@reunion.total_cost).to eq(180)
    end

    it 'can breakout what everyone owes from all activities' do
      @reunion.add_activity(@activity_2)
      expect(@reunion.breakout).to eq({"Maria" => -10, "Luther" => -30, "Louis" => 40})
    end

    it 'return a summary (string form of breakout)' do
      @reunion.add_activity(@activity_2)
      expect(@reunion.summary).to eq("Maria: -10\nLuther: -30\nLouis: 40")
    end
  end
end