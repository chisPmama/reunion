class Activity
  attr_reader :name, :participants, :total_cost

  def initialize(name)
    @name = name
    @participants = {}
    @total_cost = 0
  end

  def add_participant(name, money)
    participants[name] = money
    @total_cost += money
  end

  def split
    @total_cost/participants.count
  end

  def owed
    @participants.map{|name, money| [name, split-money]}.to_h
  end
end