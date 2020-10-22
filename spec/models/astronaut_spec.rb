require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe "class methods" do
    it "#average_age" do
      astronaut_1 = Astronaut.create!(
                                name: "Neil Armstrong",
                                 age: 37,
                                 job: "Commander"
                              )
      astronaut_2 = Astronaut.create!(
                                name: "Bob Hope",
                                 age: 32,
                                 job: "Mission Control"
                              )
      astronaut_3 = Astronaut.create!(
                                name: "Shana Young",
                                 age: 40,
                                 job: "Engineer"
                              )
      mission_1 = Mission.create!({
                              title: "Apollo 13",
                      time_in_space: 5436
                              })
      AstronautMission.create!(
                    astronaut_id: astronaut_1.id,
                    mission_id: mission_1.id
                          )
      AstronautMission.create!(
                    astronaut_id: astronaut_2.id,
                    mission_id: mission_1.id
                          )
      AstronautMission.create!(
                  astronaut_id: astronaut_3.id,
                    mission_id: mission_1.id
                          )

      expect(mission_1.astronauts.average_age.round(1)).to eq(36.3)
    end
  end

  describe "instance methods" do
    it "#missions_by_astronaut" do
      astronaut_1 = Astronaut.create!(
                                name: "Neil Armstrong",
                                 age: 37,
                                 job: "Commander"
                              )
      mission_1 = Mission.create!({
                              title: "Apollo 13",
                      time_in_space: 5436
                              })
      mission_2 = Mission.create!({
                              title: "Capricorn 4",
                      time_in_space: 25773
                              })
      mission_3 = Mission.create!({
                              title: "Gemini 7",
                              time_in_space: 579276
                              })
      AstronautMission.create!(
                    astronaut_id: astronaut_1.id,
                    mission_id: mission_1.id
                          )
      AstronautMission.create!(
                  astronaut_id: astronaut_1.id,
                    mission_id: mission_2.id
                          )
      AstronautMission.create!(
                    astronaut_id: astronaut_1.id,
                    mission_id: mission_3.id
                          )
      expect(astronaut_1.missions_by_astronaut).to eq([mission_1.title, mission_2.title, mission_3.title])
    end

    it "#time_in_space" do
      astronaut_1 = Astronaut.create!(
                                name: "Neil Armstrong",
                                 age: 37,
                                 job: "Commander"
                              )
      mission_1 = Mission.create!({
                              title: "Apollo 13",
                      time_in_space: 5436
                              })
      mission_2 = Mission.create!({
                              title: "Capricorn 4",
                      time_in_space: 25773
                              })
      mission_3 = Mission.create!({
                              title: "Gemini 7",
                              time_in_space: 579276
                              })
      AstronautMission.create!(
                    astronaut_id: astronaut_1.id,
                    mission_id: mission_1.id
                          )
      AstronautMission.create!(
                  astronaut_id: astronaut_1.id,
                    mission_id: mission_2.id
                          )
      AstronautMission.create!(
                    astronaut_id: astronaut_1.id,
                    mission_id: mission_3.id
                          )
      expect(astronaut_1.time_in_space).to eq(610485)
    end
  end
end
