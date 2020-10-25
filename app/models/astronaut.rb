class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job

  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def self.average_age
    self.all.average(:age)
  end

  def missions_by_astronaut
    self.missions.order(:title).pluck(:title)
  end

  def time_in_space
    self.missions.sum(:time_in_space)
  end

end
