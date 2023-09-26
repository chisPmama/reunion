class Reunion
  attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.map{|activity| activity.total_cost}.sum
  end

  def breakout
    breakout = Hash.new(0)
    num = 0
    activities.count.times do
      activities[num].owed.each do |name, owed|
        breakout[name]+=owed
        end
        num+=1
      end
    breakout
  end

  def summary
    array = breakout.to_a
    array.map!{|key_value| key_value[0] + ": " + key_value[1].to_s + "\n"}
    array.join.chomp
  end
end