require 'spec_helper'

RSpec.describe Activity do
  before(:each) do
    @activity = Activity.new("Brunch")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@activity.name).to eq("Brunch")
      expect(@activity.participants).to eq({})
    end

    it 'can add a participant (Maria)' do
      @activity.add_participant("Maria", 20)
      expect(@activity.participants).to eq({"Maria" => 20})
    end

    it 'can update total cost' do
      @activity.add_participant("Maria", 20)
      expect(@activity.total_cost).to eq(20)
    end

    it 'can add a another participant (Luther)' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)
      expect(@activity.participants).to eq({"Maria" => 20, "Luther" => 40})
    end

    it 'can update total cost' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)
      expect(@activity.total_cost).to eq(60)
    end
  end

  describe '#split and #owed' do
    before(:each) do
      @activity = Activity.new("Brunch")
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)
    end

    it 'will split the total cost amongst two people' do
      expect(@activity.total_cost).to eq(60)
      expect(@activity.split).to eq(30)
    end

    it 'return the amount owed per each person' do
      expect(@activity.owed).to eq({"Maria" => 10, "Luther" => -10})
    end
  end
end