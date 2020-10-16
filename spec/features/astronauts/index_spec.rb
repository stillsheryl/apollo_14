require 'rails_helper'

describe "As a visitor," do
  describe "When I visit '/astronauts'" do
    it "I see a list of astronauts with the following info: Name, Age, Job. (e.g. 'Name: Neil Armstrong, Age: 37, Job: Commander')" do
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
      visit '/astronauts'

      expect(page).to have_content("#{astronaut_1.name}")
      expect(page).to have_content("#{astronaut_1.age}")
      expect(page).to have_content("#{astronaut_1.job}")

      expect(page).to have_content("#{astronaut_2.name}")
      expect(page).to have_content("#{astronaut_2.age}")
      expect(page).to have_content("#{astronaut_2.job}")

      expect(page).to have_content("#{astronaut_3.name}")
      expect(page).to have_content("#{astronaut_3.age}")
      expect(page).to have_content("#{astronaut_3.job}")
    end

    it "I see the Average Age of all astronauts" do
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
      visit '/astronauts'

      expect(page).to have_content("Average Age: 36.3")
    end

    it "I see a list of the space missions' in alphabetical order for each astronaut. (e.g 'Apollo 13'
                         'Capricorn 4'
                         'Gemini 7')" do
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
      mission_1 = Mission.create!(
                              title: "Apollo 13",
                      time_in_space: 5436
                              )
      mission_2 = Mission.create!(
                              title: "Capricorn 4",
                      time_in_space: 25773
                              )
      mission_3 = Mission.create!(
                              title: "Gemini 7",
                              time_in_space: 579276
                              )

      visit '/astronauts'
      astronaut_mission_1 = (
                        astronaut_id: astronaut_1.id,
                        mission_id: mission_1.id
                        )
      astronaut_mission_2 = (
                        astronaut_id: astronaut_2.id,
                        mission_id: mission_2.id
                        )
      astronaut_mission_2 = (
                        astronaut_id: astronaut_3.id,
                        mission_id: mission_3.id
                        )

      expect(page).to have_content('Apollo 13')
      expect(page).to have_content('Capricorn 4')
      expect(page).to have_content('Gemini 7')
    end
  end

end
