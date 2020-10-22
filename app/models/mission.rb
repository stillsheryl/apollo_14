class Mission < ApplicationRecord
  has_many :astronaut_missions
  has_many :astronauts, through: :astronaut_missions

  validates_presence_of :title, :time_in_space

  def self.id_to_name(mission_id)
    Mission.where("id = 1").pluck(:title)
  end
end
