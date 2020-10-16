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
  end

end
